Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2747C569C3B
	for <lists+linux-input@lfdr.de>; Thu,  7 Jul 2022 09:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbiGGHwp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jul 2022 03:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235194AbiGGHwn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jul 2022 03:52:43 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7871232EE6
        for <linux-input@vger.kernel.org>; Thu,  7 Jul 2022 00:52:42 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v16so13656111wrd.13
        for <linux-input@vger.kernel.org>; Thu, 07 Jul 2022 00:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i6KN7qFz99qq/ALEKkoJkPgYJrjmF3EU2O4lIDewe7o=;
        b=2xWwxlQmOxFF7hkSwLKpunHGvB5x/X0vkrg/yhdWYf37lt4PSFeBuS/zCnxcpFzwrh
         HKDRN0N2yCvbPkyA3QiH99SXtyd4xFJu8OslBkqSP58kp4twJwZRnVn6uM9hDdYs/NmE
         scAllfzUBCgC3DvTT/3kcl/uX2f/j9EXSuZgOgCIc1yl3CwUa8/P9KLyx5ljtKMqLz8S
         Onmv+/j7i2UPWUJn52OVvG2ThAzfPtMgEhc+ZfPdB5UK55cK34jWeW2D2hH+6pCBAJjD
         d1ZJD+cj2n/Iox9G/muCTOiD3DOlT9eh6Xl21FCLrbFrXl/nPMqvWX5v+rtpxmk50oaV
         8Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i6KN7qFz99qq/ALEKkoJkPgYJrjmF3EU2O4lIDewe7o=;
        b=m05WDfWAh+n84EpnsKwpfGOBkRoM6yFkm8AEV5aUNrv0fvmvEoTfEkqcn0sePM++AA
         U7FzLRGfM2mxVwWzFOZh2Huv+t1dX8UOXIGIk6porpdeHBfvEbyJ+GBcwN+svyufomUn
         gvwUidsdFUxb9H6Y76//shHeFWRDkGrE4a4YpAE/80R0lla3Q78YonoX4eANyCyq6wqP
         /rGWyqqvzcpxqmsIEho2LttzHE4dFcaLdcPk7SLmaF964TPzf95KQp3p7f/gVLNODjeq
         W2Yr9LYWSRuKNqLCGyjbZQLHNiExfkJqjGZxFoURit4prQFEBuwQanc0ZPtB8pBrIFZe
         XsGA==
X-Gm-Message-State: AJIora8Q01WH+aqhmotci+8A7Ie1TUtp+OUWn5lmPuegue7MTCzHyANf
        1eHxNRw99RLpd3fztN8iwBIyig==
X-Google-Smtp-Source: AGRyM1soDhGfdev4LQ0mIklVU0dko84uYu7TIAzqbK7fMuXRnesTOeRRyxcpUQ5KiguXVGPAm3TRKA==
X-Received: by 2002:adf:f9ce:0:b0:21d:68b7:e7af with SMTP id w14-20020adff9ce000000b0021d68b7e7afmr20416179wrr.236.1657180361035;
        Thu, 07 Jul 2022 00:52:41 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:334b:5931:88c6:bbd2])
        by smtp.gmail.com with ESMTPSA id m16-20020adfe950000000b0021d70a871cbsm6972089wrn.32.2022.07.07.00.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 00:52:40 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Fabien Parent <parent.f@gmail.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [RESEND PATCH v3 2/2] Input: mt6779-keypad - implement row/column selection
Date:   Thu,  7 Jul 2022 09:52:36 +0200
Message-Id: <20220707075236.126631-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707075236.126631-1-mkorpershoek@baylibre.com>
References: <20220707075236.126631-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MediaTek keypad has a total of 6 input rows and 6 input columns.
By default, rows/columns 0-2 are enabled.

This is controlled by the KP_SEL register:
- bits[9:4]   control row selection
- bits[15:10] control column selection

Each bit enables the corresponding row/column number (e.g KP_SEL[4]
enables ROW0)

Depending on how the keypad is wired, this may result in wrong readings
of the keypad state.

Program the KP_SEL register to limit the key detection to n_rows,
n_cols we retrieve from the device tree.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index bd86cb95bde3..bf447bf598fb 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -17,6 +17,11 @@
 #define MTK_KPD_DEBOUNCE	0x0018
 #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
 #define MTK_KPD_DEBOUNCE_MAX_MS	256
+#define MTK_KPD_SEL		0x0020
+#define MTK_KPD_SEL_COL	GENMASK(15, 10)
+#define MTK_KPD_SEL_ROW	GENMASK(9, 4)
+#define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 9, 10)
+#define MTK_KPD_SEL_ROWMASK(r)	GENMASK((r) + 3, 4)
 #define MTK_KPD_NUM_MEMS	5
 #define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
 
@@ -161,6 +166,11 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
 		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
 
+	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
+			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
+	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
+			   MTK_KPD_SEL_COLMASK(keypad->n_cols));
+
 	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
 	if (IS_ERR(keypad->clk))
 		return PTR_ERR(keypad->clk);
-- 
2.34.1

