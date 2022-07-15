const std = @import("std");
const ziglyph = @import("ziglyph");

const info = std.log.info;
const fixedBufferStream = std.io.fixedBufferStream;
const AllKeysFile = ziglyph.collator.AllKeysFile;

pub fn main() anyerror!void {
    var allocator = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(!allocator.deinit());
    const arena = allocator.allocator();

    const txt = [_]u8{ 1, 2, 3, 4, 5, 6, 7 };

    var fbs = fixedBufferStream(&txt);

    AllKeysFile.parse(arena, fbs.reader());

    std.log.info("All your codebase are belong to us.", .{});
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
