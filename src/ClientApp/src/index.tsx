import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import { Weather } from './weather';

interface IState {
  value: string;
}

export interface ISandboxProps {
  name: string;
}

export class Sandbox extends React.Component {
  props: ISandboxProps;

  render() {
    if (this.props.name)
      return (
        <div>
          {this.props.name}
        </div>
      );
    else
      return (
        <div>
          No props.name
        </div>
      );
  }
}

ReactDOM.render(
  <Weather id={1} />,
  document.getElementById('root')
);
