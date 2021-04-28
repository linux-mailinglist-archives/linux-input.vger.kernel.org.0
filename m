Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43DF36DD44
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 18:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241141AbhD1QnU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 12:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240871AbhD1QnS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 12:43:18 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EE5C0613ED
        for <linux-input@vger.kernel.org>; Wed, 28 Apr 2021 09:42:29 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id a22-20020a05600c2256b029014294520f18so4854884wmm.1
        for <linux-input@vger.kernel.org>; Wed, 28 Apr 2021 09:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aE6tbol598vm7TcSOWd/ixIJR/NZPP5/XzZKCEl8Zf8=;
        b=J4dqcVhdcBzsqgSFLeh+i1+i5o0SxHlpn8OGQobH8KV71ucEb/6O56IXT8ve1pcz4F
         4VKoRxjcAAUGn+wTtkxSK+khCRvmSVVstBfHNcxI3I8ikMuMvedh6k54p84Ee3nOmlUX
         10ddhHbR2H1KqB2Q+YU+knIDw/qNWId1at7U/vK5K7LbV/2IYmO3Qdp+xUBsaro9qc7s
         yI8E9KY6rJGj/CpuP/xcz56ui3AnHXxkW/NTVr9C3h83kt2XnJfv++P7DNQY6qaSBbc4
         NTuwPTxqFnTRJ8G37M9Gr00xh0SmAi0p69hTXdcC0BGQmSxbC/noKyP85oM/DgNhWXSP
         yfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aE6tbol598vm7TcSOWd/ixIJR/NZPP5/XzZKCEl8Zf8=;
        b=mIHWGEtphIwGXuJZFmwA84DPqtKBfuyGq80hOSvNV+QxSwmgXkN/gf0bfqc+YUm+nc
         BnVD9WTWd1r1J9tG4hXTIS1QJCxYwbn9aIy3xa6BKaU42PxwXxsnsqGPW0b1tQ5tlyUy
         Y1+JFWixXERmUodaAdYgrfoergJFzNdquoNRO3juMRZ+zqhja9EJg7jNG/meWuvZPjtA
         AmDZfJMcD/WR2PGLlST4iPgci/YWOvQmMh8J6aN1uaTuM64HcrOgJG4WhIda1nNKIGNW
         LWEPQukNFTMOaLRLgI/JG4Zb3azC/SWXczPe3GRtQ7EJL8K0lonBvomGCbRKSWb4NwU3
         dgsg==
X-Gm-Message-State: AOAM530AtyB5SMZDJtuSA0mhD+Xwy7VU6eniG2BVHvBP8IKXocOQfbdo
        QOcxSU3JepPzR575AG6VlgRFxw==
X-Google-Smtp-Source: ABdhPJyVYbQkgOcOPhTj6Vjo77V2V6rBqhdeMpvSmiZrGZE7iyBdjx+zJuPQ8eC1m25VyF+WiKW55A==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr13689713wmc.112.1619628147980;
        Wed, 28 Apr 2021 09:42:27 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
        by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 09:42:27 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     fparent@baylibre.com,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] mfd: mt6397: keys: use named IRQs instead of index
Date:   Wed, 28 Apr 2021 18:42:15 +0200
Message-Id: <20210428164219.1115537-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For some compatible pmics (such as MT6358), there are two IRQs per
physical key: one for press event, another for release event.

Currently, the mtk-pmic-keys driver assumes that each key only has one
IRQ. The key index and the RES_IRQ resource index have a 1/1 mapping.

This won't work for MT6358, as we have multiple resources (2) for one key.

To prepare mtk-pmic-keys to support MT6358, retrieve IRQs by name
instead of by index.

Note: The keys_resources are not part of the device-tree bindings so
this won't break any DT schemas.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 7 +++++--
 drivers/mfd/mt6397-core.c              | 8 ++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 12c449eed026..b877bf98db38 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -241,6 +241,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	unsigned int keycount;
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node, *child;
+	static const char *const irqnames[] = { "powerkey", "homekey" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
@@ -271,7 +272,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	input_dev->id.version = 0x0001;
 
 	keycount = of_get_available_child_count(node);
-	if (keycount > MTK_PMIC_MAX_KEY_COUNT) {
+	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
+	    keycount > ARRAY_SIZE(irqnames)) {
 		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
 		return -EINVAL;
 	}
@@ -279,7 +281,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	for_each_child_of_node(node, child) {
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
-		keys->keys[index].irq = platform_get_irq(pdev, index);
+		keys->keys[index].irq =
+			platform_get_irq_byname(pdev, irqnames[index]);
 		if (keys->keys[index].irq < 0) {
 			of_node_put(child);
 			return keys->keys[index].irq;
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7518d74c3b4c..8738b5524783 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -46,13 +46,13 @@ static const struct resource mt6397_rtc_resources[] = {
 };
 
 static const struct resource mt6323_keys_resources[] = {
-	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_PWRKEY),
-	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_FCHRKEY),
+	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_FCHRKEY, "homekey"),
 };
 
 static const struct resource mt6397_keys_resources[] = {
-	DEFINE_RES_IRQ(MT6397_IRQ_PWRKEY),
-	DEFINE_RES_IRQ(MT6397_IRQ_HOMEKEY),
+	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_HOMEKEY, "homekey"),
 };
 
 static const struct resource mt6323_pwrc_resources[] = {
-- 
2.27.0

