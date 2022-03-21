module Bullhorn
  module Rest
    module Entities
      module JobOrder
        extend Base

        define_methods(owner_methods: true, file_methods: true, fields: [
          'id',
          'userID',
          'title',
          'clientCorporationID',
          'clientUserID',
          'dateAdded',
          'dateLastModified'
        ])
      end
    end
  end
end