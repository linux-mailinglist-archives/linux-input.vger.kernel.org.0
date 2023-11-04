Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 548D07E0EFB
	for <lists+linux-input@lfdr.de>; Sat,  4 Nov 2023 12:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbjKDLTY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Nov 2023 07:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbjKDLTW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Nov 2023 07:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B07DD4C
        for <linux-input@vger.kernel.org>; Sat,  4 Nov 2023 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699096679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dCVmEEuGjfAF1XTZdx2/tPYjyNhamBr2VQfPb0Ey7xE=;
        b=DDQnZy/PfR50sXYy0BKL/tu4xeegu4IHlRbw/wLFGbziS8qUY62wxvcpYpfrdFsqMslLxG
        +UNgZCx/I0SvFhzxXs/OepRAz+RjrcJRaM8G27wXaAhPHuMVCjY7645Ep8fU/y/q+Akyp3
        ovxo64E7bs9NszC8cl8oA1xOJCouC9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-LbH2XY3hMuWz1qSdAIhn9w-1; Sat, 04 Nov 2023 07:17:56 -0400
X-MC-Unique: LbH2XY3hMuWz1qSdAIhn9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C33580F92B;
        Sat,  4 Nov 2023 11:17:55 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E0816502E;
        Sat,  4 Nov 2023 11:17:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Julian Sax <jsbc@gmx.de>, ahormann@gmx.net,
        Bruno Jesus <bruno.fl.jesus@gmail.com>,
        Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
        Tim Aldridge <taldridge@mac.com>,
        Rene Wagner <redhatbugzilla@callerid.de>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 5/7] HID: i2c-hid: Remove I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirks
Date:   Sat,  4 Nov 2023 12:17:41 +0100
Message-ID: <20231104111743.14668-6-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-1-hdegoede@redhat.com>
References: <20231104111743.14668-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Now that i2c-hid-core waits for the reset after reading the HID report
descriptor, the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirks appear to
no longer be necessary (confirmed on one of the quirked models).

Except on laptops where the HID report descriptor is missing and is
provided by a DMI quirk instead. On these models the HID report descriptor
is not read at all, so moving the wait for reset is a no-op. These laptops
have 0911:5288 touchpads for which I2C_HID_QUIRK_NO_IRQ_AFTER_RESET was
set, keep the existing behavior there.

There might still be devices which really do not ack the reset
at all, so to avoid this causing regressions also:

1. Change the wait for ack timeout from an error into a warning; and
2. Lower reset timeout from the very long 5s to 1s which should be plenty

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 3bd0c3d77d99..df5577fc73c5 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -45,7 +45,6 @@
 
 /* quirks to control the device */
 #define I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV	BIT(0)
-#define I2C_HID_QUIRK_NO_IRQ_AFTER_RESET	BIT(1)
 #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
 #define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
 #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(6)
@@ -122,12 +121,6 @@ static const struct i2c_hid_quirks {
 } i2c_hid_quirks[] = {
 	{ USB_VENDOR_ID_WEIDA, HID_ANY_ID,
 		I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
-	{ I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288,
-		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
-	{ I2C_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_VOYO_WINPAD_A15,
-		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
-	{ I2C_VENDOR_ID_RAYDIUM, I2C_PRODUCT_ID_RAYDIUM_3118,
-		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ USB_VENDOR_ID_ALPS_JP, HID_ANY_ID,
 		 I2C_HID_QUIRK_RESET_ON_RESUME },
 	{ I2C_VENDOR_ID_SYNAPTICS, I2C_PRODUCT_ID_SYNAPTICS_SYNA2393,
@@ -470,11 +463,11 @@ static int i2c_hid_start_hwreset(struct i2c_hid *ihid)
 	return ret;
 }
 
-static int i2c_hid_finish_hwreset(struct i2c_hid *ihid)
+static int i2c_hid_finish_hwreset(struct i2c_hid *ihid, bool no_irq_after_reset)
 {
 	int ret = 0;
 
-	if (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET) {
+	if (no_irq_after_reset) {
 		msleep(100);
 		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 	}
@@ -482,9 +475,9 @@ static int i2c_hid_finish_hwreset(struct i2c_hid *ihid)
 	i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);
 	if (!wait_event_timeout(ihid->wait,
 				!test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
-				msecs_to_jiffies(5000))) {
-		ret = -ENODATA;
-		goto err_clear_reset;
+				msecs_to_jiffies(1000))) {
+		dev_warn(&ihid->client->dev, "device did not ack reset within 1000 ms\n");
+		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 	}
 	i2c_hid_dbg(ihid, "%s: finished.\n", __func__);
 
@@ -494,12 +487,6 @@ static int i2c_hid_finish_hwreset(struct i2c_hid *ihid)
 
 	mutex_unlock(&ihid->reset_lock);
 	return ret;
-
-err_clear_reset:
-	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
-	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
-	mutex_unlock(&ihid->reset_lock);
-	return ret;
 }
 
 static void i2c_hid_abort_hwreset(struct i2c_hid *ihid)
@@ -736,6 +723,7 @@ static int i2c_hid_parse(struct hid_device *hid)
 	struct i2c_client *client = hid->driver_data;
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct i2c_hid_desc *hdesc = &ihid->hdesc;
+	bool no_irq_after_reset = false;
 	unsigned int rsize;
 	char *rdesc;
 	int ret;
@@ -764,6 +752,7 @@ static int i2c_hid_parse(struct hid_device *hid)
 
 	if (use_override) {
 		rdesc = use_override;
+		no_irq_after_reset = true;
 		i2c_hid_dbg(ihid, "Using a HID report descriptor override\n");
 	} else {
 		rdesc = kzalloc(rsize, GFP_KERNEL);
@@ -790,7 +779,7 @@ static int i2c_hid_parse(struct hid_device *hid)
 	 * actually wait for the report-descriptor to be read before signalling
 	 * reset completion.
 	 */
-	ret = i2c_hid_finish_hwreset(ihid);
+	ret = i2c_hid_finish_hwreset(ihid, no_irq_after_reset);
 	if (ret)
 		goto out;
 
@@ -1005,7 +994,7 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
 	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME) {
 		ret = i2c_hid_start_hwreset(ihid);
 		if (ret == 0)
-			ret = i2c_hid_finish_hwreset(ihid);
+			ret = i2c_hid_finish_hwreset(ihid, false);
 	} else {
 		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
 	}
-- 
2.41.0

