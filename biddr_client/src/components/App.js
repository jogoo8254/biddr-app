import React, { Component } from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import { AuctionIndexPage } from './AuctionIndexPage';
import { AuctionNewPage } from './AuctionNewPage';
import { AuctionShowPage } from './AuctionShowPage';
import { WelcomePage } from './WelcomePage';
import { NavBar } from './NavBar';
import { SignInPage } from './SignInPage';
import { User } from '../api/user';


class App extends Component {
  constructor(props){
    super(props);
    this.state={
      currentUser: null,
    }
  }
  getCurrentUser=()=>{
    return User.current().then((user)=>{
      this.setState({currentUser: user})
    })
  }
  render(){
    return (
      <BrowserRouter>
      <div>
      <header>
            <NavBar currentUser={this.state.currentUser} />
          </header>
          <Switch>
            <Route exact path="/" component={WelcomePage} />
            <Route
              exact
              path="/sign_in"
              render={(routeProps) => <SignInPage {...routeProps} onSignIn={this.getCurrentUser} />}
            />
            <Route exact path="/auctions" component={AuctionIndexPage} />
            <Route exact path="/auctions/new" component={AuctionNewPage} />
            <Route path="/auctions/:id" component={AuctionShowPage} />
          </Switch>
      </div>
      </BrowserRouter>
    );  
  }
}
export {App};
