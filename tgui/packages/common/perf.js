/**
 * Ghetto performance measurement tools.
 *
<<<<<<< HEAD
 * Uses NODE_ENV to remove itself from production builds.
=======
 * Uses NODE_ENV to redact itself from production bundles.
>>>>>>> fulpmaster
 *
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD
const FPS = 60;
const FRAME_DURATION = 1000 / FPS;

// True if Performance API is supported
const supportsPerf = !!window.performance?.now;
// High precision markers
let hpMarkersByName = {};
// Low precision markers
let lpMarkersByName = {};
=======
let markersByLabel = {};
>>>>>>> fulpmaster

/**
 * Marks a certain spot in the code for later measurements.
 */
<<<<<<< HEAD
const mark = (name, timestamp) => {
  if (process.env.NODE_ENV !== 'production') {
    if (supportsPerf && !timestamp) {
      hpMarkersByName[name] = performance.now();
    }
    lpMarkersByName[name] = timestamp || Date.now();
=======
const mark = (label, timestamp) => {
  if (process.env.NODE_ENV !== 'production') {
    markersByLabel[label] = timestamp || Date.now();
>>>>>>> fulpmaster
  }
};

/**
 * Calculates and returns the difference between two markers as a string.
 *
 * Use logger.log() to print the measurement.
 */
<<<<<<< HEAD
const measure = (markerNameA, markerNameB) => {
  if (process.env.NODE_ENV !== 'production') {
    let markerA = hpMarkersByName[markerNameA];
    let markerB = hpMarkersByName[markerNameB];
    if (!markerA || !markerB) {
      markerA = lpMarkersByName[markerNameA];
      markerB = lpMarkersByName[markerNameB];
    }
    const duration = Math.abs(markerB - markerA);
    return formatDuration(duration);
  }
};

const formatDuration = duration => {
  const durationInFrames = duration / FRAME_DURATION;
  return duration.toFixed(duration < 10 ? 1 : 0) + 'ms '
    + '(' + durationInFrames.toFixed(2) + ' frames)';
=======
const measure = (markerA, markerB) => {
  if (process.env.NODE_ENV !== 'production') {
    return timeDiff(
      markersByLabel[markerA],
      markersByLabel[markerB]);
  }
};

const timeDiff = (startedAt, finishedAt) => {
  const diff = Math.abs(finishedAt - startedAt);
  const diffFrames = (diff / 16.6667).toFixed(2);
  return `${diff}ms (${diffFrames} frames)`;
>>>>>>> fulpmaster
};

export const perf = {
  mark,
  measure,
};
