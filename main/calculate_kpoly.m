%% 
% calculates polymerization rate and outputs bar charts for all 3 states
% for double and dimer shows individual k_poly for each filiment and overall/combined
% uses variables: fh1_length, pp_length_vec, p_occ1/2ab/3ab, opt1/2/3/4

%% Calculations
%sets constants
k_paf=10;
c_PA=2.5;

%calculates kpoly for all three states
kp1 = k_paf*c_PA*(1-p_occ1).*pp_length_vec';
k_poly1 = sum(kp1);

kp2a = k_paf*c_PA*(1-p_occ2a).*pp_length_vec';
kp2b = k_paf*c_PA*(1-p_occ2b).*pp_length_vec';
k_poly2 = sum(kp2a) + sum(kp2b);

kp3a = k_paf*c_PA*(1-p_occ3a).*pp_length_vec';
kp3b = k_paf*c_PA*(1-p_occ3b).*pp_length_vec';
k_poly3 = sum(kp3a) + sum(kp3b);

% CURRENTLY UNUSED
% calculates ratio of kpoly dimer to kpoly double
kp_ratio = k_poly3 / k_poly2;


%% Graphing
% creates polymerization bar charts for all three states

max_kp = max([k_poly1, k_poly2, k_poly3]) + 5;

    
%single
kp1 = [kp1'; kp1'];
fil=[1 2];

%formatting options based on opt4
if opt4 == 1
    if LOOP == 1
        subplot(3,4,2)
    else
        if rem(LOOP,3) == 1
            subplot(3,4,2)
        elseif rem(LOOP,3) == 2
            subplot(3,4,6)
        elseif rem(LOOP,3) == 0
            subplot(3,4,10)
        end
    end
else
    subplot(1,4,2)
end

bar(fil, kp1,0.5, 'stacked')
title('Single');
xlim([0.5 1.5]);
xlabel('Filaments');
ylabel('k_p_o_l_y');

%formatting options based on opt1
if opt1 == 1
    ylim([0,max_kp])
elseif opt1 ==2
    if fh1_length <= 300
        ylim([1,275])
    else
        ylim([1,max_kp])
    end 
else
    ylim([0,580])
end

%double
kp2 = [kp2a';kp2b'; (kp2a+kp2b)'];
fil=[1 2 3];

% formatting options based on opt4
if opt4 == 1
    if LOOP == 1
        subplot(3,4,3)
    else
        if rem(LOOP,3) == 1
            subplot(3,4,3)
        elseif rem(LOOP,3) == 2
            subplot(3,4,7)
        elseif rem(LOOP,3) == 0
            subplot(3,4,11)
        end
    end
else
    subplot(1,4,3)
end

bar(fil, kp2 ,0.5, 'stacked')
title('Double-Filament');
xlabel('Filaments');
ylabel('k_{poly}');
xticklabels({1, 2, 'total'});

%formatting options based on opt1
if opt1 == 1
    ylim([0,max_kp])
elseif opt1 ==2
    if fh1_length <= 300
        ylim([1,275])
    else
        ylim([1,max_kp])
    end 
else
    ylim([0,580])
end

%dimer
kp3 = [kp3a';kp3b'; (kp3a+kp3b)'];
fil=[1, 2, 3];

%formatting options based on opt4
if opt4 == 1
    if LOOP == 1
        subplot(3,4,4)
    else
        if rem(LOOP,3) == 1
            subplot(3,4,4)
        elseif rem(LOOP,3) == 2
            subplot(3,4,8)
        elseif rem(LOOP,3) == 0
            subplot(3,4,12)
        end
    end
else
    subplot(1,4,4)
end

bar(fil, kp3 ,0.5, 'stacked')
title('N-Dimerized');
xlabel('Filaments');
ylabel('k_{poly}');
xticklabels({1, 2, 'total'});

%formatting options based on opt1
if opt1 == 1
    ylim([0,max_kp])
elseif opt1 ==2
    if fh1_length <= 300
        ylim([1,275])
    else
        ylim([1,max_kp])
    end 
else
    ylim([0,580])
end
