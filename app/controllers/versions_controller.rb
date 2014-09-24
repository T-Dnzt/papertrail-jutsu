class VersionsController < ApplicationController
  before_action :require_user
  before_action :set_document_and_version, only: [:diff, :rollback, :destroy]

  def bringback
    version = PaperTrail::Version.find(params[:id])
    @object = version.reify
    @object.save
    version.delete
    redirect_to root_path, notice: 'The object was successfully brought back!'
  end
  
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
