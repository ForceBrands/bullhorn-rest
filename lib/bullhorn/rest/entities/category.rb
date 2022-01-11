module Bullhorn
  module Rest
    module Entities
      module Category
        extend Base

        define_methods(immutable: true, fields: [
          'id',
          'dateAdded',
          'description',
          'enabled',
          'name',
          'occupation',
          'skills',
          'specialties',
          'type'
        ])
      end
    end
  end
end