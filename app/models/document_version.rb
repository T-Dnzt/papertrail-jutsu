class DocumentVersion < PaperTrail::Version
  self.table_name = :document_versions

  default_scope { where.not(event: 'create') } 
end
