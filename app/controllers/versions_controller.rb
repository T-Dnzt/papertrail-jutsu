class VersionsController < ApplicationController
  before_action :require_user
  before_action :set_document_and_version, only: [:diff, :rollback, :destroy]
  
  def diff
  end

  def rollback
    document = @version.reify
    document.save
    redirect_to edit_document_path(document)
  end

  def destroy
  end

  private

    def set_document_and_version
      @document = Document.find(params[:document_id])
      @version = @document.versions.find(params[:id])
    end
    
end
