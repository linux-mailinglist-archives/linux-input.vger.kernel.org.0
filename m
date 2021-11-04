Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD30445411
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhKDNkR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:40:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:50270 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231365AbhKDNkF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 09:40:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211755226"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="211755226"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:26 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="501542051"
Received: from eyulyugi-mobl1.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.251.215.15])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:24 -0700
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        mika.westerberg@linux.intel.com, tero.kristo@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 6/8] HID: usi: Add driver for Universal Stylus Interface (USI)
Date:   Thu,  4 Nov 2021 15:36:59 +0200
Message-Id: <20211104133701.1733551-7-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Universal Stylus Interface (USI) is a new HID hardware spec for
supporting Pen input devices. These devices have a few additional
features compared to the existing HID pen support, and they are mapped
via the EV_MSC interface. A new HID driver is added for supporting the
USI pens, to isolate the quirks these devices have.

USI HID events are documented in the public USB-HID usage table:
    https://usb.org/document-library/hid-usage-tables-122

See chapter 16, Digitizers Page (0x0D)

Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
---
 drivers/hid/Kconfig   |   5 +
 drivers/hid/Makefile  |   1 +
 drivers/hid/hid-usi.c | 774 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/hid.h   |   7 +
 4 files changed, 787 insertions(+)
 create mode 100644 drivers/hid/hid-usi.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 3c33bf572d6d..c235ecb8f037 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1222,6 +1222,11 @@ config HID_MCP2221
 	To compile this driver as a module, choose M here: the module
 	will be called hid-mcp2221.ko.
 
+config HID_USI
+	tristate "USI (Universal Stylus Interface) support"
+	help
+	Provides USI support over I2C HID interface.
+
 endmenu
 
 endif # HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index e29efcb1c040..86bafd2b147e 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -124,6 +124,7 @@ hid-uclogic-objs		:= hid-uclogic-core.o \
 				   hid-uclogic-params.o
 obj-$(CONFIG_HID_UCLOGIC)	+= hid-uclogic.o
 obj-$(CONFIG_HID_UDRAW_PS3)	+= hid-udraw-ps3.o
+obj-$(CONFIG_HID_USI)		+= hid-usi.o
 obj-$(CONFIG_HID_LED)		+= hid-led.o
 obj-$(CONFIG_HID_XINMO)		+= hid-xinmo.o
 obj-$(CONFIG_HID_ZEROPLUS)	+= hid-zpff.o
diff --git a/drivers/hid/hid-usi.c b/drivers/hid/hid-usi.c
new file mode 100644
index 000000000000..4674e6993f6e
--- /dev/null
+++ b/drivers/hid/hid-usi.c
@@ -0,0 +1,774 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for USI (Universal Stylus Interface)
+ *
+ *  Copyright (C) 2021, Intel Corporation
+ *  Authors: Tero Kristo <tero.kristo@linux.intel.com>
+ *	     Mika Westerberg <mika.westerberg@linux.intel.com>
+ *	     Rajmohan Mani <rajmohan.mani@intel.com>
+ */
+
+#include <linux/module.h>
+#include <linux/sysfs.h>
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/input.h>
+#include <linux/leds.h>
+#include <linux/workqueue.h>
+
+#include "hid-ids.h"
+
+#define USI_HAS_PENS		0
+#define USI_PENS_CONFIGURED	1
+
+enum {
+	USI_PEN_FLAGS = 0,
+	USI_PEN_ID,
+	USI_PEN_COLOR,
+	USI_PEN_LINE_WIDTH,
+	USI_PEN_LINE_STYLE,
+	USI_NUM_ATTRS
+};
+
+enum {
+	USI_QUIRK_STYLE_MAX_VAL = 0,
+	USI_QUIRK_QUERY_DATA,
+};
+
+#define USI_MAX_PENS	10
+#define MSC_PEN_FIRST	MSC_PEN_ID
+#define MSC_PEN_LAST	MSC_PEN_LINE_STYLE
+
+struct usi_pen {
+	int index;
+	int values[MSC_PEN_LAST - MSC_PEN_FIRST + 1];
+};
+
+struct usi_drvdata {
+	struct hid_report *features[USI_NUM_ATTRS];
+	struct hid_field *inputs[USI_NUM_ATTRS];
+	unsigned long quirks;
+	unsigned long timeout;
+	u8 in_range_bit;
+	u8 tip_switch_bit;
+	int min_pen;
+	int max_pen;
+	unsigned long flags;
+	struct usi_pen *pens;
+	unsigned long sync_point;
+	size_t npens;
+	struct input_dev *idev;
+	struct hid_device *hdev;
+	struct usi_pen *current_pen;
+	unsigned long query_pending;
+	unsigned long update_pending;
+	unsigned long query_running;
+	bool need_flush;
+	struct delayed_work work;
+	u8 saved_data[USI_NUM_ATTRS];
+	spinlock_t lock; /* private data lock */
+};
+
+static bool _has_quirk(struct usi_drvdata *usi, int quirk)
+{
+	if (test_bit(quirk, &usi->quirks))
+		return true;
+
+	return false;
+}
+
+static int __map_usage(struct hid_usage *usage, struct hid_field *field,
+		       u8 *bit)
+{
+	if (usage->hid == HID_DG_TRANSDUCER_INDEX)
+		return USI_PEN_ID;
+
+	if (usage->hid == HID_DG_INRANGE ||
+	    usage->hid == HID_DG_TIPSWITCH) {
+		*bit = usage->usage_index;
+		return USI_PEN_FLAGS;
+	}
+
+	if (usage->hid == HID_DG_PEN_COLOR)
+		return USI_PEN_COLOR;
+
+	if (usage->hid == HID_DG_PEN_LINE_WIDTH)
+		return USI_PEN_LINE_WIDTH;
+
+	if (field->logical == HID_DG_PEN_LINE_STYLE &&
+	    usage->hid >= HID_DG_PEN_LINE_STYLE_IS_LOCKED &&
+	    usage->hid <= HID_DG_PEN_LINE_STYLE_NO_PREFERENCE)
+		return USI_PEN_LINE_STYLE;
+
+	return -EINVAL;
+}
+
+static inline int __usi_to_msc_id(int id)
+{
+	if (id < USI_PEN_ID || id > USI_PEN_LINE_STYLE)
+		return -EINVAL;
+
+	return id - USI_PEN_ID + MSC_PEN_ID;
+}
+
+static inline int __msc_to_usi_id(unsigned int code)
+{
+	if (code < MSC_PEN_ID || code > MSC_PEN_LINE_STYLE)
+		return -EINVAL;
+
+	return code - MSC_PEN_ID + USI_PEN_ID;
+}
+
+static inline int __usi_pen_get_value(const struct usi_pen *pen,
+				      unsigned int code)
+{
+	if (!pen)
+		return -ENODEV;
+
+	return pen->values[code - MSC_PEN_FIRST];
+}
+
+static inline void __usi_pen_set_value(struct usi_pen *pen,
+				       unsigned int code, int value)
+{
+	if (!pen)
+		return;
+
+	pen->values[code - MSC_PEN_FIRST] = value;
+}
+
+static struct usi_pen *usi_find_pen(struct usi_drvdata *usi, int index)
+{
+	int i;
+
+	for (i = 0; i < usi->npens; i++) {
+		if (usi->pens[i].index == index)
+			return &usi->pens[i];
+	}
+
+	return NULL;
+}
+
+static bool _in_range(struct usi_drvdata *usi, unsigned long flags)
+{
+	return !!(test_bit(usi->in_range_bit, &flags));
+}
+
+static bool _is_touching(struct usi_drvdata *usi, unsigned long flags)
+{
+	return !!(test_bit(usi->tip_switch_bit, &flags));
+}
+
+static struct usi_pen *_usi_select_pen(struct usi_drvdata *usi, int index,
+				       bool in_range)
+{
+	struct usi_pen *pen, *found;
+	int i;
+
+	/* If not in range, forget current pen, and report to input-layer */
+	if (!in_range) {
+		usi->current_pen = NULL;
+		usi->update_pending = 0;
+		usi->query_pending = 0;
+		usi->query_running = 0;
+		input_event(usi->idev, EV_MSC, MSC_PEN_ID, 0);
+		input_sync(usi->idev);
+		return NULL;
+	}
+
+	pen = usi->current_pen;
+	if (pen && pen->index == index)
+		return pen;
+
+	found = usi_find_pen(usi, index);
+	if (!found) {
+		/* Pick next available pen */
+		for (i = 0; i < usi->npens; i++) {
+			pen = &usi->pens[i];
+
+			if (pen->index == -1) {
+				pen->index = index;
+
+				__usi_pen_set_value(pen, MSC_PEN_ID, index);
+				__usi_pen_set_value(pen, MSC_PEN_LINE_STYLE, 1);
+
+				hid_dbg(usi->hdev, "pen %u allocated\n",
+					index);
+
+				found = pen;
+
+				break;
+			}
+		}
+	}
+
+	if (!found)
+		return ERR_PTR(-ENOMEM);
+
+	usi->sync_point = jiffies;
+	usi->current_pen = found;
+
+	input_event(usi->idev, EV_MSC, MSC_PEN_ID, found->index);
+
+	if (_has_quirk(usi, USI_QUIRK_QUERY_DATA)) {
+		for (i = USI_PEN_COLOR; i <= USI_PEN_LINE_STYLE; i++)
+			set_bit(i, &usi->query_pending);
+		cancel_delayed_work_sync(&usi->work);
+		schedule_delayed_work(&usi->work, 0);
+	} else {
+		// HW reads the pen automatically
+		for (i = USI_PEN_COLOR; i <= USI_PEN_LINE_STYLE; i++)
+			set_bit(i, &usi->query_running);
+	}
+
+	return found;
+}
+
+/**
+ * __usi_input_event - Parse input event passed from input layer
+ * @usi: USI handle
+ * @code: input event code
+ * @value: input event value
+ *
+ * Parses input event passed from input layer. This is used to detect
+ * any writes to the USI driver from userspace and to program hardware
+ * to the new value. No return value.
+ */
+static void __usi_input_event(struct usi_drvdata *usi, unsigned int code,
+			      int value)
+{
+	struct usi_pen *pen = usi->current_pen;
+	int cached;
+	unsigned long flags;
+
+	hid_dbg(usi->hdev, "input-event: pen=%d, code=%x, value=%d, cached=%d, update-pending=%lx\n",
+		pen ? pen->index : -1, code, value,
+		pen ? __usi_pen_get_value(pen, code) : -1,
+		usi->update_pending);
+
+	if (code < MSC_PEN_COLOR || code > MSC_PEN_LINE_STYLE)
+		return;
+
+	if (!pen)
+		return;
+
+	if (test_bit(__msc_to_usi_id(code), &usi->update_pending))
+		return;
+
+	/*
+	 * Check if we get a value that is different than what is in cache,
+	 * in this case userspace has written a new value.
+	 */
+	cached = __usi_pen_get_value(pen, code);
+	if (cached == value)
+		return;
+
+	/*
+	 * New value received, kick off the work for actually re-programming HW
+	 */
+	spin_lock_irqsave(&usi->lock, flags);
+	set_bit(__msc_to_usi_id(code), &usi->update_pending);
+	spin_unlock_irqrestore(&usi->lock, flags);
+
+	__usi_pen_set_value(pen, code, value);
+
+	if (!delayed_work_pending(&usi->work)) {
+		long delay = usi->timeout - (jiffies - usi->sync_point);
+
+		if (delay < 0)
+			delay = 0;
+
+		schedule_delayed_work(&usi->work, delay);
+	}
+}
+
+static int _usi_input_event(struct input_dev *input, unsigned int type,
+			    unsigned int code, int value)
+{
+	struct hid_device *dev = input_get_drvdata(input);
+	struct usi_drvdata *usi = hid_get_drvdata(dev);
+
+	if (value < 0)
+		return 0;
+
+	if (type == EV_MSC) {
+		switch (code) {
+		case MSC_PEN_COLOR:
+		case MSC_PEN_LINE_WIDTH:
+		case MSC_PEN_LINE_STYLE:
+			__usi_input_event(usi, code, value);
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int _usi_input_open(struct input_dev *input)
+{
+	struct hid_device *hdev = input_get_drvdata(input);
+	struct usi_drvdata *usi = hid_get_drvdata(hdev);
+
+	/*
+	 * When a new input handle is opened, we must flush the current
+	 * pen attributes, otherwise client will not know current values.
+	 */
+	usi->need_flush = true;
+
+	return hid_hw_open(hdev);
+}
+
+/**
+ * usi_input_mapping - Parse input mappings passed from HID core
+ * @hdev: HID device
+ * @hi: HID input
+ * @field: HID field
+ * @usage: HID usage
+ * @bit: HID usage bitmap (output)
+ * @max: max usage (output)
+ *
+ * Parse input mappings and apply USI specific tweaks.
+ * Always returns 0 for success.
+ */
+static int usi_input_mapping(struct hid_device *hdev,
+			     struct hid_input *hi, struct hid_field *field,
+			     struct hid_usage *usage, unsigned long **bit,
+			     int *max)
+{
+	struct usi_drvdata *usi = hid_get_drvdata(hdev);
+	int usi_id;
+	u8 bit_idx;
+
+	hid_dbg(hdev, "input-field[%d] usage=%x[%d], phys=%x, log=%x, app=%x\n",
+		field->index, usage->hid, usage->usage_index, field->physical,
+		field->logical, field->application);
+
+	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_DIGITIZER ||
+	    field->application != HID_DG_PEN ||
+	    field->physical != HID_DG_STYLUS)
+		return 0;
+
+	/*
+	 * Pen line style report appears to contain strange encoding
+	 * which confuses HID core. Fix this by forcing it to be
+	 * a variable.
+	 */
+	if (field->logical == HID_DG_PEN_LINE_STYLE)
+		field->flags |= HID_MAIN_ITEM_VARIABLE;
+
+	/*
+	 * Save the field for any USI inputs, needed for parsing
+	 * raw events.
+	 */
+	usi_id = __map_usage(usage, field, &bit_idx);
+	if (usi_id < 0)
+		return 0;
+
+	hid_dbg(usi->hdev, "usi-id %d mapped to offset %d\n",
+		usi_id, field->report_offset);
+
+	usi->inputs[usi_id] = field;
+
+	if (usi_id == USI_PEN_FLAGS) {
+		if (usage->hid == HID_DG_INRANGE)
+			usi->in_range_bit = bit_idx;
+		if (usage->hid == HID_DG_TIPSWITCH)
+			usi->tip_switch_bit = bit_idx;
+	}
+
+	return 0;
+}
+
+/**
+ * usi_raw_event - Parse raw USI events
+ * @hdev: HID device
+ * @report: report being parsed
+ * @data: raw data being parsed
+ * @size: size of the data
+ *
+ * Parses raw events passed directly from HID low level drivers. Used to
+ * select the current pen, and also updates the cached pen variables
+ * to the data if these differ from the ones coming from HW. This is done
+ * because HW reports incorrect values when coming to contact with screen.
+ * Returns 0 in success, negative error value with failure.
+ */
+static int usi_raw_event(struct hid_device *hdev,
+			 struct hid_report *report, u8 *data, int size)
+{
+	struct usi_drvdata *usi = hid_get_drvdata(hdev);
+	struct usi_pen *pen;
+	int i, index;
+	unsigned long flags;
+	u8 *ptr;
+	bool check_work = false;
+	struct hid_field *config;
+	bool touching;
+
+	if (report->application != HID_DG_PEN)
+		return 0;
+
+	hid_dbg(usi->hdev, "%s: qp:%lx, qr:%lx, up:%lx, data=%*ph\n",
+		__func__, usi->query_pending, usi->query_running,
+		usi->update_pending, size, data);
+
+	/* Get pen index */
+	index = data[usi->inputs[USI_PEN_ID]->report_offset / 8 + 1];
+	flags = data[usi->inputs[USI_PEN_FLAGS]->report_offset / 8 + 1];
+
+	pen = _usi_select_pen(usi, index, _in_range(usi, flags));
+	if (!pen)
+		return -ENOENT;
+
+	touching = _is_touching(usi, flags);
+
+	for (i = USI_PEN_COLOR; i < USI_NUM_ATTRS; i++) {
+		int cached = __usi_pen_get_value(pen, __usi_to_msc_id(i));
+		bool changed = false;
+
+		config = usi->inputs[i];
+		ptr = &data[config->report_offset / 8 + 1];
+
+		if (usi->saved_data[i] != *ptr)
+			changed = true;
+
+		hid_dbg(usi->hdev, "%s: i=%d, saved=%x, val=%x, cached=%x, changed=%d\n",
+			__func__, i,
+			usi->saved_data[i],
+			*ptr, cached, changed);
+
+		usi->saved_data[i] = *ptr;
+
+		/*
+		 * Limit logical values to min/max. Pen style has strange
+		 * mapping that goes outside ranges.
+		 */
+		if (*ptr < config->logical_minimum)
+			*ptr = config->logical_minimum;
+
+		if (*ptr > config->logical_maximum)
+			*ptr = config->logical_maximum;
+
+		if (!touching && !_has_quirk(usi, USI_QUIRK_QUERY_DATA)) {
+			usi->sync_point = jiffies;
+			spin_lock_irqsave(&usi->lock, flags);
+			set_bit(i, &usi->query_running);
+			spin_unlock_irqrestore(&usi->lock, flags);
+		}
+
+		if (test_bit(i, &usi->query_running)) {
+			if (changed ||
+			    time_after(jiffies, usi->sync_point +
+				       usi->timeout)) {
+				if (!test_bit(i, &usi->update_pending)) {
+					__usi_pen_set_value(pen,
+							    __usi_to_msc_id(i),
+							    *ptr);
+					cached = *ptr;
+					spin_lock_irqsave(&usi->lock, flags);
+					clear_bit(i, &usi->query_running);
+					spin_unlock_irqrestore(&usi->lock,
+							       flags);
+				}
+
+				check_work = true;
+			}
+		}
+
+		/* Ignore any unexpected data changes */
+		*ptr = cached;
+
+		if (usi->need_flush) {
+			input_event(usi->idev, EV_MSC, __usi_to_msc_id(i), -1);
+			input_event(usi->idev, EV_MSC, __usi_to_msc_id(i),
+				    cached);
+		}
+	}
+
+	usi->need_flush = false;
+
+	if (check_work) {
+		if (usi->update_pending || usi->query_pending) {
+			cancel_delayed_work_sync(&usi->work);
+			schedule_delayed_work(&usi->work, 0);
+		}
+	}
+
+	return 0;
+}
+
+static void _apply_quirks(struct usi_drvdata *usi, struct hid_device *hdev)
+{
+	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
+	    hdev->product == 0xe00) {
+		set_bit(USI_QUIRK_STYLE_MAX_VAL, &usi->quirks);
+		set_bit(USI_QUIRK_QUERY_DATA, &usi->quirks);
+		usi->timeout = msecs_to_jiffies(75);
+	} else {
+		usi->timeout = msecs_to_jiffies(100);
+	}
+}
+
+static int usi_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+	struct usi_drvdata *usi;
+
+	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+
+	usi = devm_kzalloc(&hdev->dev, sizeof(*usi), GFP_KERNEL);
+	if (!usi)
+		return -ENOMEM;
+
+	usi->hdev = hdev;
+
+	hid_set_drvdata(hdev, usi);
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret)
+		goto err;
+
+	_apply_quirks(usi, hdev);
+
+	return 0;
+
+err:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static void usi_remove(struct hid_device *hdev)
+{
+	hid_hw_stop(hdev);
+}
+
+/**
+ * usi_getset_feature - Read/write USI feature from LL drivers
+ * @usi: USI handle
+ * @code: field to access
+ * @value: value to write (ignored for reads)
+ * @write: true if write access
+ *
+ * Sends a HID HW request to low level drivers to read/write a USI
+ * feature value. Returns 0 on success, negative error value in failure.
+ */
+static int usi_getset_feature(struct usi_drvdata *usi,
+			      unsigned int code, int value, bool write)
+{
+	struct hid_device *hdev = usi->hdev;
+	struct hid_report *report;
+	struct usi_pen *pen = usi->current_pen;
+	size_t len;
+	u8 *buf;
+	int ret;
+
+	hid_dbg(usi->hdev, "%s: pen=%d, code=%x, value=%d, op=%s\n",
+		__func__, pen ? pen->index : 0, code, value,
+		write ? "wr" : "rd");
+
+	if (!pen)
+		return -ENODEV;
+
+	if (code >= USI_NUM_ATTRS)
+		return -ENODEV;
+
+	report = usi->features[code];
+	if (!report)
+		return -EOPNOTSUPP;
+
+	buf = hid_alloc_report_buf(report, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	len = hid_report_len(report);
+	memset(buf, 0, len);
+
+	if (_has_quirk(usi, USI_QUIRK_STYLE_MAX_VAL))
+		if (code == USI_PEN_LINE_STYLE)
+			if (value >= report->field[1]->logical_maximum)
+				value = 255;
+
+	buf[0] = report->id;
+	buf[1] = pen->index;
+	if (write)
+		buf[2] = value;
+
+	ret = hid_hw_raw_request(hdev, buf[0], buf, len, HID_FEATURE_REPORT,
+				 write ? HID_REQ_SET_REPORT :
+				 HID_REQ_GET_REPORT);
+
+	kfree(buf);
+
+	return ret < 0 ? ret : 0;
+}
+
+/**
+ * usi_feature_mapping - map any HID reported features for USI
+ * @hdev: HID device
+ * @field: HID field
+ * @usage: HID usage info
+ *
+ * Does any USI specific tweaks to the HID core reported features,
+ * and stores required fields for later use. No return value.
+ */
+static void usi_feature_mapping(struct hid_device *hdev,
+				struct hid_field *field,
+				struct hid_usage *usage)
+{
+	struct usi_drvdata *usi = hid_get_drvdata(hdev);
+	int usi_id;
+	u8 bit;
+
+	/* Re-map vendor specific usage fields to digitizer */
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_MSVENDOR) {
+		usage->hid &= HID_USAGE;
+		usage->hid |= HID_UP_DIGITIZER;
+		field->logical &= HID_USAGE;
+		field->logical |= HID_UP_DIGITIZER;
+	}
+
+	if (usage->hid == HID_DG_TRANSDUCER_INDEX) {
+		if (!test_bit(USI_HAS_PENS, &usi->flags)) {
+			/*
+			 * Transducer index reports us the amount of pens
+			 * supported by HW, store this for later use.
+			 */
+			set_bit(USI_HAS_PENS, &usi->flags);
+			usi->min_pen = field->logical_minimum;
+			usi->max_pen = field->logical_maximum;
+		}
+	} else {
+		usi_id = __map_usage(usage, field, &bit);
+		/*
+		 * For any USI specific usage, store the report for later
+		 * use; needed for read/write access to the feature over
+		 * HID LL drivers
+		 */
+		if (usi_id >= 0)
+			usi->features[usi_id] = field->report;
+	}
+}
+
+/**
+ * usi_work - work function for the USI driver
+ * @work: handle to the work
+ *
+ * Parses any pending USI low level operations and executes one of them.
+ * If there are more pending, the work is re-scheduled to execute again
+ * later. USI driver must execute these from a work, as some of the
+ * control flows entering USI driver are run in interrupt context.
+ * No return value.
+ */
+static void usi_work(struct work_struct *work)
+{
+	struct usi_drvdata *usi =
+		container_of(work, struct usi_drvdata, work.work);
+	int code;
+	bool running = false;
+	unsigned long flags;
+
+	hid_dbg(usi->hdev, "work: update=%lx, query=%lx\n",
+		usi->update_pending, usi->query_pending);
+
+	if (!usi->current_pen)
+		return;
+
+	/* Update first pending value */
+	code = find_first_bit(&usi->update_pending, USI_NUM_ATTRS);
+	if (code < USI_NUM_ATTRS) {
+		usi_getset_feature(usi, code,
+				   __usi_pen_get_value(usi->current_pen,
+						       __usi_to_msc_id(code)),
+				   true);
+		spin_lock_irqsave(&usi->lock, flags);
+		clear_bit(code, &usi->update_pending);
+		clear_bit(code, &usi->query_running);
+		spin_unlock_irqrestore(&usi->lock, flags);
+		running = true;
+	}
+
+	/*
+	 * Query first pending value. Only execute if we didn't have any
+	 * updates pending.
+	 */
+	code = find_first_bit(&usi->query_pending, USI_NUM_ATTRS);
+	if (!running && code < USI_NUM_ATTRS) {
+		usi_getset_feature(usi, code, 0, false);
+		spin_lock_irqsave(&usi->lock, flags);
+		clear_bit(code, &usi->query_pending);
+		set_bit(code, &usi->query_running);
+		spin_unlock_irqrestore(&usi->lock, flags);
+		running = true;
+	}
+
+	if (running) {
+		usi->sync_point = jiffies;
+		schedule_delayed_work(&usi->work, usi->timeout);
+	}
+}
+
+static int usi_allocate_pens(struct usi_drvdata *usi,
+			     struct hid_input *hidinput)
+{
+	size_t max_pens = usi->max_pen - usi->min_pen + 1;
+	int i;
+
+	INIT_DELAYED_WORK(&usi->work, usi_work);
+	spin_lock_init(&usi->lock);
+	usi->idev = hidinput->input;
+	usi->npens = min_t(size_t, max_pens, USI_MAX_PENS);
+	usi->pens = devm_kcalloc(&usi->hdev->dev, usi->npens,
+				 sizeof(*usi->pens), GFP_KERNEL);
+	if (!usi->pens)
+		return -ENOMEM;
+
+	for (i = 0; i < usi->npens; i++) {
+		__usi_pen_set_value(&usi->pens[i], MSC_PEN_ID, -1);
+		usi->pens[i].index = -1;
+	}
+
+	usi->idev->event = _usi_input_event;
+	usi->idev->open = _usi_input_open;
+	hid_dbg(usi->hdev, "allocated %zd pens\n", usi->npens);
+
+	return 0;
+}
+
+static int usi_input_configured(struct hid_device *hdev,
+				struct hid_input *hidinput)
+{
+	struct usi_drvdata *usi = hid_get_drvdata(hdev);
+
+	if (test_bit(USI_HAS_PENS, &usi->flags) &&
+	    !test_bit(USI_PENS_CONFIGURED, &usi->flags) &&
+	    hidinput->application == HID_DG_PEN) {
+		set_bit(USI_PENS_CONFIGURED, &usi->flags);
+		return usi_allocate_pens(usi, hidinput);
+	}
+
+	return 0;
+}
+
+static const struct hid_device_id usi_devices[] = {
+	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_USI, HID_ANY_ID, HID_ANY_ID) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(hid, usi_devices);
+
+static struct hid_driver usi_driver = {
+	.name = "usi",
+	.id_table = usi_devices,
+	.input_configured = usi_input_configured,
+	.input_mapping = usi_input_mapping,
+	.probe = usi_probe,
+	.remove = usi_remove,
+	.raw_event = usi_raw_event,
+	.feature_mapping = usi_feature_mapping,
+};
+module_hid_driver(usi_driver);
+
+MODULE_LICENSE("GPL");
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 000fd3cf06ce..05822873b39b 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -257,6 +257,13 @@ struct hid_item {
 #define HID_DG_PEN_COLOR	0x000d005c
 #define HID_DG_PEN_LINE_WIDTH	0x000d005e
 #define HID_DG_PEN_LINE_STYLE	0x000d0070
+#define HID_DG_PEN_LINE_STYLE_IS_LOCKED		0x000d0071
+#define HID_DG_PEN_LINE_STYLE_INK		0x000d0072
+#define HID_DG_PEN_LINE_STYLE_PENCIL		0x000d0073
+#define HID_DG_PEN_LINE_STYLE_HIGHLIGHTER	0x000d0074
+#define HID_DG_PEN_LINE_STYLE_CHISEL_MARKER	0x000d0075
+#define HID_DG_PEN_LINE_STYLE_BRUSH		0x000d0076
+#define HID_DG_PEN_LINE_STYLE_NO_PREFERENCE	0x000d0077
 
 #define HID_CP_CONSUMERCONTROL	0x000c0001
 #define HID_CP_NUMERICKEYPAD	0x000c0002
-- 
2.25.1

