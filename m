Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F4150E2E4
	for <lists+linux-input@lfdr.de>; Mon, 25 Apr 2022 16:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242428AbiDYOWn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Apr 2022 10:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242423AbiDYOW0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Apr 2022 10:22:26 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180AD1FA57
        for <linux-input@vger.kernel.org>; Mon, 25 Apr 2022 07:19:20 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 17-20020a05600c021100b00393a19f8f98so6665027wmi.4
        for <linux-input@vger.kernel.org>; Mon, 25 Apr 2022 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ILXr0TJPBJo0r6+Bn2TlxMvdz9hhu2MSRkeWBLg3s/U=;
        b=a7zJOVdoFT/GJdg7tl5UUVlOAPsrIqhbrZwjAOwmQ4CUB3vTk6tzLUPDaiVYfgN/ZW
         qohGnepBzmVhEdNr448DkesYtQlznMwL36KNGAD/EQY30n9grXzN0t2iLQVJVVXUE5sp
         WSyC9oqtFSQ/7306YsSXPb5iJZg5HeuFtZQtUNSQV9N+vzf88FBtkiR+Y+nrbCgLJZFW
         aR7pQaK4H2Td6QTP++rtOW8CwXXVBU4cfQ3enBKgk8Cedh6VUBSzgsN+8tg0QXBkhjTX
         yhqsf1Q2RmG/LEl9lo8Q3uJM6Xy4s3YaYcBRk4qfzpqmnCk+lHlkqIaJktG+fc1EXs9G
         apSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ILXr0TJPBJo0r6+Bn2TlxMvdz9hhu2MSRkeWBLg3s/U=;
        b=boB+FP3NGlYs95uAQI5DXzOKaPjw+s9B2jUl1nD1tWCQpV8lPEmPEBwSOF6GSQpWJP
         lc/lSYRIJUiHeoPtoabdVpbScUVOWV2fB5xU95zucXiR+G6JWM1KtZky+UoNOvTANDn0
         vdOkEMrW0xKbgBgwvTvIoIO8tEMw4PsBqb2iTR2u89xYwWfiUThrQyoUTq9DLycsX+R4
         1JwVIqw/jwqTtJuwsur6v4DpzzfEWCVFooXLiF1/ZpEUNMAsOCyBQkUwcCZoufO4ExCu
         jFt0aPEc19G5YpYo8Uzp7pmuHq5Kwfrp/Ostq8rIWQID+fhBuPLQuVzRZwKwBdO9dbTT
         MplQ==
X-Gm-Message-State: AOAM531HycfIoLi56V5UP27hWjslZCdhPWqUhVMLL/r1DBMxlgEVGtqX
        r0g6anJkXkA/465Q3G9YsO1c/Q==
X-Google-Smtp-Source: ABdhPJysAxok8ZUtzCpuS7vDpaS2DasQQibTMujnwrwmYIWm5LDaazhaCyHbAKTtyTITppXmXN7r9w==
X-Received: by 2002:a05:600c:4ca2:b0:393:eb2e:faaa with SMTP id g34-20020a05600c4ca200b00393eb2efaaamr6016743wmp.206.1650896358597;
        Mon, 25 Apr 2022 07:19:18 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:ce86:3a65:67d7:726d])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d64ca000000b0020aa97b0383sm9144592wri.113.2022.04.25.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 07:19:18 -0700 (PDT)
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
Subject: [PATCH 1/2] Input: mt6779-keypad - fix hardware code mapping
Date:   Mon, 25 Apr 2022 16:19:13 +0200
Message-Id: <20220425141914.158959-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425141914.158959-1-mkorpershoek@baylibre.com>
References: <20220425141914.158959-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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

