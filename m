Return-Path: <linux-input+bounces-16438-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1094BC9A1D3
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 06:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 086B53A53DA
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 05:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5963D2F6597;
	Tue,  2 Dec 2025 05:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b="TJJLS3pb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.softether.network (mail.softether.network [103.41.62.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA732951A7;
	Tue,  2 Dec 2025 05:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.41.62.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764654277; cv=none; b=lGID/nizrfXIqZOR4GMZJdpE3JbI3ERTl6FRIsGamxSbNJHHbxXUMoIbAnN184cf5ktGe+BrGQTILzWeQy0khsiOYmhR4jK+SQlPk3AweGxUvPFke0SHArg8VWpoz77PlQKJw1ZVpRO6DKv4JQrr1lLIzTZVXljIhzqdEdG71kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764654277; c=relaxed/simple;
	bh=ARpMSsHj86h+UX/BrZk6ruTzm/YlVXKi7ONpXBSeLog=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=VrExYVckrzJM9V17NIxwGmn2SLj9bHlj6iZxz3Tk2FUz5oYF12ZSqVGk/Iss25/K7/aCW1YIAjaTC2mkD8+wGFljRqsII9WOK4S9nlI+ZXQganhTfoq7AYECCcMB0VN/gkbqP1hwNDUyQHV5a/Mqhy9zC6MSy5bZ800C6A5N01w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev; spf=pass smtp.mailfrom=davidebeatrici.dev; dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b=TJJLS3pb; arc=none smtp.client-ip=103.41.62.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidebeatrici.dev
Received: from mail.softether.network (localhost [127.0.0.1])
	(Authenticated sender: me@davidebeatrici.dev)
	by mail.softether.network (Postfix) with ESMTPSA id 995F140CA6;
	Tue,  2 Dec 2025 05:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mail.softether.network; s=2025; t=1764653806;
	bh=ARpMSsHj86h+UX/BrZk6ruTzm/YlVXKi7ONpXBSeLog=;
	h=Date:From:To:Cc:Subject:From;
	b=TJJLS3pbC36WSt96UMYAQWK7uMcSTj25+JHrOVX4mBHCsRbaSAiClChsj5oFGiLuu
	 6z+rAtnuCUH6W1SD0lmbfTzxWdEE4S1NF+ZVTtXvgcX9tcLdGYDCmIfPi42+CVSJoP
	 atO6TdVFMzmByYLgo979keBPvyYflOva1VbdJLab2GEXiIfCKHIJUgVZPv89ulg6FL
	 WUB1Ci0s2clCJGw6R/TvkTcVJcDcdjMHMobZ0lNfS/bUMLz1PD0lCKHgYpvtS7mnmW
	 6V26QjFrZmCFioKNrrKHWqf46X54Y/XGqkJL6w2SDPS5BMlS6fjRPEb75P+PfM/x+p
	 l51NyFrvgOAUA==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 02 Dec 2025 06:36:46 +0100
From: Davide Beatrici <me@davidebeatrici.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Subject: [PATCH] HID: validate report length and constants
Message-ID: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
X-Sender: me@davidebeatrici.dev
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

 From 4956d80ba2bcdb0f5410dfe9365331bcece781cb Mon Sep 17 00:00:00 2001
 From: Davide Beatrici <git@davidebeatrici.dev>
Date: Tue, 2 Dec 2025 05:00:52 +0100
Subject: [PATCH] HID: validate report length and constants
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The HID specification defines Input(Constant) fields as padding or 
reserved
bits that must remain zero at runtime. Currently, Linux accepts non‑zero
values in these fields, allowing malformed reports to propagate to 
userspace.

The ATK X1 SE (373b:1107) is a popular USB mouse that triggers weird 
behavior.
A few seconds after connecting it sends a packet that is detected as 
malformed
by WireShark, but the kernel happily accepts and parses it.

Until the device is disconnected, modifier keys are forced into a fixed 
state:

LeftControl (0xe0): UP
LeftShift (0xe1): UP
LeftAlt (0xe2): DOWN
LeftGUI (0xe3): UP
RightControl (0xe4): UP
RightShift (0xe5): DOWN
RightAlt (0xe6): DOWN
RightGUI (0xe7): UP

And unknown keys are kept pressed:

kernel: usb 5-1: Unknown key (scancode 0xb2) pressed.
kernel: usb 5-1: Unknown key (scancode 0xff) pressed.
kernel: usb 5-1: Unknown key (scancode 0xff) pressed.

kernel: usb 5-1: Unknown key (scancode 0xc0) pressed.
kernel: usb 5-1: Unknown key (scancode 0xb6) pressed.
kernel: usb 5-1: Unknown key (scancode 0xff) pressed.
kernel: usb 5-1: Unknown key (scancode 0xff) pressed.

This patch extends hid-core to record Constant slices during descriptor
parsing and validate them at runtime. Reports with non‑zero Constant 
bits are
rejected, and a ratelimited warning is logged. Legitimate Data/Relative 
fields
(buttons, motion axes, wheel) continue to pass through unchanged.

Malformed reports are suppressed and no longer show up with 
usbmon/WireShark.
All other USB devices I own still work flawlessly after applying this 
patch,
but this is definitely something that requires extensive testing!

Signed-off-by: Davide Beatrici <git@davidebeatrici.dev>
---
  drivers/hid/hid-core.c | 134 ++++++++++++++++++++++++++++++++++++++++-
  include/linux/hid.h    |  15 +++++
  2 files changed, 146 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a5b3a8ca2fcb..bb45c5f6f4fb 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -280,6 +280,81 @@ static int hid_add_usage(struct hid_parser *parser, 
unsigned usage, u8 size)
  	return 0;
  }

+/*
+ * Append metadata for runtime payload validation.
+ */
+
+static int hid_validate_append_bits(struct hid_report *r, const __u16 
bit_off, const __u16 bit_len)
+{
+	struct hid_report_validate *v = &r->validate;
+	struct hid_const_slice *slices = krealloc(v->const_slices,
+		(v->const_count + 1) * sizeof(*slices), GFP_KERNEL);
+	if (!slices)
+		return -ENOMEM;
+
+	v->const_slices = slices;
+	v->const_slices[v->const_count].bit_off = bit_off;
+	v->const_slices[v->const_count].bit_len = bit_len;
+	v->const_count++;
+
+	return 0;
+}
+
+/*
+ * Validate runtime payload.
+ */
+
+static bool hid_validate_report(struct hid_device *hid, struct 
hid_report *r,
+		const __u8 *buf, size_t len)
+{
+	const __u8 *payload;
+	size_t payload_len;
+	__u16 i;
+
+	/* Report ID handling: if present, buf[0] is ID; payload follows */
+	payload = r->id ? buf + 1 : buf;
+	payload_len = r->id ? (len ? len - 1 : 0) : len;
+
+	if (r->validate.payload_len && payload_len != r->validate.payload_len) 
{
+		hid_warn_ratelimited(hid,
+			"Malformed report: length %zu != expected %u (ID %u)\n",
+			payload_len, r->validate.payload_len, r->id);
+		return false;
+	}
+
+	for (i = 0; i < r->validate.const_count; i++) {
+		const __u16 bit_off = r->validate.const_slices[i].bit_off;
+		const __u16 bit_len = r->validate.const_slices[i].bit_len;
+		const __u16 end_bit = bit_off + bit_len;
+
+		for (__u16 b = bit_off; b < end_bit;) {
+			size_t byte_off = b >> 3;
+			size_t bit_in_byte = b & 7;
+
+			__u16 rem_bits = end_bit - b;
+			__u8 span = (__u8)min_t(__u16, rem_bits, 8 - bit_in_byte);
+			__u8 mask = ((1u << span) - 1) << bit_in_byte;
+
+			if (byte_off >= payload_len) {
+				hid_warn_ratelimited(hid,
+					"Malformed report: const slice OOB (bit_off %u, len %u)\n",
+					bit_off, bit_len);
+				return false;
+			}
+			if (payload[byte_off] & mask) {
+				hid_warn_ratelimited(hid,
+					"Malformed report: non-zero constant at byte %zu mask 0x%02x val 
0x%02x\n",
+					byte_off, mask, payload[byte_off]);
+				return false;
+			}
+
+			b += span;
+		}
+	}
+
+	return true;
+}
+
  /*
   * Register a new field for this report.
   */
@@ -303,6 +378,8 @@ static int hid_add_field(struct hid_parser *parser, 
unsigned report_type, unsign
  		return -1;
  	}

+	parser->curr_report = report;
+
  	/* Handle both signed and unsigned cases properly */
  	if ((parser->global.logical_minimum < 0 &&
  		parser->global.logical_maximum <
@@ -638,11 +715,13 @@ static void hid_concatenate_last_usage_page(struct 
hid_parser *parser)
  static int hid_parser_main(struct hid_parser *parser, struct hid_item 
*item)
  {
  	__u32 data;
+	__u8 flags;
  	int ret;

  	hid_concatenate_last_usage_page(parser);

  	data = item_udata(item);
+	flags = (u8)data;

  	switch (item->tag) {
  	case HID_MAIN_ITEM_TAG_BEGIN_COLLECTION:
@@ -651,15 +730,61 @@ static int hid_parser_main(struct hid_parser 
*parser, struct hid_item *item)
  	case HID_MAIN_ITEM_TAG_END_COLLECTION:
  		ret = close_collection(parser);
  		break;
-	case HID_MAIN_ITEM_TAG_INPUT:
+	case HID_MAIN_ITEM_TAG_INPUT: {
+		__u16 offset_bits, size_bits;
+
+		if (flags & HID_MAIN_ITEM_RESERVED_MASK) {
+			hid_warn_ratelimited(parser->device,
+				"Malformed input descriptor: reserved bits set (0x%02x)\n",
+				flags);
+			return -EINVAL;
+		}
+
+		/* Compute field range in bits */
+		offset_bits = parser->curr_offset;
+		size_bits   = parser->global.report_size * 
parser->global.report_count;
+
+		/* Record Input(Constant) slices for runtime validation */
+		if ((flags & HID_MAIN_ITEM_CONSTANT) && parser->curr_report) {
+			/* Record bit-granular slice: store bit offset and size */
+			ret = hid_validate_append_bits(parser->curr_report, offset_bits, 
size_bits);
+			if (ret)
+				return ret;
+		}
+
+		/* Advance offset and add field */
+		parser->curr_offset += size_bits;
+
  		ret = hid_add_field(parser, HID_INPUT_REPORT, data);
+		if (!ret && parser->curr_report) {
+			/* Expected payload length (bytes) excluding the optional ID */
+			parser->curr_report->validate.payload_len = 
(parser->curr_report->size + 7) / 8;
+		}
+
  		break;
-	case HID_MAIN_ITEM_TAG_OUTPUT:
+	}
+	case HID_MAIN_ITEM_TAG_OUTPUT: {
+		if (flags & HID_MAIN_ITEM_RESERVED_MASK) {
+			hid_warn_ratelimited(parser->device,
+				"Malformed output descriptor: reserved bits set (0x%02x)\n",
+				flags);
+			return -EINVAL;
+		}
+
  		ret = hid_add_field(parser, HID_OUTPUT_REPORT, data);
  		break;
-	case HID_MAIN_ITEM_TAG_FEATURE:
+	}
+	case HID_MAIN_ITEM_TAG_FEATURE: {
+		if (flags & HID_MAIN_ITEM_RESERVED_MASK) {
+			hid_warn_ratelimited(parser->device,
+				"Malformed feature descriptor: reserved bits set (0x%02x)\n",
+				flags);
+			return -EINVAL;
+		}
+
  		ret = hid_add_field(parser, HID_FEATURE_REPORT, data);
  		break;
+	}
  	default:
  		if (item->tag >= HID_MAIN_ITEM_TAG_RESERVED_MIN &&
  			item->tag <= HID_MAIN_ITEM_TAG_RESERVED_MAX)
@@ -2062,6 +2187,9 @@ int hid_report_raw_event(struct hid_device *hid, 
enum hid_report_type type, u8 *
  		memset(cdata + csize, 0, rsize - csize);
  	}

+	if (!hid_validate_report(hid, report, data, size))
+		goto out;
+
  	if ((hid->claimed & HID_CLAIMED_HIDDEV) && hid->hiddev_report_event)
  		hid->hiddev_report_event(hid, report);
  	if (hid->claimed & HID_CLAIMED_HIDRAW) {
diff --git a/include/linux/hid.h b/include/linux/hid.h
index a4ddb94e3ee5..3c7b3a8faa48 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -88,6 +88,7 @@ struct hid_item {
   * HID report descriptor main item contents
   */

+#define HID_MAIN_ITEM_RESERVED_MASK	0x0c8 /* HID 1.11: flags reserved 
bits (3, 6, 7) must be zero */
  #define HID_MAIN_ITEM_CONSTANT		0x001
  #define HID_MAIN_ITEM_VARIABLE		0x002
  #define HID_MAIN_ITEM_RELATIVE		0x004
@@ -560,6 +561,17 @@ struct hid_field_entry {
  	__s32 priority;
  };

+struct hid_const_slice {
+	__u16 bit_off;
+	__u16 bit_len;
+};
+
+struct hid_report_validate {
+	struct hid_const_slice *const_slices;
+	__u16 const_count;
+	__u16 payload_len;
+};
+
  struct hid_report {
  	struct list_head list;
  	struct list_head hidinput_list;
@@ -576,6 +588,7 @@ struct hid_report {
  	/* tool related state */
  	bool tool_active;				/* whether the current tool is active */
  	unsigned int tool;				/* BTN_TOOL_* */
+	struct hid_report_validate validate;
  };

  #define HID_MAX_IDS 256
@@ -760,6 +773,8 @@ struct hid_parser {
  	unsigned int          collection_stack_size;
  	struct hid_device    *device;
  	unsigned int          scan_flags;
+	__u16                 curr_offset;
+	struct hid_report    *curr_report;
  };

  struct hid_class_descriptor {
-- 
2.51.2


