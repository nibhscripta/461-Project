function sys = sys_around_U()
    %{
        Returns an LTI system based on state space model linearized around the heat transfer coefficient as an input to the system.
    %}

    A = [-1.522237271090700,0,-0.018565623702440;0,-0.062500164691599,-2.243650316044796e-07;21.041424976986853,1.673269991646159e-05,0.198971905289840];
    b = [0;0;-3.673376201110873e-05];
    c = [0,0,1];
    d =0;
    sys = ss(A, b, c, d);