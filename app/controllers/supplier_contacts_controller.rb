class SupplierContactsController < ApplicationController
  before_action :set_supplier
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
    @supplier_contact.supplier_id = @supplier.id
    if @supplier_contact.save
      redirect_to supplier_path(@supplier_contact.supplier), notice: "Supplier contact was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /supplier_contacts/1 or /supplier_contacts/1.json
  def update
    if @supplier_contact.update(supplier_contact_params)
      redirect_to supplier_path(@supplier_contact.supplier), notice: "Supplier contact was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /supplier_contacts/1 or /supplier_contacts/1.json
  def destroy
    @supplier_contact.destroy!
    redirect_to supplier_path(@supplier_contact.supplier), status: :see_other, notice: "Supplier contact was successfully destroyed."
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end
  def set_supplier_contact
    @supplier_contact = SupplierContact.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def supplier_contact_params
    params.expect(supplier_contact: [:name, :last_name, :email, :phone, :supplier_id])
  end
end
