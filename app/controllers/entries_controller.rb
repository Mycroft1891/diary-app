class EntriesController < ApplicationController

  def index
    @entries = current_user.entries.current_month
    @entry = Entry.new
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    if @entry.save
      flash[:success] = "Created post"
      redirect_to entries_path
    else
      flash[:danger] = "Failed Create"
      render 'index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :content)
  end
end
