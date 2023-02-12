class BatchImportsController < ApplicationController
  before_action :set_batch_import, only: %i[ show edit update destroy export_csv]

  # GET /batch_imports or /batch_imports.json
  def index
    @batch_imports = BatchImport.all
  end

  # GET /batch_imports/1 or /batch_imports/1.json
  def show
  end

  # GET /batch_imports/new
  def new
    @batch_import = BatchImport.new
  end

  # GET /batch_imports/1/edit
  def edit
  end

  # POST /batch_imports or /batch_imports.json
  def create
    @file_import = BatchImport.import(params[:batch_import][:file])
    if @file_import[:status]
      @batch_import = BatchImport.new(@file_import[:data])
      respond_to do |format|
        if @batch_import.save
          format.html { redirect_to batch_import_url(@batch_import), notice: "Batch import was successfully created." }
          format.json { render :show, status: :created, location: @batch_import }
        else
          debugger
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @batch_import.errors, status: :unprocessable_entity }
        end
      end
      # respond_to do |format|
      #   format.html { redirect_to batch_import_url(@batch_import), notice: "Batch import was successfully created." }
      #   format.json { render :show, status: :created, location: @batch_import }
      # end
    else
      respond_to do |format|
        format.html { redirect_to new_batch_import_path(), alert: "#{@file_import[:message]}" }
        format.json { render json: @file_import, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_imports/1 or /batch_imports/1.json
  def update
    respond_to do |format|
      if @batch_import.update(batch_import_params)
        format.html { redirect_to batch_import_url(@batch_import), notice: "Batch import was successfully updated." }
        format.json { render :show, status: :ok, location: @batch_import }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_imports/1 or /batch_imports/1.json
  def destroy
    @batch_import.destroy

    respond_to do |format|
      format.html { redirect_to batch_imports_url, notice: "Batch import was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def export_csv
    case params[:type]
    when 'original'
      @file = @batch_import.file_data
      filename = "#{@batch_import.id}-OriginalFile-#{Time.now.to_i}"
    when 'right'
      @file = @batch_import.right_information
      filename = "#{@batch_import.id}-RightItemsFile-#{Time.now.to_i}"
    when 'incorrect'
      @file = @batch_import.incorrect_information
      filename = "#{@batch_import.id}-IncorrectItemsFile-#{Time.now.to_i}"
    end

    respond_to do |format|
      format.html
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=#{filename}.csv"
        render template: 'batch_imports/export_csv'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_import
      @batch_import = BatchImport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_import_params
      params.require(:batch_import).permit(:total_items, :total_revenue, :file_data, :right_information, :incorrect_information, :orders, :file)
    end
end
