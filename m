Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0DE7A502C
	for <lists+linux-input@lfdr.de>; Mon, 18 Sep 2023 19:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbjIRRA4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Sep 2023 13:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbjIRRAn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Sep 2023 13:00:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92273C05;
        Mon, 18 Sep 2023 09:35:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EBCC433CB;
        Mon, 18 Sep 2023 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695054943;
        bh=uBg0YwMFSNtf20J3F2FF6kMJ6k/t9J1KNWcs8W4I5o8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uZqcUn6fqIsV6acXBorvM40I2y5nOoXsq0RstNC6b8rLOvTTmZBRCxdxrRneA4nug
         qrySrpUfmmF0o6+yQs/rPDHvLErLg/yNAry1Q8UpU1sOb0YaGkQEelADBYf5GuvC6V
         owQBZb1B6n2e+zYUOuQw3dr6vbhJcUrXwnKmUg1cvYY6660cKT187dlK7gCqUNaWrE
         QrPMrjhZ4vAtMq0hgRrITikTir9iJzq3mi+uQpIGmjypRgaGU2wudVl5ONVPO5Kp2z
         7rGviHjMrbrKG/2/4WBFUJmyEcf4B2wExJbq+n9DzUinmta3N2gUGzz4e/KhfW8Me3
         ijL9OWQIs94Sg==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan+linaro@kernel.org>)
        id 1qiHE2-0002xw-2i;
        Mon, 18 Sep 2023 18:35:54 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH RESEND] HID: i2c-hid: fix handling of unpopulated devices
Date:   Mon, 18 Sep 2023 18:35:35 +0200
Message-ID: <20230918163535.11388-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <CAD=FV=Wfwvp-SbGrdO5VJcjG42njkApJPB7wnY-YYa1_-O0JWQ@mail.gmail.com>
References: <CAD=FV=Wfwvp-SbGrdO5VJcjG42njkApJPB7wnY-YYa1_-O0JWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A recent commit reordered probe so that the interrupt line is now
requested before making sure that the device exists.

This breaks machines like the Lenovo ThinkPad X13s which rely on the
HID driver to probe second-source devices and only register the variant
that is actually populated. Specifically, the interrupt line may now
already be (temporarily) claimed when doing asynchronous probing of the
touchpad:

	genirq: Flags mismatch irq 191. 00082008 (hid-over-i2c) vs. 00082008 (hid-over-i2c)
	i2c_hid_of 21-0015: Could not register for hid-over-i2c interrupt, irq = 191, ret = -16
	i2c_hid_of: probe of 21-0015 failed with error -16

Fix this by restoring the old behaviour of first making sure the device
exists before requesting the interrupt line.

Note that something like this should probably be implemented also for
"panel followers", whose actual probe is currently effectively deferred
until the DRM panel is probed (e.g. by powering down the device after
making sure it exists and only then register it as a follower).

Fixes: 675cd877c952 ("HID: i2c-hid: Rearrange probe() to power things up later")
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

This one still hasn't shown up in lore so resending as a reply to Doug's
reply for completeness.

Johan


 drivers/hid/i2c-hid/i2c-hid-core.c | 142 ++++++++++++++++-------------
 1 file changed, 80 insertions(+), 62 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 9601c0605fd9..e66c058a4b00 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -998,45 +998,29 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
 	return hid_driver_reset_resume(hid);
 }
 
-/**
- * __do_i2c_hid_core_initial_power_up() - First time power up of the i2c-hid device.
- * @ihid: The ihid object created during probe.
- *
- * This function is called at probe time.
- *
- * The initial power on is where we do some basic validation that the device
- * exists, where we fetch the HID descriptor, and where we create the actual
- * HID devices.
- *
- * Return: 0 or error code.
+/*
+ * Check that the device exists and parse the HID descriptor.
  */
-static int __do_i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
+static int __i2c_hid_core_probe(struct i2c_hid *ihid)
 {
 	struct i2c_client *client = ihid->client;
 	struct hid_device *hid = ihid->hid;
 	int ret;
 
-	ret = i2c_hid_core_power_up(ihid);
-	if (ret)
-		return ret;
-
 	/* Make sure there is something at this address */
 	ret = i2c_smbus_read_byte(client);
 	if (ret < 0) {
 		i2c_hid_dbg(ihid, "nothing at this address: %d\n", ret);
-		ret = -ENXIO;
-		goto err;
+		return -ENXIO;
 	}
 
 	ret = i2c_hid_fetch_hid_descriptor(ihid);
 	if (ret < 0) {
 		dev_err(&client->dev,
 			"Failed to fetch the HID Descriptor\n");
-		goto err;
+		return ret;
 	}
 
-	enable_irq(client->irq);
-
 	hid->version = le16_to_cpu(ihid->hdesc.bcdVersion);
 	hid->vendor = le16_to_cpu(ihid->hdesc.wVendorID);
 	hid->product = le16_to_cpu(ihid->hdesc.wProductID);
@@ -1050,17 +1034,49 @@ static int __do_i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
 
 	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
 
+	return 0;
+}
+
+static int i2c_hid_core_register_hid(struct i2c_hid *ihid)
+{
+	struct i2c_client *client = ihid->client;
+	struct hid_device *hid = ihid->hid;
+	int ret;
+
+	enable_irq(client->irq);
+
 	ret = hid_add_device(hid);
 	if (ret) {
 		if (ret != -ENODEV)
 			hid_err(client, "can't add hid device: %d\n", ret);
-		goto err;
+		disable_irq(client->irq);
+		return ret;
 	}
 
 	return 0;
+}
+
+static int i2c_hid_core_probe_panel_follower(struct i2c_hid *ihid)
+{
+	int ret;
 
-err:
+	ret = i2c_hid_core_power_up(ihid);
+	if (ret)
+		return ret;
+
+	ret = __i2c_hid_core_probe(ihid);
+	if (ret)
+		goto err_power_down;
+
+	ret = i2c_hid_core_register_hid(ihid);
+	if (ret)
+		goto err_power_down;
+
+	return 0;
+
+err_power_down:
 	i2c_hid_core_power_down(ihid);
+
 	return ret;
 }
 
@@ -1077,7 +1093,7 @@ static void ihid_core_panel_prepare_work(struct work_struct *work)
 	 * steps.
 	 */
 	if (!hid->version)
-		ret = __do_i2c_hid_core_initial_power_up(ihid);
+		ret = i2c_hid_core_probe_panel_follower(ihid);
 	else
 		ret = i2c_hid_core_resume(ihid);
 
@@ -1156,30 +1172,6 @@ static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
 	return 0;
 }
 
-static int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
-{
-	/*
-	 * If we're a panel follower, we'll register and do our initial power
-	 * up when the panel turns on; otherwise we do it right away.
-	 */
-	if (drm_is_panel_follower(&ihid->client->dev))
-		return i2c_hid_core_register_panel_follower(ihid);
-	else
-		return __do_i2c_hid_core_initial_power_up(ihid);
-}
-
-static void i2c_hid_core_final_power_down(struct i2c_hid *ihid)
-{
-	/*
-	 * If we're a follower, the act of unfollowing will cause us to be
-	 * powered down. Otherwise we need to manually do it.
-	 */
-	if (ihid->is_panel_follower)
-		drm_panel_remove_follower(&ihid->panel_follower);
-	else
-		i2c_hid_core_suspend(ihid, true);
-}
-
 int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 		       u16 hid_descriptor_address, u32 quirks)
 {
@@ -1224,14 +1216,10 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 		return ret;
 	device_enable_async_suspend(&client->dev);
 
-	ret = i2c_hid_init_irq(client);
-	if (ret < 0)
-		goto err_buffers_allocated;
-
 	hid = hid_allocate_device();
 	if (IS_ERR(hid)) {
 		ret = PTR_ERR(hid);
-		goto err_irq;
+		goto err_free_buffers;
 	}
 
 	ihid->hid = hid;
@@ -1242,19 +1230,42 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	hid->bus = BUS_I2C;
 	hid->initial_quirks = quirks;
 
-	ret = i2c_hid_core_initial_power_up(ihid);
+	/* Power on and probe unless device is a panel follower. */
+	if (!drm_is_panel_follower(&ihid->client->dev)) {
+		ret = i2c_hid_core_power_up(ihid);
+		if (ret < 0)
+			goto err_destroy_device;
+
+		ret = __i2c_hid_core_probe(ihid);
+		if (ret < 0)
+			goto err_power_down;
+	}
+
+	ret = i2c_hid_init_irq(client);
+	if (ret < 0)
+		goto err_power_down;
+
+	/*
+	 * If we're a panel follower, we'll register when the panel turns on;
+	 * otherwise we do it right away.
+	 */
+	if (drm_is_panel_follower(&ihid->client->dev))
+		ret = i2c_hid_core_register_panel_follower(ihid);
+	else
+		ret = i2c_hid_core_register_hid(ihid);
 	if (ret)
-		goto err_mem_free;
+		goto err_free_irq;
 
 	return 0;
 
-err_mem_free:
-	hid_destroy_device(hid);
-
-err_irq:
+err_free_irq:
 	free_irq(client->irq, ihid);
-
-err_buffers_allocated:
+err_power_down:
+	if (!drm_is_panel_follower(&ihid->client->dev))
+		i2c_hid_core_power_down(ihid);
+err_destroy_device:
+	hid_destroy_device(hid);
+err_free_buffers:
 	i2c_hid_free_buffers(ihid);
 
 	return ret;
@@ -1266,7 +1277,14 @@ void i2c_hid_core_remove(struct i2c_client *client)
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid;
 
-	i2c_hid_core_final_power_down(ihid);
+	/*
+	 * If we're a follower, the act of unfollowing will cause us to be
+	 * powered down. Otherwise we need to manually do it.
+	 */
+	if (ihid->is_panel_follower)
+		drm_panel_remove_follower(&ihid->panel_follower);
+	else
+		i2c_hid_core_suspend(ihid, true);
 
 	hid = ihid->hid;
 	hid_destroy_device(hid);
-- 
2.41.0

