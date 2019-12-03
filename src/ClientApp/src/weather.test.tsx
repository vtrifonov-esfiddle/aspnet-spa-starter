import { render, unmountComponentAtNode } from "react-dom";
import React from "react";
import { act } from "react-dom/test-utils";

import { Weather, IWeather } from "./weather";

let container = null;
beforeEach(() => {
  // setup a DOM element as a render target
  container = document.createElement("div");
  document.body.appendChild(container);
});

afterEach(() => {
  // cleanup on exiting
  unmountComponentAtNode(container);
  container.remove();
  container = null;
});

test('Weather compile', () => {
  var id = 1;

  act(() => {    
      const mockedFetch = jest.fn();
    
      mockedFetch.mockResolvedValue({
        date: new Date('2019-04-05').toDateString(),
        temperatureC: -5,
        summary: 'Test London mild weather'
      } as IWeather);

      window['testFetch'] = mockedFetch;
      //render(<Weather id={id} />, container);
  });
});