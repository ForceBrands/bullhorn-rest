require 'faraday'
require 'bullhorn/rest/authentication'
require 'bullhorn/rest/entities/base'

Dir[File.dirname(__FILE__) + '/entities/*.rb'].each {|file| require file }

module Bullhorn
  module Rest
    class Client

      include Bullhorn::Rest::Authentication
      include Bullhorn::Rest::Entities::Appointment
      include Bullhorn::Rest::Entities::AppointmentAttendee
      include Bullhorn::Rest::Entities::BusinessSector
      include Bullhorn::Rest::Entities::Candidate
      include Bullhorn::Rest::Entities::CandidateCertification
      include Bullhorn::Rest::Entities::CandidateEducation
      include Bullhorn::Rest::Entities::CandidateReference
      include Bullhorn::Rest::Entities::CandidateWorkHistory
      include Bullhorn::Rest::Entities::Category
      include Bullhorn::Rest::Entities::ClientContact
      include Bullhorn::Rest::Entities::ClientCorporation
      include Bullhorn::Rest::Entities::CorporateUser
      include Bullhorn::Rest::Entities::CorporationDepartment
      include Bullhorn::Rest::Entities::Country
      include Bullhorn::Rest::Entities::CustomAction
      include Bullhorn::Rest::Entities::JobOrder
      include Bullhorn::Rest::Entities::JobSubmission
      include Bullhorn::Rest::Entities::Lead
      include Bullhorn::Rest::Entities::Note
      include Bullhorn::Rest::Entities::NoteEntity
      include Bullhorn::Rest::Entities::Placement
      include Bullhorn::Rest::Entities::PlacementChangeRequest
      include Bullhorn::Rest::Entities::PlacementCommission
      include Bullhorn::Rest::Entities::Resume
      include Bullhorn::Rest::Entities::Sendout
      include Bullhorn::Rest::Entities::Skill
      include Bullhorn::Rest::Entities::Specialty
      include Bullhorn::Rest::Entities::State
      include Bullhorn::Rest::Entities::Task
      include Bullhorn::Rest::Entities::Tearsheet
      include Bullhorn::Rest::Entities::TearsheetRecipient
      include Bullhorn::Rest::Entities::TimeUnit

      attr_reader :conn

      RESUME_TYPES = ["Resume", "FB Stamped Resume", "Impactful Stamped Resume"]

      # Initializes a new Bullhorn REST Client
      def initialize(options = {})
        @conn = Faraday.new do |f|
          f.use Middleware, self
          f.response :logger
          f.request :multipart
          f.request :url_encoded
          f.adapter Faraday.default_adapter
        end

        [:username, :password, :client_id, :client_secret, :auth_code, :access_token, :refresh_token, :ttl, :rest_url, :rest_token, :auth_host, :rest_host].each do |opt|
          self.send "#{opt}=", options[opt] if options[opt]
        end
      end

      def find_resume(entity = 'Candidate', entity_id)
        res = conn.get ['entityFiles', entity, entity_id].join('/')
        files = JSON.parse(res.body)["EntityFiles"]
        resume = files.select {|f| RESUME_TYPES.include?(f["type"]) }
        resume[-1]
      end 

      def get_resume(resume)
        file_path = '/file' + resume['fileUrl'].split('/file')[-1] + '/raw'
        conn.get file_path
      end

      def find_job_order_resumes(entity = 'JobOrder', entity_id)
        res = conn.get ['entityFiles', entity, entity_id].join('/')
        files = JSON.parse(res.body)["EntityFiles"]
        files.select {|f| RESUME_TYPES.include?(f["type"])}
      end

      def find_all_candidate_resumes(entity='Candidate', candidate_id)
        res = conn.get ['entityFiles', entity, candidate_id].join('/')
        files = JSON.parse(res.body)["EntityFiles"]
        files.select {|f| RESUME_TYPES.include?(f["type"])}
      end

      # Attempts a best-match job and candidate resume find
      # BH presently separates these entries and does not refer to each other
      # Looking for best match on name, owner, description, and type
      def find_job_and_candidate_resumes(job_order_id, candidate_id)
        job_order_resumes = self.find_job_order_resumes('JobOrder', job_order_id)
        candidate_resumes = self.find_all_candidate_resumes('Candidate', candidate_id)
        matching = []

        job_order_resumes.each do |job|
          candidate_resumes.each do |cand|
            if job["name"] == cand["name"] &&
              job["type"] == cand["type"] &&
              job["description"] == cand["description"] &&
              job["fileOwnerID"] == cand["fileOnwerID"]
              matching << job
            end
          end
        end

        return matching
      end

      def parse_to_candidate(resume_text)
        path = "resume/parseToCandidateViaJson?format=text"
        encodedResume = {"resume" => resume_text}.to_json   
        res = conn.post path, encodedResume

        JSON.parse(res.body)
      end 

      def parse_to_candidate_as_file(format, pop, attributes)
        path = "resume/parseToCandidate?format=#{format}&populateDescription=#{pop}" 
        attributes['file'] = Faraday::UploadIO.new(attributes['file'], attributes['ct'])
        res = conn.post path, attributes
        JSON.parse(res.body)
      end 

      # Create an event subscription (there is no way to query all of them, so remember the subscriptions you've created)
      # conn.create_event_subscription('resources_production', 'entity', ['INSERTED','UPDATED','DELETED'], ['Candidate', 'JobOrder', 'ClientCorporation', 'ClientContact', 'CorporateUser', 'Placement'])
      def create_event_subscription(subscription_name, subscription_type = 'entity', event_types=['INSERTED','UPDATED','DELETED'], names = [])
        path = "event/subscription/#{subscription_name}?type=#{subscription_type}&names=#{names.join(',')}&eventTypes=#{event_types.join(',')}" 
        res = conn.put path
        JSON.parse(res.body)
      end 

      # Get the events for a subscription
      # conn.get_event_subscription('resources_production')
      def get_event_subscription(subscription_name, max_events = 100)
        path = "event/subscription/#{subscription_name}?maxEvents=#{max_events}" 
        res = conn.get path

        if res.body.presence
          JSON.parse(res.body)
        else
          puts "[bullhorn] No events for subscription: #{subscription_name}"
        end
      end 

      # Remove a subscription
      # conn.destroy_event_subscription('resources_production')
      def destroy_event_subscription(subscription_name)
        path = "event/subscription/#{subscription_name}" 
        res = conn.delete path
        JSON.parse(res.body)
      end 

    end
  end
end