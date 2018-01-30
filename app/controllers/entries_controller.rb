class EntriesController < ApplicationController

  before_action :define_entries

  def index
    @entry = Entry.new
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.date = Time.now.beginning_of_day
    if @entry.save
      flash[:success] = "Created post"
      redirect_to entries_path
    else
      render 'index'
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(entry_params)
      flash[:success] = "Your changes were saved"
      redirect_to entries_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :content)
  end

  def define_entries
    @entries = current_user.entries.current_month
  end
end
