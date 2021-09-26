Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E064189EF
	for <lists+linux-input@lfdr.de>; Sun, 26 Sep 2021 17:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhIZPWd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Sep 2021 11:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbhIZPWc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Sep 2021 11:22:32 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA43C061570
        for <linux-input@vger.kernel.org>; Sun, 26 Sep 2021 08:20:55 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id x7so43266306edd.6
        for <linux-input@vger.kernel.org>; Sun, 26 Sep 2021 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SUtl4KaA0gQaAh/0S0kv+mfIE4z7L+9aOLKke40OQe0=;
        b=Ofl3R0AR4/v4x6pfLqo7J4pQ5OMmohGXFziiEC8q6qh9m09nvpChYQlP1UksmKe9LM
         tU9cJBebAPBI06L+nxyXU3/drGW5nWX5ZkeB1WhlNiTkFJX9Zc5du/l3EjimZmnw3GtJ
         Y7CvFGTvlbC7WFVObrhefhqszESzPFRytF7rbmDbQRda+yG726GNPVkZv4qOaAxKxt/3
         TiSwocrfTQAqhqbN2hggtJ8j6fPnjC3avXDRqCeS7zwvLMrrDOTvvNsPXgwSB9v7Z0oj
         I0w0s1ZXMen+1vTTB41vk/m3mf+rhadXr0bBtCid25m2GW2YPOCfAlNJox1JrZQBlsNU
         CH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SUtl4KaA0gQaAh/0S0kv+mfIE4z7L+9aOLKke40OQe0=;
        b=Ui+gc+G3A5QlWXLmPl86tRJYQ/wfQZONPx89+MkC8UmJua8GPdrzkYIklHg/ziZ5yk
         wXn+7OGoBcdK7ikHhSCMBF44dhIV8zKY0PKU8LKZrJOmXAZrplHTPsq6pTp/rqiHUHkC
         ZgdXUpKfYVbG9Pi7TBt5eI7UzHCx2/0Zurz2QxemOTSAa6F7qrILpVkJtNuVD+iRr6zb
         in5+iYLH5uNVRAgOz346hl/HL27zmIOTUdbqsNaEKpoNvVIt02lkQrsN3x9rtEVFBoPX
         1Ih7TW7GBGsl0HkqMye01v2dV/2WMVNodzBAsGXN6Rjjsvav7ezmWztR7ARw61U2uCZX
         6f2A==
X-Gm-Message-State: AOAM531mpVlYOU7PPGo9ztFU2B0euS/e1mRkhLz92qCyLvH7uJzp9L/L
        DWmhQYPumw3ElrgntvzgftLPBwvXFLpEkw==
X-Google-Smtp-Source: ABdhPJzImYPkv3SKkI4sNSs46JZ0H1xItvE8hnJcnf+FP7X/rSpnBOOZkBwLwlqqMoyJhCnSz8rBLA==
X-Received: by 2002:a50:d80e:: with SMTP id o14mr18226203edj.49.1632669653786;
        Sun, 26 Sep 2021 08:20:53 -0700 (PDT)
Received: from dfj.1.1.1.1 ([87.13.101.122])
        by smtp.gmail.com with ESMTPSA id ba29sm9131320edb.5.2021.09.26.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 08:20:53 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] input: keyboard-matrix: add a function to reset input states
Date:   Sun, 26 Sep 2021 17:18:47 +0200
Message-Id: <20210926151847.337767-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In some cases, at open(), when matrix_keypad_start() schedules
matrix_keypad_scan(), some events may be fired, but they can't be
grabbed from the event queue by evtest later on, since this
condition causes a continuous event triggered.

Add a function to get (and align) button states at open without
firing events at open stage.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 drivers/input/keyboard/matrix_keypad.c | 37 ++++++++++++++++----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 30924b57058f..ce8cb09ee333 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -108,6 +108,24 @@ static void disable_row_irqs(struct matrix_keypad *keypad)
 	}
 }
 
+static inline void matrix_get_keys_state(struct matrix_keypad *keypad,
+					 uint32_t *states)
+{
+	int row, col;
+	const struct matrix_keypad_platform_data *pdata = keypad->pdata;
+
+	states = states ?: keypad->last_key_state;
+
+	/* assert each column and read the row status out */
+	for (col = 0; col < pdata->num_col_gpios; col++) {
+		activate_col(pdata, col, true);
+		for (row = 0; row < pdata->num_row_gpios; row++)
+			states[col] |=
+				row_asserted(pdata, row) ? (1 << row) : 0;
+		activate_col(pdata, col, false);
+	}
+}
+
 /*
  * This gets the keys from keyboard and reports it to input subsystem
  */
@@ -126,17 +144,7 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 	memset(new_state, 0, sizeof(new_state));
 
-	/* assert each column and read the row status out */
-	for (col = 0; col < pdata->num_col_gpios; col++) {
-
-		activate_col(pdata, col, true);
-
-		for (row = 0; row < pdata->num_row_gpios; row++)
-			new_state[col] |=
-				row_asserted(pdata, row) ? (1 << row) : 0;
-
-		activate_col(pdata, col, false);
-	}
+	matrix_get_keys_state(keypad, new_state);
 
 	for (col = 0; col < pdata->num_col_gpios; col++) {
 		uint32_t bits_changed;
@@ -202,10 +210,11 @@ static int matrix_keypad_start(struct input_dev *dev)
 	mb();
 
 	/*
-	 * Schedule an immediate key scan to capture current key state;
-	 * columns will be activated and IRQs be enabled after the scan.
+	 * Reset current key state and activate columns and IRQs.
 	 */
-	schedule_delayed_work(&keypad->work, 0);
+	matrix_get_keys_state(keypad, NULL);
+	activate_all_cols(keypad->pdata, true);
+	enable_row_irqs(keypad);
 
 	return 0;
 }
-- 
2.32.0

