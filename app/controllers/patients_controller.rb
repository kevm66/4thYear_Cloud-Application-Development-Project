class PatientsController < ApplicationController

  # GET /doctors/1/patients
  def index
    # Get the doctor with id=1
    @doctor = Doctor.find(params[:doctor_id])
    # Access all patients for that doctor
    @patients = @doctor.patients
  end

  # GET /doctors/1/patients/2
  def show
    @doctor = Doctor.find(params[:doctor_id])
    # Find a patient in doctors 1 that has id=2
    @patient = @doctor.patients.find(params[:id])
  end

  # GET /doctors/1/patients/new
  def new
    @doctor = Doctor.find(params[:doctor_id])
    # Associate a patient object with doctor 1
    @patient = @doctor.patients.build
  end

  # POST /doctors/1/patients
  def create
    @doctor = Doctor.find(params[:doctor_id])
    # Populate a patient associate with doctor 1 with form data,# Doctor will be associated with the patient
    # @patient = @doctor.patients.build(params.require(:patient).permit!)
    @patient = @doctor.patients.build(params.require(:patient).permit(:firstname, :surname, :admission_date, :dob, :address, :phone, :email, :healthy, :notes))
    if @patient.save
      redirect_to doctor_patient_url(@doctor, @patient)
    else
      render :action => "new"
    end
  end

  # GET /doctors/1/patients/2/edit
  def edit
    @doctor = Doctor.find(params[:doctor_id])
    # Get patient id=2 for doctor 1
    @patient = @doctor.patients.find(params[:id])
  end

  # PUT /doctors/1/patients/2
  def update
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(params.require(:patient).permit(:firstname, :surname, :admission_date, :dob, :address, :phone, :email, :healthy, :notes))
      redirect_to doctor_patient_url(@doctor, @patient)
    else
      render :action => "edit"
    end
  end

  # DELETE /doctors/1/patients/2
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])
    @patient.destroy
    respond_to do |format|
      format.html {redirect_to doctor_patients_path(@doctor)}
      format.xml {head :ok}
    end
  end
end
