# Geospatial Heatmaps for Language Use 

📌 Project Type: Research + Data Visualization + Geospatial Modeling

---

## 🔍 Overview

This project visualizes phonological variation across 87 Black Boston speakers using high-resolution geospatial heatmaps. Using vowel formant data and speaker geolocations, we apply **Ordinary Kriging** to interpolate scores and reveal spatial linguistic patterns.

---

## 📌 Tools & Technologies
- **Python**: `geopandas`, `pykrige`, `matplotlib`, `plotly`
- **R**: Score calculation
- **Basemap**: CartoDB
- **GIS**: ArcGIS Pro (for shape files)
- **Sources**:
  - [SuperMap Kriging Docs](https://help.supermap.com/iDesktop/en/tutorial/Analyst/Raster/interpolation/OrdinaryKriging)
  - [pykrige Example](https://github.com/ERSSLE/ordinary_kriging/blob/master/example.ipynb)
  - [PyKrige Docs](https://geostat-framework.readthedocs.io/projects/pykrige/en/stable/generated/pykrige.ok.OrdinaryKriging.html)

---

## 📂 Project Workflow

### 1. **Data Preparation**
- **Inputs**:
  - EMVowel Data`: Formant values (F1, F2, etc.)
  - EMDemographics : Speaker demographics and coordinates
- **Steps**:
  - Speaker ID standardization
  - Filtering MC-style recordings
  - Coordinate correction & merging

---

### 2. **Score Calculation**
- **Metrics**:
  - Pillai Score (vowel overlap)
  - SFVS (Short Front Vowel Shift)
  - Fronting, Rhoticity
- **Tools**: R
- **Modifications**: Custom adjustments to existing scripts for compatibility.

---

### 3. **Interpolation: Ordinary Kriging**
- **Why**: To estimate values at unsampled locations spatially.
- **Library**: `pykrige`
- **Settings**:
  - Grid: 500×500 resolution
  - Variogram model: Linear (slope: 1.0, nugget: 0.001)
  - Null handling
- **Functions**:
  - `ordKriging()`: For [0, 1] normalized scores
  - `ordKriging2()`: For raw metrics

---

### 4. **Heatmap Generation**
- **Tools**: `matplotlib`, `geopandas`
- **Features**:
  - Custom red-to-blue gradient
  - Geographic masking using `shapefiles/ne_10m_land.shp`
  - Basemap: CartoDB Light
- **Functions**:
  - `plotHeatmaps1()` for normalized
  - `plotHeatmaps2()` for raw metrics

---

### 5. **Speaker Maps**
- **Library**: `plotly.express.scatter_mapbox`
- **Features**:
  - Interactive
  - Hover displays speaker metadata

---

### 6. **Aggregation Maps**
- **Aggregated Metrics**:
  - **AAL Average**
  - **AAL + SFVS**
  - **NE Average**
  - **Rhoticity Aggregation**
- Columns with `*` underwent complement transformation.
