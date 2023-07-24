class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    # binding.pry
    @employee = Employee.find(params[:id])
  end

  def new
    # binding.pry
    @employee = Employee.new
  end

  def create
    # binding.pry
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Employee detail '#{@employee.name}' has been created successfully."
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      flash[:notice] = "Employee detail '#{@employee.id}' has been Updated successfully."
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

   def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "Employee detail '#{@employee.name}' has been deleted successfully."
    redirect_to root_path, status: :see_other
  end

  private
  def employee_params
    # binding.pry
    params.require(:employee).permit(:name, :city, :designation)
  end
end
