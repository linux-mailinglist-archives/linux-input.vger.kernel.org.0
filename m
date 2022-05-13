Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2805B5265D8
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 17:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381069AbiEMPS4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 11:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379690AbiEMPSy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 11:18:54 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0626865D3D
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 08:18:53 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id f2so4861422wrc.0
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ILXr0TJPBJo0r6+Bn2TlxMvdz9hhu2MSRkeWBLg3s/U=;
        b=HLD6Co9A73LAXEkw7+pf5QazPc69Bm06mHH6jsxZoX0JxGEgEYzaYyu56Alvyu+0Qt
         7PFQjfMia2V+1HGOLGC56uB3KItocMtPicnNQds8cHaoIxgRl8RxEQM18q7Dnm0PPopw
         pu9sSSMCdD9d08zK0JXdLDAngru3KaGKK7TXryjBh9EVoGJBv+yPX7GKis6MqNc3Nc9f
         OUSKwsKg9hGxD/hkmkLK6kxmWAQyN1ujJxUVeCeweirF1euA33h4Uhhif6rWjxM0qE7n
         1WsnoTM/6xOg67hixrGo+3a7CUqfYPhjHy0GitnM6mu6WGR0Pk6nGNWm+JPibcdI9oJF
         nJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ILXr0TJPBJo0r6+Bn2TlxMvdz9hhu2MSRkeWBLg3s/U=;
        b=0aGt93WD/Gw+VAIkhV373DiILc/lCxcTzfZLnwjkUPW2g2PPPQZ4GbFNLQWQ6qQDqB
         E9u0HGeYIrdluV4nUAEm4rcxg27chbFW2l/nHLIlU9HBnXQtvD8OfvfnQz7szTnJ93W1
         SrOSDHW3CDAof//tPeBFrfnGhyGAqILvakOX4tUFh986mTt0V1DTpvOABJ+H7iwZpuJ+
         qaO1bDpzEb/mOqx8NjEBeL8j2owg4dGAAaCRiB4n2Vht1gsNAOGbGArchEoakdv3t4ch
         lC1cvOD27IzOBhIXa5GUCDzSxGkevFQsqj/VNzxA4w0MpBHL2J/7cR+o91Gsphp8S0kA
         I+6A==
X-Gm-Message-State: AOAM5301XViMHBH2O2WkTQRfxb69bCiP33FHc2O/01iIrkDRJ1H1MB3Y
        LlnhqRgO59ISW8Nhokajpn5jQg==
X-Google-Smtp-Source: ABdhPJzKFEfxpnN+vZ4gkOcoP10PztsJZ+L6QlSReHHtgDvmMOwpglZXa0bZZncL5YwfpXGV9OgxEg==
X-Received: by 2002:adf:e2cb:0:b0:20c:c1bb:9fcb with SMTP id d11-20020adfe2cb000000b0020cc1bb9fcbmr4435589wrj.35.1652455131503;
        Fri, 13 May 2022 08:18:51 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:9353:61cb:4e25:b9cd])
        by smtp.gmail.com with ESMTPSA id b9-20020adfc749000000b0020c6a524fd5sm2800825wrh.99.2022.05.13.08.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 08:18:51 -0700 (PDT)
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
Subject: [RESEND PATCH 1/2] Input: mt6779-keypad - fix hardware code mapping
Date:   Fri, 13 May 2022 17:18:44 +0200
Message-Id: <20220513151845.2802795-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
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

In mt6779_keypad_irq_handler(), we
1. Read a hardware code from KPD_MEM1 -> KPD_MEM5
2. Use that hardware code to compute columns/rows for the standard
   keyboard matrix.

According to the (non-public) datasheet, the
map between the hardware code and the cols/rows is:

        |(0)  |(1)  |(2)
    ----*-----*-----*-----
        |     |     |
        |(9)  |(10) |(11)
    ----*-----*-----*-----
        |     |     |
        |(18) |(19) |(20)
    ----*-----*-----*-----
        |     |     |

This brings us to another formula:
-> row = code / 9;
-> col = code % 3;

Implement this mapping in bitnr_to_col_row() to fetch the
correct input event from keypad->input_dev->keycode and report that
back to userspace.

Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
Co-developed-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 2e7c9187c10f..23360de20da5 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -36,6 +36,19 @@ static const struct regmap_config mt6779_keypad_regmap_cfg = {
 	.max_register = 36,
 };
 
+/*
+ * | hardware key code | col0 | col1 | col2|
+ * | ----------------- | -----| ---- | --- |
+ * | row0              | 0    | 1    | 2   |
+ * | row1              | 9    | 10   | 11  |
+ * | row2              | 18   | 19   | 20  |
+ */
+static void bitnr_to_col_row(int bit_nr, int *col, int *row)
+{
+	*row = bit_nr / 9;
+	*col = bit_nr % 3;
+}
+
 static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 {
 	struct mt6779_keypad *keypad = dev_id;
@@ -61,8 +74,7 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 		if (bit_nr % 32 >= 16)
 			continue;
 
-		row = bit_nr / 32;
-		col = bit_nr % 32;
+		bitnr_to_col_row(bit_nr, &col, &row);
 		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
 		/* 1: not pressed, 0: pressed */
 		pressed = !test_bit(bit_nr, new_state);
-- 
2.32.0

