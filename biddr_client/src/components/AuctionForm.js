import React from "react";
import { FormErrors } from "./FormErrors";

export const AuctionForm = props => {
  const { data = {}, errors = [] } = props;
  const handleSubmit = event => {
    event.preventDefault();
    const formNode = event.currentTarget;
    const formData = new FormData(formNode);

    if (typeof props.onSubmit === "function") {
      props.onSubmit({
        title: formData.get("title"),
        description: formData.get("description"),
        ends_at: formData.get("ends_at"),
        reserve_price: formData.get("reserve_price")
      });
    }
  };
  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor="title">Title</label> <br />
        <FormErrors forField="title" errors={errors} />
        <input name="title" id="title" defaultValue={data.title} />
      </div>
      <div>
        <label htmlFor="description">Description</label> <br />
        <FormErrors forField="description" errors={errors} />
        <textarea
          name="description"
          id="description"
          cols="60"
          rows="4"
          defaultValue={data.description}
        />
      </div>
      <div>
        <label htmlFor="ends_at">Ends at</label> <br />
        <FormErrors forField="ends_at" errors={errors} />
        <input name="ends_at" id="ends_at" defaultValue={data.ends_at} />
      </div>
      <div>
        <label htmlFor="reserve_price">Reserve price</label> <br />
        <FormErrors forField="reserve_price" errors={errors} />
        <input name="reserve_price" id="reserve_price" defaultValue={data.reserve_price} />
      </div>
      <div>
        <input type="submit" value="Submit" />
      </div>
    </form>
  );
};
