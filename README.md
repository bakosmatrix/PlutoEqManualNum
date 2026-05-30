# PlutoEqManualNum

[English Version](#english-version) | [Magyar Változat](#magyar-változat)

---

## English Version

`PlutoEqManualNum` is a lightweight Julia package designed specifically for **Pluto.jl** notebooks. It enables manual equation numbering, dynamic cross-referencing within markdown text, and automatically generates a clickable table of equations with optional descriptions in the exact order they were executed.

### Key Features
*   **Single Backslash (`\`) Support:** Thanks to the `L"..."` prefix, you don't need to escape LaTeX commands with double backslashes (`\\`).
*   **Manual Numbering:** You define the equation number (e.g., `"1"`, `"4.2"`, `"1.1a"`), preventing Pluto's reactive cells from messing up the sequence.
*   **Descriptions in Index:** You can attach a text description to any equation, making the equation index a true, readable table of contents.
*   **Automatic Table of Equations:** Generate an elegant index with a single function. Clicking an equation jumps straight to its cell.
*   **Flexbox Alignment:** Equations are perfectly centered, while numbers remain aligned to the right margin.

### Installation & Loading in Pluto

For active development and automatic code reloading without restarting the notebook, it is recommended to use `Revise.jl`:

```julia
begin
    import Pkg
    using Revise
    Pkg.develop(path="/Users/gyuri/SajatJuliaModulok/PlutoEqManualNum")
    using PlutoEqManualNum
end
```

### Usage Guide

#### 1. Inserting an Equation (with optional description)
Use the `tex()` function to display equations. It takes three mandatory arguments and an optional fourth one for description:

```julia
# Without description
tex(L"E = mc^2", "einstein", "4.2")

# With description
tex(L"C_{-k}\(=\overline{C_{k}}\)", "complex_conjugate", "13", "The complex conjugate function")
```

#### 2. Cross-Referencing in Text
To reference equations in text, use the `ref()` function inside the triple-quoted `md"""..."""` format:

```julia
md"""
The cornerstone of relativity is equation \$(ref("einstein")).
"""
```

#### 3. Table of Equations
Call this function to list your equations in their order of appearance, showing their labels and descriptions:

```julia
table_of_equations()
```

---

## Magyar Változat

A `PlutoEqManualNum` egy könnyen használható Julia csomag, amelyet kifejezetten **Pluto.jl** notebookokhoz terveztek. Lehetővé teszi a matematikai egyenletek kézi sorszámozását, a folyószövegben való dinamikus hivatkozást, valamint egy opcionális leírásokkal ellátott, kattintható egyenletjegyzék generálását a beszúrás sorrendjében.

### Főbb jellemzők
*   **Szimpla visszaperjel (`\`) támogatás:** Az `L"..."` prefixnek köszönhetően a LaTeX kódokat nem kell dupla visszaperjelekkel elcsúfítani.
*   **Kézi számozás (Manual Numbering):** Te határozod meg az egyenlet sorszámát (pl. `"1"`, `"4.2"`, `"1.1a"`), nem keveredik össze a Pluto reaktív cellafuttatásai miatt.
*   **Magyarázó leírások:** Minden egyenlethez fűzhetsz egy rövid szöveges leírást, így az egyenletjegyzék valódi, olvasható tartalomjegyzékké válik.
*   **Automatikus tartalomjegyzék:** Egyetlen függvénnyel generálhatsz egy esztétikus jegyzéket, ahol az egyenletekre kattintva a böngésző azonnal a megfelelő cellához ugrik.

### Telepítés és betöltés a Pluto notebookban

Ha aktívan fejleszted a modult, érdemes a `Revise.jl` csomaggal együtt betölteni, hogy a forrásfájl mentésekor a notebook újraindítás nélkül, azonnal frissüljön:

```julia
begin
    import Pkg
    using Revise
    Pkg.develop(path="/Users/gyuri/SajatJuliaModulok/PlutoEqManualNum")
    using PlutoEqManualNum
end
```

### Használati útmutató

#### 1. Egyenlet beszúrása (opcionális leírással)
A `tex()` függvény negyedik argumentumaként megadhatod az egyenlet szöveges leírását is:

```julia
# Leírás nélkül:
tex(L"E = mc^2", "einstein", "4.2")

# Leírással kiegészítve:
tex(L"C_{-k}\(=\overline{C_{k}}\)", "kmplxkonjugalt", "13", "A komplex konjugált függvény")
```

#### 2. Hivatkozás a folyószövegben
```julia
md"""
A relativitáselmélet alapköve a \$(ref("einstein")) egyenlet.
"""
```

#### 3. Egyenletjegyzék (Tartalomjegyzék)
A beszúrás sorrendjében listázza ki az egyenleteket a számukkal, címkéjükkel és a megadott leírásukkal együtt:
```julia
table_of_equations()
```

---
Created by / Készítette: **Bakos György**
