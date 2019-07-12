class AdminMainController < AdminPageBaseController
  def index
    if redirectToErrorPageWhenNotLogin
      return
    end
  end
end
