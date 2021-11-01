module Bullhorn
  module Rest
    module Entities
      module Candidate
        extend Base

        define_methods(owner_methods: true, file_methods: true, fields: [
          'id',
          'firstName', 
          'lastName',
          'email',
          # 'categories',
          'companyName',
          'dateAdded',
          'externalID'
        ])
      end
    end
  end
end