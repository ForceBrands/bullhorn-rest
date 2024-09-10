module Bullhorn
  module Rest
    module Entities
      module Opportunity
        extend Base

        define_methods(owner_methods: true, file_methods: true, fields: [
          'id',
          'address',
          'assignedDate',
          'assignedUsers',
          'businessSector',
          'businessSectors',
          'campaignSource',
          'category',
          'categories',
          'clientContact',
          'clientCorporation',
          'committed',
          'dateAdded',
          'dateLastModified',
          'description',
          'markUpPercentage',
          'notes',
          'numOpenings',
          'onSite',
          'owner',
          'status',
          'title',
        ])
      end
    end
  end
end


