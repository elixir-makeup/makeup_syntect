## CSS Code Example

```css
/* Typography Variables */
:root {
  --font-primary: 'Helvetica Neue', sans-serif;
  --font-secondary: Georgia, serif;
  --font-size-base: 16px;
  --line-height: 1.5;

  /* Color Scheme */
  --color-primary: #007bff;
  --color-secondary: #6c757d;
  --color-success: #28a745;
  --color-error: rgb(220, 53, 69);
  --color-warning: hsl(45, 100%, 51%);

  /* Spacing */
  --spacing-unit: 8px;
  --spacing-large: calc(var(--spacing-unit) * 2);
  --spacing-small: calc(var(--spacing-unit) * 0.5);

  /* Borders */
  --border-radius: 4px;
  --border-width: 1px;
}

/* Media Queries and Feature Queries */
@media screen and (min-width: 768px) {
  :root {
    --font-size-base: 18px;
  }
}

@supports (display: grid) {
  .grid-layout {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: var(--spacing-large);
  }
}

/* Animations and Keyframes */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Complex Selectors */
.container > .header {
  font-family: var(--font-primary);
  font-size: calc(var(--font-size-base) * 1.5);
  color: var(--color-primary);
  background-image: url(https://example.com/image.jpg);
}

#main-content {
  padding: var(--spacing-large);
  background-color: white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Pseudo-classes and Pseudo-elements */
.button:hover,
.button:focus {
  background-color: var(--color-secondary);
  transform: translateY(-1px);
  transition: all 0.3s ease;
}

.card::before {
  content: '';
  display: block;
  padding-top: 56.25%; /* 16:9 Aspect Ratio */
}

/* Attribute Selectors */
input[type="text"],
input[type="email"] {
  border: var(--border-width) solid var(--color-secondary);
  border-radius: var(--border-radius);
  padding: var(--spacing-unit);
}

button[disabled] {
  opacity: 0.5;
  cursor: not-allowed;
}

/* Complex Properties */
.gradient-background {
  background-image: linear-gradient(
    45deg,
    var(--color-primary) 0%,
    var(--color-secondary) 100%
  );
}

.flex-container {
  display: flex;
  flex-direction: column;
  gap: clamp(1rem, 2vw, 2rem);
}

/* Named Colors and Units */
.color-examples {
  color: darkslateblue;
  background-color: aliceblue;
  border: 2px solid cornflowerblue;
}

.unit-examples {
  /* Absolute Units */
  width: 100px;
  margin: 1in;
  border: 0.5mm solid black;

  /* Relative Units */
  padding: 1.5rem;
  font-size: 1.2em;
  line-height: 1.6;

  /* Viewport Units */
  height: 50vh;
  max-width: 90vw;

  /* Calculation */
  margin-top: calc(2rem + 20px);
}

/* Function Usage */
.advanced-properties {
  /* Color Functions */
  color: rgb(33, 37, 41);
  background-color: rgba(255, 255, 255, 0.9);
  border-color: hsl(210, 50%, 50%);
  outline-color: hsla(210, 50%, 50%, 0.5);

  /* Transform Functions */
  transform: translate3d(0, 10px, 0) rotate(45deg) scale(1.1);

  /* Filter Functions */
  filter: brightness(1.2) contrast(1.1) blur(2px);

  /* Modern Color Functions */
  color: color-mix(in srgb, var(--color-primary) 50%, var(--color-secondary));
}

/* Custom Media Queries */
@custom-media --mobile (max-width: 768px);
@custom-media --tablet (min-width: 769px) and (max-width: 1024px);
@custom-media --desktop (min-width: 1025px);

@media (--mobile) {
  .responsive-element {
    font-size: 14px;
    padding: 0.5rem;
  }
}

/* Layer Declarations */
@layer base, components, utilities;

@layer base {
  /* Base styles */
  body {
    margin: 0;
    font-family: var(--font-primary);
    line-height: var(--line-height);
  }
}

@layer components {
  /* Component styles */
  .card {
    border-radius: var(--border-radius);
    padding: var(--spacing-unit);
  }
}

/* Container Queries */
@container (min-width: 400px) {
  .container-query-card {
    display: grid;
    grid-template-columns: 2fr 1fr;
  }
}

/* Support Queries */
@supports (aspect-ratio: 16/9) {
  .video-container {
    aspect-ratio: 16/9;
  }
}

/* Nest Rules (using PostCSS or other preprocessors) */
.article {
  & h1 {
    font-size: 2rem;

    &:first-child {
      margin-top: 0;
    }
  }

  & p {
    margin-bottom: var(--spacing-unit);
  }
}
```
