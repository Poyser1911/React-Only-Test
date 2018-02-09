import React, { Component } from "react";
import Main from "../../hoc/Main";
import { Row, Input, Col, Button } from "react-materialize";
import axios from "../../http/axios";
import { toast, ToastContainer } from "react-toastify";

class Login extends Component {
  state = {
    identity: "Poyser",
    password: "testpass"
  };
  onUpdated = event => {
    this.setState({
      ...this.state,
      [event.target.name]: event.target.value
    });
  };
  onSignIn = () => {
    console.log(this.state);
    axios
      .post("/user/signin", {
        identity: this.state.identity,
        password: this.state.password
      })
      .then(
        res => {
          console.log(res);
          console.log('Token',res.data.token);
          localStorage.setItem('token',res.data.token);
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
        <div>
          <Row>
            <Col s={12} m={8} l={4} offset="m2 l4">
              <Input
                s={12}
                defaultValue={this.state.identity}
                onChange={this.onUpdated}
                name="identity"
                label="Email/User Name"
              />
            </Col>
          </Row>
          <Row>
            <Col s={12} m={8} l={4} offset="m2 l4">
              <Input
                s={12}
                defaultValue={this.state.password}
                onChange={this.onUpdated}
                type="password"
                name="password"
                label="Password"
              />
            </Col>
          </Row>
          <Row className="center">
            <Button onClick={this.onSignIn} s={12}>
              Login
            </Button>
          </Row>
        </div>
      </Main>
    );
  }
}

export default Login;
