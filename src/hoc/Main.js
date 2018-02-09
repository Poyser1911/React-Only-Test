import React from "react";
import Header from "../components/Header/Header";
import "./Main.css";


const Main = props => (
  <div>
    <Header {...props} />
    <div className="pad-top">{props.children}</div>
  </div>
);
export default Main;
