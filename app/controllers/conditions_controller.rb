class ConditionsController < ApplicationController

  # GET /patients/1/conditions
  def index
    # Get the patient with id=1
    @patient = Patient.find(params[:patient_id])
    # Access all conditions for that patient
    @conditions = @patient.conditions
  end

  # GET /patients/1/conditions/2
  def show
    @patient = Patient.find(params[:patient_id])
    # Find a condition in patients 1 that has id=2
    @condition = @patient.conditions.find(params[:id])
  end

  # GET /patients/1/conditions/new
  def new
    @patient = Patient.find(params[:patient_id])
    # Associate a condition object with patient 1
    @condition = @patient.conditions.build
  end

  # POST /patients/1/conditions
  def create
    @patient = Patient.find(params[:patient_id])
    # Populate a condition associate with patient 1 with form data,# Patient will be associated with the condition
    # @condition = @patient.conditions.build(params.require(:condition).permit!)
    @condition = @patient.conditions.build(params.require(:condition).permit(:name, :severity, :remedies, :condition_type))
    if @condition.save
      redirect_to patient_condition_url(@patient, @condition)
    else
      render :action => "new"
    end
  end

  # GET /patients/1/conditions/2/edit
  def edit
    @patient = Patient.find(params[:patient_id])
    # Get condition id=2 for patient 1
    @condition = @patient.conditions.find(params[:id])
  end

  # PUT /patients/1/conditions/2
  def update
    @patient = Patient.find(params[:patient_id])
    @condition = Condition.find(params[:id])
    if @condition.update_attributes(params.require(:condition).permit(:name, :severity, :remedies, :condition_type))
      redirect_to patient_condition_url(@patient, @condition)
    else
      render :action => "edit"
    end
  end

  # DELETE /patients/1/conditions/2
  def destroy
    @patient = Patient.find(params[:patient_id])
    @condition = Condition.find(params[:id])
    @condition.destroy
    respond_to do |format|
      format.html {redirect_to patients_conditon_path(@patient)}
      format.xml {head :ok}
    end
  end

end
