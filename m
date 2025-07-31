Return-Path: <linux-input+bounces-13734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF79B16F43
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 12:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8285D6241DF
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 10:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33952BE03B;
	Thu, 31 Jul 2025 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z13P8NM5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460932BE028
	for <linux-input@vger.kernel.org>; Thu, 31 Jul 2025 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753956836; cv=none; b=RGvecjpZJHR4x/vQnZn4lKg+m9XVG2taH3sNh+jqTNitxSfwM5jN1syLuvfdHc7Jt5g1fEXEI/1+K8wEba5ykKVmnWsYqC7B4ONtjr1VKcCtLY6SuPV/6MuYqN6mg2WKnCp2tdW263iGMLnfpczXGOecrsI5GsCvrKZlC1xiNSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753956836; c=relaxed/simple;
	bh=SzgQ4PbYilbgu6QRaVpQlt2ao9GrzC4Etb7sN45WZ4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdAgT6xEHQHhjJIHkRMnuD21WPxsgVT55eSI1asWOfgmkiiGMdx4Tuj5km4muUMCYGqR7yO9zgmu/ajVG1F6l/bAX7nIoGZ6i3p52F2jflU/23yh9znkyxqFmKXQqWy2MXtT4OqRCiiGBennPBqvGPygpOUZuRf/Ai8xlrl51W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z13P8NM5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7426c44e014so718647b3a.3
        for <linux-input@vger.kernel.org>; Thu, 31 Jul 2025 03:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753956834; x=1754561634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbmP0QkKxqA/DbyjgD1AWdfq/ymSytlBSv09DpEvJnQ=;
        b=Z13P8NM5fmTdIfkuEiywwAIOOtxUNXzUretim8hRXHstAsthhQWcYt58HG+T+QVpnp
         uQp0B+imIg+RrojQozE/Rnw+9OQNvsprc4YA1REXnkoiUprRjKeAI9aSajWLybbDoBJT
         aCBxT60borJG7V3V6hxY+gtKr5XKjjqRnVrJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753956834; x=1754561634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbmP0QkKxqA/DbyjgD1AWdfq/ymSytlBSv09DpEvJnQ=;
        b=X0BddGb2QOQhujmJin4fode/izyp7y7GwV16BRCg06AVzsFlGTCLRtiKR/aEyj7Iu/
         cUOzTOcF1BT6hzrqTuOIWTAu1plhpL9JKUurkV4d56voUD2Ovf1Xtqc1uq+ApASzynUg
         PBy9sUZLhqGmjx1TYBvMngFrwRLuXJwExj82g9FfOqQQeDo1uekYCk2Q5GMxPPwQ9Ko/
         qP7F9iIi9baE5gF0Ye4hfxjyb6uOmrCQlLhJPbuFdGH3Kj256/CyRnrIYe+ldEkpg+jN
         +S901a9aRmZS5OLnCnR6sxr7okgD0YWHnfZvcpsaklRHgSqRd3YexInsGXZOaz/VbhQu
         BpCw==
X-Forwarded-Encrypted: i=1; AJvYcCXuPVKXM5PXZjaH6DdUaL09ZubH9vMrimxRisq5Rv93maDsMDr69FVglxWL8GWxz1w2g18pPV9rOCxApw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxErBMwy1qqGYP3IFaYqmNmgDT0QHHUrcpNb0/8c9TuqEvtLhK4
	7BuOkzuAfEmTVPM93PK0Co6w9KfcZFzrLJa9Xu4EBEnlGn4JfnNeWZA10+l6+LoImg==
X-Gm-Gg: ASbGncu6kmPIaB0mKegvOoH4o1zeiyDwGUMMg83hTJ3eJW8QZPmJ/4a+6KklRtuhdiZ
	G2DOUibXrXIhf+tk93Tr1YE/nyAfy0tnSq2GbNKfqKa2Z8Ls/GtPGuMTRGzbHYjziiLkw3Gg5I2
	Oa2+CdmuXorlNjQutgdE4JURmdLF1dC1WTpMKq8W4zV72ibSrBB/ZEZ14KLysB7qagZDNIxO20r
	33AYzNIReMbX31QxFEygdL6jaXXQe6upkXijy9PvShYBXi0Bcl8YnSR+f/TlhGVCr0FTaJ8ovYG
	iwLTMMaojP2JlEafmqEbj6ib1CN2x9HF+BqHybkCvctJH0jlPC/PCTa/+Oo4O0rWcKGYCTQvMRf
	ynRdi55tHT4NJggwkgmBZ2NVX6ZORA1KUw/5x17ra/GM=
X-Google-Smtp-Source: AGHT+IHss+OJHmD0FAT3nC9RmC2MQCveb1+xJQvOEYyG7cW9OhPxDF0JmjTzbXM6LOHd95qxmTPNHw==
X-Received: by 2002:a05:6a20:3ca8:b0:234:80f6:2b3a with SMTP id adf61e73a8af0-23dc0cf78ecmr10951554637.4.1753956834512;
        Thu, 31 Jul 2025 03:13:54 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:8177:f5a7:88a1:4ed9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f5f5sm1229265b3a.10.2025.07.31.03.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 03:13:54 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
X-Google-Original-From: Pin-Yen Lin <treapking@google.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Pin-Yen Lin <treapking@google.com>
Subject: [PATCH 2/2] HID: Make elan touch controllers power on after panel is enabled
Date: Thu, 31 Jul 2025 18:13:15 +0800
Message-ID: <20250731101344.2761757-2-treapking@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
In-Reply-To: <20250731101344.2761757-1-treapking@google.com>
References: <20250731101344.2761757-1-treapking@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new HID quirk to indicate that this device has to be enabled
after the panel's backlight is enabled, and update the driver data for
the elan devices to enable this quirk. This cannot be a I2C HID quirk
because the kernel needs to acknowledge this before powering up the
device and read the VID/PID.

Signed-off-by: Pin-Yen Lin <treapking@google.com>

---

 drivers/hid/i2c-hid/i2c-hid-core.c    |  2 ++
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++++++-
 include/linux/hid.h                   |  2 ++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index d3912e3f2f13a..8dc4d5d56d399 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1183,6 +1183,8 @@ static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
 	int ret;
 
 	ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_funcs;
+	if (ihid->hid->initial_quirks | HID_QUIRK_POWER_ON_AFTER_BACKLIGHT)
+		ihid->panel_follower.after_panel_enabled = true;
 
 	/*
 	 * If we're not in control of our own power up/power down then we can't
diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 3fcff6daa0d3a..0215f217f6d86 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hid.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -23,6 +24,7 @@ struct elan_i2c_hid_chip_data {
 	unsigned int post_power_delay_ms;
 	u16 hid_descriptor_address;
 	const char *main_supply_name;
+	bool power_after_backlight;
 };
 
 struct i2c_hid_of_elan {
@@ -97,6 +99,7 @@ static int i2c_hid_of_elan_probe(struct i2c_client *client)
 {
 	struct i2c_hid_of_elan *ihid_elan;
 	int ret;
+	u32 quirks = 0;
 
 	ihid_elan = devm_kzalloc(&client->dev, sizeof(*ihid_elan), GFP_KERNEL);
 	if (!ihid_elan)
@@ -131,8 +134,12 @@ static int i2c_hid_of_elan_probe(struct i2c_client *client)
 		}
 	}
 
+	if (ihid_elan->chip_data->power_after_backlight)
+		quirks = HID_QUIRK_POWER_ON_AFTER_BACKLIGHT;
+
 	ret = i2c_hid_core_probe(client, &ihid_elan->ops,
-				 ihid_elan->chip_data->hid_descriptor_address, 0);
+				 ihid_elan->chip_data->hid_descriptor_address,
+				 quirks);
 	if (ret)
 		goto err_deassert_reset;
 
@@ -150,6 +157,7 @@ static const struct elan_i2c_hid_chip_data elan_ekth6915_chip_data = {
 	.post_gpio_reset_on_delay_ms = 300,
 	.hid_descriptor_address = 0x0001,
 	.main_supply_name = "vcc33",
+	.power_after_backlight = true,
 };
 
 static const struct elan_i2c_hid_chip_data elan_ekth6a12nay_chip_data = {
@@ -157,6 +165,7 @@ static const struct elan_i2c_hid_chip_data elan_ekth6a12nay_chip_data = {
 	.post_gpio_reset_on_delay_ms = 300,
 	.hid_descriptor_address = 0x0001,
 	.main_supply_name = "vcc33",
+	.power_after_backlight = true,
 };
 
 static const struct elan_i2c_hid_chip_data ilitek_ili9882t_chip_data = {
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 2cc4f1e4ea963..c32425b5d0119 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -364,6 +364,7 @@ struct hid_item {
  * | @HID_QUIRK_HAVE_SPECIAL_DRIVER:
  * | @HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE:
  * | @HID_QUIRK_IGNORE_SPECIAL_DRIVER
+ * | @HID_QUIRK_POWER_ON_AFTER_BACKLIGHT
  * | @HID_QUIRK_FULLSPEED_INTERVAL:
  * | @HID_QUIRK_NO_INIT_REPORTS:
  * | @HID_QUIRK_NO_IGNORE:
@@ -391,6 +392,7 @@ struct hid_item {
 #define HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE	BIT(20)
 #define HID_QUIRK_NOINVERT			BIT(21)
 #define HID_QUIRK_IGNORE_SPECIAL_DRIVER		BIT(22)
+#define HID_QUIRK_POWER_ON_AFTER_BACKLIGHT	BIT(23)
 #define HID_QUIRK_FULLSPEED_INTERVAL		BIT(28)
 #define HID_QUIRK_NO_INIT_REPORTS		BIT(29)
 #define HID_QUIRK_NO_IGNORE			BIT(30)
-- 
2.50.1.552.g942d659e1b-goog


