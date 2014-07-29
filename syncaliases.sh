syncfrom ()
{
rsync -avh --exclude='.git/' m.slagter@paranoid:/home/NKI/m.slagter/FittingReport/ /home/maarten/Dropbox/Immunology/SanderData/FittingReport
}

syncto ()
{
rsync -avh /home/maarten/Dropbox/Immunology/SanderData/FittingReport/ m.slagter@paranoid:/home/NKI/m.slagter/FittingReport
}
