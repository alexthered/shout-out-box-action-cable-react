class Api::V1::ShoutsController < Api::V1::ApiController
  
  def index
    render json: Shout.all, status: 200
  end
  
  def create
    render json: Shout.create!(shout_params), status: 201
  end
  
  def update
    shout = Shout.find(params[:id])
    
    shout.update!(shout_params)
    
    render json: shout, status: 200
  end
  
  def destroy
    shout = Shout.find(params[:id])

    shout.destroy!
    
    head 204
  end
  
  
  private
  
    def shout_params
      params.require(:shout).permit(:name, :content)
    end
  
end
