module Bullhorn
  module Rest
    module Entities
      module JobOrder
        extend Base

        define_methods(owner_methods: true, file_methods: true, fields: [
          'id',
          'owner',
          'title',
          'clientCorporation',
          'clientContact',
          'payRate',
          'correlatedCustomFloat3',
          'dateAdded',
          'dateLastModified',
          'correlatedCustomText2'
        ])
      end
    end
  end
end