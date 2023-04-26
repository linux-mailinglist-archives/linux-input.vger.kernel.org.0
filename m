Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D066EF13C
	for <lists+linux-input@lfdr.de>; Wed, 26 Apr 2023 11:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240340AbjDZJdo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Apr 2023 05:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240289AbjDZJdm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Apr 2023 05:33:42 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EE01BE4
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 02:33:41 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so5714935b3a.2
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682501620; x=1685093620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbkTP3zHcJFJuVybS9KupjRL2tPIXD5dw4xi+AbtQaw=;
        b=C8LAqlu6DToCZB9Khh7AJe4KKQMWtFvMtBzAAACPvEmA1+DBreI552kDfQTb3Q2Ut2
         9m+esTfiRzAeUqVB12gteiAuVqPePd+h2FTlmetMy85ujIIAEcG/uplvGHmGt/4Ql1oO
         IVX72xlund0sCV7s9Co3GT2hmPe6NI97Y1VZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682501620; x=1685093620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbkTP3zHcJFJuVybS9KupjRL2tPIXD5dw4xi+AbtQaw=;
        b=cIxUdsQ2cHl8oOXcSzPrJe+LLaHyw3EAo8LPRGiEZBsnLSvlscp/jegtM3TgFONmzq
         0sfenlm12GWPVWGXaQoL2gXnbJgh5HXJ5/3TNa8sh11EOwT80U9059jTpuMJM/dJobkx
         w80gRhrCnFhD/CnwML9ew4bS3FRdwNHW/3UxeecvFdfVvJeuRdD2oDMzJvT2HTU7Paca
         RhKY/nc/PpSdpqfUoJ0QIZy8ipwpOdXkzq8diqhmF9WiQKCiO9WofWiPgWaFnvrnPLIf
         yhFuVsDsblQmpW1j3phTQtCrDfNsqrGAEwWuQSqqa2JEPVEZzmU7PpcUJAAm6xu5h3wk
         0RUw==
X-Gm-Message-State: AAQBX9de4Tjf4v8wk7H9wjLdeLF10C6VP5yavVM7n/jKF5c1mn+1TEIa
        DbOxe/VTt54Vvd4K2sLAGTh7la/2UeBI78A+qYg=
X-Google-Smtp-Source: AKy350YrCareTvj+eDZ+fbTN6x5p6afQ7jO7RDXDEbJX15Wm3ZZLFh0VsSVNstRbc8sSNOzhz1r+9Q==
X-Received: by 2002:a05:6a00:2da7:b0:625:ea57:389b with SMTP id fb39-20020a056a002da700b00625ea57389bmr27528444pfb.5.1682501620593;
        Wed, 26 Apr 2023 02:33:40 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a00078100b005810c4286d6sm10730075pfu.0.2023.04.26.02.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:33:40 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     Jeff LaBundy <jeff@labundy.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-mediatek <linux-mediatek@lists.infradead.org>,
        Fei Shao <fshao@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend" property
Date:   Wed, 26 Apr 2023 17:32:30 +0800
Message-ID: <20230426093231.1466984-3-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
In-Reply-To: <20230426093231.1466984-1-fshao@chromium.org>
References: <20230426093231.1466984-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In the beginning, commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the
reset line to true state of the regulator") introduced a change to tie
the reset line of the Goodix touchscreen to the state of the regulator
to fix a power leakage issue in suspend.

After some time, the change was deemed unnecessary and was reverted in
commit 557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the reset line to
the regulator") due to difficulties in managing regulator notifiers for
designs like Evoker, which provides a second power rail to touchscreen.

However, the revert caused a power regression on another Chromebook
device Steelix in the field, which has a dedicated always-on regulator
for touchscreen and was covered by the workaround in the first commit.

To address both cases, this patch adds the support for the new
"goodix,no-reset-during-suspend" property in the driver:
- When set to true, the driver does not assert the reset GPIO during
  power-down.
  Instead, the GPIO will be asserted during power-up to ensure the
  touchscreen always has a clean start and consistent behavior after
  resuming.
  This is for designs with a dedicated always-on regulator.
- When set to false or unset, the driver uses the original control flow
  and asserts GPIO and disable regulators normally.
  This is for the two-regulator and shared-regulator designs.

Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Changes in v2:
- Do not change the regulator_enable logic during power-up.

 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 0060e3dcd775..fc4532fcadcc 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -28,6 +28,7 @@ struct i2c_hid_of_goodix {
 	struct regulator *vdd;
 	struct regulator *vddio;
 	struct gpio_desc *reset_gpio;
+	bool no_reset_during_suspend;
 	const struct goodix_i2c_hid_timing_data *timings;
 };
 
@@ -37,6 +38,20 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops *ops)
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 	int ret;
 
+	if (ihid_goodix->no_reset_during_suspend) {
+		/*
+		 * This is not mandatory, but we assert reset here (instead of
+		 * during power-down) to ensure the device will have a clean
+		 * state after powering up, just like the normal scenarios will
+		 * have.
+		 *
+		 * Note that in this case we assume the regulators should be
+		 * (marked as) always-on, so the regulator core knows what to
+		 * do with them in the following regulator_enable() calls
+		 * despite regulator_disable() was not called previously.
+		 */
+		gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+	}
 	ret = regulator_enable(ihid_goodix->vdd);
 	if (ret)
 		return ret;
@@ -60,6 +75,14 @@ static void goodix_i2c_hid_power_down(struct i2chid_ops *ops)
 	struct i2c_hid_of_goodix *ihid_goodix =
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 
+	/*
+	 * Don't assert reset GPIO if it's set.
+	 * Also, it's okay to skip the following regulator_disable() calls
+	 * because the regulators should be always-on in this case.
+	 */
+	if (ihid_goodix->no_reset_during_suspend)
+		return;
+
 	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
 	regulator_disable(ihid_goodix->vddio);
 	regulator_disable(ihid_goodix->vdd);
@@ -91,6 +114,9 @@ static int i2c_hid_of_goodix_probe(struct i2c_client *client)
 	if (IS_ERR(ihid_goodix->vddio))
 		return PTR_ERR(ihid_goodix->vddio);
 
+	ihid_goodix->no_reset_during_suspend =
+		of_property_read_bool(client->dev.of_node, "goodix,no-reset-during-suspend");
+
 	ihid_goodix->timings = device_get_match_data(&client->dev);
 
 	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001, 0);
-- 
2.40.1.495.gc816e09b53d-goog

