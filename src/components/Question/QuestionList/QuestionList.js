import React, { Component } from "react";
import { Table } from "react-materialize";

import { Row, Col } from "react-materialize";
import QuestionRowItem from "./QuestionRowItem/QuestionRowItem";
import { withRouter } from "react-router-dom";
import axios from "../../../http/axios";
import { toast, ToastContainer } from "react-toastify";

import "./QuestionList.css";

class QuestionList extends Component {
  state = {
    questions: []
  };
  componentDidMount() {
    this.getAllQuestions();
  }
  getAllQuestions = () => {
    axios.post("/questions").then(
      res => {
        this.setState({
          questions: res.data.data
        });
        console.log(res.data.data);

        toast.success("Success", {
          position: toast.POSITION.BOTTOM_LEFT,
          hideProgressBar: true,
          className: "green darken-1",
          autoClose: 2000
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
  componentDidUpdate(prevProps, prevState) {
    if (this.props.searchfilter !== prevProps.searchfilter) {
      if (this.props.searchfilter.trim() === "") {
        this.getAllQuestions();
        return;
      }
      const tags = this.props.searchfilter.split(",");
      //console.log("Searching for tags with", tags);
      axios
        .post("/questions/q", {
          tagnames: tags
        })
        .then(
          res => {
            console.log(res.data);
            var questions = res.data.map(tagwithquestion => {
              tagwithquestion.question[0].id = tagwithquestion.question_id;
              tagwithquestion = tagwithquestion.question;
              return tagwithquestion;
            });
            questions = questions.map(q => {
              q = q[0];
              return q;
            });
            console.log(questions);
            this.setState({
              questions: questions
            });
            /*toast.success("Success", {
            position: toast.POSITION.BOTTOM_LEFT,
            hideProgressBar: true,
            className: "green darken-1",
            autoClose: 2000
          });*/
          },
          err => {
            //Assumed status[442]
            toast.error(Object.values(err.response.data.errors)[0].toString(), {
              position: toast.POSITION.BOTTOM_RIGHT,
              hideProgressBar: true
            });
          }
        );
    }
  }
  onItemClicked = id => {
    this.props.history.push("/q/" + id);
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
      <Row>
        <ToastContainer />
        <Col s={12} m={8} l={8} offset="m2 l2">
          <Table s={12} hoverable={true}>
            <thead>
              <tr>
                <th data-field="id">Subject</th>
                <th data-field="desc">Description</th>
                <th data-field="cat">Category</th>
              </tr>
            </thead>
            <tbody>
              {this.state.questions.map(q => {
                return (
                  <QuestionRowItem
                    click={() => this.onItemClicked(q.id)}
                    key={q.id}
                    id={q.id}
                    name={q.subject}
                    desc={q.desc}
                    cat={this.getCategoryFromId(q.category)}
                  />
                );
              })}
            </tbody>
          </Table>
        </Col>
      </Row>
    );
  }
}
const QuestionListWithRouter = withRouter(QuestionList);
export default QuestionListWithRouter;
