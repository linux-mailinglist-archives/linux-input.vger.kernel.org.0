Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1967876238A
	for <lists+linux-input@lfdr.de>; Tue, 25 Jul 2023 22:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjGYUhb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jul 2023 16:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbjGYUh1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jul 2023 16:37:27 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712582688
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 13:37:10 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-686b91c2744so456382b3a.0
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 13:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690317429; x=1690922229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpzMl+hQ1ZFKADkTA6+giANmnh0KSfYRxfLW5dMWSJw=;
        b=nRURIRJwmt7wFoCuQYM1uZzf9MGtZsG5Bho2gKdWg+wAlJuwE5Vh9eeZWFn86FqOhD
         PaGpjOy3OaPwjjOseSuaywGZBg/VmDc10evbQ4F3D+enyMTScqxyrVNVyJwfZD2iNVRX
         /M7VjtZ+GAq3ABUFSrGtvW8BB92y4ibITyKnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690317429; x=1690922229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpzMl+hQ1ZFKADkTA6+giANmnh0KSfYRxfLW5dMWSJw=;
        b=kq0h4hcNYx7D7YDikDPbwAfe8J5d9ZEOk4oMQ5l0RmVp9apLI3wZzx5pgMiktxAEMr
         7Q24k1skzhZDtabnu7e9OnYxaof+UrerbGHryNRxkHVsGJ1zOOtwmiXTl42lZoCIz/eM
         Yhd230j5abliEGUIvfDL7wOEhb1By5iGCdf2iL5bHdd4WJ85aOZfuniQG89u/7mvlyBD
         vROgZr5ckOeXtuJNTwdGn0XshA+dNya8gwDM9gWTQHdiBJq0+03Hu7X+QJ5q0SrFRDcm
         kRpUjZWZeUBeKi/QUGiRpjHoW+6ehUKaogPNVpP6i6v+Ujb6YxpDe5AmGHMEZUry8UUP
         OzPA==
X-Gm-Message-State: ABy/qLYFbDA1wlpjiLoqof/cgd88hO2pXWCslHUMElkcqm3z73J32h2A
        YP+a/j3s7zlz6jjZxwhcn3ygdQ==
X-Google-Smtp-Source: APBJJlFmEjRKJoMuLY7gsv1K5TkBafrLyOOsaMbf8NUogJ97ehlUnPDGgKd8SRoI7uUdSNv9+0wXjw==
X-Received: by 2002:a17:90a:f988:b0:268:273e:b75d with SMTP id cq8-20020a17090af98800b00268273eb75dmr242482pjb.20.1690317429623;
        Tue, 25 Jul 2023 13:37:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:c363:4681:f5b8:301])
        by smtp.gmail.com with ESMTPSA id bg1-20020a17090b0d8100b002676e961261sm1396951pjb.1.2023.07.25.13.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 13:37:08 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, hsinyi@google.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        yangcong5@huaqin.corp-partner.google.com,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 06/10] HID: i2c-hid: Rearrange probe() to power things up later
Date:   Tue, 25 Jul 2023 13:34:41 -0700
Message-ID: <20230725133443.v3.6.Ifcc9b0a44895d164788966f9b9511fe094ca8cf9@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230725203545.2260506-1-dianders@chromium.org>
References: <20230725203545.2260506-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In a future patch, we want to change i2c-hid not to necessarily power
up the touchscreen during probe. In preparation for that, rearrange
the probe function so that we put as much stuff _before_ powering up
the device as possible.

This change is expected to have no functional effect.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- i2c_hid_core_initial_power_up() is now static.

 drivers/hid/i2c-hid/i2c-hid-core.c | 124 ++++++++++++++++++-----------
 1 file changed, 77 insertions(+), 47 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 19d985c20a5c..d29e6421ecba 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -855,7 +855,8 @@ static int i2c_hid_init_irq(struct i2c_client *client)
 		irqflags = IRQF_TRIGGER_LOW;
 
 	ret = request_threaded_irq(client->irq, NULL, i2c_hid_irq,
-				   irqflags | IRQF_ONESHOT, client->name, ihid);
+				   irqflags | IRQF_ONESHOT | IRQF_NO_AUTOEN,
+				   client->name, ihid);
 	if (ret < 0) {
 		dev_warn(&client->dev,
 			"Could not register for %s interrupt, irq = %d,"
@@ -940,6 +941,72 @@ static void i2c_hid_core_shutdown_tail(struct i2c_hid *ihid)
 	ihid->ops->shutdown_tail(ihid->ops);
 }
 
+/**
+ * i2c_hid_core_initial_power_up() - First time power up of the i2c-hid device.
+ * @ihid: The ihid object created during probe.
+ *
+ * This function is called at probe time.
+ *
+ * The initial power on is where we do some basic validation that the device
+ * exists, where we fetch the HID descriptor, and where we create the actual
+ * HID devices.
+ *
+ * Return: 0 or error code.
+ */
+static int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
+{
+	struct i2c_client *client = ihid->client;
+	struct hid_device *hid = ihid->hid;
+	int ret;
+
+	ret = i2c_hid_core_power_up(ihid);
+	if (ret)
+		return ret;
+
+	/* Make sure there is something at this address */
+	ret = i2c_smbus_read_byte(client);
+	if (ret < 0) {
+		i2c_hid_dbg(ihid, "nothing at this address: %d\n", ret);
+		ret = -ENXIO;
+		goto err;
+	}
+
+	ret = i2c_hid_fetch_hid_descriptor(ihid);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to fetch the HID Descriptor\n");
+		goto err;
+	}
+
+	enable_irq(client->irq);
+
+	hid->version = le16_to_cpu(ihid->hdesc.bcdVersion);
+	hid->vendor = le16_to_cpu(ihid->hdesc.wVendorID);
+	hid->product = le16_to_cpu(ihid->hdesc.wProductID);
+
+	hid->initial_quirks |= i2c_hid_get_dmi_quirks(hid->vendor,
+						      hid->product);
+
+	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X",
+		 client->name, (u16)hid->vendor, (u16)hid->product);
+	strscpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
+
+	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
+
+	ret = hid_add_device(hid);
+	if (ret) {
+		if (ret != -ENODEV)
+			hid_err(client, "can't add hid device: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	i2c_hid_core_power_down(ihid);
+	return ret;
+}
+
 int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 		       u16 hid_descriptor_address, u32 quirks)
 {
@@ -966,16 +1033,10 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	if (!ihid)
 		return -ENOMEM;
 
-	ihid->ops = ops;
-
-	ret = i2c_hid_core_power_up(ihid);
-	if (ret)
-		return ret;
-
 	i2c_set_clientdata(client, ihid);
 
+	ihid->ops = ops;
 	ihid->client = client;
-
 	ihid->wHIDDescRegister = cpu_to_le16(hid_descriptor_address);
 
 	init_waitqueue_head(&ihid->wait);
@@ -986,28 +1047,12 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	 * real computation later. */
 	ret = i2c_hid_alloc_buffers(ihid, HID_MIN_BUFFER_SIZE);
 	if (ret < 0)
-		goto err_powered;
-
+		return ret;
 	device_enable_async_suspend(&client->dev);
 
-	/* Make sure there is something at this address */
-	ret = i2c_smbus_read_byte(client);
-	if (ret < 0) {
-		i2c_hid_dbg(ihid, "nothing at this address: %d\n", ret);
-		ret = -ENXIO;
-		goto err_powered;
-	}
-
-	ret = i2c_hid_fetch_hid_descriptor(ihid);
-	if (ret < 0) {
-		dev_err(&client->dev,
-			"Failed to fetch the HID Descriptor\n");
-		goto err_powered;
-	}
-
 	ret = i2c_hid_init_irq(client);
 	if (ret < 0)
-		goto err_powered;
+		goto err_buffers_allocated;
 
 	hid = hid_allocate_device();
 	if (IS_ERR(hid)) {
@@ -1021,26 +1066,11 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	hid->ll_driver = &i2c_hid_ll_driver;
 	hid->dev.parent = &client->dev;
 	hid->bus = BUS_I2C;
-	hid->version = le16_to_cpu(ihid->hdesc.bcdVersion);
-	hid->vendor = le16_to_cpu(ihid->hdesc.wVendorID);
-	hid->product = le16_to_cpu(ihid->hdesc.wProductID);
-
 	hid->initial_quirks = quirks;
-	hid->initial_quirks |= i2c_hid_get_dmi_quirks(hid->vendor,
-						      hid->product);
-
-	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X",
-		 client->name, (u16)hid->vendor, (u16)hid->product);
-	strscpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
-
-	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
 
-	ret = hid_add_device(hid);
-	if (ret) {
-		if (ret != -ENODEV)
-			hid_err(client, "can't add hid device: %d\n", ret);
+	ret = i2c_hid_core_initial_power_up(ihid);
+	if (ret)
 		goto err_mem_free;
-	}
 
 	return 0;
 
@@ -1050,9 +1080,9 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 err_irq:
 	free_irq(client->irq, ihid);
 
-err_powered:
-	i2c_hid_core_power_down(ihid);
+err_buffers_allocated:
 	i2c_hid_free_buffers(ihid);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i2c_hid_core_probe);
@@ -1062,6 +1092,8 @@ void i2c_hid_core_remove(struct i2c_client *client)
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid;
 
+	i2c_hid_core_power_down(ihid);
+
 	hid = ihid->hid;
 	hid_destroy_device(hid);
 
@@ -1069,8 +1101,6 @@ void i2c_hid_core_remove(struct i2c_client *client)
 
 	if (ihid->bufsize)
 		i2c_hid_free_buffers(ihid);
-
-	i2c_hid_core_power_down(ihid);
 }
 EXPORT_SYMBOL_GPL(i2c_hid_core_remove);
 
-- 
2.41.0.487.g6d72f3e995-goog

