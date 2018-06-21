class UsersController < ApplicationController
  def posts
    user=User.find(params[:id])
    @posts=user.posts
  end

  def login

  end

  def loginprocess
    #1.이메일 가입확인
    user=User.find_by(email: params[:email])
    #1-1 가입되엇으면 비밀번호확인
    if user
      if user.authenticate(params[:password])
        #1-1-1 비밀번호 일치하면 로그인
        session[:user_id]=user.id
        flash[:notice]="로그인 됫따"
        redirect_to '/'
      else  #1-1-2 비밀번호 다르면 flash +:back
        flash[:alert] = "비밀번호가 다릅니다."
        redirect_to :back
      end
      #1-2가입이 안되엇으면 , flash +아비하는곳으로 보낼께
    else
      flash[:alert] = "가입이 안되있따임마."
      redirect_to '/signup'
    end
  end

def logout
  session.clear
  flash[:notice] = "로그아웃에 성공하였습니다"
  redirect_to '/'
end

  def index
    @users=User.all
  end

  def new
  end

  def create
    unless User.find_by(email: params[:email])
      @user=User.create(username: params[:username],email: params[:email],password: params[:password],password_confirmation: params[:password_confirmation])
      if @user.save
        #가입이 되면 ,true +저장이 되고
        flash[:notice]="가입을 축하드립니다"
        redirect_to "/"
      else
        flash[:alert] = "비밀번호가 다릅니다."
        redirect_to "/"
      end
    else
      flash[:alert] = "등록된 이메일입니다."
    end
        #비밀번호가 달라서 가입이 안되면,false +저장이 안됨

  #   #1.email검증
  #   if User.find_by(email: params[:email])
  #     flash[:notice] = "같은이메일이 있다"
  #       redirect_to :back
  #   #1-1 맞으면 비밀번호확인, 틀리면 flash메세지로 비밀번호가 일치하지 않습니다 redirect_to :back
  # else
  #   if params[:password]==params[:password_confirmation]
  #     User.create(username: params[:username],email: params[:email],password: params[:password])
  #     flash[:notice] = "#{params[:username]}님 가입추카"
  #     redirect_to "/"
  #   else
  #     #1-2틀리면 flash메세지로 가입된 이메일 입니다. redirect_to :back
  #     flash[:alert] = "비밀번호가 일치하지 않습니다."
  #     redirect_to :back
  #
  #   end

end
end
