Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6320A389A6D
	for <lists+linux-input@lfdr.de>; Thu, 20 May 2021 02:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhETAYl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 May 2021 20:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhETAYl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 May 2021 20:24:41 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247C0C061574
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 17:23:20 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id bc3-20020ad456830000b02901f47dbd7ef6so1826804qvb.6
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 17:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZLOR33UPVhxDYUxNdoVaJuwz26aIKW+kNnu2OBb4Wco=;
        b=r1gK0lN5H/ZJ3Rm+UEYOJHJyYvkhQcs2yF3A0vWFiVFIj8kQQS6BOJywHxlsOQPi5H
         wRryVfBt1QPqItzjQD2JyiZUdCu3fYmR4FOP7wEgurSyBbDq1Y40fAU6aSLOdZpLnooP
         c41UlmUvgzMdkeucvQqJyQv8QJYTUM9JkK1bCnok2rnpoTplFTfTrldzkB5lpyBnV876
         emENsgUfLoh6cU1Sxnp6VFWBrcsiSCGmB0eTM/gSwWDQFMWbGBw6l1cGWh0CdAzfzvH9
         i3DtOt6Dl5QEI3P5XD/vgDCzCcprgZJ+INElcuo0GRzAsCB4R5V8lhjHwqFFzH6tou4M
         QcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZLOR33UPVhxDYUxNdoVaJuwz26aIKW+kNnu2OBb4Wco=;
        b=OU9RF1gGg9g3RjDPwGHjJ3XB9TBE6l7o+EnfiuBIbtyPdxgxnrUUvJbNaq4zgF+Kr+
         VjY55+eAWwgKcf1b+YG36EQZJI6dadISUddoNFOnOLjqpSma8LA/zYjac4ptW70fBVR/
         zA5DXOvGJmVI/njyBU1GzEDup35J+MnVcewJ24KGOg2ytin87gcZY7s1G79oHDeijLJc
         sBaZlwI58mePIr3Z8sG4dEgcfGmiE+8nURT3dVEV2m2xZ2guJp1BNEWE1JsdVuKGF8eY
         LX8mUkdfIUiPAVgNFKnbSPVezdP2rSZ8bXg+UW8/iVhlIsCsVBGQQssqf/+vjtTKdTF/
         Y9kg==
X-Gm-Message-State: AOAM531LNp6uxIRGs1m1cfPr01sih+F0IZzTD//3bUXm/IcMN7QIkfK7
        H4PL4x6jcztbtSV6mXNdDHuHn188KwNoDw9w0DiaaJhguPQ+q72L+PyEuuASwmNJhQkLTTDXFoC
        yn3F81GM8mZX6k16ELd2AOjj6FXuFCTHBCj3mY3Kfg393tFrTbvmFOeX2ixZ/t8fZci0FU38=
X-Google-Smtp-Source: ABdhPJyt4ojNrkn8gaLajRMcN3I+aQf7Kf8KuWru8fieAQpzDgoj5rVpBqsCjuu5SUAyl8jZ1MI837whXNub
X-Received: from kenalba1.mtv.corp.google.com ([2620:15c:203:200:4404:83b2:506f:fd71])
 (user=kenalba job=sendgmr) by 2002:a05:6214:b27:: with SMTP id
 w7mr2606582qvj.40.1621470199160; Wed, 19 May 2021 17:23:19 -0700 (PDT)
Date:   Wed, 19 May 2021 17:22:48 -0700
In-Reply-To: <20210520002249.361821-1-kenalba@google.com>
Message-Id: <20210519143836.2.I62308b62b6ebddf086c125fbf1a5aa159bda891a@changeid>
Mime-Version: 1.0
References: <20210520002249.361821-1-kenalba@google.com>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH 2/3] [hid] Enable processing of fields larger than 32 bits.
From:   Kenneth Albanowski <kenalba@google.com>
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Kenneth Albanowski <kenalba@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Extends hid-core to process HID fields larger than 32 bits,
by storing them as multiple consecutive 32-bit values.

hid-input and hid-debug are specifically changed to match.
Currently, no other hid consumers get an interface to see
fields larger than 32 bits.

All existing code, including hid-input processing, will by
default see the least significant 32-bits of the field, so they
have unchanged behaviour (sign extension does not change: for
any field longer than 32 bits, extension was already a no-op,
so the least significant 32-bit value will be identical. The most
significant value, at the far end, will now be extended to fill
its 32-bit value.)

Logical min/max interaction with larger fields is limited,
as min/max and other item parameters can only be described with
32-bit values (sometimes signed). hid-input is expected to
ignore min/max in scenarios where a specific larger field is
involved.

hid-debug 'events' debugfs text report format is changed, but
only for HID fields larger than 32 bits.

Signed-off-by: Kenneth Albanowski <kenalba@google.com>
---

 Documentation/hid/hiddev.rst |  6 ++-
 drivers/hid/hid-core.c       | 80 ++++++++++++++++++++++++++----------
 drivers/hid/hid-debug.c      | 27 ++++++++----
 drivers/hid/hid-input.c      | 10 ++++-
 include/linux/hid-debug.h    |  4 +-
 include/linux/hid.h          |  2 +-
 6 files changed, 92 insertions(+), 37 deletions(-)

diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
index 209e6ba4e019e..f22fcf1b55b9e 100644
--- a/Documentation/hid/hiddev.rst
+++ b/Documentation/hid/hiddev.rst
@@ -72,8 +72,10 @@ The hiddev API uses a read() interface, and a set of ioctl() calls.
 
 HID devices exchange data with the host computer using data
 bundles called "reports".  Each report is divided into "fields",
-each of which can have one or more "usages".  In the hid-core,
-each one of these usages has a single signed 32 bit value.
+each of which can have one or more "usages". Each of these usages
+has a value, usually a 32 bit or smaller signed value. (The
+hid-core can process larger values, but these are not currently
+exposed through hiddev.)
 
 read():
 -------
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 19b2b0aae0c7e..e588c3a35a593 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -86,22 +86,35 @@ struct hid_report *hid_register_report(struct hid_device *device,
 }
 EXPORT_SYMBOL_GPL(hid_register_report);
 
+// How many 32-bit values are needed to store a field?
+static unsigned hid_field_size_in_values(unsigned flags, unsigned size_in_bits)
+{
+	if (!(flags & HID_MAIN_ITEM_VARIABLE)) {
+		return 1;
+	} else {
+		return DIV_ROUND_UP(size_in_bits, 32);
+	}
+}
+
 /*
  * Register a new field for this report.
  */
 
-static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages)
+static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages, unsigned flags, unsigned size_in_bits)
 {
 	struct hid_field *field;
+	unsigned size_in_values;
 
 	if (report->maxfield == HID_MAX_FIELDS) {
 		hid_err(report->device, "too many fields in report\n");
 		return NULL;
 	}
 
+	size_in_values = hid_field_size_in_values(flags, size_in_bits);
+
 	field = kzalloc((sizeof(struct hid_field) +
 			 usages * sizeof(struct hid_usage) +
-			 usages * sizeof(unsigned)), GFP_KERNEL);
+			 usages * size_in_values * sizeof(s32)), GFP_KERNEL);
 	if (!field)
 		return NULL;
 
@@ -300,7 +313,7 @@ static int hid_add_field(struct hid_parser *parser, unsigned report_type, unsign
 	usages = max_t(unsigned, parser->local.usage_index,
 				 parser->global.report_count);
 
-	field = hid_register_field(report, usages);
+	field = hid_register_field(report, usages, flags, parser->global.report_size);
 	if (!field)
 		return 0;
 
@@ -1340,6 +1353,9 @@ static u32 s32ton(__s32 value, unsigned n)
  * While the USB HID spec allows unlimited length bit fields in "report
  * descriptors", most devices never use more than 16 bits.
  * One model of UPS is claimed to report "LINEV" as a 32-bit field.
+ * Some digitizers report stylus transducer IDs as 64-bit fields.
+ * The outer routines will extract multiple 32-bit parts if necessary
+ * to retrieve an entire field.
  * Search linux-kernel and linux-usb-devel archives for "hid-core extract".
  */
 
@@ -1495,16 +1511,19 @@ static int hid_match_usage(struct hid_device *hid, struct hid_usage *usage)
 }
 
 static void hid_process_event(struct hid_device *hid, struct hid_field *field,
-		struct hid_usage *usage, __s32 value, int interrupt)
+		struct hid_usage *usage, const __s32 * values, unsigned value_count, int interrupt)
 {
 	struct hid_driver *hdrv = hid->driver;
 	int ret;
 
+	if (unlikely(value_count == 0))
+		return;
+
 	if (!list_empty(&hid->debug_list))
-		hid_dump_input(hid, usage, value);
+		hid_dump_input(hid, usage, values, value_count);
 
 	if (hdrv && hdrv->event && hid_match_usage(hid, usage)) {
-		ret = hdrv->event(hid, field, usage, value);
+		ret = hdrv->event(hid, field, usage, values[0]);
 		if (ret != 0) {
 			if (ret < 0)
 				hid_err(hid, "%s's event failed with %d\n",
@@ -1514,9 +1533,9 @@ static void hid_process_event(struct hid_device *hid, struct hid_field *field,
 	}
 
 	if (hid->claimed & HID_CLAIMED_INPUT)
-		hidinput_hid_event(hid, field, usage, value);
+		hidinput_hid_event(hid, field, usage, values, value_count);
 	if (hid->claimed & HID_CLAIMED_HIDDEV && interrupt && hid->hiddev_hid_event)
-		hid->hiddev_hid_event(hid, field, usage, value);
+		hid->hiddev_hid_event(hid, field, usage, values[0]);
 }
 
 /*
@@ -1528,24 +1547,41 @@ static void hid_process_event(struct hid_device *hid, struct hid_field *field,
 static void hid_input_field(struct hid_device *hid, struct hid_field *field,
 			    __u8 *data, int interrupt)
 {
-	unsigned n;
+	unsigned n, v;
 	unsigned count = field->report_count;
 	unsigned offset = field->report_offset;
-	unsigned size = field->report_size;
+	unsigned size_in_bits = field->report_size;
+	unsigned size_in_values; /* storage size in 32-bit values, always >= 1 */
+	unsigned last_value_size_in_bits; /* bits in most significant/last value */
+	unsigned bit_pos;
 	__s32 min = field->logical_minimum;
 	__s32 max = field->logical_maximum;
 	__s32 *value;
+	static const __s32 zero = 0;
+	static const __s32 one = 1;
+
+	size_in_values = hid_field_size_in_values(field->flags, size_in_bits);
+	last_value_size_in_bits = (size_in_bits % 32) ?: 32;
 
-	value = kmalloc_array(count, sizeof(__s32), GFP_ATOMIC);
+	value = kmalloc_array(count * size_in_values, sizeof(__s32), GFP_ATOMIC);
 	if (!value)
 		return;
 
-	for (n = 0; n < count; n++) {
+	for (n = 0; n < count * size_in_values; n += size_in_values) {
+		v = 0;
+		bit_pos = offset + (n * size_in_bits);
+
+		// Extract least significant values for fields longer than 32 bits.
+		if (size_in_values > 1) {
+			for (; v < size_in_values - 1; v++, bit_pos += 32)
+				value[n+v] = hid_field_extract(hid, data, bit_pos, 32);
+		}
 
-		value[n] = min < 0 ?
-			snto32(hid_field_extract(hid, data, offset + n * size,
-			       size), size) :
-			hid_field_extract(hid, data, offset + n * size, size);
+		// May need to sign extend the most significant value.
+		value[n+v] = min < 0 ?
+			sign_extend32(hid_field_extract(hid, data, bit_pos,
+				last_value_size_in_bits), last_value_size_in_bits) :
+			hid_field_extract(hid, data, bit_pos, last_value_size_in_bits);
 
 		/* Ignore report if ErrorRollOver */
 		if (!(field->flags & HID_MAIN_ITEM_VARIABLE) &&
@@ -1555,10 +1591,10 @@ static void hid_input_field(struct hid_device *hid, struct hid_field *field,
 			goto exit;
 	}
 
-	for (n = 0; n < count; n++) {
+	for (n = 0; n < count * size_in_values; n += size_in_values) {
 
 		if (HID_MAIN_ITEM_VARIABLE & field->flags) {
-			hid_process_event(hid, field, &field->usage[n], value[n], interrupt);
+			hid_process_event(hid, field, &field->usage[n], value + n, size_in_values, interrupt);
 			continue;
 		}
 
@@ -1566,16 +1602,16 @@ static void hid_input_field(struct hid_device *hid, struct hid_field *field,
 			&& field->value[n] - min < field->maxusage
 			&& field->usage[field->value[n] - min].hid
 			&& search(value, field->value[n], count))
-				hid_process_event(hid, field, &field->usage[field->value[n] - min], 0, interrupt);
+				hid_process_event(hid, field, &field->usage[field->value[n] - min], &zero, 1, interrupt);
 
 		if (value[n] >= min && value[n] <= max
 			&& value[n] - min < field->maxusage
 			&& field->usage[value[n] - min].hid
 			&& search(field->value, value[n], count))
-				hid_process_event(hid, field, &field->usage[value[n] - min], 1, interrupt);
+				hid_process_event(hid, field, &field->usage[value[n] - min], &one, 1, interrupt);
 	}
 
-	memcpy(field->value, value, count * sizeof(__s32));
+	memcpy(field->value, value, count * size_in_values * sizeof(__s32));
 exit:
 	kfree(value);
 }
@@ -1662,7 +1698,7 @@ int hid_set_field(struct hid_field *field, unsigned offset, __s32 value)
 
 	size = field->report_size;
 
-	hid_dump_input(field->report->device, field->usage + offset, value);
+	hid_dump_input(field->report->device, field->usage + offset, &value, 1);
 
 	if (offset >= field->report_count) {
 		hid_err(field->report->device, "offset (%d) exceeds report_count (%d)\n",
diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 9453147d020db..bc25b0e8b6b63 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -692,21 +692,30 @@ void hid_dump_report(struct hid_device *hid, int type, u8 *data,
 }
 EXPORT_SYMBOL_GPL(hid_dump_report);
 
-void hid_dump_input(struct hid_device *hdev, struct hid_usage *usage, __s32 value)
+void hid_dump_input(struct hid_device *hdev, struct hid_usage *usage, const __s32 *values, unsigned value_count)
 {
 	char *buf;
 	int len;
+	unsigned n;
 
-	buf = hid_resolv_usage(usage->hid, NULL);
-	if (!buf)
-		return;
-	len = strlen(buf);
-	snprintf(buf + len, HID_DEBUG_BUFSIZE - len - 1, " = %d\n", value);
+	for (n = 0; n < value_count; n++) {
 
-	hid_debug_event(hdev, buf);
+		buf = hid_resolv_usage(usage->hid, NULL);
+		if (!buf)
+			return;
 
-	kfree(buf);
-	wake_up_interruptible(&hdev->debug_wait);
+		len = strlen(buf);
+
+		if (value_count == 1)
+			snprintf(buf + len, HID_DEBUG_BUFSIZE - len - 1, " = %d\n", values[n]);
+		else
+			snprintf(buf + len, HID_DEBUG_BUFSIZE - len - 1, "[%d] = %d (%08x)\n", n, values[n], values[n]);
+
+		hid_debug_event(hdev, buf);
+
+		kfree(buf);
+		wake_up_interruptible(&hdev->debug_wait);
+	}
 }
 EXPORT_SYMBOL_GPL(hid_dump_input);
 
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index bceccd75b488e..ee9e8d31a45ba 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1273,10 +1273,18 @@ static void hidinput_handle_scroll(struct hid_usage *usage,
 	input_event(input, EV_REL, usage->code, hi_res);
 }
 
-void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct hid_usage *usage, __s32 value)
+void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct hid_usage *usage, const __s32 *values, unsigned value_count)
 {
 	struct input_dev *input;
 	unsigned *quirks = &hid->quirks;
+	__s32 value;
+
+	if (unlikely(value_count == 0))
+		return;
+
+	// The majority of this code was writen to only understand 32-bit sized
+	// values, and anything larger was truncated: we continue that tradition.
+	value = values[0];
 
 	if (!usage->type)
 		return;
diff --git a/include/linux/hid-debug.h b/include/linux/hid-debug.h
index ea7b23d13bfdf..b4fb1a73817b4 100644
--- a/include/linux/hid-debug.h
+++ b/include/linux/hid-debug.h
@@ -16,7 +16,7 @@
 #define HID_DEBUG_BUFSIZE 512
 #define HID_DEBUG_FIFOSIZE 512
 
-void hid_dump_input(struct hid_device *, struct hid_usage *, __s32);
+void hid_dump_input(struct hid_device *, struct hid_usage *, const __s32 *, unsigned);
 void hid_dump_report(struct hid_device *, int , u8 *, int);
 void hid_dump_device(struct hid_device *, struct seq_file *);
 void hid_dump_field(struct hid_field *, int, struct seq_file *);
@@ -37,7 +37,7 @@ struct hid_debug_list {
 
 #else
 
-#define hid_dump_input(a,b,c)		do { } while (0)
+#define hid_dump_input(a,b,c,d)		do { } while (0)
 #define hid_dump_report(a,b,c,d)	do { } while (0)
 #define hid_dump_device(a,b)		do { } while (0)
 #define hid_dump_field(a,b,c)		do { } while (0)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 59828a6080e83..8494b1995b10b 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -878,7 +878,7 @@ extern void hid_unregister_driver(struct hid_driver *);
 	module_driver(__hid_driver, hid_register_driver, \
 		      hid_unregister_driver)
 
-extern void hidinput_hid_event(struct hid_device *, struct hid_field *, struct hid_usage *, __s32);
+extern void hidinput_hid_event(struct hid_device *, struct hid_field *, struct hid_usage *, const __s32 *values, unsigned value_count);
 extern void hidinput_report_event(struct hid_device *hid, struct hid_report *report);
 extern int hidinput_connect(struct hid_device *hid, unsigned int force);
 extern void hidinput_disconnect(struct hid_device *);
-- 
2.31.0

