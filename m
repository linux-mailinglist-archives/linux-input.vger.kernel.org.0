Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153B4347971
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 14:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234802AbhCXNUS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 09:20:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:45452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234844AbhCXNUD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 09:20:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2FD961A01;
        Wed, 24 Mar 2021 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616592003;
        bh=mGh+44Zfv/STwMBai++b5B0xWcfoJzMizF1R245Y8sI=;
        h=From:To:Cc:Subject:Date:From;
        b=YDi0CBM5oo7klqsbp9Ce6UHJoraBrwd9JSr492FtnM3WC19t60MaTVxwLc5EQbVD9
         +6aT12A8x5ohAi15GJjwMTaF9IXsNUcbEmdgsJ3TDB7E0m2aa7aKvzRQqXuFxJ4lIn
         wFRuOVioLNX21EqFm+Y7+l0mTg0qEAaQgFnMXfCe+Nkuijcn9Qwt005luWKnrTRgad
         AnlC8jMJWs6tZl9fcL226YK1pClMXUz9nUlxSrh0DtjOIGdWqVRd2C/5CNmL8OYOwO
         6l/Y9yXk9twcRN+2faAiXR5MJiDGnRTdLP1Q6nZPNiV8mD0TCiFC23zmnBDEuC4YOh
         xkPJnroTL5AOA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] Input: analog - fix invalid snprintf() call
Date:   Wed, 24 Mar 2021 14:19:54 +0100
Message-Id: <20210324131959.2089129-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Overlapping input and output arguments to snprintf() are
undefined behavior in C99:

drivers/input/joystick/analog.c: In function 'analog_name':
drivers/input/joystick/analog.c:428:3: error: 'snprintf' argument 4 overlaps destination object 'analog' [-Werror=restrict]
  428 |   snprintf(analog->name, sizeof(analog->name), "%s %d-hat",
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  429 |     analog->name, hweight16(analog->mask & ANALOG_HATS_ALL));
      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/input/joystick/analog.c:420:40: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
  420 | static void analog_name(struct analog *analog)
      |                         ~~~~~~~~~~~~~~~^~~~~~

Change this function to use the simpler seq_buf interface instead.

Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use seq_buf instead of rolling my own
---
 drivers/input/joystick/analog.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
index f798922a4598..087b65ae7585 100644
--- a/drivers/input/joystick/analog.c
+++ b/drivers/input/joystick/analog.c
@@ -19,6 +19,7 @@
 #include <linux/input.h>
 #include <linux/gameport.h>
 #include <linux/jiffies.h>
+#include <linux/seq_buf.h>
 #include <linux/timex.h>
 #include <linux/timekeeping.h>
 
@@ -419,23 +420,24 @@ static void analog_calibrate_timer(struct analog_port *port)
 
 static void analog_name(struct analog *analog)
 {
-	snprintf(analog->name, sizeof(analog->name), "Analog %d-axis %d-button",
+	struct seq_buf s;
+
+	seq_buf_init(&s, analog->name, sizeof(analog->name));
+	seq_buf_printf(&s, "Analog %d-axis %d-button",
 		 hweight8(analog->mask & ANALOG_AXES_STD),
 		 hweight8(analog->mask & ANALOG_BTNS_STD) + !!(analog->mask & ANALOG_BTNS_CHF) * 2 +
 		 hweight16(analog->mask & ANALOG_BTNS_GAMEPAD) + !!(analog->mask & ANALOG_HBTN_CHF) * 4);
 
 	if (analog->mask & ANALOG_HATS_ALL)
-		snprintf(analog->name, sizeof(analog->name), "%s %d-hat",
-			 analog->name, hweight16(analog->mask & ANALOG_HATS_ALL));
+		seq_buf_printf(&s, " %d-hat",
+			       hweight16(analog->mask & ANALOG_HATS_ALL));
 
 	if (analog->mask & ANALOG_HAT_FCS)
-		strlcat(analog->name, " FCS", sizeof(analog->name));
+		seq_buf_printf(&s, " FCS");
 	if (analog->mask & ANALOG_ANY_CHF)
-		strlcat(analog->name, (analog->mask & ANALOG_SAITEK) ? " Saitek" : " CHF",
-			sizeof(analog->name));
+		seq_buf_printf(&s, (analog->mask & ANALOG_SAITEK) ? " Saitek" : " CHF");
 
-	strlcat(analog->name, (analog->mask & ANALOG_GAMEPAD) ? " gamepad": " joystick",
-		sizeof(analog->name));
+	seq_buf_printf(&s, (analog->mask & ANALOG_GAMEPAD) ? " gamepad": " joystick");
 }
 
 /*
-- 
2.29.2

