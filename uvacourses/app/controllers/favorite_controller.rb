class FavoriteController < ActionController::Base
  def index 
    list
  end
 
  def list
    if cookies.permanent[:unique].blank?
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...50).map{ o[rand(o.length)] }.join
      cookies.permanent[:unique] = string
    end
    @favorite = Favorite.find_by_sql("SELECT * FROM Favorites, Courses WHERE Favorites.cookieID = '#{cookies[:unique]}' AND Courses.id == Favorites.vakID")
  end  
  
  def add
      favorite = Favorite.find_or_create_by_cookieID_and_vakID(:cookieID => cookies[:unique], :vakID => params[:vakID])
      favorite.save
      redirect_to '/course/list'
  end
  
  def delete
    delete = Favorite.where(:cookieID => cookies[:unique], :vakID => params[:vakID]).destroy_all
    redirect_to '/favorite/list'    
  end
  
end