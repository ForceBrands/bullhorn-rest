module Bullhorn
  module Rest
    module Entities
      module Placement
        extend Base

        define_methods(owner_methods: true, file_methods: true, fields: [
          'id',
          'candidate', 
          'fee',
          'jobOrder',
          'jobSubmission',
          'customBillRate10',
          'employeeType',
          'customDate2',
          'customDate10',
          'correlatedCustomText2',
          'correlatedCustomText4',
          'customText8',
          'customBillRate1',
          'dateAdded',
          'dateLastModified'
        ])
      end
    end
  end
end