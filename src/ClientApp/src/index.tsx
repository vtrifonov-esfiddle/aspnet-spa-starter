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

ReactDOM.render(
  <Weather id={1} />,
  document.getElementById('root')
);
