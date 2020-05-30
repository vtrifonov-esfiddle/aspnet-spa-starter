import { Component } from '@angular/core';
import { WeatherService, IWeather } from './weather.service';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  constructor (private weatherService: WeatherService) { }

  async ngOnInit() {
    this.weatherForecasts = await this.weatherService.getWeatherForecasts();
  }

  weatherForecasts: IWeather[];
  title = 'aspnet-spa-starter';
}
