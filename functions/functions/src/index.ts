import * as functions from "firebase-functions";
import * as https from "https";

export const fetchWeatherData = functions.https.onRequest((request, response) => {
  // Parsing query parameters for latitude and longitude
  const latitude = request.query.latitude as string;
  const longitude = request.query.longitude as string;

  if (!latitude || !longitude) {
    response.status(400).send("Latitude and Longitude are required");
    return;
  }

  const queryParams = new URLSearchParams({
    latitude: latitude,
    longitude: longitude,
    hourly: "temperature_2m,precipitation,weather_code",
    daily: "temperature_2m_max,temperature_2m_min,precipitation_probability_max",
    timezone: "auto",
    forecast_days: "1",
  });

  const weatherUrl = `https://api.open-meteo.com/v1/forecast?${queryParams}`;

  https.get(weatherUrl, (res) => {
    let data = "";

    res.on("data", (chunk) => {
      data += chunk;
    });

    res.on("end", () => {
      try {
        const jsonData = JSON.parse(data);
        response.send(jsonData);
      } catch (e) {
        response.status(500).send("Error parsing weather data");
      }
    });
  }).on("error", (err) => {
    console.error("Error fetching weather data:", err);
    response.status(500).send("Failed to fetch weather data");
  });
});
