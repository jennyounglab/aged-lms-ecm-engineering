
// ============================================================
// ECM FLUORESCENCE AREA QUANTIFICATION
// Fiji / ImageJ
//
// Workflow:
// 1. Background subtraction
// 2. Individual-image Triangle thresholding
// 3. ECM-positive area quantification
//
// Note: Batch thresholding based on a representative image
// is performed separately and is not included in this example.
// Actin-positive area is quantified separately using manual
// thresholding. Final area normalization is performed in Excel.
// ============================================================


// -------------------- SETTINGS --------------------

// Select imaging magnification: "20x" or "60x"
magnification = "60x";

// Background subtraction and particle size parameters
if (magnification == "20x") {
    rollingRadius = 50;
    minParticleSize = 10;
} else {
    rollingRadius = 20;
    minParticleSize = 3;
}


// -------------------- MEASUREMENTS --------------------

run("Set Measurements...",
    "area mean standard min fit shape feret's integrated median area_fraction limit display redirect=None decimal=3");


// -------------------- BATCH PROCESSING --------------------

// Select folder containing TIFF images
dir = getDirectory("Choose a folder with images");
list = getFileList(dir);

// Create results folder
res_folder = dir + "ResultsIndividual" + File.separator;
File.makeDirectory(res_folder);

// Process individual images
for (i = 0; i < list.length; i++) {

    if (endsWith(list[i], ".tif")) {

        open(dir + list[i]);

        titletiff = getTitle();

        // Background subtraction
        run("Subtract Background...",
            "rolling=" + rollingRadius);

        // Individual-image Triangle thresholding
        setAutoThreshold("Triangle dark");

        // Quantify thresholded ECM-positive area
        run("Analyze Particles...",
            "size=" + minParticleSize + "-Infinity clear summarize");

        close();
    }
}


// -------------------- EXPORT RESULTS --------------------

selectWindow("Summary");

saveAs("Results",
    res_folder + "ECM_Quantification_Summary.csv");

