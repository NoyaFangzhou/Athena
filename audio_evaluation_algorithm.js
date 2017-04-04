/**
 *
 * Calculate the similarity of two strings based on their distance
 * @para test: 		string to be meaturered
 * @para standard:  standard string
 * @return: 		a float value indicates the similiarity rate
 */
function calSimilarity(test, standard) {
	// test is null
	if (test == null || test == undefined || test == '') { 
      return 0;
	}
	return 1 - (calDistance(test.toLowerCase(), standard.toLowerCase())/standard.length);
}



/**
 *
 * Calculate the distance between two strings
 * Smaller distance means that the two strings looks similar
 *
 * @para str: 	string to be tested
 * @para lib: 	standard str
 * @return  : 	double variable, the similarity between two strings
 */

function calDistance(str, lib) {
	var str_len = str.length;
	var lib_len = lib.length;

	if (str_len == 0) {
		return lib_len;
	}

	var dist_arr = create2DArray(str_len+1, lib_len+1);

	for (var i = 0; i <= str_len; i++) {
		dist_arr[i][0] = i;
	}

	for (var j = 0; j <= lib_len; j++) {
		dist_arr[0][j] = j;
	}

	var eq = 0;

	var strchar, libchar;
	for (var i = 1; i <= str_len; i++) {
		strchar = str.charAt(i-1);
		for (var j = 1; j < lib_len; i++) {
			libchar = lib.charAt(j);
			if (strchar == libchar) {
				eq = 0;
			}
			else {
				eq = 1;
			}
			dist_arr = Math.min(dist_arr[i-1][j-1]+eq, Math.min(dist_arr[i][j-1]+1, d[i-1][j]+1));
		}
	}

	return dist_arr[str_len][lib_len];
}


/**
 *
 * Helper func
 * This func builds an 2D Array
 * 
 * @para col: 	the colum number
 * @para row: 	the row number
 * @para the 2D array object
 */

function create2DArray(row, col) {

    var arr = new Array(row),

    for (var i = 0; i < row; i++) {
  		arr[i] = new Array(col);
	}

    return arr;
}