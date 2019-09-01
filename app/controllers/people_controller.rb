class PeopleController < ApplicationController

  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
    else
      flash[:error] = @person.error
      render :new
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to @person
    else
      flash[:error] = @person.error
      render :edit
    end
  end

  def destroy
    if @person.destroy
      flash[:notice] = 'Person successfully destroyed'
    else
      flash[:error] = 'Something went wrong, please, try again.'
    end
    redirect_to people_path
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :middle_name, :sex)
  end

end
