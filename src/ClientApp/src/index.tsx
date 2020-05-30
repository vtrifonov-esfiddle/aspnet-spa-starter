import React from 'react';
import ReactDOM from 'react-dom';
import { Weather } from './weather/weather';

interface IState {
  value: string;
}

export interface ISandboxProps {
  name: string;
}

ReactDOM.render(
  <Weather />,
  document.getElementById('root')
);
