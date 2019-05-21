import React from "react";
function BidDetails(props) {
  return (
    <div>
      <p>
        {props.price}
        <br />
        <br />
        <small>Bided {props.created_at}</small>
      </p>
    </div>
  );
}

export { BidDetails };
