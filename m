Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4B468AA71
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 14:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjBDN7Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Feb 2023 08:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbjBDN7P (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Feb 2023 08:59:15 -0500
X-Greylist: delayed 1506 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 04 Feb 2023 05:59:14 PST
Received: from smtpq4.tb.mail.iss.as9143.net (smtpq4.tb.mail.iss.as9143.net [212.54.42.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141DD6A75
        for <linux-input@vger.kernel.org>; Sat,  4 Feb 2023 05:59:13 -0800 (PST)
Received: from [212.54.42.106] (helo=smtp2.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <dick@mrns.nl>)
        id 1pOIfR-0007Oy-Eo
        for linux-input@vger.kernel.org; Sat, 04 Feb 2023 14:33:21 +0100
Received: from routi.mrns.nl ([213.93.239.227])
        by smtp2.tb.mail.iss.as9143.net with ESMTPA
        id OIfPpJ8cUD6f4OIfQpWYvQ; Sat, 04 Feb 2023 14:33:21 +0100
X-Env-Mailfrom: dick@mrns.nl
X-Env-Rcptto: linux-input@vger.kernel.org
X-SourceIP: 213.93.239.227
X-CNFS-Analysis: v=2.4 cv=U5hUT8nu c=1 sm=1 tr=0 ts=63de5ea1 cx=a_exe
 a=JHrq6bmmrihZf+Bww3MhDg==:117 a=JHrq6bmmrihZf+Bww3MhDg==:17
 a=m04uMKEZRckA:10 a=NEAV23lmAAAA:8 a=f67E9ZWsdK3KuOE8IYgA:9 a=CjuIK1q_8ugA:10
 a=VlZU0XKO32wA:10 a=oxU5Xt4QAAAA:8 a=URH0Hc5xpFxPGZQFdQAA:9
 a=jKdzr7yA372qb7_9lzlF:22
X-Authenticated-Sender: boeierlaan60@ziggo.nl
Received: by routi.mrns.nl (sSMTP sendmail emulation); Sat, 04 Feb 2023 14:33:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mrns.nl;
 i=@mrns.nl; q=dns/txt; s=mail; t=1675517599; h=date : from : to :
 subject : message-id : mime-version : content-type : from;
 bh=BvQGlIMTnE0Le3Vt/jnQMZYU91ipgocPI80Hx8buvYw=;
 b=LDsC5cLvfGpC277Sa84WuLQRx7V93eXnFEkaktVBQiBDv07K4HckrXENacGzCNetGIhyh
 fcqmGBiwi29MccGwJlcBC37ArawHAKlahUcOhbIiin3dDjecZ2j21uEWz0K5hJbfEiqJBxw
 OXhracjcBH9ZiQAZ4RwQ9eBZUnhj7MU=
Date:   Sat, 4 Feb 2023 14:33:19 +0100
From:   Dick Marinus <dick@mrns.nl>
To:     linux-input@vger.kernel.org
Subject: [PATCH] Use HID descriptor for razer devices
Message-ID: <Y95en/0j7C2Z0oaZ@routi.mrns.nl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ypllSzNrja7j64F+"
Content-Disposition: inline
X-CMAE-Envelope: MS4xfJA8qG6sDQffaeN5lFjSgJwsntNPb+iWn1VSkSwGp+QRlWoSh99TlSyYTaDaksgzt3I9iwKZvOhsNo0P2KRkrM6Sl2ECWsU6aM0SqlF9vR6B2WPDqXTt
 rf9HbUyRgoMa+t0PX6HuNDUcqxd41q91pRFl/yX0WgYMjJA7jFsC+izkzMPyvpqDf/rRh1tV/3231g==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ypllSzNrja7j64F+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hid-razer currently makes some guesses which device should be used to
send control messages and the size of it.

This patch derives this information from the HID descriptors, the
Windows Drivers from Razer also do this.

The crc in the blackwidow_init packet is now calculated (copied from
openrazer GPL code).

--

This is some groundwork to support more Razer devices and features.

I don't own a Razer Black Widow keyboard and used an emulator to test
this module:

https://github.com/meeuw/razer-emulator

Any feedback on this patch is appreciated, I'd also like to ask someone
to test this with real hardware.

This patch is based on v6.1.8, please let me know if I should rebase.

--ypllSzNrja7j64F+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-Use-HID-descriptor-for-razer-devices.patch"

From 68ac13b153698413118c255ff9c3abc3175f6bf3 Mon Sep 17 00:00:00 2001
From: Dick Marinus <dick@mrns.nl>
Date: Sat, 4 Feb 2023 14:14:53 +0100
Subject: [PATCH] Use HID descriptor for razer devices

hid-razer currently makes some guesses which device should be used to
send control messages and the size of it.

This patch derives this information from the HID descriptors, the
Windows Drivers from Razer also do this.

The crc in the blackwidow_init packet is now calculated (copied from
openrazer GPL code).

Signed-off-by: Dick Marinus <dick@mrns.nl>
---
 drivers/hid/hid-razer.c | 134 ++++++++++++++++++++++++++++++----------
 drivers/hid/hid-razer.h |   6 ++
 2 files changed, 107 insertions(+), 33 deletions(-)
 create mode 100644 drivers/hid/hid-razer.h

diff --git a/drivers/hid/hid-razer.c b/drivers/hid/hid-razer.c
index 740df148b..93fef4918 100644
--- a/drivers/hid/hid-razer.c
+++ b/drivers/hid/hid-razer.c
@@ -15,31 +15,15 @@
 #include <linux/wait.h>
 
 #include "hid-ids.h"
+#include "hid-razer.h"
 
 #define map_key_clear(c) hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
 
-#define RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE	91
-
 static bool macro_key_remapping = 1;
 module_param(macro_key_remapping, bool, 0644);
 MODULE_PARM_DESC(macro_key_remapping, " on (Y) off (N)");
 
-
-static unsigned char blackwidow_init[RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE] = {
-	0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04,
-	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x04, 0x00
-};
+static unsigned char set_device_mode[] = {0x00, 0x04, 0x02, 0x00};
 
 static int razer_input_mapping(struct hid_device *hdev,
 		struct hid_input *hi, struct hid_field *field,
@@ -73,35 +57,118 @@ static int razer_input_mapping(struct hid_device *hdev,
 	return 0;
 }
 
+static bool razer_check_control_interface(struct hid_device *hdev)
+{
+	int i;
+	unsigned int hid;
+	struct hid_report *report;
+	struct hid_razer *hid_razer_drvdata;
+
+	hid_razer_drvdata = hid_get_drvdata(hdev);
+
+	list_for_each_entry(report, &hdev->report_enum[HID_FEATURE_REPORT].report_list, list) {
+		for (i = 0; i < report->maxfield; i++) {
+			hid = report->field[i]->usage->hid;
+
+			if ((hid & HID_USAGE_PAGE) == HID_UP_MSVENDOR && (hid & HID_USAGE) == 0x2) {
+				hid_razer_drvdata->report_count = report->field[i]->report_count;
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
+static int razer_control_message(struct hid_device *hdev, unsigned char data_len, unsigned char *data)
+{
+	struct hid_razer *hid_razer_drvdata;
+	unsigned char* full_control_message;
+	unsigned char crc = 0;
+	unsigned int i;
+	unsigned report_count;
+	int ret;
+
+	if (data_len < 2) {
+		ret = -EINVAL;
+		goto cleanup_and_exit;
+	}
+
+	hid_razer_drvdata = hid_get_drvdata(hdev);
+
+	report_count = hid_razer_drvdata->report_count;
+
+	if (report_count < 2) {
+		ret = -EINVAL;
+		goto cleanup_and_exit;
+	}
+
+	printk("%i", report_count);
+	full_control_message = kzalloc(report_count + 1, GFP_KERNEL);
+
+	if (full_control_message == NULL) {
+		ret = -ENOMEM;
+		goto cleanup_and_exit;
+	}
+
+	full_control_message[6] = data_len - 2;
+	memcpy(full_control_message + 7, data, data_len);
+
+	for(i = 2; i < report_count - 2; i++) {
+		crc ^= full_control_message[i];
+	}
+	full_control_message[report_count - 1] = crc;
+
+	ret = hid_hw_raw_request(hdev, 0, full_control_message, report_count + 1, HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+
+	if (ret != report_count + 1) {
+		ret = -EIO;
+		goto cleanup_and_exit;
+	}
+
+cleanup_and_exit:
+	kfree(full_control_message);
+
+	return 0;
+}
+
+
 static int razer_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
-	char *buf;
 	int ret = 0;
+	struct hid_razer *hid_razer_drvdata;
+
+	hid_razer_drvdata = kzalloc(sizeof(struct hid_razer), GFP_KERNEL);
+	if (hid_razer_drvdata == NULL) {
+		return -ENOMEM;
+	}
+	hid_set_drvdata(hdev, hid_razer_drvdata);
 
 	ret = hid_parse(hdev);
+
 	if (ret)
 		return ret;
 
-	/*
-	 * Only send the enable macro keys command for the third device
-	 * identified as mouse input.
-	 */
-	if (hdev->type == HID_TYPE_USBMOUSE) {
-		buf = kmemdup(blackwidow_init, RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE, GFP_KERNEL);
-		if (buf == NULL)
-			return -ENOMEM;
-
-		ret = hid_hw_raw_request(hdev, 0, buf, RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE,
-				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
-		if (ret != RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE)
+	if (razer_check_control_interface(hdev)) {
+		ret = razer_control_message(hdev, sizeof(set_device_mode), set_device_mode);
+		if (ret) {
 			hid_err(hdev, "failed to enable macro keys: %d\n", ret);
-
-		kfree(buf);
+			return ret;
+		}
 	}
 
 	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 }
 
+static void razer_remove(struct hid_device *hdev)
+{
+	struct hid_razer *hid_razer_drvdata;
+
+	hid_razer_drvdata = hid_get_drvdata(hdev);
+
+	kfree(hid_razer_drvdata);
+}
+
 static const struct hid_device_id razer_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER,
 		USB_DEVICE_ID_RAZER_BLACKWIDOW) },
@@ -118,6 +185,7 @@ static struct hid_driver razer_driver = {
 	.id_table = razer_devices,
 	.input_mapping = razer_input_mapping,
 	.probe = razer_probe,
+	.remove = razer_remove,
 };
 module_hid_driver(razer_driver);
 
diff --git a/drivers/hid/hid-razer.h b/drivers/hid/hid-razer.h
new file mode 100644
index 000000000..ef9bb81cb
--- /dev/null
+++ b/drivers/hid/hid-razer.h
@@ -0,0 +1,6 @@
+#ifndef __HID_RAZER_H
+#define __HID_RAZER_H
+struct hid_razer {
+	unsigned report_count;
+};
+#endif
-- 
2.39.1


--ypllSzNrja7j64F+--
