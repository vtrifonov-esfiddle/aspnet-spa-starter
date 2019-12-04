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

test('Weather compile with mock data', async() => {
  var id = 1;
  
  const expectedValue = {
    date: new Date('2019-04-05').toDateString(),
    temperatureC: -5,
    summary: 'Test London mild weather'
  } as IWeather;
  
  const fetchSpy = jest.spyOn(window, 'fetch').mockImplementation(() =>
    Promise.resolve({ 
      json: () => Promise.resolve(expectedValue)
    } as Response));
  await act(async() => {    
      render(<Weather id={id} />, container);
  });

  expect(fetchSpy.mock.calls.length).toBe(1);
  expect(container.innerHTML).toMatchSnapshot();

  fetchSpy.mockReset();
});