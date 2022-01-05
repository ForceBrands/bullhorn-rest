module Bullhorn
  module Rest
    module Entities
      module CorporateUser
        extend Base

        define_methods(immutable: true, fields: [
          'id',
          'customDate1',
          'customFloat1',
          'customInt1',
          'customText1',
          'dateLastComment',
          'departments',
          'email',
          'emailSignature',
          'enabled',
          'firstName',
          'lastName',
          'isDeleted',
          'isLockedOut',
          # 'jobAssignments',
          'mobile',
          'name',
          'nickName',
          'occupation',
          'phone',
          'smsOptIn',
          'timeZoneOffsetEST',
          'username'
        ])
      end
    end
  end
end

