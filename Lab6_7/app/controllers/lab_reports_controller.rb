class LabReportsController < ApplicationController
  before_action :set_lab_report, only: %i[ show edit update destroy ]

  # GET /lab_reports or /lab_reports.json
  def index
    @lab_reports = LabReport.all
  end

  # GET /lab_reports/1 or /lab_reports/1.json
  def show
    @lab_report = LabReport.find(params[:id])
  end

  # GET /lab_reports/new
  def new
    @lab_report = LabReport.new
  end

  # GET /lab_reports/1/edit
  # Used for setting grade
  def edit
    @lab_report = LabReport.find(params[:id])
  end

  # POST /lab_reports or /lab_reports.json
  def create
    @lab_report = LabReport.new(lab_report_params)

    respond_to do |format|
      if @lab_report.save
        format.html { redirect_to @lab_report, notice: 'Lab report was successfully created.' }
        format.json { render :show, status: :created, location: @lab_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lab_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lab_reports/1 or /lab_reports/1.json
  # Used for setting grade
  def update
    lab_report = LabReport.find(params[:id])
    respond_to do |format|
      if lab_report.update(params.require(:lab_report).permit(:grade))
        format.html { redirect_to lab_report, notice: 'Lab report was successfully updated.' }
        format.json { render :show, status: :ok, location: lab_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: lab_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_reports/1 or /lab_reports/1.json
  def destroy
    @lab_report.destroy
    respond_to do |format|
      format.html { redirect_to lab_reports_url, notice: 'Lab report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_report
      @lab_report = LabReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lab_report_params
      params.require(:lab_report).permit(:user_id, :title, :description)
    end
end
