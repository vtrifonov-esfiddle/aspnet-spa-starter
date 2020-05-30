import { Injectable } from '@angular/core';


export interface IWeather {
  date: string;
  temperatureC: number;
  temperatureF: number;
  summary: string;
}

@Injectable({
  providedIn: 'root'
})
export class WeatherService {

  constructor() { }

  async getWeatherForecasts(): Promise<IWeather[]> {
    const response = await fetch(`/WeatherForecast/`);
    if (!response.ok)
      return null;
      
    const result: IWeather[] = await response.json();
    return result.map(weather => (
      {...weather, date: new Date(weather.date).toDateString()}
    ));
  }
}
