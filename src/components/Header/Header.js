import React from "react";
import "./Header.css";

import { Navbar, Icon } from "react-materialize";
import { Link } from "react-router-dom";

const Header = (props) => (
  <div>
    <Navbar className="green darken-1" brand="Q">
      <ul className="right">
        <li>
          <Link to="/q/add">
            <Icon className="left">add</Icon>Add
          </Link>
        </li>
        <li>
          <Link to="/login">Login</Link>
        </li>
        <li>
          <Link to="/register">Register</Link>
        </li>
      </ul>
      <input
        type="text"
        onChange={props.updateSearch}
        className="browser-default searchbox"
        placeholder="Tags"
      />
    </Navbar>
  </div>
);

export default Header;
