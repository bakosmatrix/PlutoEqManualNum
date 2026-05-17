module PlutoEqManualNum
    using HypertextLiteral
    using Markdown

    export tex, ref, reset_eqs!, table_of_equations, @L_str

    const eq_manual_dict = Dict{String, Any}()
    const eq_manual_order = String[]

    macro L_str(s)
        s
    end

    function track_manual_order!(label)
        if !haskey(eq_manual_dict, label)
            push!(eq_manual_order, label)
        end
    end

    function tex(latex_string, label, manual_num)
        track_manual_order!(label)
        eq_manual_dict[label] = manual_num
        
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
        num = get(eq_manual_dict, label, "?")
        @htl "<a href='#$(label)' style='text-decoration: none; font-weight: bold;'>($(num))</a>"
    end

    function table_of_equations()
        if isempty(eq_manual_order)
            return md"*Még nincsenek egyenletek.*"
        end
        
        links = [
            @htl("<li><a href='#$(label)' style='text-decoration: none;'>Egyenlet ($(eq_manual_dict[label])): <code style='font-style: italic;'>$(label)</code></a></li>") 
            for label in eq_manual_order
        ]
        
        @htl """
        <div style="background: #f9f9f9; padding: 1em; border-radius: 8px; border: 1px solid #ddd; max-width: 600px;">
            <h3 style="margin-top: 0;">Egyenletjegyzék</h3>
            <ul style="list-style: none; padding-left: 0;">
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
