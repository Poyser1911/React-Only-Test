import React, { Component } from "react";

import { Row, Col, Input, Button } from "react-materialize";
import Main from "../../hoc/Main";
import axios from "../../http/axios";
import { ToastContainer, toast } from "react-toastify";
class AddQuestion extends Component {
  state = {
    subject: "Creating Drools .drl files programmatically",
    desc:
      "I have a requirement to generate drools drl files programmatically based on a service response from an external system. What is the recommended way to acheive this",
    cat: 3,
    tags: "Drools,.drl,response,programmatically"
  };
  onUpdated = event => {
    this.setState({
      ...this.state,
      [event.target.name]: event.target.value
    });
  };
  onSubmitQuestion = () => {
    const question = {
      ...this.state
    };
    question.tags = question.tags.split(",");
    console.log(question);
    axios
    .post("/question?token="+localStorage.getItem('token'), {
      subject: question.subject,
      desc: question.desc,
      category: question.cat,
      tags: question.tags
    })
    .then(
      res => {
        console.log(res);
        console.log('Token',res.data.token);
       toast.success("Success", {
          position: toast.POSITION.BOTTOM_LEFT,
          hideProgressBar: true,
          className: "green darken-1",
          autoClose: 2000,
          onClose: () => this.props.history.replace("/")
        });
      },
      err => {
        //Assumed status[442]
        toast.error(Object.values(err.response.data.errors)[0].toString(), {
          position: toast.POSITION.BOTTOM_RIGHT,
          hideProgressBar: true
        });
      }
    );
  };
  render() {
    return (
      <Main>
        <ToastContainer/>
        <div className="">
          <h3 className="center">Submit Question</h3>
          <Row>
            <Col s={12} m={8} l={4} offset="m2 l4">
              <Input
                onChange={this.onUpdated}
                defaultValue={this.state.subject}
                s={12}
                name="subject"
                label="Subject"
              />
            </Col>
          </Row>
          <Row>
            <Col s={12} m={8} l={4} offset="m2 l4">
              <Input
                onChange={this.onUpdated}
                defaultValue={this.state.desc}
                s={12}
                name="desc"
                label="Description"
              />
            </Col>
          </Row>
          <Row>
            <Col s={12} m={8} l={4} offset="m2 l4">
              <Input
                onChange={this.onUpdated}
                defaultValue={this.state.cat}
                s={12}
                name="cat"
                type="select"
                label="Category"
                icon="extension"
              >
                <option value="1">Home</option>
                <option value="2">Work</option>
                <option value="3">Other</option>
              </Input>
            </Col>
          </Row>
          <Row>
            <Col s={12} m={8} l={4} offset="m2 l4">
              <Input
                onChange={this.onUpdated}
                defaultValue={this.state.tags}
                s={12}
                name="tags"
                label="Comma Seperated Tags"
              />
            </Col>
          </Row>
          <Row className="center">
            <Button onClick={this.onSubmitQuestion} s={12}>
              Submit
            </Button>
          </Row>
        </div>
      </Main>
    );
  }
}
export default AddQuestion;
