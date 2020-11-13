Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A092D2B1AB3
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 13:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgKMMEm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 07:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgKMLf5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 06:35:57 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71DFC0613D1;
        Fri, 13 Nov 2020 03:35:25 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id e21so6854478pgr.11;
        Fri, 13 Nov 2020 03:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6y9vmXX7zOZnbMhZlEt5kl1rihnQFMA8OGUNF1w170o=;
        b=ExxYNYn4bS8T3lfeAF+IPQa5cW7AVatx2zBE3dl+uz9uTy75DhXEPavEj0Y7B6z1HU
         bKUqVCWjueZg08Rlz+LSfNTgL5i94RRx+iQX0Pg5Yh2bzBTKElhhpMoD+eIpDcbK9CDb
         w9QWe6TA7aGA3mKyJ0tuYg0NbF1OlSB4e4hAaqm8NRs84Wm4fiz+eSgMGuox9NLWF4SI
         sIKuDwr/Kr+CM42Z6RNwyczuvnRU0JB6UQcF3VJu07MRq9NBt66Ehe1Q9HTH1VZN15kL
         1FF326ytVKTb84+KpVHlsXGHa+B71bXwkSDgMz9XE9DZB+/8dGYjJMQj72Fj6+GPI3Wu
         PftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6y9vmXX7zOZnbMhZlEt5kl1rihnQFMA8OGUNF1w170o=;
        b=EfZgROrGAH4CZtJhngari/6YmW0O+GkHcd0xRngQ07H7nE2zSFN2qs5e8x1tj0XlWI
         UNkibuBa7LFps9AUlIaG6xdcfFHkKMlj94KhmQ8YkCCHxw00reY6eg/y1GAs/HQGEDxf
         Gr9zasfJBxd7+NsCLwUMzKaKRP1DHfkqAbjlT62S8DHiwoA51LOm35hakAGQEWt7sGbG
         ot+1rYU7YQizdhg+/DDCkbQm4j7e+63Mpmpvu6lvXb0ya8f14efhhBcenoFxjFf/yq2T
         sU/sLjKo69cfwrC5Qjr1xmLkiKn951wkZBwvms7oea/Jb91U1C9RVproxHA8M+NiJ6dg
         XNMg==
X-Gm-Message-State: AOAM530KFjR1u/SWHlYS8vXae4676UeJ8jkEFEdDhSKR4zqGI8Sc/SUx
        MP09aX37oMghh3L7QSCwfWE=
X-Google-Smtp-Source: ABdhPJzilGohfkU3iBVtu8k8vDDQosc/HCCcporPbIbzkusXUEjyDz2S+bdyNTn04yyguWa4kRdlYA==
X-Received: by 2002:a17:90a:448a:: with SMTP id t10mr2478521pjg.38.1605267325436;
        Fri, 13 Nov 2020 03:35:25 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id q12sm9900987pfc.84.2020.11.13.03.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 03:35:24 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Nemo Han <nemo.han@unisoc.com>
Subject: [PATCH 1/3] input: sc27xx: Add support for sc2730 and sc2721
Date:   Fri, 13 Nov 2020 19:34:49 +0800
Message-Id: <20201113113451.52355-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nemo Han <nemo.han@unisoc.com>

Add new compatible strings and match data to support sc2730 and sc2721
which are two varieties of SC27XX family.

Signed-off-by: Nemo Han <nemo.han@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/input/misc/sc27xx-vibra.c | 64 ++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/drivers/input/misc/sc27xx-vibra.c b/drivers/input/misc/sc27xx-vibra.c
index 295251abbdac..b4adb826db56 100644
--- a/drivers/input/misc/sc27xx-vibra.c
+++ b/drivers/input/misc/sc27xx-vibra.c
@@ -5,43 +5,77 @@
 
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/input.h>
 #include <linux/workqueue.h>
 
-#define CUR_DRV_CAL_SEL		GENMASK(13, 12)
-#define SLP_LDOVIBR_PD_EN	BIT(9)
-#define LDO_VIBR_PD		BIT(8)
+#define CUR_DRV_CAL_SEL			GENMASK(13, 12)
+#define SLP_LDOVIBR_PD_EN		BIT(9)
+#define LDO_VIBR_PD			BIT(8)
+#define SC2730_CUR_DRV_CAL_SEL		0
+#define SC2730_SLP_LDOVIBR_PD_EN	BIT(14)
+#define SC2730_LDO_VIBR_PD		BIT(13)
+
+struct sc27xx_vibra_data {
+	u32 cur_drv_cal_sel;
+	u32 slp_pd_en;
+	u32 ldo_pd;
+};
 
 struct vibra_info {
 	struct input_dev	*input_dev;
 	struct work_struct	play_work;
 	struct regmap		*regmap;
+	const struct sc27xx_vibra_data *data;
 	u32			base;
 	u32			strength;
 	bool			enabled;
 };
 
+static const struct sc27xx_vibra_data sc2731_data = {
+	.cur_drv_cal_sel = CUR_DRV_CAL_SEL,
+	.slp_pd_en = SLP_LDOVIBR_PD_EN,
+	.ldo_pd = LDO_VIBR_PD,
+};
+
+static const struct sc27xx_vibra_data sc2730_data = {
+	.cur_drv_cal_sel = SC2730_CUR_DRV_CAL_SEL,
+	.slp_pd_en = SC2730_SLP_LDOVIBR_PD_EN,
+	.ldo_pd = SC2730_LDO_VIBR_PD,
+};
+
+static const struct sc27xx_vibra_data sc2721_data = {
+	.cur_drv_cal_sel = CUR_DRV_CAL_SEL,
+	.slp_pd_en = SLP_LDOVIBR_PD_EN,
+	.ldo_pd = LDO_VIBR_PD,
+};
+
 static void sc27xx_vibra_set(struct vibra_info *info, bool on)
 {
+	const struct sc27xx_vibra_data *data = info->data;
 	if (on) {
-		regmap_update_bits(info->regmap, info->base, LDO_VIBR_PD, 0);
+		regmap_update_bits(info->regmap, info->base, data->ldo_pd, 0);
 		regmap_update_bits(info->regmap, info->base,
-				   SLP_LDOVIBR_PD_EN, 0);
+				   data->slp_pd_en, 0);
 		info->enabled = true;
 	} else {
-		regmap_update_bits(info->regmap, info->base, LDO_VIBR_PD,
-				   LDO_VIBR_PD);
+		regmap_update_bits(info->regmap, info->base, data->ldo_pd,
+				   data->ldo_pd);
 		regmap_update_bits(info->regmap, info->base,
-				   SLP_LDOVIBR_PD_EN, SLP_LDOVIBR_PD_EN);
+				   data->slp_pd_en, data->slp_pd_en);
 		info->enabled = false;
 	}
 }
 
 static int sc27xx_vibra_hw_init(struct vibra_info *info)
 {
-	return regmap_update_bits(info->regmap, info->base, CUR_DRV_CAL_SEL, 0);
+	const struct sc27xx_vibra_data *data = info->data;
+
+	if (!data->cur_drv_cal_sel)
+		return 0;
+	return regmap_update_bits(info->regmap, info->base, data->cur_drv_cal_sel, 0);
 }
 
 static void sc27xx_vibra_play_work(struct work_struct *work)
@@ -78,8 +112,15 @@ static void sc27xx_vibra_close(struct input_dev *input)
 static int sc27xx_vibra_probe(struct platform_device *pdev)
 {
 	struct vibra_info *info;
+	const struct sc27xx_vibra_data *data;
 	int error;
 
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data) {
+		dev_err(&pdev->dev, "no matching driver data found\n");
+		return -EINVAL;
+	}
+
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
@@ -105,6 +146,7 @@ static int sc27xx_vibra_probe(struct platform_device *pdev)
 	info->input_dev->name = "sc27xx:vibrator";
 	info->input_dev->id.version = 0;
 	info->input_dev->close = sc27xx_vibra_close;
+	info->data = data;
 
 	input_set_drvdata(info->input_dev, info);
 	input_set_capability(info->input_dev, EV_FF, FF_RUMBLE);
@@ -134,7 +176,9 @@ static int sc27xx_vibra_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sc27xx_vibra_of_match[] = {
-	{ .compatible = "sprd,sc2731-vibrator", },
+	{ .compatible = "sprd,sc2721-vibrator", .data = &sc2721_data },
+	{ .compatible = "sprd,sc2730-vibrator", .data = &sc2730_data },
+	{ .compatible = "sprd,sc2731-vibrator", .data = &sc2731_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sc27xx_vibra_of_match);
-- 
2.25.1

