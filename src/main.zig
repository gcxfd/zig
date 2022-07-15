const ziglyph = @import("ziglyph");
const std = @import("std");

const fixedBufferStream = std.io.fixedBufferStream;
const AllKeysFile = ziglyph.collator.AllKeysFile;

pub fn main() anyerror!void {
    var allocator = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(!allocator.deinit());
    const arena = allocator.allocator();

    const txt = "The most common newbie mistake: \nSo while you're learning Zig you come up with the following program:";
    std.log.info("> {s}", .{txt});

    var fbs = fixedBufferStream(&txt);

    AllKeysFile.parse(arena, fbs.reader());

    std.log.info("All your codebase are belong to us.", .{});
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
