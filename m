Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34A437270E9
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 23:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbjFGVxo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 17:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjFGVx2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 17:53:28 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6F32119
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 14:53:24 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6513e7e5d44so4753568b3a.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jun 2023 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686174803; x=1688766803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ednqd69XAn3oXLgneclhI21DyoCY28g8dUYMulq+Zo=;
        b=gVjgQSnhi/3hx1rlvHyqyVbCd6NI+puUk+72twZOtdP997vwzYC3shHqkIGuVh18GR
         w3q7O4cPal6lAZgclbMwq6RWi7mvY6WGZaF/Kfs3ophNAUekSjnTFS5tG0XUuUtoxouZ
         h27czJwMQH+Vg6Gt+RYm2j1c5SMgy9zIh9HC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686174803; x=1688766803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ednqd69XAn3oXLgneclhI21DyoCY28g8dUYMulq+Zo=;
        b=YxQuJG/Xj6X3Vztyi0ry5HdbBFuIFhvL5w1wNzDgAuW3ms4Ru6WMkFxNNRCJiB7zch
         w8xoGil4yDQZr4uuOxfycewB+cOQDo2G0W3NMJ/uPAVOmSk9dKf5sANNr3I8ZTUM2Miz
         rRVkyi8wAMnnSfOKTObf0rKlQd4oi/EdLPqvNMigBk3ohGjymWatSXuqOlqqJqQxu13i
         q6wtUC+5YUtwv1eLYzeinGt5Od6nWLrEysPPEyqmVayC2UzE7BfIbEOYm8vJcvyzd171
         4Nen5BjeyV2LR+1q/7SOlU2iCz1LpjSCAKy4wjiWbHiVd6VifWBvMO7np46xj6xBio0l
         wIBA==
X-Gm-Message-State: AC+VfDxqr7SdiihAwWIVNF11z9APNHquvcnx0QW7JBIcdm9NRZPYcgpn
        iCINv87jnAZ1xBHOx7FNAA3iQw==
X-Google-Smtp-Source: ACHHUZ7zjtZzGEvv7Wao9sGLZkZCyhRWPhqJ6F72lDey43aW/alK7oYxUSX6FlOCGnI9DN289NJxCA==
X-Received: by 2002:a05:6a00:139d:b0:65e:842:7922 with SMTP id t29-20020a056a00139d00b0065e08427922mr4301906pfg.16.1686174803390;
        Wed, 07 Jun 2023 14:53:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:34b2:b638:6b53:f6c2])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78d19000000b0065dd1e7c2c1sm1376486pfe.63.2023.06.07.14.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 14:53:22 -0700 (PDT)
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
Cc:     dri-devel@lists.freedesktop.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org, hsinyi@google.com,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-arm-msm@vger.kernel.org,
        Chris Morgan <macroalpha82@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 07/10] HID: i2c-hid: Make suspend and resume into helper functions
Date:   Wed,  7 Jun 2023 14:49:29 -0700
Message-ID: <20230607144931.v2.7.I5c9894789b8b02f029bf266ae9b4f43c7907a173@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230607215224.2067679-1-dianders@chromium.org>
References: <20230607215224.2067679-1-dianders@chromium.org>
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

In a future patch we'd like to be able to call the current i2c-hid
suspend and resume functions from times other than system
suspend. Move the functions higher up in the file and have them take a
"struct i2c_hid" to make this simpler. We'll then add tiny wrappers of
the functions for use with system suspend.

This change is expected to have no functional effect.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/hid/i2c-hid/i2c-hid-core.c | 98 +++++++++++++++++-------------
 1 file changed, 56 insertions(+), 42 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index d29e6421ecba..fa8a1ca43d7f 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -941,6 +941,57 @@ static void i2c_hid_core_shutdown_tail(struct i2c_hid *ihid)
 	ihid->ops->shutdown_tail(ihid->ops);
 }
 
+static int i2c_hid_core_suspend(struct i2c_hid *ihid)
+{
+	struct i2c_client *client = ihid->client;
+	struct hid_device *hid = ihid->hid;
+	int ret;
+
+	ret = hid_driver_suspend(hid, PMSG_SUSPEND);
+	if (ret < 0)
+		return ret;
+
+	/* Save some power */
+	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
+
+	disable_irq(client->irq);
+
+	if (!device_may_wakeup(&client->dev))
+		i2c_hid_core_power_down(ihid);
+
+	return 0;
+}
+
+static int i2c_hid_core_resume(struct i2c_hid *ihid)
+{
+	struct i2c_client *client = ihid->client;
+	struct hid_device *hid = ihid->hid;
+	int ret;
+
+	if (!device_may_wakeup(&client->dev))
+		i2c_hid_core_power_up(ihid);
+
+	enable_irq(client->irq);
+
+	/* Instead of resetting device, simply powers the device on. This
+	 * solves "incomplete reports" on Raydium devices 2386:3118 and
+	 * 2386:4B33 and fixes various SIS touchscreens no longer sending
+	 * data after a suspend/resume.
+	 *
+	 * However some ALPS touchpads generate IRQ storm without reset, so
+	 * let's still reset them here.
+	 */
+	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME)
+		ret = i2c_hid_hwreset(ihid);
+	else
+		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
+
+	if (ret)
+		return ret;
+
+	return hid_driver_reset_resume(hid);
+}
+
 /**
  * i2c_hid_core_initial_power_up() - First time power up of the i2c-hid device.
  * @ihid: The ihid object created during probe.
@@ -1115,61 +1166,24 @@ void i2c_hid_core_shutdown(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(i2c_hid_core_shutdown);
 
-static int i2c_hid_core_suspend(struct device *dev)
+static int i2c_hid_core_pm_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
-	struct hid_device *hid = ihid->hid;
-	int ret;
-
-	ret = hid_driver_suspend(hid, PMSG_SUSPEND);
-	if (ret < 0)
-		return ret;
 
-	/* Save some power */
-	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
-
-	disable_irq(client->irq);
-
-	if (!device_may_wakeup(&client->dev))
-		i2c_hid_core_power_down(ihid);
-
-	return 0;
+	return i2c_hid_core_suspend(ihid);
 }
 
-static int i2c_hid_core_resume(struct device *dev)
+static int i2c_hid_core_pm_resume(struct device *dev)
 {
-	int ret;
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
-	struct hid_device *hid = ihid->hid;
 
-	if (!device_may_wakeup(&client->dev))
-		i2c_hid_core_power_up(ihid);
-
-	enable_irq(client->irq);
-
-	/* Instead of resetting device, simply powers the device on. This
-	 * solves "incomplete reports" on Raydium devices 2386:3118 and
-	 * 2386:4B33 and fixes various SIS touchscreens no longer sending
-	 * data after a suspend/resume.
-	 *
-	 * However some ALPS touchpads generate IRQ storm without reset, so
-	 * let's still reset them here.
-	 */
-	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME)
-		ret = i2c_hid_hwreset(ihid);
-	else
-		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
-
-	if (ret)
-		return ret;
-
-	return hid_driver_reset_resume(hid);
+	return i2c_hid_core_resume(ihid);
 }
 
 const struct dev_pm_ops i2c_hid_core_pm = {
-	SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
+	SYSTEM_SLEEP_PM_OPS(i2c_hid_core_pm_suspend, i2c_hid_core_pm_resume)
 };
 EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
 
-- 
2.41.0.162.gfafddb0af9-goog

