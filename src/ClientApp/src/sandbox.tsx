import React from 'react';
import ReactDOM from 'react-dom';

export interface ISandboxProps {
  name: string;
}

export class Sandbox extends React.Component {
  props: ISandboxProps;

  render() {
    if (this.props.name)
      return (
        <div>
          Sandbox {this.props.name}
        </div>
      );
    else
      return (
        <div>
          Sandbox no props.name
        </div>
      );
  }
}