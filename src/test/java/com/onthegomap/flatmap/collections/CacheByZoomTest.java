package com.onthegomap.flatmap.collections;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.onthegomap.flatmap.Arguments;
import com.onthegomap.flatmap.CommonParams;
import java.util.ArrayList;
import java.util.List;
import org.junit.jupiter.api.Test;

public class CacheByZoomTest {

  @Test
  public void testCacheZoom() {
    List<Integer> calls = new ArrayList<>();
    CacheByZoom<Integer> cached = CacheByZoom.create(CommonParams.from(Arguments.of(
      "minzoom", "1",
      "maxzoom", "10"
    )), i -> {
      calls.add(i);
      return i + 1;
    });
    assertEquals(3, cached.get(2));
    assertEquals(3, cached.get(2));
    assertEquals(6, cached.get(5));
    assertEquals(List.of(2, 5), calls);
  }

}
