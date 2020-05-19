import { Component } from '@angular/core';
import { WeatherService, IWeather } from './weather.service';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  constructor (weatherService: WeatherService) { 
     weatherService.getWeather().then((weather) => {
      this.weather = weather;
     })
  }
  weather: IWeather;
  title = 'aspnet-spa-starter';
}
