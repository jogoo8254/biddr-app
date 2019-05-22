import React, { Component } from "react";
import { BidList } from "./BidList";
import { AuctionDetails } from "./AuctionDetails";
import { Auction } from "../api/auction";
import { PrimaryButton } from "office-ui-fabric-react/lib/Button";

export class AuctionShowPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      auction: null
    };
  }
  componentDidMount() {
    const id = this.props.match.params.id;

    Auction.one(id).then(auction => {
      this.setState({
        auction
      });
    });
  }
  render() {
    if (!this.state.auction) {
      return (
        <main className="Page">
          <h2>Auction doesn't exist!</h2>
        </main>
      );
    }
    return (
      <main className="Page">
        <AuctionDetails {...this.state.auction} />
        <div>
        </div>
        <h2>Bids</h2>
        <BidList
          bids={this.state.auction.bids}
        />
      </main>
    );
  }
}
