# PlutoEqManualNum

A `PlutoEqManualNum` egy könnyen használható Julia csomag, amelyet kifejezetten **Pluto.jl** notebookokhoz terveztek. Lehetővé teszi a matematikai egyenletek kézi sorszámozását, a folyószövegben való dinamikus hivatkozást, valamint egy automatikus, kattintható egyenletjegyzék (tartalomjegyzék) generálását a beszúrás sorrendjében.

## Főbb jellemzők
*   **Szimpla visszaperjel (`\`) támogatás:** Az `L"..."` prefixnek köszönhetően a LaTeX kódokat nem kell dupla visszaperjelekkel elcsúfítani.
*   **Kézi számozás (Manual Numbering):** Te határozod meg az egyenlet sorszámát (pl. `"1"`, `"4.2"`, `"1.1a"`), nem keveredik össze a Pluto reaktív cellafuttatásai miatt.
*   **Automatikus tartalomjegyzék:** Egyetlen függvénnyel generálhatsz egy esztétikus jegyzéket, ahol az egyenletekre kattintva a böngésző azonnal a megfelelő cellához ugrik.
*   **Flexbox igazítás:** Az egyenletek mindig tökéletesen középre, míg a sorszámok a jobb szélre igazítódnak.

---

## Telepítés és betöltés a Pluto notebookban

Mivel a csomag elérhető a GitHubon, bármelyik Pluto notebook legelső cellájában az alábbi módon tudod fejlesztheti (development) módban behúzni:

```julia
begin
    import Pkg
    Pkg.develop(url="https://github.com")
    using PlutoEqManualNum
end
```

---

## Használati útmutató

### 1. Egyenlet beszúrása
Az egyenletek megjelenítéséhez használd a `tex()` függvényt. Három argumentumot vár: a LaTeX kódot (`L"..."` formában), egy egyedi hivatkozási címkét (label), valamint a kívánt sorszámot szövegként.

```julia
tex(L"E = mc^2", "einstein", "4.2")
```

### 2. Hivatkozás a folyószövegben
A szöveges cellákban a hivatkozáshoz használd a `ref()` függvényt. **Fontos:** A Pluto-ban a behelyettesítéshez a háromszoros idézőjeles `md"""..."""` formátumot kell használni!

```julia
md"""
A relativitáselmélet alapköve a \$(ref("einstein")) egyenlet.
"""
```

### 3. Egyenletjegyzék (Tartalomjegyzék)
A notebookod végén (vagy elején) egy külön cellában hívd meg az alábbi függvényt, amely a beszúrás sorrendjében listázza ki az egyenleteidet:

```julia
table_of_equations()
```

### 4. Számlálók és tárolók kiürítése
Ha átmozgatod a cellákat, vagy tiszta lappal indulnál, a belső szótárat és a sorrendet a következő függvénnyel tudod törölni (ezután futtasd újra az egyenlet celláit):

```julia
reset_eqs!()
```

---
Készítette: **Bakos György**
