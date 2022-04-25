Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F8950E2E6
	for <lists+linux-input@lfdr.de>; Mon, 25 Apr 2022 16:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242421AbiDYOWo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Apr 2022 10:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242424AbiDYOW1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Apr 2022 10:22:27 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B548F1FA5C
        for <linux-input@vger.kernel.org>; Mon, 25 Apr 2022 07:19:20 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id d5so5880116wrb.6
        for <linux-input@vger.kernel.org>; Mon, 25 Apr 2022 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f2ty6Kirg+4vRs3TX4nTiMefjQ+ct09dXtXeTw7jYik=;
        b=1sB7e3bdedA9AmRsfGnyCiarRfssvnjB14wg3RY5vuJjV8MlDlAG4m3750y3L4EI6B
         VCreeEhx06bcRLFb3DUHAYJvjqkhhjWZ5wEsdtvd0iyChuQyufYvQz/rFgbcBNXFkta5
         oZ364bmnxUDmoMo5PKJYxul44ORkdDIAdkjhG7RD7z3xVe48qqIIxETG2j+dSi9L5Pxi
         451O8ITGyPjGK/bRn2zi7whFR2olqTX68D+YTPvymtepHOVTUjCHRAG4eiBUy0hkofDD
         QV83KEgXbzukq11DA/dsG46j5gmqyPahC8HpJjhHATw13Xy4EH6GtVSWueTVkutXrcyB
         H+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f2ty6Kirg+4vRs3TX4nTiMefjQ+ct09dXtXeTw7jYik=;
        b=6luYxNb9pbwpVBJGuJOKcH2f7xwuawIWKBSl1/WAbIFVJrS4vONWwmu9+9bENJ2Oqw
         uq5KY/H1xx7IuS5Xr/SmsgtGsdfxiQrXjhHIy1EgWplkCdvc6TMr5z8Rt7QSiHBhHvE/
         byn9PYcOyczBIWrB2Oa+uIIHC9TYJKVotzSELx92XTSxfo3MMLbRrJOJUAM1o4FWaA5J
         Cnp1XuICcnR4UlZ4nBa7RVNSocTdWKkwyQ9MM14Hl15dMgCtOCKlx2do4y0N7OFLHLsV
         7YQLmmgVgvJUvFz3qo5MYzXP2vQpf+fyq2Nc4hbdYGrIqVQBvxnGhqtyNhJVgrtXhjVk
         I9tA==
X-Gm-Message-State: AOAM531k+QS4fPh+hWIL0ChfDSv6mR4m7Sb1cR0UkfSA8IccmPgPQeI3
        86QXWFIVGcJZU0XN59FdqBpRWg==
X-Google-Smtp-Source: ABdhPJyz4lwM9SSlgEubsE2+9MARuzk/2+T+ZiKJb/BBzhW4+LWq+OpWxYNbBON2beZCu62KJb+UqQ==
X-Received: by 2002:a05:6000:1a86:b0:20a:a933:ba16 with SMTP id f6-20020a0560001a8600b0020aa933ba16mr14279412wry.583.1650896359277;
        Mon, 25 Apr 2022 07:19:19 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:ce86:3a65:67d7:726d])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d64ca000000b0020aa97b0383sm9144592wri.113.2022.04.25.07.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 07:19:19 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 2/2] Input: mt6779-keypad - implement row/column selection
Date:   Mon, 25 Apr 2022 16:19:14 +0200
Message-Id: <20220425141914.158959-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425141914.158959-1-mkorpershoek@baylibre.com>
References: <20220425141914.158959-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
index 23360de20da5..653dfc619696 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -17,6 +17,11 @@
 #define MTK_KPD_DEBOUNCE	0x0018
 #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
 #define MTK_KPD_DEBOUNCE_MAX_MS	256
+#define MTK_KPD_SEL		0x0020
+#define MTK_KPD_SEL_COL	GENMASK(15, 10)
+#define MTK_KPD_SEL_ROW	GENMASK(9, 4)
+#define MTK_KPD_SEL_COLMASK(c)	(MTK_KPD_SEL_COL >> (6 - (c)))
+#define MTK_KPD_SEL_ROWMASK(r)	(MTK_KPD_SEL_ROW >> (6 - (r)))
 #define MTK_KPD_NUM_MEMS	5
 #define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
 
@@ -171,6 +176,11 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
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
2.32.0

