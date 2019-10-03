Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E146ACAE99
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 20:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730976AbfJCSyC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 14:54:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:45206 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730835AbfJCSyA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Oct 2019 14:54:00 -0400
Received: (qmail 17807 invoked by uid 2102); 3 Oct 2019 14:53:59 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Oct 2019 14:53:59 -0400
Date:   Thu, 3 Oct 2019 14:53:59 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jiri Kosina <jikos@kernel.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] HID: Fix assumption that devices have inputs
In-Reply-To: <000000000000cd1def0592ab9697@google.com>
Message-ID: <Pine.LNX.4.44L0.1910031449210.1797-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The syzbot fuzzer found a slab-out-of-bounds write bug in the hid-gaff
driver.  The problem is caused by the driver's assumption that the
device must have an input report.  While this will be true for all
normal HID input devices, a suitably malicious device can violate the
assumption.

The same assumption is present in over a dozen other HID drivers.
This patch fixes them by checking that the list of hid_inputs for the
hid_device is nonempty before allowing it to be used.

Reported-and-tested-by: syzbot+403741a091bf41d4ae79@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---

[as1921]


 drivers/hid/hid-axff.c           |   11 +++++++++--
 drivers/hid/hid-dr.c             |   12 +++++++++---
 drivers/hid/hid-emsff.c          |   12 +++++++++---
 drivers/hid/hid-gaff.c           |   12 +++++++++---
 drivers/hid/hid-holtekff.c       |   12 +++++++++---
 drivers/hid/hid-lg2ff.c          |   12 +++++++++---
 drivers/hid/hid-lg3ff.c          |   11 +++++++++--
 drivers/hid/hid-lg4ff.c          |   11 +++++++++--
 drivers/hid/hid-lgff.c           |   11 +++++++++--
 drivers/hid/hid-logitech-hidpp.c |   11 +++++++++--
 drivers/hid/hid-microsoft.c      |   12 +++++++++---
 drivers/hid/hid-sony.c           |   12 +++++++++---
 drivers/hid/hid-tmff.c           |   12 +++++++++---
 drivers/hid/hid-zpff.c           |   12 +++++++++---
 14 files changed, 126 insertions(+), 37 deletions(-)

Index: usb-devel/drivers/hid/hid-gaff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-gaff.c
+++ usb-devel/drivers/hid/hid-gaff.c
@@ -64,14 +64,20 @@ static int gaff_init(struct hid_device *
 {
 	struct gaff_device *gaff;
 	struct hid_report *report;
-	struct hid_input *hidinput = list_entry(hid->inputs.next,
-						struct hid_input, list);
+	struct hid_input *hidinput;
 	struct list_head *report_list =
 			&hid->report_enum[HID_OUTPUT_REPORT].report_list;
 	struct list_head *report_ptr = report_list;
-	struct input_dev *dev = hidinput->input;
+	struct input_dev *dev;
 	int error;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
+
 	if (list_empty(report_list)) {
 		hid_err(hid, "no output reports found\n");
 		return -ENODEV;
Index: usb-devel/drivers/hid/hid-axff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-axff.c
+++ usb-devel/drivers/hid/hid-axff.c
@@ -63,13 +63,20 @@ static int axff_init(struct hid_device *
 {
 	struct axff_device *axff;
 	struct hid_report *report;
-	struct hid_input *hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
+	struct hid_input *hidinput;
 	struct list_head *report_list =&hid->report_enum[HID_OUTPUT_REPORT].report_list;
-	struct input_dev *dev = hidinput->input;
+	struct input_dev *dev;
 	int field_count = 0;
 	int i, j;
 	int error;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
+	dev = hidinput->input;
+
 	if (list_empty(report_list)) {
 		hid_err(hid, "no output reports found\n");
 		return -ENODEV;
Index: usb-devel/drivers/hid/hid-dr.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-dr.c
+++ usb-devel/drivers/hid/hid-dr.c
@@ -75,13 +75,19 @@ static int drff_init(struct hid_device *
 {
 	struct drff_device *drff;
 	struct hid_report *report;
-	struct hid_input *hidinput = list_first_entry(&hid->inputs,
-						struct hid_input, list);
+	struct hid_input *hidinput;
 	struct list_head *report_list =
 			&hid->report_enum[HID_OUTPUT_REPORT].report_list;
-	struct input_dev *dev = hidinput->input;
+	struct input_dev *dev;
 	int error;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
+	dev = hidinput->input;
+
 	if (list_empty(report_list)) {
 		hid_err(hid, "no output reports found\n");
 		return -ENODEV;
Index: usb-devel/drivers/hid/hid-emsff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-emsff.c
+++ usb-devel/drivers/hid/hid-emsff.c
@@ -47,13 +47,19 @@ static int emsff_init(struct hid_device
 {
 	struct emsff_device *emsff;
 	struct hid_report *report;
-	struct hid_input *hidinput = list_first_entry(&hid->inputs,
-						struct hid_input, list);
+	struct hid_input *hidinput;
 	struct list_head *report_list =
 			&hid->report_enum[HID_OUTPUT_REPORT].report_list;
-	struct input_dev *dev = hidinput->input;
+	struct input_dev *dev;
 	int error;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
+	dev = hidinput->input;
+
 	if (list_empty(report_list)) {
 		hid_err(hid, "no output reports found\n");
 		return -ENODEV;
Index: usb-devel/drivers/hid/hid-holtekff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-holtekff.c
+++ usb-devel/drivers/hid/hid-holtekff.c
@@ -124,13 +124,19 @@ static int holtekff_init(struct hid_devi
 {
 	struct holtekff_device *holtekff;
 	struct hid_report *report;
-	struct hid_input *hidinput = list_entry(hid->inputs.next,
-						struct hid_input, list);
+	struct hid_input *hidinput;
 	struct list_head *report_list =
 			&hid->report_enum[HID_OUTPUT_REPORT].report_list;
-	struct input_dev *dev = hidinput->input;
+	struct input_dev *dev;
 	int error;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
+
 	if (list_empty(report_list)) {
 		hid_err(hid, "no output report found\n");
 		return -ENODEV;
Index: usb-devel/drivers/hid/hid-lg2ff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-lg2ff.c
+++ usb-devel/drivers/hid/hid-lg2ff.c
@@ -50,11 +50,17 @@ int lg2ff_init(struct hid_device *hid)
 {
 	struct lg2ff_device *lg2ff;
 	struct hid_report *report;
-	struct hid_input *hidinput = list_entry(hid->inputs.next,
-						struct hid_input, list);
-	struct input_dev *dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *dev;
 	int error;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
+
 	/* Check that the report looks ok */
 	report = hid_validate_values(hid, HID_OUTPUT_REPORT, 0, 0, 7);
 	if (!report)
Index: usb-devel/drivers/hid/hid-lg3ff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-lg3ff.c
+++ usb-devel/drivers/hid/hid-lg3ff.c
@@ -117,12 +117,19 @@ static const signed short ff3_joystick_a
 
 int lg3ff_init(struct hid_device *hid)
 {
-	struct hid_input *hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	struct input_dev *dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *dev;
 	const signed short *ff_bits = ff3_joystick_ac;
 	int error;
 	int i;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
+
 	/* Check that the report looks ok */
 	if (!hid_validate_values(hid, HID_OUTPUT_REPORT, 0, 0, 35))
 		return -ENODEV;
Index: usb-devel/drivers/hid/hid-lg4ff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-lg4ff.c
+++ usb-devel/drivers/hid/hid-lg4ff.c
@@ -1253,8 +1253,8 @@ static int lg4ff_handle_multimode_wheel(
 
 int lg4ff_init(struct hid_device *hid)
 {
-	struct hid_input *hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	struct input_dev *dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *dev;
 	struct list_head *report_list = &hid->report_enum[HID_OUTPUT_REPORT].report_list;
 	struct hid_report *report = list_entry(report_list->next, struct hid_report, list);
 	const struct usb_device_descriptor *udesc = &(hid_to_usb_dev(hid)->descriptor);
@@ -1266,6 +1266,13 @@ int lg4ff_init(struct hid_device *hid)
 	int mmode_ret, mmode_idx = -1;
 	u16 real_product_id;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
+
 	/* Check that the report looks ok */
 	if (!hid_validate_values(hid, HID_OUTPUT_REPORT, 0, 0, 7))
 		return -1;
Index: usb-devel/drivers/hid/hid-lgff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-lgff.c
+++ usb-devel/drivers/hid/hid-lgff.c
@@ -115,12 +115,19 @@ static void hid_lgff_set_autocenter(stru
 
 int lgff_init(struct hid_device* hid)
 {
-	struct hid_input *hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	struct input_dev *dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *dev;
 	const signed short *ff_bits = ff_joystick;
 	int error;
 	int i;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
+
 	/* Check that the report looks ok */
 	if (!hid_validate_values(hid, HID_OUTPUT_REPORT, 0, 0, 7))
 		return -ENODEV;
Index: usb-devel/drivers/hid/hid-logitech-hidpp.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-logitech-hidpp.c
+++ usb-devel/drivers/hid/hid-logitech-hidpp.c
@@ -2084,8 +2084,8 @@ static void hidpp_ff_destroy(struct ff_d
 static int hidpp_ff_init(struct hidpp_device *hidpp, u8 feature_index)
 {
 	struct hid_device *hid = hidpp->hid_dev;
-	struct hid_input *hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	struct input_dev *dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *dev;
 	const struct usb_device_descriptor *udesc = &(hid_to_usb_dev(hid)->descriptor);
 	const u16 bcdDevice = le16_to_cpu(udesc->bcdDevice);
 	struct ff_device *ff;
@@ -2094,6 +2094,13 @@ static int hidpp_ff_init(struct hidpp_de
 	int error, j, num_slots;
 	u8 version;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
+
 	if (!dev) {
 		hid_err(hid, "Struct input_dev not set!\n");
 		return -EINVAL;
Index: usb-devel/drivers/hid/hid-microsoft.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-microsoft.c
+++ usb-devel/drivers/hid/hid-microsoft.c
@@ -328,11 +328,17 @@ static int ms_play_effect(struct input_d
 
 static int ms_init_ff(struct hid_device *hdev)
 {
-	struct hid_input *hidinput = list_entry(hdev->inputs.next,
-						struct hid_input, list);
-	struct input_dev *input_dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *input_dev;
 	struct ms_data *ms = hid_get_drvdata(hdev);
 
+	if (list_empty(&hdev->inputs)) {
+		hid_err(hdev, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hdev->inputs.next, struct hid_input, list);
+	input_dev = hidinput->input;
+
 	if (!(ms->quirks & MS_QUIRK_FF))
 		return 0;
 
Index: usb-devel/drivers/hid/hid-sony.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-sony.c
+++ usb-devel/drivers/hid/hid-sony.c
@@ -2250,9 +2250,15 @@ static int sony_play_effect(struct input
 
 static int sony_init_ff(struct sony_sc *sc)
 {
-	struct hid_input *hidinput = list_entry(sc->hdev->inputs.next,
-						struct hid_input, list);
-	struct input_dev *input_dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *input_dev;
+
+	if (list_empty(&sc->hdev->inputs)) {
+		hid_err(sc->hdev, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(sc->hdev->inputs.next, struct hid_input, list);
+	input_dev = hidinput->input;
 
 	input_set_capability(input_dev, EV_FF, FF_RUMBLE);
 	return input_ff_create_memless(input_dev, NULL, sony_play_effect);
Index: usb-devel/drivers/hid/hid-tmff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-tmff.c
+++ usb-devel/drivers/hid/hid-tmff.c
@@ -114,12 +114,18 @@ static int tmff_init(struct hid_device *
 	struct tmff_device *tmff;
 	struct hid_report *report;
 	struct list_head *report_list;
-	struct hid_input *hidinput = list_entry(hid->inputs.next,
-							struct hid_input, list);
-	struct input_dev *input_dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *input_dev;
 	int error;
 	int i;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	input_dev = hidinput->input;
+
 	tmff = kzalloc(sizeof(struct tmff_device), GFP_KERNEL);
 	if (!tmff)
 		return -ENOMEM;
Index: usb-devel/drivers/hid/hid-zpff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-zpff.c
+++ usb-devel/drivers/hid/hid-zpff.c
@@ -54,11 +54,17 @@ static int zpff_init(struct hid_device *
 {
 	struct zpff_device *zpff;
 	struct hid_report *report;
-	struct hid_input *hidinput = list_entry(hid->inputs.next,
-						struct hid_input, list);
-	struct input_dev *dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *dev;
 	int i, error;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
+
 	for (i = 0; i < 4; i++) {
 		report = hid_validate_values(hid, HID_OUTPUT_REPORT, 0, i, 1);
 		if (!report)

