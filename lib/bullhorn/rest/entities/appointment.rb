module Bullhorn
  module Rest
    module Entities
      module Appointment
        extend Base

        define_methods(owner_methods: true, fields: [
          'appointmentID',
          'appointmentUUID',
          'candidateReferenceID',
          'clientContactReferenceID',
          'placementID',
          'opportunityID',
          'jobOrderID',
          'ownerID',
          'leadID',
          'parentAppointmentID',
          'communicationMethod',
          'dateAdded',
          'dateBegin',
          'dateEnd',
          'dateLastModified',
          'description',
          'isAllDay',
          'isDeleted',
          'isPrivate',
          'location',
          'notificationMinutes',
          'recurrenceDayBits',
          'recurrenceFrequency',
          'recurrenceStyle',
          'recurrenceType',
          'subject',
          'type',
          'dateLastSync'        
        ])     
      end
    end
  end
end

