Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0CD54F2A7
	for <lists+linux-input@lfdr.de>; Fri, 17 Jun 2022 10:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380436AbiFQITO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jun 2022 04:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380282AbiFQITL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jun 2022 04:19:11 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435036832C
        for <linux-input@vger.kernel.org>; Fri, 17 Jun 2022 01:19:10 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id g4so4746306wrh.11
        for <linux-input@vger.kernel.org>; Fri, 17 Jun 2022 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B+0V1FswFhS8JDSDQi560ezRR3egayVm0kqkR8HX1a0=;
        b=CWIw+SKozEYKSjXKiyhkbgZmMOtdHn0KwhrfNy6oyETgyT90moWsaDQWt1xbeWfagr
         GO8BJm/gbXxQnzzNT52jBfNTohTqjzZaJCVaTWUQlOiUX84/vkOFMTMrIuWaau2efh4x
         lTszgI8YDW50cv6K8Yhb9KSr3CnpmQp7uhrCSY/Zwsp7ehnxStnqE1mQD1gw0OvzszGB
         oopBaloytTGS1PaHtnIIaGf/xEmsq9ulEgL2qc5yxcfq0iDVGFFxli9x7TgzN4trFtQK
         AW9haYEXPQTPnBt1PHpi53rud0Tz5cgiROx3gOQqc1G+7FEoGNxis6gOwDN/3uYVSE8e
         8efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B+0V1FswFhS8JDSDQi560ezRR3egayVm0kqkR8HX1a0=;
        b=UgipT+R+f86H5pLW7s0QGgSYoOyWye+4RgKYTsh8+3fqCpfvOgcplvJS7tdv3vgvpm
         kAodfgh5n6pTnQWfI5VblYMj3lZbmmlDofD21s3ikD2fKHx57wFXHn1l+QuJcnVpYaGA
         D4wzHUpObXYkGhbkY6FMW01DUgpVsq0RTSomq18fZfOC48zNeuDeLloKI5uXSWXUXE87
         A0xMfhqegN3lVg4el0Luh6l1twI330dgtJoxzheRZBxk212UtYM2zLdb8PukCEv0sYjA
         GERqNVwswU2Vyl9v27HrwifhuUUQCyBdGZtRCPTuGeQ3CbAk/FEYphe4qG2l/DCGDwGU
         R11A==
X-Gm-Message-State: AJIora8cMW2LkRSkmEjciCSl2lRXY90NPVs8PrDoPrpDnY6IW3yU9cLa
        Uaf9xHqhhhT/5caCpj1t13uI+w==
X-Google-Smtp-Source: AGRyM1ta2q9ocH3+ZlEIO4Zm/dANjzoJkhcNDdzPCDqronR3KId0B5dJhF5i4ZTu2Sx/xXjavxJDVA==
X-Received: by 2002:a5d:570c:0:b0:210:32e1:7250 with SMTP id a12-20020a5d570c000000b0021032e17250mr8269541wrv.368.1655453948779;
        Fri, 17 Jun 2022 01:19:08 -0700 (PDT)
Received: from groot.. ([2a01:cb19:85e6:1900:b8a0:45dd:a367:2e65])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c4f0900b0039db500714fsm4970245wmq.6.2022.06.17.01.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 01:19:07 -0700 (PDT)
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
Subject: [PATCH v3 1/2] Input: mt6779-keypad - match hardware matrix organization
Date:   Fri, 17 Jun 2022 10:19:01 +0200
Message-Id: <20220617081902.2931099-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220617081902.2931099-1-mkorpershoek@baylibre.com>
References: <20220617081902.2931099-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MediaTek keypad has a set of bits representing keys,
from KEY0 to KEY77, arranged in 5 chunks of 15 bits split into 5 32-bit
registers.

In our implementation, we simply decided to use register number as row
and offset in the register as column when encoding our "matrix".

Because of this, we can have a 5x32 matrix which does not match the
hardware at all, which is confusing.

Change the row/column calculation to match the hardware.

Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
Co-developed-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 2e7c9187c10f..bd86cb95bde3 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -42,7 +42,7 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 	const unsigned short *keycode = keypad->input_dev->keycode;
 	DECLARE_BITMAP(new_state, MTK_KPD_NUM_BITS);
 	DECLARE_BITMAP(change, MTK_KPD_NUM_BITS);
-	unsigned int bit_nr;
+	unsigned int bit_nr, key;
 	unsigned int row, col;
 	unsigned int scancode;
 	unsigned int row_shift = get_count_order(keypad->n_cols);
@@ -61,8 +61,10 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 		if (bit_nr % 32 >= 16)
 			continue;
 
-		row = bit_nr / 32;
-		col = bit_nr % 32;
+		key = bit_nr / 32 * 16 + bit_nr % 32;
+		row = key / 9;
+		col = key % 9;
+
 		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
 		/* 1: not pressed, 0: pressed */
 		pressed = !test_bit(bit_nr, new_state);
-- 
2.34.1

