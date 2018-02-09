import React from "react";
import { Route, Switch } from "react-router-dom";
import AddQuestion from "../../containers/AddQuestion/AddQuestion";
import QuestionInfo from "../../containers/QuestionInfo/QuestionInfo";

const Question = () => (
  <Switch>
    <Route path="/q/add" component={AddQuestion} />
    <Route path={"/q/:id"} component={QuestionInfo} />
  </Switch>
);

export default Question;
