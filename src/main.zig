const ziglyph = @import("ziglyph");
const std = @import("std");

pub fn main() anyerror!void {
    const txt = "banana";
    std.log.info("> {s}", .{txt});

    std.log.info("All your codebase are belong to us.", .{});
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
