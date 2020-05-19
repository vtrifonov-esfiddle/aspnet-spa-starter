import { Injectable } from '@angular/core';


export interface IWeather {
  date: Date;
  temperatureC: number;
  temperatureF: number;
  summary: string;
}

@Injectable({
  providedIn: 'root'
})
export class WeatherService {

  constructor() { }

  async getWeather(weatherId: number = 1): Promise<IWeather> {
    const response = await fetch(`/WeatherForecast/${weatherId}`);
    if (!response.ok)
      return null;
      
    const result: IWeather = await response.json();
    result.date = new Date(result.date);
    return result;
  }
}
