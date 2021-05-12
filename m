Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE8537C8A3
	for <lists+linux-input@lfdr.de>; Wed, 12 May 2021 18:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235847AbhELQLV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 May 2021 12:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233958AbhELPvP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 May 2021 11:51:15 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9037FC061345
        for <linux-input@vger.kernel.org>; Wed, 12 May 2021 08:26:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id h4so24024980wrt.12
        for <linux-input@vger.kernel.org>; Wed, 12 May 2021 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=;
        b=hXAKLlGslSY+StvaTShozecnK56pNk1iaHsdQQqcO3Oq+6ZookK9e21q3ejNQQvBqq
         RDhHax1vyl5VTyNgLtRs/87oEJGisOF/zGw7VnU0wP2Xli9Vmw1lNM1DP+o1bIMCNZc2
         49Wt8OIXmlP0FCA4GETy37IWb6XzuBEsV1YMjfjvHIqMtfiidrWJPN06kSnNPl8G0El+
         ejyDjMoNnCe3HFwf1hjDSq/tkolEptYzQzFsogm86a+12K46WgmdmimS0pkSjJdz7Qs1
         rZXRl5tgPlAYFLp0FQpP8s37hueBw3hseo+jn1R8u8CpczgMEdOlTFVKdL5IBJcLVRrv
         wbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=;
        b=azLQ2mmhcfWzIIf8XWDkaTM4UWC1bZ8EK2WEKAG5pDxbYYq82rYnr1Ks9FdNNNWlXS
         4cNQAWpA/7vAoTom1XPaO+OQYNrg6c06yUy7l5ewKK/LLgdyQcQyXA7Fs1uvB0U0eiEt
         dix60jYpCpbhvTrR+9HOu8solSgjjqMWI4jz+LzZaKXPlRu3tg2gyrHUbMaCv6chT39M
         yVzYcQNGMj4pMMkRmTiHqsty2w9JgvHy7hcVt6oli5LfENVkACcbXyx8zZM1OOCE3zdv
         4FzhosvnQFlZVcLQzhOEP47FSvMn7xpiKTeBfTCrtDhA+9VQ6Mt19LX12xUMZVl4/qic
         cBIw==
X-Gm-Message-State: AOAM530qmwcMRlBFp8bCTR3nFijcVzT1lvTpT0G2mBJAWFzHlzWwYFb4
        IF29mGC/Lz/bNrU03yOLUdnFeg==
X-Google-Smtp-Source: ABdhPJypo7Jgc6oAImKUv3gajv3k/NqdipfFKhkHkFZxxCQ1LulKIaO0IIMcNGTIuXb2LioBDAsYuQ==
X-Received: by 2002:a05:6000:1549:: with SMTP id 9mr45965246wry.367.1620833213218;
        Wed, 12 May 2021 08:26:53 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.home (lfbn-tou-1-1465-169.w90-89.abo.wanadoo.fr. [90.89.34.169])
        by smtp.gmail.com with ESMTPSA id b7sm30931256wri.83.2021.05.12.08.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 08:26:52 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 1/3] Input: mtk-pmic-keys - use get_irq_byname() instead of index
Date:   Wed, 12 May 2021 17:26:46 +0200
Message-Id: <20210512152648.39961-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512152648.39961-1-mkorpershoek@baylibre.com>
References: <20210512152648.39961-1-mkorpershoek@baylibre.com>
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
2.27.0

