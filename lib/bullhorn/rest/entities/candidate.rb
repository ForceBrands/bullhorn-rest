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
          'categories',
          'companyName',
          'isDeleted',
          'dateAdded',
          'dateLastModified',
          'status',
          'phone',
          'companyURL',
          'experience',
          'customText4',
          'owner',
          'description',
          'businessSectorID',
          'source',
          'name'
        ])
      end
    end
  end
end