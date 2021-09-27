Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AE841920E
	for <lists+linux-input@lfdr.de>; Mon, 27 Sep 2021 12:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbhI0KP6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Sep 2021 06:15:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:60310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233703AbhI0KP5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Sep 2021 06:15:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94FF660F6C;
        Mon, 27 Sep 2021 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632737660;
        bh=mQhnijdLqalY6BhsW7eBN2/4Zqalyq0/oAzdB9fhxpw=;
        h=From:To:Cc:Subject:Date:From;
        b=pwP/fHycrsr3Pw+INmwN7VNZ7svNlULMbq5Q1/55NzymbXrI+Tt1xAeDk4Hp3alJI
         DM7Un9tKXDNMiXNaPbnQKDjG3s5M3P5I4ZkLNFQX4nDSnbPGKAt5KevuW4SIhIY/dY
         g/fhCJTNl86QA45tttBl1XaYWHAOHj2lHDSz1Y/MvPer9/OBksaoRFfcdRpuUQaIUA
         Dd0jy0XTq+HL/jd6CrZKLFbNP6mdAIlxov1jrZ3TB3U3gD0mHWlb3jVi+D88Io844N
         LZbNSu1kgrxy9YW2+86B/2vohOe2qv+nCIIYxTmtSvgYU1Ksh5RP1Vtsj/kSZybEA8
         Iurt42xiTmYPw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Randy Dunlap <rdunlap@infradead.org>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] [v2] Input: analog - fix invalid snprintf() call
Date:   Mon, 27 Sep 2021 12:14:06 +0200
Message-Id: <20210927101416.1569609-1-arnd@kernel.org>
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
Link: https://lore.kernel.org/all/20210323131456.2600132-1-arnd@kernel.org/
Link: https://lore.kernel.org/all/20210324131959.2089129-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use seq_buf instead of rolling my own

Resending as the second submission somehow got dropped
---
 drivers/input/joystick/analog.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
index 882c3c8ba399..3c17bf202af5 100644
--- a/drivers/input/joystick/analog.c
+++ b/drivers/input/joystick/analog.c
@@ -19,6 +19,7 @@
 #include <linux/input.h>
 #include <linux/gameport.h>
 #include <linux/jiffies.h>
+#include <linux/seq_buf.h>
 #include <linux/timex.h>
 #include <linux/timekeeping.h>
 
@@ -338,23 +339,24 @@ static void analog_calibrate_timer(struct analog_port *port)
 
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

