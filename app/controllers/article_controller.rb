class ArticleController < ApplicationController

     skip_before_action :verify_authenticity_token
  layout false




  def read
   cread=Article.all
    render json: cread
  end



  def find2
    if(params[:id])
        c=Article.find(params[:id])
        render json: c
    elsif(params[:a_cat])
        const=params[:a_cat]
        c=Article.where(a_cat: const)
        render json: c
    elsif(params[:a_auth])
        const=params[:a_auth]
        c=Article.where(a_auth: const)
        render json: c
    elsif(params[:a_content])
        c=Article.where("a_content like ?","%#{params[:a_content]}%")
        render json: c
    else
       c=Article.where(:a_date => params[:first_date]..params[:last_date]);
       render json: c
    end
end





  def create
    c=Article.create(title: params[:title],a_auth: params[:a_auth],a_date: params[:a_date],a_content: params[:a_content],a_cat: params[:a_cat])
    render json:c
  end





  def update
    c=Article.find(params[:id])
    c=c.update(title: params[:title],a_auth: params[:a_auth],a_date: params[:a_date],a_content: params[:a_content],a_cat: params[:a_cat])
    render json: c
  end






  def delete
    c=Article.find(params[:id])
    c.destroy
  end

end
