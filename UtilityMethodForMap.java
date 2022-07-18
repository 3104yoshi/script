package testFile;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.Map.Entry;

public class UtilityMethodForMap {
	/**
	 * keyとなる要素のListとvalueとなる要素のListを2つ指定し、Map<K, V>を生成する<br>
	 * ★!注意! 長さの違うリストを指定した場合、nullで埋める
	 * 
	 * @param <K>   生成するmapのkeyの型
	 * @param <V>   生成するmapのvalueの型
	 * @param kList keyとなる要素が入ったList〈K〉
	 * @param vList valueとなる要素が入ったList〈V〉
	 * @return 生成したMap<K, V>を返す
	 */
	public static <K, V> Map<K, V> makeMapFromTwoList(List<K> kList, List<V> vList) {
		Map<K, V> map = new HashMap<K, V>();
		if (kList.size() != vList.size()) {
			System.out.println("一方のリストの要素が足りないため、その分はnullで埋めます");
		}
		for (int i = 0; i < Math.max(kList.size(), vList.size()); i++) {
			K key = null;
			V value = null;
			if (i < kList.size()) {
				key = kList.get(i);
			}
			if (i < vList.size()) {
				value = vList.get(i);
			}
			map.put(key, value);
		}
		return map;
	}

	/**
	 * Mapをvalueでソートする
	 * !注意! ジェネリクスには対応していない
	 * 
	 * @param unSortedMap ソート対象のmap
	 * @return sort後のmap (LinkedHashMap)
	 */
	public static Map<String, Integer> sortMapByValue(Map<String, Integer> unSortedMap) {
		// 降順
//		Map<String, Integer> sortedByValue = 
//				unSortedMap.entrySet().stream()
//				.sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
//				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));
		// 昇順
		Map<String, Integer> sortedByValue = 
				unSortedMap.entrySet().stream()
				.sorted(Map.Entry.<String, Integer>comparingByValue())
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));
//		 Map<String, Integer> result = map.entrySet().stream()
//	                .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
//	                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue,
//	                        (oldValue, newValue) -> oldValue, LinkedHashMap::new));
		return sortedByValue;
	}
	
	/**
	 * mapオブジェクトのエントリを「key+delimiter+value」の文字列に整形する
	 * 
	 * @param <K> 引数のmapのkeyの型
	 * @param <V> 引数のmapのvalueの型
	 * @param map 整形に供したいMap
	 * @param delimiter 整形時の区切り文字
	 * @return 「key+delimiter+value」を1つの要素とし、全てのエントリを整形したListを返す
	 */
	public static <K, V> List<String> formatMapObjectForOutput(Map<K, V> map, String delimiter) {
		List<String> formattedList = new ArrayList<>();
		for (Entry<K, V> entry : map.entrySet()) {
			String line = entry.getKey().toString() + delimiter + entry.getValue().toString();
			formattedList.add(line);
		}
		return formattedList;
	}
}
