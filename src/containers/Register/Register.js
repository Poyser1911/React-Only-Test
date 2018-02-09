import React, { Component } from "react";
import Main from "../../hoc/Main";

import { Row, Input, Col, Button } from "react-materialize";
import axios from "../../http/axios";
import { ToastContainer, toast } from "react-toastify";

class Register extends Component {
  state = {
    email: "poyser1911@gmail.com",
    username: "Poyser",
    password: "testpass",
    errors: null
  };
  onRegisterSubmit = () => {
    axios
      .post("/user", {
        email: this.state.email,
        username: this.state.username,
        password: this.state.password
      })
      .then(
        res => {
          console.log(res);
          toast.success("Success", {
            position: toast.POSITION.BOTTOM_RIGHT,
            hideProgressBar: true,
            className: "green darken-1",
            autoClose: 1000,
            onClose: () => this.props.history.replace("/login")
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
  onUpdated = event => {
    this.setState({
      ...this.state,
      [event.target.name]: event.target.value
    });
  };
  render() {
    return (
      <Main>
        <ToastContainer />
        <div className="">
          <Row>
            <Col s={12} m={8} l={4} offset="m2 l4">
              <Input
                defaultValue={this.state.email}
                name="email"
                s={12}
                onChange={this.onUpdated}
                label="Email"
              />
            </Col>
          </Row>
          <Row>
            <Col s={12} m={8} l={4} offset="m2 l4">
              <Input
                defaultValue={this.state.username}
                name="username"
                s={12}
                onChange={this.onUpdated}
                label="User Name"
              />
            </Col>
          </Row>
          <Row>
            <Col s={12} m={8} l={4} offset="m2 l4">
              <Input
                type="password"
                defaultValue={this.state.password}
                name="password"
                s={12}
                onChange={this.onUpdated}
                label="Password"
              />
            </Col>
          </Row>
          <Row className="center">
            <Button onClick={this.onRegisterSubmit} s={12}>
              Register
            </Button>
          </Row>
        </div>
      </Main>
    );
  }
}
export default Register;
