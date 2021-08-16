Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C393ED184
	for <lists+linux-input@lfdr.de>; Mon, 16 Aug 2021 12:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbhHPKAv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 06:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235717AbhHPKAu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 06:00:50 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384FFC0613CF
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 03:00:19 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x12so22692706wrr.11
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PpTp/5Tq0vrESfQrWF/0EYbh0U7tDoXhxB+uJr6AMbw=;
        b=fZgM7et7JYN90BplPUrj/GoO0GMYg2UGNctNv85sYTJZyAp9+5tYQ/atL9fS0rK3no
         2jQXLYyUaJtuipNYQqdWqHWJAJPb+u9Btp7iBxVu4tsGws2grDmPFkZAFSwKS7MHWgZ1
         mqpfHHPg9beVHo+CgtbDHCjaL0TE3Syn8NLiFhdmzq+aBDAUIKjUUJ03EE5TPZvuPDWn
         +iIqBddx4oYL04skb1+ky2iex/cWMpN8aG/o/3FgFS+hEiEyEWBNH05CE10XGJAdR9SV
         iZX9YJWkpYTxynqjuG/LCBhnUS7lB1LK1alovi3FK+/o9o0OmWst5uBWbXCpwn+vWvoc
         pnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PpTp/5Tq0vrESfQrWF/0EYbh0U7tDoXhxB+uJr6AMbw=;
        b=Sk53TUbhBqaRszy831cFszymNyaCeS0H6Zsi7sC7ttX0BeVWmITMMoO6jn6NqtK4wu
         MHZbFbNSKHKNuLITDtIzAtZpuSPh00lLs3dFA/qOv8j60Kr4g9ELYuOK8ix+XRq3mNSc
         WbZkKZ5qEj82cBlfQYGO5GrTyLyEGj/2vvY0OdnmlqxoXyPGx3mKhMvOeA7WMfYpFLhi
         WrzQvqYTFJzlqB98vLIFVyFDMFJTVD7dNL9tHYIlZRdRqt12EPQxf9MF5UCPpSs+J0zj
         aeztelAxPfZH0bW0WwCXAWN+VPMwkk8KllRiyWNNxymlLfvT9253Q4/uTK2kXDpFdBK9
         EnYg==
X-Gm-Message-State: AOAM533UH3+r88s+5c0ekY1Gg2xQxynAioiMWzTf0dOAHRxlzaGCpwp8
        MXaaNCkchJ7e0pmZfQB6PqT2vA==
X-Google-Smtp-Source: ABdhPJx0rUUhNZQP2bVTR6MASpL3WdLxTe5ewjSHul88ww9MB25RzFpl0cLiAjLY5D8Dik1Igj8Q2w==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr16919690wrt.178.1629108017782;
        Mon, 16 Aug 2021 03:00:17 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:92b1:d3c2:1204:85e2])
        by smtp.gmail.com with ESMTPSA id u10sm1916645wrt.14.2021.08.16.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 03:00:17 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH RESEND v3 1/4] Input: mtk-pmic-keys - use get_irq_byname() instead of index
Date:   Mon, 16 Aug 2021 12:00:10 +0200
Message-Id: <20210816100013.100412-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816100013.100412-1-mkorpershoek@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some pmics of the mt6397 family (such as MT6358), have two IRQs per
physical key: one for press event, another for release event.

The mtk-pmic-keys driver assumes that each key only has one
IRQ. The key index and the RES_IRQ resource index have a 1/1 mapping.

This won't work for MT6358, as we have multiple resources (2) for one key.

To prepare mtk-pmic-keys to support MT6358, retrieve IRQs by name
instead of by index.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 62391d6c7da6..d1abf95d5701 100644
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
@@ -268,7 +269,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	input_dev->id.version = 0x0001;
 
 	keycount = of_get_available_child_count(node);
-	if (keycount > MTK_PMIC_MAX_KEY_COUNT) {
+	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
+	    keycount > ARRAY_SIZE(irqnames)) {
 		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
 		return -EINVAL;
 	}
@@ -276,7 +278,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	for_each_child_of_node(node, child) {
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
-		keys->keys[index].irq = platform_get_irq(pdev, index);
+		keys->keys[index].irq =
+			platform_get_irq_byname(pdev, irqnames[index]);
 		if (keys->keys[index].irq < 0) {
 			of_node_put(child);
 			return keys->keys[index].irq;
-- 
2.30.2

