from typing import List


def find_median_sorted_arrays(nums1: List[int], nums2: List[int]) -> float:
    nums1.extend(nums2)
    merged_array = sorted(nums1)

    if len(merged_array) == 1:
        return merged_array[0]
    elif len(merged_array) % 2 != 0:
        return float(merged_array[len(merged_array) // 2])
    else:
        mid = len(merged_array) // 2
        return (merged_array[mid] + merged_array[mid - 1]) / 2
