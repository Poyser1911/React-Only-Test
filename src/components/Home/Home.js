import React, { Component } from "react";
import { Container } from "react-materialize";
import QuestionListWithRouter from "../Question/QuestionList/QuestionList";
import Main from "../../hoc/Main";

import { Row } from "react-materialize";
class Home extends Component {
  state = {
    search: ""
  };
  onSearchChanged = event => {
    //console.log("Home Component => Search Changed: " + event.target.value);
    this.setState({
      search: event.target.value,
    })
  };
  render() {
    return (
      <Main updateSearch={this.onSearchChanged}>
        <Row className="center">
          {/*<h1 className="center flow-text">Recent</h1>*/}
        </Row>
        <Container>
          <QuestionListWithRouter searchfilter={this.state.search}/>
        </Container>
      </Main>
    );
  }
}

export default Home;
