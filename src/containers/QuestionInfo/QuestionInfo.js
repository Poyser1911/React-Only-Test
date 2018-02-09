import React, { Component } from "react";
import { Row, Col, Chip, Icon } from "react-materialize";
import Main from "../../hoc/Main";
import axios from "../../http/axios";
import { toast, ToastContainer } from "react-toastify";
import Moment from "react-moment";
import Input from "react-materialize/lib/Input";
import Button from "react-materialize/lib/Button";
class QuestionInfo extends Component {
  state = {
    id: "",
    subject: "",
    desc: "",
    cat: "",
    tags: [],
    user: {},
    created_at: "",
    answers: [],

    answer: ""
  };
  onAnswerSubmit = () => {
    console.log(this.state.answer);

    axios
      .post(
        "/question/" +
          this.state.id +
          "/answer?token=" +
          localStorage.getItem("token"),
        {
          answer: this.state.answer
        }
      )
      .then(
        res => {
          console.log(res);
          this.getQuestionInfo();
          toast.success("Success", {
            position: toast.POSITION.BOTTOM_LEFT,
            hideProgressBar: true,
            className: "green darken-1",
            autoClose: 2000
          });
        },
        err => {
          //Assumed status[442]
          try{
          toast.error(Object.values(err.response.data.errors)[0].toString(), {
            position: toast.POSITION.BOTTOM_RIGHT,
            hideProgressBar: true
          });
        }catch(e) {
            console.log(e);
        }
        }
      );
  };
  onUpdated = event => {
    this.setState({
      ...this.state,
      [event.target.name]: event.target.value
    });
  };
  componentDidMount = () => {
    console.log(this.props);
    this.getQuestionInfo();
  };
  getQuestionInfo = () => {
    axios.post("/question/" + this.props.match.params.id).then(
      res => {
        console.log(res.data);
        this.setState({
          id: res.data.id,
          subject: res.data.subject,
          desc: res.data.desc,
          cat: res.data.category,
          tags: res.data.tags,
          user: res.data.user,
          created_at: res.data.created_at,
          answers: res.data.answers
        });
      },
      err => {
        //Assumed status[442]
        try{
        toast.error(Object.values(err.response.data.errors)[0].toString(), {
          position: toast.POSITION.BOTTOM_RIGHT,
          hideProgressBar: true
        });
      }catch(e){
        console.log(e);
      }
      }
    );
  };
  getCategoryFromId(id) {
    switch (id) {
      case "1":
        return "Health";
      case "2":
        return "Season";
      case "3":
        return "Coding";
      default:
        return "";
    }
  }
  render() {
    return (
      <Main>
        <ToastContainer />
        <Row>
          <Col s={12} m={8} l={8} offset="m2 l2">
            <ul>
              <li>
                Submited By: {this.state.user.username}{" "}
                {this.state.created_at === "" ? (
                  ""
                ) : (
                  <Moment fromNow>{this.state.created_at}</Moment>
                )}
              </li>
              <br />
              <li>Subject: {this.state.subject}</li>
              <br />
              <li>Description: {this.state.desc}</li>
              <li>Category: {this.getCategoryFromId(this.state.cat)}</li>
              <br />
              {this.state.tags.map((tag, index) => {
                return <Chip key={index}>{tag.name}</Chip>;
              })}
            </ul>
          </Col>
        </Row>
        <Row>
          <Col s={12} m={8} l={8} offset="m2 l2">
            <Input
              s={12}
              name="answer"
              onChange={this.onUpdated}
              type="textarea"
              label={
                "Submit Answer to " + this.state.user.username + "'s Question"
              }
            />
          </Col>
        </Row>
        <Row className="center">
          <Button onClick={this.onAnswerSubmit}>Submit</Button>
        </Row>
        <Row>
          <Col s={12} m={8} l={8} offset="m2 l2">
            {this.state.answers.length === 0 ? (
              <h1 className="flow-text">No Answers Submitted</h1>
            ) : (
              <h1 className="flow-text">{this.state.answers.length} Answers</h1>
            )}

            {this.state.answers.map(a => {
              return (
                <ul
                  key={a.id}
                  style={{ padding: "3%", borderRadius: "10px" }}
                  className="z-depth-1 lighten-2"
                >
                  <li>
                    <Icon className="right red-text">delete_forever</Icon>
                    Answer by {a.user.username}{" "}
                    {a.created_at === "" ? (
                      ""
                    ) : (
                      <Moment fromNow>{a.created_at}</Moment>
                    )}
                  </li>
                  <br />
                  <li>{a.solution}</li>
                  <br />
                  <li className="right">Overall Vote: {a.overallvote}</li>
                </ul>
              );
            })}
          </Col>
        </Row>
      </Main>
    );
  }
}

export default QuestionInfo;
