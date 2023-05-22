% line 0 to rbar with arrowhead in 3D space
function status = arrow3( rbar, plotcode, linewidth )
    plot3( [0, rbar(1)], [0, rbar(2)], [0, rbar(3)], plotcode, 'LineWidth', linewidth );
    tangent = rbar/sqrt(rbar'*rbar);
    per1 = cross( tangent, [0, 0, 1]' );
    per1 = per1/sqrt(per1'*per1);
    per2 = cross( tangent, per1 );
    per2 = per2/sqrt(per2'*per2);
    L = 0.05*sqrt(rbar'*rbar);
    v1 = rbar - L*tangent + 0.25*L*per1;
    v2 = rbar - L*tangent - 0.25*L*per1;
    v3 = rbar - L*tangent + 0.25*L*per2;
    v4 = rbar - L*tangent - 0.25*L*per2;
    plot3( [rbar(1), v1(1)], [rbar(2), v1(2)], [rbar(3), v1(3)], plotcode, 'LineWidth', linewidth );
    plot3( [rbar(1), v2(1)], [rbar(2), v2(2)], [rbar(3), v2(3)], plotcode, 'LineWidth', linewidth );
    plot3( [rbar(1), v3(1)], [rbar(2), v3(2)], [rbar(3), v3(3)], plotcode, 'LineWidth', linewidth );
    plot3( [rbar(1), v4(1)], [rbar(2), v4(2)], [rbar(3), v4(3)], plotcode, 'LineWidth', linewidth );
    status=1;
    return