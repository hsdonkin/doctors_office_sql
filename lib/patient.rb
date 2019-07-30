class Patient
  attr_reader :name, :dob, :id, :doc_id
  attr_accessor :doc_name

  def initialize(attr)
    @name = attr.fetch(:name)
    @dob = attr.fetch(:dob)
    @id = attr.fetch(:id)
    @doc_id = attr.fetch(:doc_id)
    @doc_name = ""
  end
end
