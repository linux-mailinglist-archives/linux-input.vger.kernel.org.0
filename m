Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E50BF581396
	for <lists+linux-input@lfdr.de>; Tue, 26 Jul 2022 14:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238674AbiGZM4i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jul 2022 08:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238939AbiGZM4f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Jul 2022 08:56:35 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2B125C5C
        for <linux-input@vger.kernel.org>; Tue, 26 Jul 2022 05:56:34 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id g2so11971629wru.3
        for <linux-input@vger.kernel.org>; Tue, 26 Jul 2022 05:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:cc;
        bh=tD4ST1GLkFfCdHd4u8ts0UQsGiLNPqXx0HKCsoNVuT4=;
        b=W3PAGeT94Vn3xX26lGfe1+Mze8r0I2iBziCUdIepLwzWyJcCogiZ1vOTm0eHPt5klL
         rk+K65pbpke7ZjTLRiJSZFeTSCqP1pXtcRFVHOUCGaXTCF6U1V5r1rrLbk11gAw3M42b
         lRdieESewrHcHaGkUS4QBvUd0j6rWb9aR6oIG0q4HH5r3RDCL0fpZS4eMnR+GO5pskrZ
         ldCnwO1Oi+XTVgQhz32OdRTwJORQJNeyil4llKTmwhrRBT9Aoo6nC+n6uKwDFiBDmn5d
         rtFhkaCCD7enY/2GIdh8vExjEntnpuY7TS2k/hqRFQoZGJvv3h2Anv9EGjjkydWvZY4J
         H31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:cc;
        bh=tD4ST1GLkFfCdHd4u8ts0UQsGiLNPqXx0HKCsoNVuT4=;
        b=6SHNctJg5WxS7f3LOCbl96KVLk5Q+x7/1Wr6+DBkpcfpTv/eHDTl8pv1fz9SqtOWZP
         t2qxpSfAFUivY5onnNw6iFE75cG6GpjBMlITZ34rwsawS3z5WnS7ReZNvm4omUM26Q+T
         +zUYuCgcgDU1H1kH8CFVH7QVWdT78h21EBvfpqe/DcMmERcJfzB8fpOlabP5M+uFkKTl
         jLOVUIeyZDpBPmWzr/EX7LvUscFrwoZvVypIiLHzECBI8EPZ8P/LBvXr408sJQtscwCt
         tR+m1yAIkeERpHaRFvmxYTsLm9c6rxVseg3jIekvWKAEc4vHe5ZTCaPwtSmDWB776cYR
         wlBw==
X-Gm-Message-State: AJIora/a0I3edV4iEKthKe1MU/OH3xrLKziuxBeWDNu913Djmf/hK6NP
        Daf7sn4+Wjwx/i0YDC291Oq+DA==
X-Google-Smtp-Source: AGRyM1vGYy9Kw+JfFrw9aIUXm7WvvvklWWEd28eEP4n/Z10dPqxoPZS1XDoRwK4BuI36L3XZc42XtQ==
X-Received: by 2002:a05:6000:1d89:b0:21d:5655:eb72 with SMTP id bk9-20020a0560001d8900b0021d5655eb72mr10702395wrb.110.1658840193779;
        Tue, 26 Jul 2022 05:56:33 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:33 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date:   Tue, 26 Jul 2022 14:56:10 +0200
Subject: [PATCH v2 5/7] Input: mt6779-keypad - support double keys matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v2-5-6d42c357cb76@baylibre.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,MISSING_HEADERS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

MediaTek keypad has 2 modes of detecting key events:
- single key: each (row, column) can detect one key
- double key: each (row, column) is a group of 2 keys

Double key support exists to minimize cost, since it reduces the number
of pins required for physical keys.

Double key is configured by setting BIT(0) of the KP_SEL register.

Enable double key matrix support based on the mediatek,keys-per-group
device tree property.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 39c931974bde..f70b02396de4 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -18,6 +18,7 @@
 #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
 #define MTK_KPD_DEBOUNCE_MAX_MS	256
 #define MTK_KPD_SEL		0x0020
+#define MTK_KPD_SEL_DOUBLE_KP_MODE	BIT(0)
 #define MTK_KPD_SEL_COL	GENMASK(15, 10)
 #define MTK_KPD_SEL_ROW	GENMASK(9, 4)
 #define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 9, 10)
@@ -102,12 +103,21 @@ static void mt6779_keypad_calc_row_col_single(unsigned int key,
 	*col = key % 9;
 }
 
+static void mt6779_keypad_calc_row_col_double(unsigned int key,
+					      unsigned int *row,
+					      unsigned int *col)
+{
+	*row = key / 13;
+	*col = (key % 13) / 2;
+}
+
 static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 {
 	struct mt6779_keypad *keypad;
 	void __iomem *base;
 	int irq;
 	u32 debounce;
+	u32 keys_per_group;
 	bool wakeup;
 	int error;
 
@@ -156,7 +166,20 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	keypad->calc_row_col = mt6779_keypad_calc_row_col_single;
+	if (device_property_read_u32(&pdev->dev, "mediatek,keys-per-group", &keys_per_group))
+		keys_per_group = 1;
+
+	switch (keys_per_group) {
+	case 1:
+		keypad->calc_row_col = mt6779_keypad_calc_row_col_single;
+		break;
+	case 2:
+		keypad->calc_row_col = mt6779_keypad_calc_row_col_double;
+		break;
+	default:
+		dev_err(&pdev->dev, "Invalid keys-per-group: %d\n", keys_per_group);
+		return -EINVAL;
+	}
 
 	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
 
@@ -176,6 +199,10 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
 		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
 
+	if (keys_per_group == 2)
+		regmap_update_bits(keypad->regmap, MTK_KPD_SEL,
+				   MTK_KPD_SEL_DOUBLE_KP_MODE, MTK_KPD_SEL_DOUBLE_KP_MODE);
+
 	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
 			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
 	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,

-- 
b4 0.10.0-dev-78725
