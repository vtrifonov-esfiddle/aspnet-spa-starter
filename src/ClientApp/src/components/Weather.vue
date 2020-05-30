<template>
  <div class="weather">
    <table class="weather-loaded" v-if="!showError">
        <thead>
          <tr>
            <th>Date</th>
            <th>Temp. °C</th>
            <th>Temp. °F</th>
            <th>Summary</th>
          </tr>
        </thead>
        <tbody>
            <tr v-for="(forecast, index) in weatherForecasts" v-bind:key="index">
              <td>{{forecast.date}}</td>
              <td>{{forecast.temperatureC}}</td>
              <td>{{forecast.temperatureF}}</td>
              <td>{{forecast.summary}}</td>
            </tr>
        </tbody>
        <caption>Weather forecast</caption>
    </table>
    <div class="weather-loading" v-if="showError">
        <h2>Error</h2>
        <p>{{errorMessage}}</p>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

interface Forecast {
    date: string;
    temperatureC: number;
    temperatureF: number;
    summary: string;
}

@Component
export default class Weather extends Vue {
    private showError = false;
    private errorMessage = '';
    private weatherForecasts = [] as Forecast[];

    private created() {
        this.fetchWeatherForecasts();
    }

    private async fetchWeatherForecasts() {
        try {
            const response = await fetch(`/WeatherForecast/`);
            const weatherForecasts = await response.json();
            this.weatherForecasts = weatherForecasts.map((w: Forecast) => (
                {...w, date: new Date(w.date).toDateString()}
            ));
        } catch (e) {
            this.showError = true;
            this.errorMessage = `Error while loading weather forecast: ${e.message}.`;
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.weather table {
    margin-left: auto;
    margin-right: auto;
    border-spacing: 0px;
    border-style: solid;
    border-width: 1px;
    border-color: #e0e0dc;

    td {
        padding-left: 18px;
        padding-right: 18px;
        padding-top: 6px;
        padding-bottom: 6px;
        border: 1px solid #e0e0dc;
    }
    th {
        padding-left: 18px;
        padding-right: 18px;
        padding-top: 6px;
        padding-bottom: 6px;
        border: 1px solid #e0e0dc;
        background-color: rgba(212,221,228,.5);
    }
    caption {
        padding-top: 6px;
        caption-side: bottom;
    }
}
</style>
