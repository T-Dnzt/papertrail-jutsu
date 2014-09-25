class Document < ActiveRecord::Base
  belongs_to :user

  # Declare this in your model to track every create, update, and destroy.  Each version of
  # the model is available in the `versions` association.
  #
  # Options:
  # :on           the events to track (optional; defaults to all of them).  Set to an array of
  #               `:create`, `:update`, `:destroy` as desired.
  # :class_name   the name of a custom Version class.  This class should inherit from `PaperTrail::Version`.
  # :ignore       an array of attributes for which a new `Version` will not be created if only they change.
  #               it can also aceept a Hash as an argument where the key is the attribute to ignore (a `String` or `Symbol`),
  #               which will only be ignored if the value is a `Proc` which returns truthily.
  # :if, :unless  Procs that allow to specify conditions when to save versions for an object
  # :only         inverse of `ignore` - a new `Version` will be created only for these attributes if supplied
  #               it can also aceept a Hash as an argument where the key is the attribute to track (a `String` or `Symbol`),
  #               which will only be counted if the value is a `Proc` which returns truthily.
  # :skip         fields to ignore completely.  As with `ignore`, updates to these fields will not create
  #               a new `Version`.  In addition, these fields will not be included in the serialized versions
  #               of the object whenever a new `Version` is created.
  # :meta         a hash of extra data to store.  You must add a column to the `versions` table for each key.
  #               Values are objects or procs (which are called with `self`, i.e. the model with the paper
  #               trail).  See `PaperTrail::Controller.info_for_paper_trail` for how to store data from
  #               the controller.
  # :versions     the name to use for the versions association.  Default is `:versions`.
  # :version      the name to use for the method which returns the version the instance was reified from.
  #               Default is `:version`.
  has_paper_trail class_name: 'DocumentVersion', meta: { author_username: :user_name, 
                                                         word_count: :count_word }

  def user_name
    user ? user.name : ''
  end

  def count_word
    content.split(' ').count
  end

end
