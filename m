Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027692D4E84
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 00:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgLIXJz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 18:09:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbgLIXJz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 18:09:55 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5F9C0613CF;
        Wed,  9 Dec 2020 15:09:14 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w5so1581909pgj.3;
        Wed, 09 Dec 2020 15:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=RllWjXmt24+TR71iaZkso9VeRpDv2hfIa/LswWV4QMM=;
        b=pybgsXa/SwpSGRNtfyTJe/9ribuitvtHQM7OfiXiNg/Y5qSmkr0bvRuRDj6tQ38nS7
         sQsq/G762XhtkbL1+KRDGUWB166ZYkK558C0XpcJPS+RIiwmDcmaDCr/zi1pZehugIWe
         xblZ+CYMo4Ky2cYGWhj8j/gZRL9WDZFiKKMxv+m1V9oqsp/qlnbt/WkBdghGGkJBlhkt
         eChO7aT3bloG4FmioJxVtYOBg/d8xVppPQosGydLwvWZqRhLXhMy0mGxEH+hKCxUHuoc
         6Pt/2xCQ3QCrrHq1PzpDrWqTPguLQHsTKw2RfIahLbOJeUdwQxCRjJWL2BRKqzhpvE3H
         /s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=RllWjXmt24+TR71iaZkso9VeRpDv2hfIa/LswWV4QMM=;
        b=GqyJX3Nx7B/1wmUxppT3+GppYAk9DKYhmHBoXjG6vO8fnzbQG5dPXYg3N/lCEUOTMx
         Z+agvUjp+M3Fl4x75vAE2+B23tHH7uBwQpu5qffjUhhSNiMXaBe8lWmC8e6txSqM739N
         14GEyZsZMaSr7J0cSYumL4VV/s0NwFzRV2N0U9k/P0prs2I10TLTPJ8fDsvSYzAC8Mm5
         F23w1+zD9/YYGj8b4+KJqHicmbbfIDxpKr8TtMrK3NGTSYKuuK37RP5Je5lAQ/upKacA
         fbnQ8ht3KuPWqyX/X19JcSVcCwBSOKabPklbJL3Ev7Hu5XNrDtCu1j4mPyz288dTwIWC
         agLw==
X-Gm-Message-State: AOAM532h0y2PF7MK/UcEgP+wOMkLBlot2KnJpnaS6aa5K3V2+IlqjrRA
        3p38UiG+pzFOggviQoV/0TLOFWv3EAY=
X-Google-Smtp-Source: ABdhPJzMDxGbz/ewirIQgmz5g0n3asex8tyE3wz4eYgqgVctqnk6HlwtVnehOR+rOBb2iur0z/7rWQ==
X-Received: by 2002:a05:6a00:acc:b029:198:2ba6:c0f6 with SMTP id c12-20020a056a000accb02901982ba6c0f6mr4226061pfl.53.1607555354006;
        Wed, 09 Dec 2020 15:09:14 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id r15sm3589246pgn.26.2020.12.09.15.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 15:09:12 -0800 (PST)
Date:   Wed, 9 Dec 2020 15:09:10 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Simon Budig <simon.budig@kernelconcepts.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: edt-ft5x06 - consolidate handling of number of
 electrodes
Message-ID: <X9FZFs3NZADoIhhH@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of using special-casing retrieval of number of X/Y electrodes
based on the firmware, let's select default values and mark registers as
non-existent on firmwares that do not support this operation.

Also mark "report rate" register as non-existent for generic firmwares as
having it set to 0 does not make sense.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 43 ++++++++++----------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 6ff81d48da86..2eefbc2485bc 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -69,6 +69,9 @@
 #define EDT_RAW_DATA_RETRIES		100
 #define EDT_RAW_DATA_DELAY		1000 /* usec */
 
+#define EDT_DEFAULT_NUM_X		1024
+#define EDT_DEFAULT_NUM_Y		1024
+
 enum edt_pmode {
 	EDT_PMODE_NOT_SUPPORTED,
 	EDT_PMODE_HIBERNATE,
@@ -977,8 +980,7 @@ static void edt_ft5x06_ts_get_defaults(struct device *dev,
 	}
 }
 
-static void
-edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
+static void edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
 {
 	struct edt_reg_addr *reg_addr = &tsdata->reg_addr;
 
@@ -997,21 +999,17 @@ edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
 	if (reg_addr->reg_report_rate != NO_REGISTER)
 		tsdata->report_rate = edt_ft5x06_register_read(tsdata,
 						reg_addr->reg_report_rate);
-	if (tsdata->version == EDT_M06 ||
-	    tsdata->version == EDT_M09 ||
-	    tsdata->version == EDT_M12) {
+	tsdata->num_x = EDT_DEFAULT_NUM_X;
+	if (reg_addr->reg_num_x != NO_REGISTER)
 		tsdata->num_x = edt_ft5x06_register_read(tsdata,
 							 reg_addr->reg_num_x);
+	tsdata->num_y = EDT_DEFAULT_NUM_Y;
+	if (reg_addr->reg_num_y != NO_REGISTER)
 		tsdata->num_y = edt_ft5x06_register_read(tsdata,
 							 reg_addr->reg_num_y);
-	} else {
-		tsdata->num_x = -1;
-		tsdata->num_y = -1;
-	}
 }
 
-static void
-edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
+static void edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 {
 	struct edt_reg_addr *reg_addr = &tsdata->reg_addr;
 
@@ -1041,22 +1039,25 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 
 	case EV_FT:
 		reg_addr->reg_threshold = EV_REGISTER_THRESHOLD;
+		reg_addr->reg_report_rate = NO_REGISTER;
 		reg_addr->reg_gain = EV_REGISTER_GAIN;
 		reg_addr->reg_offset = NO_REGISTER;
 		reg_addr->reg_offset_x = EV_REGISTER_OFFSET_X;
 		reg_addr->reg_offset_y = EV_REGISTER_OFFSET_Y;
 		reg_addr->reg_num_x = NO_REGISTER;
 		reg_addr->reg_num_y = NO_REGISTER;
-		reg_addr->reg_report_rate = NO_REGISTER;
 		break;
 
 	case GENERIC_FT:
 		/* this is a guesswork */
 		reg_addr->reg_threshold = M09_REGISTER_THRESHOLD;
+		reg_addr->reg_report_rate = NO_REGISTER;
 		reg_addr->reg_gain = M09_REGISTER_GAIN;
 		reg_addr->reg_offset = M09_REGISTER_OFFSET;
 		reg_addr->reg_offset_x = NO_REGISTER;
 		reg_addr->reg_offset_y = NO_REGISTER;
+		reg_addr->reg_num_x = NO_REGISTER;
+		reg_addr->reg_num_y = NO_REGISTER;
 		break;
 	}
 }
@@ -1195,20 +1196,10 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	input->id.bustype = BUS_I2C;
 	input->dev.parent = &client->dev;
 
-	if (tsdata->version == EDT_M06 ||
-	    tsdata->version == EDT_M09 ||
-	    tsdata->version == EDT_M12) {
-		input_set_abs_params(input, ABS_MT_POSITION_X,
-				     0, tsdata->num_x * 64 - 1, 0, 0);
-		input_set_abs_params(input, ABS_MT_POSITION_Y,
-				     0, tsdata->num_y * 64 - 1, 0, 0);
-	} else {
-		/* Unknown maximum values. Specify via devicetree */
-		input_set_abs_params(input, ABS_MT_POSITION_X,
-				     0, 65535, 0, 0);
-		input_set_abs_params(input, ABS_MT_POSITION_Y,
-				     0, 65535, 0, 0);
-	}
+	input_set_abs_params(input, ABS_MT_POSITION_X,
+			     0, tsdata->num_x * 64 - 1, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y,
+			     0, tsdata->num_y * 64 - 1, 0, 0);
 
 	touchscreen_parse_properties(input, true, &tsdata->prop);
 
-- 
2.29.2.576.ga3fc446d84-goog


-- 
Dmitry
