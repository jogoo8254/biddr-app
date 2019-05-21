import React from 'react';
import { NavLink } from 'react-router-dom';

export function NavBar(props) {
  const { currentUser } = props;
  return (
    <nav className="NavBar">
      <NavLink exact to="/">
        Welcome
      </NavLink>
      <NavLink exact to="/auctions">
        Auctions
      </NavLink>
      {currentUser ? (
        <React.Fragment>
          <span>{currentUser.full_name}</span>
          <NavLink exact to="/auctions/new">
            Create An Auction
          </NavLink>
        </React.Fragment>
      ) : (
        <>
          <NavLink exact to="/sign_in">
            Sign In
          </NavLink>
        </>
      )}
    </nav>
  );
}
