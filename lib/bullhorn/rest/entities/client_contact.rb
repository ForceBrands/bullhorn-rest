module Bullhorn
  module Rest
    module Entities
      module ClientContact
        extend Base

        define_methods(owner_methods: true, fields: [
          'id',
          'firstName', 
          'lastName',
          'email',
          'mobile',
          'type',
          'status',
          'address',
          'owner',
          'division',
          'businessSectors',
          'timeZoneOffsetEST',
          'occupation',
          'clientCorporation',
          'source',
          'referredByPerson',
          'externalID',
          'isDeleted',
          'dateAdded',
          'dateLastModified'
        ])
      end
    end
  end
end