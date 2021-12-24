function hu_moments_vector_norm = run(img)
    eta = SI_Moment(img);
    inv_moments = Hu_Moments(eta);
    hu_moments_vector_norm = -sign(inv_moments).*(log10(abs(inv_moments)));