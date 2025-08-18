Return-Path: <linux-input+bounces-14087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3122B2A0DB
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 13:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0345D19630FB
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 11:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1E231A06A;
	Mon, 18 Aug 2025 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oRVhocTw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E596131A043
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755517828; cv=none; b=iDxg9F5M/6Y1vquPIo5x6d6NAFRbeSGcEVMNNkt1tuvXZUMoyVk2vaIndf15Pg/3iiW5J3fmrNThCVoky9h6Ol416BNPwsreuxaIlLRENJ4rr8CwDv9reaVH48061RC/VtNtSG3rxenDnYEZ1BVnavqPmWoDQU5ie0hE6T0ndDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755517828; c=relaxed/simple;
	bh=2F+LQBZ/eBkS2ZxR7ElP8NsgBUf5s8KGbrnq9GqVgok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=drDG0q7jwTQawmb4DjYJOvHz9v+7WOdJkraUjZXxeJDgpgjBK7ZFgtoA39JWTHBFmvef6StPI/8TlYrjKJx/+LmZHHQmnsNRFIvuTcEoDXwECUYuvjPbax1Raqa1q7BSC4ZSJ4D3b2QJldy4idmWP5nSVVdth16cispdeqsevx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oRVhocTw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e2eb3726cso2382422b3a.3
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 04:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755517825; x=1756122625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb1sCPo77mcuKw2zTHcH238POIGc59QSz6qQTiNa2Mw=;
        b=oRVhocTwrZXDM1tP9B7f0kJK/9LjSmpR7iowfpUU58N4poBJfIc58B8Owi6cabLtbd
         0w4yixAiWkB1b53mcoqmK/hsv08c3QmBTNpaDJt9Hekm46Qu9ncS8C8ZuUU8gMOgEn1G
         Crt1UdfCt9JzVGR03TUQiJ51PIMwwYyFG6nmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755517825; x=1756122625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb1sCPo77mcuKw2zTHcH238POIGc59QSz6qQTiNa2Mw=;
        b=s1AZHg7CL5Pb2maVV4WZ7OJ94FUzdGPwqIjneFwYmn9Qdksa60fwD6qm84LSJb0yCa
         mxItWgryJYOgZP99plq1o47Z312hgadme8tSFnlbT8Y6/9pYSm69H2525oFMocVUqY5L
         Wo5C7oElmvOeEj+yf+P//iokfxusDwJt1vXHNM8D/qvrMzCfQVNIMNibAYfXREEX4oGk
         BRFCd9wW/fKISx4rLJ1rFnAw3qxPs8giQda7LvQ6iDnOeIlnp+VRkliq+dNQxy8k03Xy
         D9W+Ln9W8gDP7fIPF+BG87LrRdVMkyzT3D/eUoZVdv+vSCyLic2k/xbxOyHTz6hPtjuR
         SHnA==
X-Forwarded-Encrypted: i=1; AJvYcCUzgv5VTQhYTSEr+W/cAcRB9nuZD4OD51k7kSFoRYZdJsWaWr6SzjMtvhSoTjm6CpR4lA4m0Wvww4gGCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXIrk7yl4+R06U2JThXOtFju4lRItqMvel6r4NQTYLvPBuV5AB
	LTZQsUIYdb9XKdV2qTLV20LY0U8YOd8mISE+rgBdrzMylUrUxg9M5iLFBrGuvn+Dgo7QsJmOJyk
	2ZNU=
X-Gm-Gg: ASbGncsI8Cfgef5MOfBTjXqZD3vtdNT/1SPLV/ZtHrkp8/WF4V6LFXwkBalo2JE70QN
	5K52ffQCqdLVwueN6aBGN/VHinVn0BR9Yi3E+C4ZjsYoN6B5BHVYReSQ7pjLeUfIlDd8pumcgil
	zHUn66tT+EqFAtC8Y8F/5z4UZVtl7R9i0QM5H1Wy06n6NCCHn09J5HrzNF8zXVp6pLshBp91Xep
	lAfsEEhjStvdqSE3S90X6a8EiWMcX2N1aYHKiqcVOKausRBf/0b532mTBwCECSc+q9jRA7x4MqZ
	226khQ0lbWI8m2H7tmxQPdi5opB3ACRKufVcBJs7nU2qqpZa3a+mwj31FJNllKxe0Sgiajn6CiQ
	SjiD2tbeFmvnek/VpK7HSWv4l+mZhN1N6rG/tr8c3UAq9ZJ+s8MlZQLgr
X-Google-Smtp-Source: AGHT+IEnZmo97hTPFZMCorIymSRvtFy/EQxRfq2GVJu7TQxCxXPZYFAQNMo9Bj8lA2NgaOC3Q4hnKw==
X-Received: by 2002:a17:902:d2c9:b0:242:461b:7d4 with SMTP id d9443c01a7336-2446d71ed3amr173689245ad.15.1755517825070;
        Mon, 18 Aug 2025 04:50:25 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:5130:767b:3a09:59d6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9ee03sm78997715ad.15.2025.08.18.04.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:50:24 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
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
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 2/2] HID: Make elan touch controllers power on after panel is enabled
Date: Mon, 18 Aug 2025 19:49:34 +0800
Message-ID: <20250818115015.2909525-2-treapking@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250818115015.2909525-1-treapking@chromium.org>
References: <20250818115015.2909525-1-treapking@chromium.org>
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
device and read the VID/PID. When this quirk is enabled, register
.panel_enabled()/.panel_disabling() instead for the panel follower.

Also rename the *panel_prepare* functions into *panel_follower* because
they could be called in other situations now.

Fixes: bd3cba00dcc63 ("HID: i2c-hid: elan: Add support for Elan eKTH6915 i2c-hid touchscreens")
Fixes: d06651bebf99e ("HID: i2c-hid: elan: Add elan-ekth6a12nay timing")

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v3:
- Collect review tag
- Add fixes tags

Changes in v2:
- Rename *panel_prepare* functions to *panel_follower*
- Replace after_panel_enabled flag with enabled/disabling callbacks

 drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++-----------
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
 include/linux/hid.h                   |  2 ++
 3 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index d3912e3f2f13a..99ce6386176c6 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -112,9 +112,9 @@ struct i2c_hid {
 
 	struct i2chid_ops	*ops;
 	struct drm_panel_follower panel_follower;
-	struct work_struct	panel_follower_prepare_work;
+	struct work_struct	panel_follower_work;
 	bool			is_panel_follower;
-	bool			prepare_work_finished;
+	bool			panel_follower_work_finished;
 };
 
 static const struct i2c_hid_quirks {
@@ -1110,10 +1110,10 @@ static int i2c_hid_core_probe_panel_follower(struct i2c_hid *ihid)
 	return ret;
 }
 
-static void ihid_core_panel_prepare_work(struct work_struct *work)
+static void ihid_core_panel_follower_work(struct work_struct *work)
 {
 	struct i2c_hid *ihid = container_of(work, struct i2c_hid,
-					    panel_follower_prepare_work);
+					    panel_follower_work);
 	struct hid_device *hid = ihid->hid;
 	int ret;
 
@@ -1130,7 +1130,7 @@ static void ihid_core_panel_prepare_work(struct work_struct *work)
 	if (ret)
 		dev_warn(&ihid->client->dev, "Power on failed: %d\n", ret);
 	else
-		WRITE_ONCE(ihid->prepare_work_finished, true);
+		WRITE_ONCE(ihid->panel_follower_work_finished, true);
 
 	/*
 	 * The work APIs provide a number of memory ordering guarantees
@@ -1139,12 +1139,12 @@ static void ihid_core_panel_prepare_work(struct work_struct *work)
 	 * guarantee that a write that happened in the work is visible after
 	 * cancel_work_sync(). We'll add a write memory barrier here to match
 	 * with i2c_hid_core_panel_unpreparing() to ensure that our write to
-	 * prepare_work_finished is visible there.
+	 * panel_follower_work_finished is visible there.
 	 */
 	smp_wmb();
 }
 
-static int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
+static int i2c_hid_core_panel_follower_resume(struct drm_panel_follower *follower)
 {
 	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
 
@@ -1152,29 +1152,36 @@ static int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
 	 * Powering on a touchscreen can be a slow process. Queue the work to
 	 * the system workqueue so we don't block the panel's power up.
 	 */
-	WRITE_ONCE(ihid->prepare_work_finished, false);
-	schedule_work(&ihid->panel_follower_prepare_work);
+	WRITE_ONCE(ihid->panel_follower_work_finished, false);
+	schedule_work(&ihid->panel_follower_work);
 
 	return 0;
 }
 
-static int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *follower)
+static int i2c_hid_core_panel_follower_suspend(struct drm_panel_follower *follower)
 {
 	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
 
-	cancel_work_sync(&ihid->panel_follower_prepare_work);
+	cancel_work_sync(&ihid->panel_follower_work);
 
-	/* Match with ihid_core_panel_prepare_work() */
+	/* Match with ihid_core_panel_follower_work() */
 	smp_rmb();
-	if (!READ_ONCE(ihid->prepare_work_finished))
+	if (!READ_ONCE(ihid->panel_follower_work_finished))
 		return 0;
 
 	return i2c_hid_core_suspend(ihid, true);
 }
 
-static const struct drm_panel_follower_funcs i2c_hid_core_panel_follower_funcs = {
-	.panel_prepared = i2c_hid_core_panel_prepared,
-	.panel_unpreparing = i2c_hid_core_panel_unpreparing,
+static const struct drm_panel_follower_funcs
+				i2c_hid_core_panel_follower_prepare_funcs = {
+	.panel_prepared = i2c_hid_core_panel_follower_resume,
+	.panel_unpreparing = i2c_hid_core_panel_follower_suspend,
+};
+
+static const struct drm_panel_follower_funcs
+				i2c_hid_core_panel_follower_enable_funcs = {
+	.panel_enabled = i2c_hid_core_panel_follower_resume,
+	.panel_disabling = i2c_hid_core_panel_follower_suspend,
 };
 
 static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
@@ -1182,7 +1189,10 @@ static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
 	struct device *dev = &ihid->client->dev;
 	int ret;
 
-	ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_funcs;
+	if (ihid->hid->initial_quirks | HID_QUIRK_POWER_ON_AFTER_BACKLIGHT)
+		ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_enable_funcs;
+	else
+		ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_prepare_funcs;
 
 	/*
 	 * If we're not in control of our own power up/power down then we can't
@@ -1237,7 +1247,7 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	init_waitqueue_head(&ihid->wait);
 	mutex_init(&ihid->cmd_lock);
 	mutex_init(&ihid->reset_lock);
-	INIT_WORK(&ihid->panel_follower_prepare_work, ihid_core_panel_prepare_work);
+	INIT_WORK(&ihid->panel_follower_work, ihid_core_panel_follower_work);
 
 	/* we need to allocate the command buffer without knowing the maximum
 	 * size of the reports. Let's use HID_MIN_BUFFER_SIZE, then we do the
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
2.51.0.rc1.163.g2494970778-goog


