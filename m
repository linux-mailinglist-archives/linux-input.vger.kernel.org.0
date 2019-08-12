Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3DE18A335
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 18:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfHLQXi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 12:23:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36340 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfHLQXh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 12:23:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C0FF7C04510D;
        Mon, 12 Aug 2019 16:23:36 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-117-165.ams2.redhat.com [10.36.117.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6C94784F4;
        Mon, 12 Aug 2019 16:23:35 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Matthias Fend <Matthias.Fend@wolfvision.net>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 2/2] HID: multitouch: add support for the Smart Tech panel
Date:   Mon, 12 Aug 2019 18:23:26 +0200
Message-Id: <20190812162326.14253-3-benjamin.tissoires@redhat.com>
In-Reply-To: <20190812162326.14253-1-benjamin.tissoires@redhat.com>
References: <20190812162326.14253-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 12 Aug 2019 16:23:36 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This panel is not very friendly to us:
it exposes multiple multitouch collections, some of them being of
logical application stylus.

Usually, a device has only one report per application, and that is
what I assumed in commit 8dfe14b3b47f ("HID: multitouch: ditch mt_report_id")

To avoid breaking all working device, add a new class and a new quirk
for that situation.

Reported-and-tested-by: Matthias Fend <Matthias.Fend@wolfvision.net>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-multitouch.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 0d190d93ca7c..3cfeb1629f79 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -68,6 +68,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_STICKY_FINGERS		BIT(16)
 #define MT_QUIRK_ASUS_CUSTOM_UP		BIT(17)
 #define MT_QUIRK_WIN8_PTP_BUTTONS	BIT(18)
+#define MT_QUIRK_SEPARATE_APP_REPORT	BIT(19)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -103,6 +104,7 @@ struct mt_usages {
 struct mt_application {
 	struct list_head list;
 	unsigned int application;
+	unsigned int report_id;
 	struct list_head mt_usages;	/* mt usages list */
 
 	__s32 quirks;
@@ -203,6 +205,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_VTL				0x0110
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
+#define MT_CLS_SMART_TECH			0x0113
 
 #define MT_DEFAULT_MAXCONTACT	10
 #define MT_MAX_MAXCONTACT	250
@@ -354,6 +357,12 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_WIN8_PTP_BUTTONS,
 	},
+	{ .name = MT_CLS_SMART_TECH,
+		.quirks = MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_IGNORE_DUPLICATES |
+			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_SEPARATE_APP_REPORT,
+	},
 	{ }
 };
 
@@ -510,8 +519,9 @@ static struct mt_usages *mt_allocate_usage(struct hid_device *hdev,
 }
 
 static struct mt_application *mt_allocate_application(struct mt_device *td,
-						      unsigned int application)
+						      struct hid_report *report)
 {
+	unsigned int application = report->application;
 	struct mt_application *mt_application;
 
 	mt_application = devm_kzalloc(&td->hdev->dev, sizeof(*mt_application),
@@ -536,6 +546,7 @@ static struct mt_application *mt_allocate_application(struct mt_device *td,
 	mt_application->scantime = DEFAULT_ZERO;
 	mt_application->raw_cc = DEFAULT_ZERO;
 	mt_application->quirks = td->mtclass.quirks;
+	mt_application->report_id = report->id;
 
 	list_add_tail(&mt_application->list, &td->applications);
 
@@ -543,19 +554,23 @@ static struct mt_application *mt_allocate_application(struct mt_device *td,
 }
 
 static struct mt_application *mt_find_application(struct mt_device *td,
-						  unsigned int application)
+						  struct hid_report *report)
 {
+	unsigned int application = report->application;
 	struct mt_application *tmp, *mt_application = NULL;
 
 	list_for_each_entry(tmp, &td->applications, list) {
 		if (application == tmp->application) {
-			mt_application = tmp;
-			break;
+			if (!(td->mtclass.quirks & MT_QUIRK_SEPARATE_APP_REPORT) ||
+			    tmp->report_id == report->id) {
+				mt_application = tmp;
+				break;
+			}
 		}
 	}
 
 	if (!mt_application)
-		mt_application = mt_allocate_application(td, application);
+		mt_application = mt_allocate_application(td, report);
 
 	return mt_application;
 }
@@ -572,7 +587,7 @@ static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 		return NULL;
 
 	rdata->report = report;
-	rdata->application = mt_find_application(td, report->application);
+	rdata->application = mt_find_application(td, report);
 
 	if (!rdata->application) {
 		devm_kfree(&td->hdev->dev, rdata);
@@ -1562,6 +1577,9 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	case HID_VD_ASUS_CUSTOM_MEDIA_KEYS:
 		suffix = "Custom Media Keys";
 		break;
+	case HID_DG_PEN:
+		suffix = "Stylus";
+		break;
 	default:
 		suffix = "UNKNOWN";
 		break;
@@ -2023,6 +2041,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_SYNAPTICS, 0x8323) },
 
+	/* Smart Tech panels */
+	{ .driver_data = MT_CLS_SMART_TECH,
+		MT_USB_DEVICE(0x0b8c, 0x0092)},
+
 	/* Stantum panels */
 	{ .driver_data = MT_CLS_CONFIDENCE,
 		MT_USB_DEVICE(USB_VENDOR_ID_STANTUM_STM,
-- 
2.19.2

