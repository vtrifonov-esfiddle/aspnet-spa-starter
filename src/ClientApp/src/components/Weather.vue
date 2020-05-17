<template>
  <div class="weather">
    <h1>Weather</h1>
    <div class="weather-loaded" v-if="!loading && !showError">
        <h2>Summary: {{forecast.summary}}</h2>
        <ul>
            <li>Temperature {{forecast.temperatureC }} ℃</li>
            <li>Temperature {{forecast.temperatureF}} ℉</li>
            <li>Date: {{forecast.date.toDateString() }}</li>
        </ul>
    </div>
    <div class="weather-loading" v-if="showError">
        <h2>Error</h2>
        <p>{{errorMessage}}</p>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

class Forecast {
  constructor(
    public date: Date,
    public temperatureC: number,
    public temperatureF: number,
    public summary: string,
  ) {}
}

@Component
export default class Weather extends Vue {
    private showError = false;
    private errorMessage = '';
    private forecast = {} as Forecast;

    private created() {
        this.fetchWeatherForecast(1);
    }

    private async fetchWeatherForecast(weatherId: number) {
        try {
            const response = await fetch(`/WeatherForecast/${weatherId}`);
            this.forecast = await response.json().then(responseForecast => {
                responseForecast.date = new Date(responseForecast.date);
                return responseForecast;
            });
        } catch (e) {
            this.showError = true;
            this.errorMessage = `Error while loading weather forecast: ${e.message}.`;
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
ul {
    list-style-type: none;
    padding: 0;
}
li {
    display: block;
    margin: 0 10px;
}
</style>
