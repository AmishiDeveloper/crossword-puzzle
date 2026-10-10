# crossword-puzzle

Crossword Puzzle is a customizable word search game built with Flutter, where users can create custom grids and fill them with letters of their choice. It instantly finds and highlights words in multiple directions (horizontal, vertical, diagonal), with a smooth scrollable layout designed to fit screens of all sizes.

---

## Features

- **Custom Grid Setup:** Allows users to define custom matrix sizes and populate them with custom letters.
- **Multi-Directional Word Search:** Instantly searches and detects words across Horizontal (West-to-East), Vertical (North-to-South), and Diagonal (South-to-East) directions.
- **Real-Time Visual Highlighting:** Matched words get highlighted instantly across tiles with distinctive highlight colors and animated borders.
- **Reactive Search Controls:** Clean search bar with real-time Done and Clear actions that automatically reset highlights.
- **Adaptive Light & Dark Theming:** Complete support for both Light and Dark modes, automatically adapting UI elements, board surfaces, and contrast borders for comfortable viewing in any environment.

---

## Flutter Version

Currently, the app uses the following version of Flutter and Dart:

- **Flutter SDK:** 3.47.2
- **Dart SDK:** 3.13.2

---

## Packages Used

- **flutter_screenutil:** Resolution-independent UI element sizing, spacing, and responsive font scaling. 

---

## Architecture

Crossword Puzzle follows a clean, feature-driven layered architecture:

- **Core Layer:**
  
  - **Constants & Assets:**
    - `AppColors`: Centralized application palette managing primary, surface, border, and tile-highlighting.
    - `AppImages`: Static asset paths reference.
    - `Helper`: Global utility functions, including navigation dialog helpers (`showExitDialog`).
  - **Theme:**
    - `AppTextTheme`: Global typography definitions with scalable text styling.
    - `AppTheme`: Application-wide Material design system and theme configuration.
      
- **Presentation Layer:**
  - `SplashScreen`: Manages the initial application launch.
  - `GridDimensionsScreen`: Handles matrix dimension setup ($M \times N$), input validation, and user-provided alphabet string intake.
  - `CrosswordPuzzleScreen`: Renders the interactive puzzle board and executes real-time word search highlighting.

- **Shared Custom Widgets:**
  - `CustomElevatedButton`: Reusable, uniformly styled primary call-to-action button.
  - `CustomTextFormField`: Modular text input field featuring reactive suffix actions and standardized validation styles.
  - `CustomCrosswordPuzzleDialog`: Reusable modal dialog container for consistent app-wide dialog layouts (e.g., exit confirmation).

---

## Setup Instructions

**1. Clone the project repository to your local environment:**
```bash
git clone https://github.com/AmishiDeveloper/crossword-puzzle.git
cd crossword-puzzle
```

**2. Install project dependencies:**
```bash
flutter pub get
```

**3. Run the application:**
```bash
flutter run
```

---

## Limitations

- **Search Directions:** Currently searches words in 3 primary directions (Horizontal East, Vertical South, and South-East Diagonal); reverse directions are planned for future updates.

- **Input Matching:** The total number of letters entered must match the exact grid dimensions (Rows × Columns).

---

## Project Assets & Resources

You can find all project assets, release APKs, demonstration videos, and screenshots organized in the Google Drive repository:

**Download Release APK:**
<p align="center">
  <a href="https://drive.google.com/drive/folders/1ql_HuXRGXIuO6xUt9TWJuZLZGmLM2p1s?usp=drive_link">
    <img src="https://img.shields.io/badge/Google%20Drive-Download%20APK-blue?style=for-the-badge&logo=googledrive" alt="Download APK">
  </a>
</p>

* **Main Project Assets Directory:**  
  [Google Drive - All Project Assets](https://drive.google.com/drive/folders/1uOo1MCL9WLNMUdwvt_ZRXe2dKYe2eHvZ?usp=sharing)

---

### Media & Demonstrations

####  Dark Theme
* **Demo Video:** [Watch Dark Theme Demo Video](https://drive.google.com/file/d/1BTOYkLDeyIl1uiAFBeHXfhP59GBZID53/view?usp=drive_link)
* **Screenshots Folder:** [View Dark Theme Screenshots](https://drive.google.com/drive/folders/1AxU9GNcNpbis6J0ZgfApcKCU8Kvf0wAU?usp=drive_link)

####  Light Theme
* **Demo Video:** [Watch Light Theme Demo Video](https://drive.google.com/file/d/1nQdOsqsn8xffuRy_ey2Y0_EmhrsbQllE/view?usp=drive_link)
* **Screenshots Folder:** [View Light Theme Screenshots](https://drive.google.com/drive/folders/1R9difaGEsJc9qv1g2Qd48srXd4lgz4Rp?usp=drive_link)

