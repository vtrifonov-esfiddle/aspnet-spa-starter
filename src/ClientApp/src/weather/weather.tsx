import React, { useState, useEffect } from "react";
import './weather.scss'
export interface IProps {
}

export interface IWeather {
  summary: string;
  temperatureC: number;
  temperatureF: number;
  date: string;
}

export function Weather(props: IProps) {
  const [weatherForecasts, setWeatherForecasts] = useState([] as IWeather[]);

  async function fetchWeatherForecasts() {
    const response = await fetch('/WeatherForecast/');
    if (!response.ok) {
      return;
    }
    let weatherForecasts = await response.json();
    weatherForecasts.map(w => w.date = new Date(w.date).toDateString());
    setWeatherForecasts(weatherForecasts);
  }
  useEffect(() => {
    fetchWeatherForecasts();
  }, [props]);

  return (
    <div className="Weather">
      <table>
        <thead>
          <tr>
            <th>Date</th>
            <th>Temp. °C</th>
            <th>Temp. °F</th>
            <th>Summary</th>
          </tr>
        </thead>
        <tbody>
          {weatherForecasts.map((forecast, index) =>
            <tr key={index}>
              <td>{forecast.date}</td>
              <td>{forecast.temperatureC}</td>
              <td>{forecast.temperatureF}</td>
              <td>{forecast.summary}</td>
            </tr>
          )}
        </tbody>
        <caption>Weather forecast</caption>
      </table>
    </div>
  );
}