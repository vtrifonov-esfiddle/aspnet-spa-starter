import React, { useState, useEffect } from "react";

export interface IProps {
  id: number;
}

export interface IWeather {
  summary: string;
  temperatureC: number;
  date: string;
}

export function Weather(props: IProps) {
  const [weather, setWeather] = useState(null);

  async function fetchWeather(id) {
    const response = await fetch(`/WeatherForecast/${id}/`);
    setWeather(await response.json());
  }
  useEffect(() => {
    fetchWeather(props.id);
  }, [props.id]);

  if (!weather) {
    return <div>loading...</div>;
  }

  return (
    <div>
      <h2 className="summary">Forecast: {weather.summary}</h2>
      <strong>{weather.temperatureC}</strong> °C
      <br />
      Date: {weather.date}
    </div>
  );
}