class UserController < ApplicationController

    layout false
    skip_before_action :verify_authenticity_token
def read
    c=User.all
    render json: c
end


def create
    c=User.create(email: params[:email],password: params[:password],phone: params[:phone],name: params[:name])
    render json:c
  end


  def update
    c=User.find(params[:id])
    
    c=c.update(email: params[:email],password: params[:password],phone: params[:phone],name: params[:name])
    render json: c
  end 


  def check
    c=User.find(params[:id])
    if c.email == params[:email]
        if c.autenticate(params[:password])
            render html: "correct Password"
        else
            render html: "incorrect Password"
        end
    else 
        render html: "Email Id Does Not exists"
    end

  end
  def passupdate
    c=User.find(params[:id])
    if c.email == params[:email]
        if c.autenticate(params[:pass])
            c.update(pass: params[:newpass])
            render html: "Updated"
        end
        render html: "incorrect Password"
    else
        render html: "Email Id Does Not exists"
    end 
  end  
end
