Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1763309CC
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 09:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhCHI4k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 03:56:40 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:36509 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCHI4a (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 03:56:30 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="39695779"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 08 Mar 2021 16:56:17 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(9037:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Mon, 08 Mar 2021 16:56:15 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2472:3:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Mon, 08 Mar 2021 16:56:14 +0800 (CST)
From:   "jingle" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     "'linux-kernel'" <linux-kernel@vger.kernel.org>,
        "'linux-input'" <linux-input@vger.kernel.org>,
        "'phoenix'" <phoenix@emc.com.tw>,
        "'dave.wang'" <dave.wang@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>
References: <20210226073537.4926-1-jingle.wu@emc.com.tw> <YDx8M4Rhdi8hW4EO@google.com> <1614647097.9201.jingle.wu@emc.com.tw> <YEGBeWHRfL4gN9pX@google.com> <004f01d7115e$3ba005e0$b2e011a0$@emc.com.tw> <YEGJ7z479pqyBW1w@google.com> <005401d71161$ef9b20e0$ced162a0$@emc.com.tw> <YEWXcV62YpxbBp9P@google.com>
In-Reply-To: <YEWXcV62YpxbBp9P@google.com>
Subject: RE: [PATCH] Input: elan_i2c - Reduce the resume time for new dev ices
Date:   Mon, 8 Mar 2021 16:56:14 +0800
Message-ID: <005d01d713f8$e4b715a0$ae2540e0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQGs01cKeSW+WSlGkCw6sJc3Mb/pawH5MxoQAdwxvXACK2QSBAIRtt8MAkDeqHgCB6X1vAJFybuVqllCnIA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0yMjRmZmM4OS03ZmVjLTExZWItOGUwZi1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcMjI0ZmZjOGItN2ZlYy0xMWViLThlMGYtZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSI2OTMwIiB0PSIxMzI1OTY2NzM3Mzk3NjQ4NDEiIGg9IjJySndkL0J5eUNSOTIyQlc3TlcrVngrVDRWcz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry:

1. missing "i<" 
+	u32 quirks = 0;
+	int i;
+
+	for (i = 0; ARRAY_SIZE(elan_i2c_quirks); i++) {

-> for (i = 0; i<ARRAY_SIZE(elan_i2c_quirks); i++) {

2. elan_resume () funtion are different with at Chromeos driver.
@@ -1384,7 +1422,7 @@ static int __maybe_unused elan_resume(struct device
*dev)
 		goto err;
 	}
 
-	error = elan_initialize(data);
+	error = elan_initialize(data, data->quirks &
ETP_QUIRK_QUICK_WAKEUP);
 	if (error)
 		dev_err(dev, "initialize when resuming failed: %d\n",
error);

-> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/ref
-> s/heads/chromeos-5.4/drivers/input/mouse/elan_i2c_core.c#1434
-> error = elan_initialize(data);  this code is in elan_reactivate()
function at Chromeos driver.
-> Will this change affect cherrypick from linux kernel to chromeos?

THANKS
JINGLE

-----Original Message-----
From: 'Dmitry Torokhov' [mailto:dmitry.torokhov@gmail.com] 
Sent: Monday, March 08, 2021 11:18 AM
To: jingle
Cc: 'linux-kernel'; 'linux-input'; 'phoenix'; 'dave.wang'; 'josh.chen'
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new dev
ices

Hi Jingle,

On Fri, Mar 05, 2021 at 09:50:35AM +0800, jingle wrote:
> HI Dmitry:
> 
> 1. You mean to let all devices ignore skipping reset/sleep part of 
> device initialization?
> 2. The test team found that some old firmware will have errors 
> (invalid report etc...), so ELAN can only ensure that the new device 
> can meet the newer parts.

I see. OK, fair enough.

I would prefer if we were more explicit about when we skip resetting the
device, what do you think about the version of your patch below?

Thanks.

--
Dmitry


Input: elan_i2c - reduce the resume time for new devices

From: Jingle Wu <jingle.wu@emc.com.tw>

Newer controllers, such as Voxel, Delbin, Magple, Bobba and others, do not
need to be reset after issuing power-on command, and skipping reset saves
at least 100ms from resume time.

Note that if first attempt of re-initializing device fails we will not be
skipping reset on the subsequent ones.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
Link: https://lore.kernel.org/r/20210226073537.4926-1-jingle.wu@emc.com.tw
Patchwork-Id: 12105967
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/elan_i2c.h      |    5 +++
 drivers/input/mouse/elan_i2c_core.c |   58
+++++++++++++++++++++++++++++------
 2 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index e12da5b024b0..838b3b346316 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -55,6 +55,11 @@
 #define ETP_FW_PAGE_SIZE_512	512
 #define ETP_FW_SIGNATURE_SIZE	6
 
+#define ETP_PRODUCT_ID_DELBIN	0x00C2
+#define ETP_PRODUCT_ID_VOXEL	0x00BF
+#define ETP_PRODUCT_ID_MAGPIE	0x0120
+#define ETP_PRODUCT_ID_BOBBA	0x0121
+
 struct i2c_client;
 struct completion;
 
diff --git a/drivers/input/mouse/elan_i2c_core.c
b/drivers/input/mouse/elan_i2c_core.c
index bef73822315d..51a65f6bf1e3 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -46,6 +46,9 @@
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
 
+/* quirks to control the device */
+#define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
+
 /* The main device structure */
 struct elan_tp_data {
 	struct i2c_client	*client;
@@ -90,8 +93,38 @@ struct elan_tp_data {
 	bool			baseline_ready;
 	u8			clickpad;
 	bool			middle_button;
+
+	u32			quirks;		/* Various quirks */
 };
 
+static u32 elan_i2c_lookup_quirks(u16 ic_type, u16 product_id)
+{
+	static const struct {
+		u16 ic_type;
+		u16 product_id;
+		u32 quirks;
+	} elan_i2c_quirks[] = {
+		{ 0x0D, ETP_PRODUCT_ID_DELBIN, ETP_QUIRK_QUICK_WAKEUP },
+		{ 0x10, ETP_PRODUCT_ID_VOXEL, ETP_QUIRK_QUICK_WAKEUP },
+		{ 0x14, ETP_PRODUCT_ID_MAGPIE, ETP_QUIRK_QUICK_WAKEUP },
+		{ 0x14, ETP_PRODUCT_ID_BOBBA, ETP_QUIRK_QUICK_WAKEUP },
+	};
+	u32 quirks = 0;
+	int i;
+
+	for (i = 0; ARRAY_SIZE(elan_i2c_quirks); i++) {
+		if (elan_i2c_quirks[i].ic_type == ic_type &&
+		    elan_i2c_quirks[i].product_id == product_id) {
+			quirks = elan_i2c_quirks[i].quirks;
+		}
+	}
+
+	if (ic_type >= 0x0D && product_id >= 0x123)
+		quirks |= ETP_QUIRK_QUICK_WAKEUP;
+
+	return quirks;
+}
+
 static int elan_get_fwinfo(u16 ic_type, u8 iap_version, u16
*validpage_count,
 			   u32 *signature_address, u16 *page_size)
 {
@@ -258,16 +291,18 @@ static int elan_check_ASUS_special_fw(struct
elan_tp_data *data)
 	return false;
 }
 
-static int __elan_initialize(struct elan_tp_data *data)
+static int __elan_initialize(struct elan_tp_data *data, bool skip_reset)
 {
 	struct i2c_client *client = data->client;
 	bool woken_up = false;
 	int error;
 
-	error = data->ops->initialize(client);
-	if (error) {
-		dev_err(&client->dev, "device initialize failed: %d\n",
error);
-		return error;
+	if (!skip_reset) {
+		error = data->ops->initialize(client);
+		if (error) {
+			dev_err(&client->dev, "device initialize failed:
%d\n", error);
+			return error;
+		}
 	}
 
 	error = elan_query_product(data);
@@ -311,16 +346,17 @@ static int __elan_initialize(struct elan_tp_data
*data)
 	return 0;
 }
 
-static int elan_initialize(struct elan_tp_data *data)
+static int elan_initialize(struct elan_tp_data *data, bool skip_reset)
 {
 	int repeat = ETP_RETRY_COUNT;
 	int error;
 
 	do {
-		error = __elan_initialize(data);
+		error = __elan_initialize(data, skip_reset);
 		if (!error)
 			return 0;
 
+		skip_reset = false;
 		msleep(30);
 	} while (--repeat > 0);
 
@@ -357,6 +393,8 @@ static int elan_query_device_info(struct elan_tp_data
*data)
 	if (error)
 		return error;
 
+	data->quirks = elan_i2c_lookup_quirks(data->ic_type,
data->product_id);
+
 	error = elan_get_fwinfo(data->ic_type, data->iap_version,
 				&data->fw_validpage_count,
 				&data->fw_signature_address,
@@ -546,7 +584,7 @@ static int elan_update_firmware(struct elan_tp_data
*data,
 		data->ops->iap_reset(client);
 	} else {
 		/* Reinitialize TP after fw is updated */
-		elan_initialize(data);
+		elan_initialize(data, false);
 		elan_query_device_info(data);
 	}
 
@@ -1247,7 +1285,7 @@ static int elan_probe(struct i2c_client *client,
 	}
 
 	/* Initialize the touchpad. */
-	error = elan_initialize(data);
+	error = elan_initialize(data, false);
 	if (error)
 		return error;
 
@@ -1384,7 +1422,7 @@ static int __maybe_unused elan_resume(struct device
*dev)
 		goto err;
 	}
 
-	error = elan_initialize(data);
+	error = elan_initialize(data, data->quirks &
ETP_QUIRK_QUICK_WAKEUP);
 	if (error)
 		dev_err(dev, "initialize when resuming failed: %d\n",
error);
 

