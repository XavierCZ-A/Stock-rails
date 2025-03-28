class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]
  layout "product"

  # GET /suppliers or /suppliers.json
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
    @supplier_contacts = @supplier.supplier_contacts.ordered
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)
      if @supplier.save
        redirect_to @supplier, notice: "Supplier was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
      if @supplier.update(supplier_params)
        redirect_to @supplier, notice: "Supplier was successfully updated."
        render :show, status: :ok, location: @supplier
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    @supplier.destroy!
      redirect_to suppliers_path, status: :see_other, notice: "Supplier was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.expect(supplier: [ :company_name, :name, :email, :phone, :address ])
    end
end
