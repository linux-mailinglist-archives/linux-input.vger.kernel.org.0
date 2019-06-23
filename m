Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2667A4FA82
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 08:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfFWGb6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 02:31:58 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40716 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFWGb6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 02:31:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so5682087pfp.7;
        Sat, 22 Jun 2019 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fsg8cr6mQhG4dr4Q+MgsY02WFUAFbTzHhAJKafUHVk8=;
        b=gniVCEkPm4LEUka8nJ29vElgDkZcMqC4EOmP3aeKTmveRGjR0Lutyl4XrMsdhNIDgn
         hxiWjx5yjx7oiQbzVAo9PHx+79oL4xshXZZF50Cje+2YpaX5ukBw4YNwnUFbgwdm+JkI
         mIDeuxtANkZxG8KeVGNq7JK8WCUYXqnIFUXCP1jjs1NTt9QrSf/06CRMKWelcp+I+Klq
         1BQy7TBONOvHAG6hghzCDY9FGki53333908D2j5WlQBNX1Oq1fZUCRK3AXZEX4aVfuah
         MmjSTpYsqWPOCLyT019yED2bAKARwHMxUBijVAy/nZbPOAknRbepLGgqVZrVTGPbxkwl
         EcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fsg8cr6mQhG4dr4Q+MgsY02WFUAFbTzHhAJKafUHVk8=;
        b=S5p9R9f411AphC+sQeT1ZqaHF8gvLkPYXhauCUlo6D26S8BP5n5cCtyyg3ZC3EF5n8
         gyk6xcBe5aSr/OwMm+hyvP4kLI1cJ/3y3tArEGVLMXoxoRo7V1igSYX+J2q6qIjv+MwH
         OraUurjyTBRIup8IWPCVyv3vz3KJhgGM1rP1Nwh0j84D5faO0vG+zN6AutujDclMGDoW
         plXKqQGzI2jyaNkdbeVJjvm2cZU77Xqh3zLrw1HIgvVBmRB+W6FVhHGfKXObSIY0gzxy
         0KUy/eXeHm5YtZhPFHaOo7iSZ7A4oIn8/E+rtD/ek0WIm/slNufuruKvWJy0Dvl+tA1k
         RefQ==
X-Gm-Message-State: APjAAAUTTEPJiL15wvlcFR66AzhLSVBjpB82are/tjL7RG5hd1LHxxBw
        uy3t7mKHD1g9v8h6PS3i54D2Ohan
X-Google-Smtp-Source: APXvYqz6h+hZLJW9UhIbHs1/trA9Zst1/9rrU+BmQ7fHvjNz1mNogcFapHDpS4JuL+QeM/wlmqF5Hw==
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr17557873pjr.113.1561271516593;
        Sat, 22 Jun 2019 23:31:56 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i14sm10421411pfk.0.2019.06.22.23.31.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 22 Jun 2019 23:31:55 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Benoit Parrot <bparrot@ti.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: edt-ft5x06 - use get_unaligned_be16()
Date:   Sat, 22 Jun 2019 23:31:52 -0700
Message-Id: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of doing conversion by hand, let's use the proper accessors.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index c639ebce914c..ec770226e119 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -27,6 +27,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
+#include <asm/unaligned.h>
 
 #define WORK_REGISTER_THRESHOLD		0x00
 #define WORK_REGISTER_REPORT_RATE	0x08
@@ -239,8 +240,8 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 		if (tsdata->version == EDT_M06 && type == TOUCH_EVENT_DOWN)
 			continue;
 
-		x = ((buf[0] << 8) | buf[1]) & 0x0fff;
-		y = ((buf[2] << 8) | buf[3]) & 0x0fff;
+		x = get_unaligned_be16(buf) & 0x0fff;
+		y = get_unaligned_be16(buf + 2) & 0x0fff;
 		/* The FT5x26 send the y coordinate first */
 		if (tsdata->version == EV_FT)
 			swap(x, y);
-- 
2.22.0.410.gd8fdbe21b5-goog

