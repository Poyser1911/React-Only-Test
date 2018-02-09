import React, { Component } from "react";
import "./App.css";

import { Route, Switch } from "react-router-dom";

import Home from "../components/Home/Home";
import Login from "../containers/Login/Login";
import Register from "../containers/Register/Register";
import Question from "../components/Question/Question";
import UnknownRoute from "../components/Errors/404/UnknownRoute";

class App extends Component {
  render() {
    return (
      <Switch>
        <Route path={"/home"} component={Home} />
        <Route path={"/login"} component={Login} />
        <Route path={"/register"} component={Register} />
        <Route path={"/q"} exact={true} component={Home} />
        <Route path={"/q"} component={Question} />
        <Route path={"/"} exact={true} component={Home} />
        <Route path={"/"} component={UnknownRoute} />
      </Switch>
    );
  }
}

export default App;
