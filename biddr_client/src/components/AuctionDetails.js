import React from "react";

export function AuctionDetails(props) {
  return (
    <div>
      <h2>{props.title}</h2>
      <p>
        {props.description}
        <br />
        By {props.author && props.author.full_name}
      </p>
      <p>
        <small>Created at {props.created_at}</small>
      </p>
    </div>
  );
}
