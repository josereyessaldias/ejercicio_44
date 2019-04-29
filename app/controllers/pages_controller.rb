class PagesController < ApplicationController
  authorize_resource :class => PagesController
  
  def index
    @users = User.all
    if user_signed_in?
      @user_activities = Activity.where.not(id: current_user.activities.pluck(:id))
      @contacts = current_user.contacting
    end
    @promotes = PromoteActivity.where(payed: true)

    @sucesos = []
    @contacts.each do |c|
      User.find(c.followed_id).user_activity.each do |suc|
        @sucesos << suc
      end
    end
    current_user.user_activity.each do |suceso|
       @sucesos << suceso
    end
    @sucesos.sort_by {|event| event.created_at}
    @sucesos.reverse!

  end  

  def user_page
    @user = User.find(params[:user_id])
  	@activities = UserActivity.where(user_id: params[:user_id]).order(:created_at).reverse
    @categories = Category.all
    if user_signed_in?
      if current_user.contacting.find_by(followed_id: @user.id) != nil
        @following = true
      else
        @following = false
      end
    end
    


  end

end
