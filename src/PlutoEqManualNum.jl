module PlutoEqManualNum
using HypertextLiteral
using Markdown

export tex, ref, reset_eqs!, table_of_equations, @L_str

# A szótár most már a sorszámot ÉS a leírást is tárolja egy Tuple-ben: (szám, leírás)
const eq_manual_dict = Dict{String, Tuple{Any, String}}()
const eq_manual_order = String[]

macro L_str(s)
s
end

function track_manual_order!(label)
    if !haskey(eq_manual_dict, label)
        push!(eq_manual_order, label)
    end
end

# A tex függvény most már elfogad egy opcionális negyedik argumentumot (desc)
function tex(latex_string, label, manual_num, desc="")
    track_manual_order!(label)
    eq_manual_dict[label] = (manual_num, desc)

    d = "\$\$"
    @htl """
    <div id=$(label) style="display: flex; align-items: center; width: 100%; margin: 1em 0;">
    <div style="flex-grow: 1; text-align: center;">
    <span class="tex">
    $(d) \\displaystyle $(latex_string) $(d)
    </span>
    </div>
    <div style="min-width: 50px; text-align: right; font-weight: bold;">
    ($(manual_num))
    </div>
    </div>
    """
end

function ref(label)
    # Kiszedjük a Tuple első elemét (a számot)
    num = haskey(eq_manual_dict, label) ? eq_manual_dict[label][1] : "?"
    @htl "<a href='#$(label)' style='text-decoration: none; font-weight: bold;'>($(num))</a>"
end

function table_of_equations()
    if isempty(eq_manual_order)
        return md"*Még nincsenek egyenletek.*"
    end

    links = map(eq_manual_order) do label
        num, desc = eq_manual_dict[label]
        # Ha van megadva leírás, zárójelben vagy vesszővel elválasztva fűzzük hozzá
        desc_text = isempty(desc) ? "" : " – $desc"

        @htl("""
             <li style="margin-bottom: 0.4em;">
             <a href='#$(label)' style='text-decoration: none;'>
             Egyenlet ($(num)): <code style='font-style: italic;'>$(label)</code>$(desc_text)
             </a>
             </li>
             """)
    end

    @htl """
    <div style="background: #f9f9f9; padding: 1.2em; border-radius: 8px; border: 1px solid #ddd; max-width: 700px;">
    <h3 style="margin-top: 0; margin-bottom: 0.8em;">Egyenletjegyzék</h3>
    <ul style="list-style: square; padding-left: 1.2em; margin-bottom: 0;">
    $(links)
    </ul>
    </div>
    """
end

function reset_eqs!()
    empty!(eq_manual_dict)
    empty!(eq_manual_order)
    "Kézi számláló és sorrend törölve!"
end
end
