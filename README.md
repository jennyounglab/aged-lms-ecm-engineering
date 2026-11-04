# aged-lms-ecm-engineering
Data analysis workflows for evaluating collagenase-mediated extracellular matrix remodeling in aged left ventricular living myocardial slices (LMS), including transcriptomic, mechanical, and contractile characterization.


### ECM Fluorescence Area Quantification

ECM abundance was quantified from collagen and fibronectin fluorescence images using Fiji/ImageJ.

**ECM-positive area quantification**

1. Background subtraction was performed using the rolling-ball method (radius: 50 pixels for 20× images; 20 pixels for 60× images).
2. Fluorescence-positive areas were identified using the automatic Triangle thresholding method. Depending on staining and imaging consistency, thresholding was performed either individually or uniformly across batches using a representative image.
3. ECM-positive area was quantified using the Analyze Particles function, with minimum particle sizes of 10 pixels² for 20× images and 3 pixels² for 60× images.

An example Fiji macro for individual-image processing is provided in `ECM_Quantification.ijm`.

**Actin-positive tissue area quantification**

Actin-positive tissue area was quantified separately using manual thresholding in Fiji/ImageJ to capture the tissue area.

**Area normalization**

ECM-positive area was expressed as a percentage of the corresponding actin-positive tissue area:

ECM-positive area (%) = (ECM-positive area / Actin-positive area) * 100


This calculation was performed in Microsoft Excel. Multiple non-overlapping regions of interest were analyzed per tissue slice, and measurements were averaged at the animal level.
