# PlutoEqManualNum

[English Version](#english-version) | [Magyar Változat](#magyar-változat)

---

## English Version

`PlutoEqManualNum` is a lightweight Julia package designed specifically for **Pluto.jl** notebooks. It enables manual equation numbering, dynamic cross-referencing within markdown text, and automatically generates a clickable table of equations in the exact order they were executed.

### Key Features
*   **Single Backslash (`\`) Support:** Thanks to the `L"..."` prefix, you don't need to escape LaTeX commands with double backslashes (`\\`).
*   **Manual Numbering:** You define the equation number (e.g., `"1"`, `"4.2"`, `"1.1a"`), preventing Pluto's reactive cells from messing up the sequence.
*   **Automatic Table of Equations:** Generate an elegant index with a single function. Clicking an equation jumps straight to its cell.
*   **Flexbox Alignment:** Equations are perfectly centered, while numbers remain aligned to the right margin.

### Installation & Loading in Pluto

Since the package is hosted on GitHub, you can add it in development mode in the very first cell of your notebook:

```julia
begin
    import Pkg
    Pkg.develop(url="https://github.com")
    using PlutoEqManualNum
end
```

### Usage Guide

#### 1. Inserting an Equation
Use the `tex()` function to display equations. It takes three arguments: the LaTeX string (using `L"..."`), a unique reference label, and the desired equation number as a string.

```julia
tex(L"E = mc^2", "einstein", "4.2")
```

#### 2. Cross-Referencing in Text
To reference equations in text, use the `ref()` function. **Important:** In Pluto, variable interpolation requires the triple-quoted `md"""..."""` format!

```julia
md"""
The cornerstone of relativity is equation \$(ref("einstein")).
"""
```

#### 3. Table of Equations
At the end or beginning of your notebook, call this function in a separate cell to list your equations in their order of appearance:

```julia
table_of_equations()
```

#### 4. Resetting Counters
If you reorder cells or want a clean slate, clear the internal dictionary and execution history with:

```julia
reset_eqs!()
```

---

## Magyar Változat

A `PlutoEqManualNum` egy könnyen használható Julia csomag, amelyet kifejezetten **Pluto.jl** notebookokhoz terveztek. Lehetővé teszi a matematikai egyenletek kézi sorszámozását, a folyószövegben való dinamikus hivatkozást, valamint egy automatikus, kattintható egyenletjegyzék generálását a beszúrás sorrendjében.

### Főbb jellemzők
*   **Szimpla visszaperjel (`\`) támogatás:** Az `L"..."` prefixnek köszönhetően a LaTeX kódokat nem kell dupla visszaperjelekkel elcsúfítani.
*   **Kézi számozás (Manual Numbering):** Te határozod meg az egyenlet sorszámát (pl. `"1"`, `"4.2"`, `"1.1a"`), nem keveredik össze a Pluto reaktív cellafuttatásai miatt.
*   **Automatikus tartalomjegyzék:** Egyetlen függvénnyel generálhatsz egy esztétikus jegyzéket, ahol az egyenletekre kattintva a böngésző azonnal a megfelelő cellához ugrik.
*   **Flexbox igazítás:** Az egyenletek mindig tökéletesen középre, míg a sorszámok a jobb szélre igazítódnak.

### Telepítés és betöltés a Pluto notebookban

```julia
begin
    import Pkg
    Pkg.develop(url="https://github.com")
    using PlutoEqManualNum
end
```

### Használati útmutató

#### 1. Egyenlet beszúrása
```julia
tex(L"E = mc^2", "einstein", "4.2")
```

#### 2. Hivatkozás a folyószövegben
```julia
md"""
A relativitáselmélet alapköve a \$(ref("einstein")) egyenlet.
"""
```

#### 3. Egyenletjegyzék (Tartalomjegyzék)
```julia
table_of_equations()
```

#### 4. Számlálók és tárolók kiürítése
```julia
reset_eqs!()
```

---
Created by / Készítette: **Bakos György**
