import http from "k6/http";
import { check, sleep } from "k6";

const isNumeric = (value) => /^\d+$/.test(value);

const target_vus = 5;

export let options = {
  stages: [
    // Ramp-up from 1 to TARGET_VUS virtual users (VUs) in 5s
    { duration: "5s", target: target_vus },

    // Stay at rest on TARGET_VUS VUs for 10s
    { duration: "10s", target: target_vus },

    // Ramp-down from TARGET_VUS to 0 VUs for 5s
    { duration: "5s", target: 0 },
  ],
};

export default function () {
  const response = http.get("https://swapi.dev/api/people/30/", {
    headers: { Accepts: "application/json" },
  });
  check(response, { "status is 200": (r) => r.status === 200 });
  sleep(0.3);
}
