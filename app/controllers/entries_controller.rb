class EntriesController < ApplicationController

  before_action :define_entries
  before_action :check_last_entry, only: [:new]

  def index
    @entry = Entry.new
  end

  def show
    @entry = Entry.find(params[:id])
    @related_entries = current_user.entries.limit(3)
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.date = Time.now.beginning_of_day
    if @entry.save
      flash[:success] = "Created post"
      redirect_to entries_path
    else
      render 'new'
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

  def check_last_entry
    if current_user.entries.any? && current_user.entries.last.date == Time.now.beginning_of_day
      flash[:notice] = "Already created today, edit your last entry"
      redirect_to current_user.entries.last
    end
  end
end
