Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905E033064C
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 04:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbhCHDSq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Mar 2021 22:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233754AbhCHDS1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Mar 2021 22:18:27 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9491C06174A;
        Sun,  7 Mar 2021 19:18:15 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id o38so5529921pgm.9;
        Sun, 07 Mar 2021 19:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FKoFqiGHcYvMiBx+jvcCcZ0vzeos9icvY01lVMQurYg=;
        b=p6jk0mO7+oyu0Yg5VbipIbhf9jHCW5QwoLapOa2LIzygeyHBsu4wePGEylI3biONRr
         ijYt9WsAYrO7GXZfo9tSWLNwKc3gQZI8fa0/057trKPhpGPJZL+1nizd6dpfYfMih4wq
         +muqCD62RRPMVCNu2oe4mHE+sB0siLQqguwCnJqmUMlf1BsKTrAw7OH50InkJSIyEIbp
         vLmkwcC9svsTqqgWXuerUL87E5fbwBPKsIx1DgFUjHciyx2jUQfUtSHyO2KLiW3wL8Dv
         s+3GmS3c93bKTP4437aIafsGGOOQmEwaHamxGMy6rMP/JE5RBf0p76KAzMi69n0+PPEE
         1CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FKoFqiGHcYvMiBx+jvcCcZ0vzeos9icvY01lVMQurYg=;
        b=I7Mf+hD+xkN/AVQFTzbw2GubrWZqevKHCe4EyLSEU61kC0LgZsfC6+0yEcoqQRm1I2
         OASwjG4WQ2x9fkfpg4Tg4cLPvb0kj/x9axaIugblb7T7pQk2fSeAi8/o8ZTxI6jqb0Er
         x+Kv68qfd0T5ZFmC2JYFC+AMQPCStSBxSMNxEJHEilwQTEaFxgXejt3OmN7VUR3uvAzE
         CQdoR/wJaL7SMdPlkX/YtJ2lQkP8rk4NXsMbLTcaSY8vZeoA3XZVR2E2Hnu+vyPPhj07
         vGgD2yYkqRZ2UgRnJcHNGvJI/JK87wHWGYi1wlhlWir/gsPVgnbkrjzHStvT06Vwbf4A
         tsUw==
X-Gm-Message-State: AOAM533Vy+oJ8NyVbtYQcJPzs9r2nvV9Ye399GMSc04RcRBUdwpNAE35
        cyShGYQw8YYWBqDqQH8sVHtfOngJHLY=
X-Google-Smtp-Source: ABdhPJw7RMKc3hw+tV+zQyLEbpLRRHaPhpRyN8vEfoeZimPsjIoaDubDycRI6xmcDc07fgKCqFMb/w==
X-Received: by 2002:a05:6a00:168d:b029:1ba:d500:1209 with SMTP id k13-20020a056a00168db02901bad5001209mr19390446pfc.4.1615173493608;
        Sun, 07 Mar 2021 19:18:13 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bc9b:5ab2:d763:15bc])
        by smtp.gmail.com with ESMTPSA id g8sm8906887pfu.13.2021.03.07.19.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 19:18:12 -0800 (PST)
Date:   Sun, 7 Mar 2021 19:18:09 -0800
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     jingle <jingle.wu@emc.com.tw>
Cc:     'linux-kernel' <linux-kernel@vger.kernel.org>,
        'linux-input' <linux-input@vger.kernel.org>,
        'phoenix' <phoenix@emc.com.tw>,
        "'dave.wang'" <dave.wang@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new dev ices
Message-ID: <YEWXcV62YpxbBp9P@google.com>
References: <20210226073537.4926-1-jingle.wu@emc.com.tw>
 <YDx8M4Rhdi8hW4EO@google.com>
 <1614647097.9201.jingle.wu@emc.com.tw>
 <YEGBeWHRfL4gN9pX@google.com>
 <004f01d7115e$3ba005e0$b2e011a0$@emc.com.tw>
 <YEGJ7z479pqyBW1w@google.com>
 <005401d71161$ef9b20e0$ced162a0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <005401d71161$ef9b20e0$ced162a0$@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Fri, Mar 05, 2021 at 09:50:35AM +0800, jingle wrote:
> HI Dmitry:
> 
> 1. You mean to let all devices ignore skipping reset/sleep part of device
> initialization?
> 2. The test team found that some old firmware will have errors (invalid
> report etc...), so ELAN can only ensure that the new device can meet the
> newer parts.

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
 drivers/input/mouse/elan_i2c_core.c |   58 +++++++++++++++++++++++++++++------
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
 
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
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
 static int elan_get_fwinfo(u16 ic_type, u8 iap_version, u16 *validpage_count,
 			   u32 *signature_address, u16 *page_size)
 {
@@ -258,16 +291,18 @@ static int elan_check_ASUS_special_fw(struct elan_tp_data *data)
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
-		dev_err(&client->dev, "device initialize failed: %d\n", error);
-		return error;
+	if (!skip_reset) {
+		error = data->ops->initialize(client);
+		if (error) {
+			dev_err(&client->dev, "device initialize failed: %d\n", error);
+			return error;
+		}
 	}
 
 	error = elan_query_product(data);
@@ -311,16 +346,17 @@ static int __elan_initialize(struct elan_tp_data *data)
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
 
@@ -357,6 +393,8 @@ static int elan_query_device_info(struct elan_tp_data *data)
 	if (error)
 		return error;
 
+	data->quirks = elan_i2c_lookup_quirks(data->ic_type, data->product_id);
+
 	error = elan_get_fwinfo(data->ic_type, data->iap_version,
 				&data->fw_validpage_count,
 				&data->fw_signature_address,
@@ -546,7 +584,7 @@ static int elan_update_firmware(struct elan_tp_data *data,
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
 
@@ -1384,7 +1422,7 @@ static int __maybe_unused elan_resume(struct device *dev)
 		goto err;
 	}
 
-	error = elan_initialize(data);
+	error = elan_initialize(data, data->quirks & ETP_QUIRK_QUICK_WAKEUP);
 	if (error)
 		dev_err(dev, "initialize when resuming failed: %d\n", error);
 

