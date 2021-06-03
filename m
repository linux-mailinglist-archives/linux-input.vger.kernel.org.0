Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17AAB399935
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 06:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhFCEjh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 00:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhFCEjg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 00:39:36 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44738C061756;
        Wed,  2 Jun 2021 21:37:37 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id n12so4132832pgs.13;
        Wed, 02 Jun 2021 21:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WU0LMmPiA/gi0hM1H/SSB6uKAA2ksvr9jOLLh3Q1VC4=;
        b=PoBAZd9LjCGkhI6W80kOeVbhM+dzv1hren2aAuCgtyloMl1WRD1Jh28mmm11H5VOeS
         yaK2jNEPVvykLSQvKfUwxI5RZRqD81opJbPDn+ayL//W3hiBQWtUi6HdYLNM7mZNB9T8
         sXe4R8Wc89OVsUsJLzvBGWvvSJ5S+uDsCBIooQrT+YxbwivB+mC/obaYkGso9LbyP46s
         vmVmGiqr2u18uFkDzw2hASwP7nWa954+Yy2CLY+crQ4oEvTolkyehkjB6aRkW+USXfLd
         MdFX/YbCUq0kc3t+oEGTGFOdRHSsVgc+SV96ggkSFxoLvtqvwmGgcNdUFlp5gzzkqImu
         gxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WU0LMmPiA/gi0hM1H/SSB6uKAA2ksvr9jOLLh3Q1VC4=;
        b=UCLpafpzpeIs0A+Uq+Q7BH8pQcxLiYSScENKyYVWqEYH+fxgdZlX4RJfNRSrfS4rza
         0EPs98ezTiz0Jln9dxxNlth2VDEiwAFs3hg7d+kVIhFzqqeX+YehiHvn/BWPPyyfkHkS
         6QQGB/VdaF6X5eKi1KENv+0rx0IRPsj/y2kZKO2evCzVaNRp9D3Qb6eHFIBjEoch7rXP
         25r5yTMmPNaIp3v/5k2xAqiPMQzxvSGWqMT9Yu8M2IwkNueDiooAnXCA+7Fazmiia7Sd
         7TLwko7TXH8xmGZHvd94sa3nh0NXje2b7LS1FR2zooZTZ/MZelfKBBAiRVEpdLhGHRCy
         R9FA==
X-Gm-Message-State: AOAM533wQUdOSWlbSaR3ameObCMDqyG2Q4WXT8UxXWtMfOHgWngMTYF5
        iBqZiM44/+sNhit4Bp75n/TYhycoZdo=
X-Google-Smtp-Source: ABdhPJxvAIF8ytZpOT8dCAssGtufK0Y9Pm0gOMj9TDstxB14NSuGx52vXN0nSthbo/bGEHffsGu5dw==
X-Received: by 2002:a05:6a00:cd3:b029:27f:c296:4a5d with SMTP id b19-20020a056a000cd3b029027fc2964a5dmr30366150pfv.38.1622695056331;
        Wed, 02 Jun 2021 21:37:36 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id f28sm1132414pgb.12.2021.06.02.21.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 21:37:35 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] Input: cy8ctmg110_ts - use endian helpers when converting data on wire
Date:   Wed,  2 Jun 2021 21:37:24 -0700
Message-Id: <20210603043726.3793876-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Switch to using be16_to_cpup() instead of shifting and combining data by
hand.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cy8ctmg110_ts.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index f8d7ab3b6c25..33c1360a251c 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/gpio.h>
 #include <linux/input/cy8ctmg110_pdata.h>
+#include <asm/byteorder.h>
 
 #define CY8CTMG110_DRIVER_NAME      "cy8ctmg110"
 
@@ -111,7 +112,6 @@ static int cy8ctmg110_touch_pos(struct cy8ctmg110 *tsc)
 {
 	struct input_dev *input = tsc->input;
 	unsigned char reg_p[CY8CTMG110_REG_MAX];
-	int x, y;
 
 	memset(reg_p, 0, CY8CTMG110_REG_MAX);
 
@@ -119,16 +119,15 @@ static int cy8ctmg110_touch_pos(struct cy8ctmg110 *tsc)
 	if (cy8ctmg110_read_regs(tsc, reg_p, 9, CY8CTMG110_TOUCH_X1) != 0)
 		return -EIO;
 
-	y = reg_p[2] << 8 | reg_p[3];
-	x = reg_p[0] << 8 | reg_p[1];
-
 	/* Number of touch */
 	if (reg_p[8] == 0) {
 		input_report_key(input, BTN_TOUCH, 0);
 	} else  {
 		input_report_key(input, BTN_TOUCH, 1);
-		input_report_abs(input, ABS_X, x);
-		input_report_abs(input, ABS_Y, y);
+		input_report_abs(input, ABS_X,
+				 be16_to_cpup((__be16 *)(reg_p + 0)));
+		input_report_abs(input, ABS_Y,
+				 be16_to_cpup((__be16 *)(reg_p + 2)));
 	}
 
 	input_sync(input);
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

