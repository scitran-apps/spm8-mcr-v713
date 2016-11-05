## SPM8 with MATLAB MCR 2010a

This container has a compiled version of SPM8 for 2010a in `/opt/spm8` and a 2010a MCR in `/opt/mcr/v713`. I intend
to primarily use this container to support Nipype pipelines that require SPM8. I've picked 2010a because it's one
the compilation targets that SPM developers pick for SPM8.

While older builds of SPM8 seem to only compile on 2013a or older, newer SPM8 builds can compile on newer versions
of matlab.

Many thanks to the Nipype developers for the work they've put into Nipype. Much of the dockerfile for this project
is based on code they've written to [run tests](https://github.com/nipy/nipype/tree/55d052b/docker).
