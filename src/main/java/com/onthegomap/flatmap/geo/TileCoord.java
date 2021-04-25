package com.onthegomap.flatmap.geo;

public class TileCoord {

  private final int encoded;
  private final int x;
  private final int y;
  private final int z;

  private TileCoord(int encoded, int x, int y, int z) {
    this.encoded = encoded;
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public static TileCoord of(int x, int y, int z) {
    return new TileCoord(encode(x, y, z), x, y, z);
  }

  public static TileCoord decode(int encoded) {
    return new TileCoord(encoded, decodeX(encoded), decodeY(encoded), decodeZ(encoded));
  }

  public int encoded() {
    return encoded;
  }

  public int x() {
    return x;
  }

  public int y() {
    return y;
  }

  public int z() {
    return z;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    TileCoord tileCoord = (TileCoord) o;

    return encoded == tileCoord.encoded;
  }

  @Override
  public int hashCode() {
    return encoded;
  }

  public static int decodeZ(int key) {
    int result = key >> 28;
    return result < 0 ? 16 + result : result;
  }

  public static int decodeX(int key) {
    return (key >> 14) & ((1 << 14) - 1);
  }

  public static int decodeY(int key) {
    return (key) & ((1 << 14) - 1);
  }

  private static int encode(int x, int y, int z) {
    int max = 1 << z;
    if (x >= max) {
      x %= max;
    }
    if (x < 0) {
      x += max;
    }
    if (y < 0) {
      y = 0;
    }
    if (y >= max) {
      y = max;
    }
    return (z << 28) | (x << 14) | y;
  }

  @Override
  public String toString() {
    return "TileCoord{" +
      z + "/" + x + "/" + y +
      ", encoded=" + encoded +
      '}';
  }
}
