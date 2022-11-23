module Bullhorn
  module Rest
    module Entities
      module ClientCorporation
        extend Base
        
        define_methods(owner_methods: true, fields: [
          'id',
          'name', 
          'numEmployees',
          'numOffices',
          'phone',
          'status',
          'owners',
          'parentClientCorporation',
          'tickerSymbol',
          'funding',
          'dateFounded',
          'companyDescription',
          'clientContacts',
          'companyURL',
          'taxRate',
          # 'exemptionStatus',
          'feeArrangement',
          'invoiceFormat',
          'billingFrequency',
          'billingContact',
          'leads',
          'externalID',
          # 'isDeleted',
          'linkedinProfileName',
          'dateAdded',
          'dateLastModified'
        ])      
      end
    end
  end
end
