module Bullhorn
  module Rest
    module Entities
      module CorporationDepartment
        extend Base

        define_methods(immutable: true, fields: [
          'id',
          'dateAdded',
          'description',
          'enabled',
          'name'
        ])
      end
    end
  end
end