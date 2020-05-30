import { render } from '@testing-library/react';
import React from "react";
import { Weather, IWeather } from "./weather";

describe('Weather forecast', () => {
  it('should look sensible', () => {
    const { container } = render(<Weather />);
    expect(container).toMatchSnapshot();
  });
  
  it('should fetch weather from API', () => {
  
    const expectedValue = [{
      date: new Date('2019-04-05').toDateString(),
      temperatureC: -5,
      temperatureF: -30,
      summary: 'Test London mild weather'
    } as IWeather];

    const fetchSpy = jest.spyOn(window, 'fetch').mockImplementation((input) => {
      if (input === '/WeatherForecast/') {
        return Promise.resolve({ 
          json: () => Promise.resolve(expectedValue)
        } as Response);
      }
      else
        return Promise.reject();
    });
    try {
      render(<Weather />);

      expect(fetchSpy).toHaveBeenCalledTimes(1);
    }
    finally {
      fetchSpy.mockReset();
    }
  });
})
