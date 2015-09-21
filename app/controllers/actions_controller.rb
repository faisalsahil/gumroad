class ActionsController < ApplicationController
  def destroy
    @action = Action.find(params[:id])
    @action.destroy

    respond_to do |format|
      format.html { redirect_to actions_url }
      format.js   { render :nothing => true }
    end
  end
end	