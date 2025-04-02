/*
//////////////// Disclaimer ///////////////////

The code is from https://alrightchiu.github.io/SecondRound/comparison-sort-merge-sorthe-bing-pai-xu-fa.html#code.

///////////////////////////////////////////
*/

#include <iostream>
#include <vector>

#include "Mergesort.hpp"
#include "PrintArray.hpp"


int main() {

    int arr[] = {5,3,8,6,2,7,1,4};
    std::vector<int> array(arr, arr+sizeof(arr)/sizeof(int));

    std::cout << "original:\n";
    PrintArray(array);

    MergeSort(array, 0, 7);
    std::cout << "sorted:\n";
    PrintArray(array);

    return 0;
}
