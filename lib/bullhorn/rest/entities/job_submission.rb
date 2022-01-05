module Bullhorn
  module Rest
    module Entities
      module JobSubmission
        extend Base

        define_methods(immutable: true, fields: [
          'id',
          'appointments',
          'billRate',
          'branch',
          'candidate',
          # 'comments',
          'customDate1',
          'customFloat1',
          'customInt1',
          'customText1',
          'customTextBlock1',
          'dateAdded',
          'dateLastModified',
          'dateWebResponse',
          'endDate',
          'isDeleted',
          'isHidden',
          'jobOrder',
          'jobSubmissionCertificationRequirements',
          'jobSubmissionIntegrations',
          'latestAppointment',
          'migrateGUID',
          # 'owners',
          'payRate',
          'salary',
          'sendingUser',
          'source',
          'startDate',
          'status',
          # 'tasks'
        ])
      end
    end
  end
end

