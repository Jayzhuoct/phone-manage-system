package zjj.design.ssm.utils;

import java.util.*;

public class ListUtils {
    public static <T> List<T> removeDuplicates(List<T> list) {
        Set<T> set = new LinkedHashSet<>(list);
        return new ArrayList<>(set);
    }
}