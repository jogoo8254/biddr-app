class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_auction, only: [:show]

  def new
    @auction = Auction.new
  end


  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction.id)
    else
      render :new
    end
  end

  def show
    @bid = Bid.new
    @bids = @auction.bids.order(created_at: :desc)

    respond_to do |format|
      format.html { render }
      format.json { render json: @auction }
    end
  end

  def index
    @auctions = Auction.all.order(created_at: :desc)
  end
  private

  def auction_params
   params.require(:auction).permit(:title, :description, :ends_at, :reserve_price)
 end

  def find_auction
   @auction = Auction.find(params[:id])
 end
end
