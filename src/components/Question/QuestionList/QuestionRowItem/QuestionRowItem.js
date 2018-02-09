import React from "react";

const QuestionRowItem = (props) => (
  <tr onClick={props.click}>
    <td>{props.name}</td>
    <td>{props.desc}</td>
    <td>{props.cat}</td>
  </tr>
);

export default QuestionRowItem;
