Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF57C3757B8
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 17:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235712AbhEFPli (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 11:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235888AbhEFPlL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 11:41:11 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC29BC061263
        for <linux-input@vger.kernel.org>; Thu,  6 May 2021 08:37:30 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso4998662wmc.1
        for <linux-input@vger.kernel.org>; Thu, 06 May 2021 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IEDSCcz9DuURhhNfs/tK0QYp1lnSjVV5pxew10G8dSk=;
        b=V/zeaR1TaQIoeM9XJufp+iP5G92k1G7iWvx0YDJBs9KSTMlmsMkOC9Ez5goto83id3
         VXJxFioSnQras5VmtoC1mS86Qn6xMuxeNrsN/w4dmPcZZwzKkzT1j184TkYmlgqNOGsG
         D7mX3kuycZVBBaJHLTu1jL1YE7cH2iwDCqLePnMy8MsUUpKaZvLyUA9YciXt4I3M7J2n
         8bFSPupQId613OvNqc/ecuxQ67Bn2wha7tcANjBBO7oitXR669EwypI8JNq+BavI82WX
         5zjHjOWvU5ig2060eSyBeA0UVJAhBeNAgxSDXHRlho7sk2UkPALdYWnKdS8RBX5s+mOn
         Qjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IEDSCcz9DuURhhNfs/tK0QYp1lnSjVV5pxew10G8dSk=;
        b=DzDN3UZLj7s74zic664C+/ytjHm+Fjbwca/OA5bnl5GrdSK1GyoXzEyTx/NIoOVIdK
         YzAiklrRnDHby6qVeEEY7IBRAguwnmmJdtroP9RBW2gL6N9+M5AVwGsz+2lzh9v1X7tr
         L9Cy4HunZU4hWYvDu1qdQjeIilmQrzt+SC00wWOpVZrjUXMEf8Md962NybiVsADkjf8T
         AyKCLcd+P/3MFOi8XAvv3RziopkIU15lxnycRrA93D0udldNstPOUaQlziuQdMyeF4l8
         hTidzlwmbeyskPJyIikrGxqs6SyWEYjkJCsD+5xBWfJG5dGeeEu+r5NZiU7/0L94xxYi
         zhEw==
X-Gm-Message-State: AOAM532fGk3dCCCoi5Jgo0+KZrwbaL/yGMv6h2Qnd7rcXzw0rzhsb04t
        hB2i4+fqSe96STfqAFd8AMANFg==
X-Google-Smtp-Source: ABdhPJxAlzAXFBB33Dmk47O2hysPZnFEIjDmjMGitDd9gQpK+W5laXn9eipEYkrU5GFJKGiqW4CfSw==
X-Received: by 2002:a05:600c:322a:: with SMTP id r42mr4723194wmp.98.1620315449674;
        Thu, 06 May 2021 08:37:29 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5fe0:3a70:ad4a:a29b])
        by smtp.gmail.com with ESMTPSA id o13sm3788673wmh.34.2021.05.06.08.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:37:29 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] Input: mtk-pmic-keys - add support for MT6358
Date:   Thu,  6 May 2021 17:37:18 +0200
Message-Id: <20210506153718.256903-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506153718.256903-1-mkorpershoek@baylibre.com>
References: <20210506153718.256903-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

MT6358 pmic keys behave differently than mt6397 and mt6323: there are
two interrupts per key: one for press, the other one for release (_r)

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 49 ++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index d1abf95d5701..5496a7020104 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -74,11 +75,22 @@ static const struct mtk_pmic_regs mt6323_regs = {
 	.pmic_rst_reg = MT6323_TOP_RST_MISC,
 };
 
+static const struct mtk_pmic_regs mt6358_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
+		0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
+		0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
+	.pmic_rst_reg = MT6358_TOP_RST_MISC,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
 	unsigned int keycode;
 	int irq;
+	int irq_r; /* optional: release irq if different */
 	bool wakeup:1;
 };
 
@@ -188,6 +200,19 @@ static int mtk_pmic_key_setup(struct mtk_pmic_keys *keys,
 		return ret;
 	}
 
+	if (info->irq_r > 0) {
+		ret = devm_request_threaded_irq(
+			keys->dev, info->irq_r, NULL,
+			mtk_pmic_keys_irq_handler_thread,
+			IRQF_ONESHOT | IRQF_TRIGGER_HIGH, "mtk-pmic-keys",
+			info);
+		if (ret) {
+			dev_err(keys->dev, "Failed to request IRQ_r: %d: %d\n",
+				info->irq, ret);
+			return ret;
+		}
+	}
+
 	input_set_capability(keys->input_dev, EV_KEY, info->keycode);
 
 	return 0;
@@ -199,8 +224,11 @@ static int __maybe_unused mtk_pmic_keys_suspend(struct device *dev)
 	int index;
 
 	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
-		if (keys->keys[index].wakeup)
+		if (keys->keys[index].wakeup) {
 			enable_irq_wake(keys->keys[index].irq);
+			if (keys->keys[index].irq_r > 0)
+				enable_irq_wake(keys->keys[index].irq_r);
+		}
 	}
 
 	return 0;
@@ -212,8 +240,11 @@ static int __maybe_unused mtk_pmic_keys_resume(struct device *dev)
 	int index;
 
 	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
-		if (keys->keys[index].wakeup)
+		if (keys->keys[index].wakeup) {
 			disable_irq_wake(keys->keys[index].irq);
+			if (keys->keys[index].irq_r > 0)
+				disable_irq_wake(keys->keys[index].irq_r);
+		}
 	}
 
 	return 0;
@@ -229,6 +260,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
+	}, {
+		.compatible = "mediatek,mt6358-keys",
+		.data = &mt6358_regs,
 	}, {
 		/* sentinel */
 	}
@@ -242,6 +276,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node, *child;
 	static const char *const irqnames[] = { "powerkey", "homekey" };
+	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
@@ -285,6 +320,16 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			return keys->keys[index].irq;
 		}
 
+		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
+			keys->keys[index].irq_r = platform_get_irq_byname(
+				pdev, irqnames_r[index]);
+
+			if (keys->keys[index].irq_r < 0) {
+				of_node_put(child);
+				return keys->keys[index].irq_r;
+			}
+		}
+
 		error = of_property_read_u32(child,
 			"linux,keycodes", &keys->keys[index].keycode);
 		if (error) {
-- 
2.27.0

