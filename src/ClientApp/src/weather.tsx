import React, { useState, useEffect } from "react";

export interface IProps {
  id: number;
}

export interface IWeather {
  summary: string;
  temperatureC: number;
  date: string;
}

const testFetchPromiseImpl = new Promise<IWeather>((resolve, reject) => {
  resolve({
    date: new Date('2019-04-05').toDateString(),
    temperatureC: 10,
    summary: 'London mild weather'
  } as IWeather);
}); 

window['testFetch'] = (uri: string) => (testFetchPromiseImpl);

export function Weather(props: IProps) {
  const [weather, setWeather] = useState(null);

  async function fetchWeather(id) {
    // const response = await fetch(`/WeatherForecast/${id}/`);
    // setWeather(await response.json());
    const jsonResponse = await window['testFetch'](`/WeatherForecast/${id}/`);
    setWeather(jsonResponse);
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