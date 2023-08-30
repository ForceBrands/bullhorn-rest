module Bullhorn
  module Rest
    module Entities
      module Opportunity
        extend Base

        define_methods(owner_methods: true, file_methods: true, fields: [
          'id',
          'opportunityMarkUp',
          'dateAdded',
          'dateLastModified'
        ])
      end
    end
  end
end


