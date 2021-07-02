Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33743BA17B
	for <lists+linux-input@lfdr.de>; Fri,  2 Jul 2021 15:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbhGBNqA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Jul 2021 09:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbhGBNp7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Jul 2021 09:45:59 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD430C0613DF
        for <linux-input@vger.kernel.org>; Fri,  2 Jul 2021 06:43:26 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id m18so12559687wrv.2
        for <linux-input@vger.kernel.org>; Fri, 02 Jul 2021 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IEDSCcz9DuURhhNfs/tK0QYp1lnSjVV5pxew10G8dSk=;
        b=oww/EIcYIkkGjYZeUZhdFMuaI/3hIzPWI+E0BV41zo/upZHpHgjKSmWv/rt8AcOayF
         p1OcudJNb6uX5mfCUjL+BLpj3pk+0oeRyUbDoEZz0YOAgU6mPUtMw6Qpm4Fpe4Ab6VMe
         AvYm/b9U3vkmB/LcPaf00sRbmqOunnJbmsi2fADxIqQGhZE7+IXUqnBuQqqxwmMneEhz
         Y+tBt7uihF3lYsN1j4O+8oJZJ9eahTis77T1N3tTXkza1yq5XC8YOia71tlG5XUCuDSG
         TfXOWyhklJidLU/YHElIXmJ4YhnBzMx7h/nlYbH8KLELC/X2RQZMlmvHxZFfPXcVlpfx
         9SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IEDSCcz9DuURhhNfs/tK0QYp1lnSjVV5pxew10G8dSk=;
        b=J+alcq6B/wcAHtoAqFSLuGiS1JmvFKUQhQ0PzIxpGSjzp0EWCjP9iuLMMYuknhZ92G
         6OfCgj/OPfvXIlmKvRyUi+/JamPlwBwLxFzLD80E2cChF4EA7txttfEkz06I4+RmiDd3
         S0LcTq6kNm3vXgcm8JScDp261JQAK23AFtbZkGaXjfMaLqbOb3sfb1C3OU/uay/hv/hR
         28fFd8YFv9VFnLzl0VicSKJnwxy61bidMCeQ7i38lwb9EcGNuXAlY2MGFgQ+jhCHpXju
         uwWW7nCrPl6/PbHOF3Gx1CFNkspGSMmLUESvTGaePXopQ1OQdeNSCqTDhm9P2a2Rkg18
         OeCg==
X-Gm-Message-State: AOAM531ykBIxWT1nKktjlY91Pb5T0p+xN5duln6SP0Rc+ILllQHiN/k9
        /6v806WDLnR0a0/vTh3aNHQC/Q==
X-Google-Smtp-Source: ABdhPJw2So7Imsur+MFkTU8FDDV/9iBuIT90pZGEkhPsGPQkJRg76z1mW/l4fUwTrTI5R3Q6dIn5DQ==
X-Received: by 2002:adf:cd85:: with SMTP id q5mr6032107wrj.214.1625233405464;
        Fri, 02 Jul 2021 06:43:25 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:c5f3:6ae:eaf:87a2])
        by smtp.gmail.com with ESMTPSA id s1sm12595512wmj.8.2021.07.02.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 06:43:25 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v3 3/4] Input: mtk-pmic-keys - add support for MT6358
Date:   Fri,  2 Jul 2021 15:43:09 +0200
Message-Id: <20210702134310.3451560-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
References: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
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

