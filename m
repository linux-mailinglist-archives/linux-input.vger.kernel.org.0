Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9521445413
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbhKDNkT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:40:19 -0400
Received: from mga12.intel.com ([192.55.52.136]:50283 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231611AbhKDNkH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 09:40:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211755234"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="211755234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:29 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="501542057"
Received: from eyulyugi-mobl1.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.251.215.15])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:27 -0700
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        mika.westerberg@linux.intel.com, tero.kristo@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 7/8] HID: USI: add new input event codes for the pen-set value events
Date:   Thu,  4 Nov 2021 15:37:00 +0200
Message-Id: <20211104133701.1733551-8-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Previously, pen values were set using the same input event codes as were
used for reporting the new values from the core. This lead into some
confusion with both the driver layer and the userspace. To avoid these
issues, allocate new event codes purely for setting the pen
color/width/style.

This patch is a proposal only, and can be omitted if not acceptable, or
if the ioctl solution that is introduced in patch #8 is preferred.

Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
---
 drivers/hid/hid-usi.c                  | 59 ++++++++++++++++----------
 include/linux/mod_devicetable.h        |  2 +-
 include/uapi/linux/input-event-codes.h |  5 ++-
 3 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-usi.c b/drivers/hid/hid-usi.c
index 4674e6993f6e..a465c140d25a 100644
--- a/drivers/hid/hid-usi.c
+++ b/drivers/hid/hid-usi.c
@@ -37,7 +37,7 @@ enum {
 
 #define USI_MAX_PENS	10
 #define MSC_PEN_FIRST	MSC_PEN_ID
-#define MSC_PEN_LAST	MSC_PEN_LINE_STYLE
+#define MSC_PEN_LAST	MSC_PEN_SET_LINE_STYLE
 
 struct usi_pen {
 	int index;
@@ -63,6 +63,7 @@ struct usi_drvdata {
 	unsigned long query_pending;
 	unsigned long update_pending;
 	unsigned long query_running;
+	unsigned long update_running;
 	bool need_flush;
 	struct delayed_work work;
 	u8 saved_data[USI_NUM_ATTRS];
@@ -113,6 +114,9 @@ static inline int __usi_to_msc_id(int id)
 
 static inline int __msc_to_usi_id(unsigned int code)
 {
+	if (code >= MSC_PEN_SET_COLOR && code <= MSC_PEN_SET_LINE_STYLE)
+		return code - MSC_PEN_SET_COLOR + USI_PEN_COLOR;
+
 	if (code < MSC_PEN_ID || code > MSC_PEN_LINE_STYLE)
 		return -EINVAL;
 
@@ -169,6 +173,7 @@ static struct usi_pen *_usi_select_pen(struct usi_drvdata *usi, int index,
 	if (!in_range) {
 		usi->current_pen = NULL;
 		usi->update_pending = 0;
+		usi->update_running = 0;
 		usi->query_pending = 0;
 		usi->query_running = 0;
 		input_event(usi->idev, EV_MSC, MSC_PEN_ID, 0);
@@ -238,7 +243,6 @@ static void __usi_input_event(struct usi_drvdata *usi, unsigned int code,
 			      int value)
 {
 	struct usi_pen *pen = usi->current_pen;
-	int cached;
 	unsigned long flags;
 
 	hid_dbg(usi->hdev, "input-event: pen=%d, code=%x, value=%d, cached=%d, update-pending=%lx\n",
@@ -246,7 +250,7 @@ static void __usi_input_event(struct usi_drvdata *usi, unsigned int code,
 		pen ? __usi_pen_get_value(pen, code) : -1,
 		usi->update_pending);
 
-	if (code < MSC_PEN_COLOR || code > MSC_PEN_LINE_STYLE)
+	if (code < MSC_PEN_SET_COLOR || code > MSC_PEN_SET_LINE_STYLE)
 		return;
 
 	if (!pen)
@@ -255,14 +259,6 @@ static void __usi_input_event(struct usi_drvdata *usi, unsigned int code,
 	if (test_bit(__msc_to_usi_id(code), &usi->update_pending))
 		return;
 
-	/*
-	 * Check if we get a value that is different than what is in cache,
-	 * in this case userspace has written a new value.
-	 */
-	cached = __usi_pen_get_value(pen, code);
-	if (cached == value)
-		return;
-
 	/*
 	 * New value received, kick off the work for actually re-programming HW
 	 */
@@ -291,14 +287,9 @@ static int _usi_input_event(struct input_dev *input, unsigned int type,
 	if (value < 0)
 		return 0;
 
-	if (type == EV_MSC) {
-		switch (code) {
-		case MSC_PEN_COLOR:
-		case MSC_PEN_LINE_WIDTH:
-		case MSC_PEN_LINE_STYLE:
-			__usi_input_event(usi, code, value);
-			break;
-		}
+	if (type == EV_MSC && code >= MSC_PEN_SET_COLOR &&
+	    code <= MSC_PEN_SET_LINE_STYLE) {
+		__usi_input_event(usi, code, value);
 	}
 
 	return 0;
@@ -407,9 +398,9 @@ static int usi_raw_event(struct hid_device *hdev,
 	if (report->application != HID_DG_PEN)
 		return 0;
 
-	hid_dbg(usi->hdev, "%s: qp:%lx, qr:%lx, up:%lx, data=%*ph\n",
+	hid_dbg(usi->hdev, "%s: qp:%lx, qr:%lx, up:%lx, ur:%lx, data=%*ph\n",
 		__func__, usi->query_pending, usi->query_running,
-		usi->update_pending, size, data);
+		usi->update_pending, usi->update_running, size, data);
 
 	/* Get pen index */
 	index = data[usi->inputs[USI_PEN_ID]->report_offset / 8 + 1];
@@ -455,6 +446,23 @@ static int usi_raw_event(struct hid_device *hdev,
 			spin_unlock_irqrestore(&usi->lock, flags);
 		}
 
+		if (test_bit(i, &usi->update_running)) {
+			int new = __usi_pen_get_value(pen, __usi_to_msc_id(i) +
+						      MSC_PEN_SET_COLOR -
+						      MSC_PEN_COLOR);
+			if ((changed && *ptr == new) ||
+			    time_after(jiffies, usi->sync_point +
+				       usi->timeout)) {
+				__usi_pen_set_value(pen,
+						    __usi_to_msc_id(i), new);
+				cached = new;
+				spin_lock_irqsave(&usi->lock, flags);
+				clear_bit(i, &usi->update_running);
+				spin_unlock_irqrestore(&usi->lock, flags);
+				check_work = true;
+			}
+		}
+
 		if (test_bit(i, &usi->query_running)) {
 			if (changed ||
 			    time_after(jiffies, usi->sync_point +
@@ -681,11 +689,14 @@ static void usi_work(struct work_struct *work)
 	if (code < USI_NUM_ATTRS) {
 		usi_getset_feature(usi, code,
 				   __usi_pen_get_value(usi->current_pen,
-						       __usi_to_msc_id(code)),
+						       __usi_to_msc_id(code) +
+						       MSC_PEN_SET_COLOR -
+						       MSC_PEN_COLOR),
 				   true);
 		spin_lock_irqsave(&usi->lock, flags);
 		clear_bit(code, &usi->update_pending);
 		clear_bit(code, &usi->query_running);
+		set_bit(code, &usi->update_running);
 		spin_unlock_irqrestore(&usi->lock, flags);
 		running = true;
 	}
@@ -734,6 +745,10 @@ static int usi_allocate_pens(struct usi_drvdata *usi,
 	usi->idev->open = _usi_input_open;
 	hid_dbg(usi->hdev, "allocated %zd pens\n", usi->npens);
 
+	input_set_capability(usi->idev, EV_MSC, MSC_PEN_SET_COLOR);
+	input_set_capability(usi->idev, EV_MSC, MSC_PEN_SET_LINE_WIDTH);
+	input_set_capability(usi->idev, EV_MSC, MSC_PEN_SET_LINE_STYLE);
+
 	return 0;
 }
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4ff40be7676b..3c719047da81 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -322,7 +322,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_KEY_MAX		0x2ff
 #define INPUT_DEVICE_ID_REL_MAX		0x0f
 #define INPUT_DEVICE_ID_ABS_MAX		0x3f
-#define INPUT_DEVICE_ID_MSC_MAX		0x09
+#define INPUT_DEVICE_ID_MSC_MAX		0x0c
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 98295f71941a..66ac07529eac 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -912,8 +912,11 @@
 #define MSC_PEN_COLOR			0x07
 #define MSC_PEN_LINE_WIDTH		0x08
 #define MSC_PEN_LINE_STYLE		0x09
+#define MSC_PEN_SET_COLOR		0x0a
+#define MSC_PEN_SET_LINE_WIDTH		0x0b
+#define MSC_PEN_SET_LINE_STYLE		0x0c
 /* TODO: Add USI diagnostic & battery events too */
-#define MSC_MAX				0x09
+#define MSC_MAX				0x0c
 #define MSC_CNT				(MSC_MAX + 1)
 
 /*
-- 
2.25.1

