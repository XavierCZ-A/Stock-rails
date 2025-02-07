class SupplierContactsController < ApplicationController
  before_action :set_supplier_contact, only: %i[ show edit update destroy ]

  # GET /supplier_contacts or /supplier_contacts.json
  def index
    @supplier_contacts = SupplierContact.all
  end

  # GET /supplier_contacts/1 or /supplier_contacts/1.json
  def show
  end

  # GET /supplier_contacts/new
  def new
    @supplier_contact = SupplierContact.new
  end

  # GET /supplier_contacts/1/edit
  def edit
  end

  # POST /supplier_contacts or /supplier_contacts.json
  def create
    @supplier_contact = SupplierContact.new(supplier_contact_params)

    respond_to do |format|
      if @supplier_contact.save
        format.html { redirect_to @supplier_contact, notice: "Supplier contact was successfully created." }
        format.json { render :show, status: :created, location: @supplier_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplier_contacts/1 or /supplier_contacts/1.json
  def update
    respond_to do |format|
      if @supplier_contact.update(supplier_contact_params)
        format.html { redirect_to @supplier_contact, notice: "Supplier contact was successfully updated." }
        format.json { render :show, status: :ok, location: @supplier_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier_contacts/1 or /supplier_contacts/1.json
  def destroy
    @supplier_contact.destroy!

    respond_to do |format|
      format.html { redirect_to supplier_contacts_path, status: :see_other, notice: "Supplier contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_contact
      @supplier_contact = SupplierContact.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def supplier_contact_params
      params.expect(supplier_contact: [ :name, :last_name, :email, :phone ])
    end
end
