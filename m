Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB1047614C
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2019 10:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfGZItQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jul 2019 04:49:16 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41665 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfGZItQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jul 2019 04:49:16 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so24191545pff.8;
        Fri, 26 Jul 2019 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=n+PSUAMKZPff5zesM1XSMM7/Tungo32ENdBEjQ0MAgI=;
        b=R+u+xDerujiwy7aIwIbcVjK9CQ1elm4f3hHj5YUsgz5N3B/svM8It4NRk7qF59knjA
         Djl0h57yc3oCQLkelcEamnbnJEeiclJ3Xlps59V8c3QC7pDVAR72uqPKvZVRhr9spg6n
         7+/iPOZDqpr1WN4s27NQh6bb2bn/FiX/mjlW5iNmv8j3j3xYVnmDCtKRzNby+E7+PsU9
         fMoZJo2qlicsQWGJCdoFwEH8M/XOoOs/zE/vsKajnli7hgUSiohsOeGk9FgedQeJisYy
         PEf12Gk7ux+Q1KLjgmOFoqVb3VMCDL7ezITkLW9NnA/T3hr5ilXvk0Hf+IzpSYMhaJaN
         45lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=n+PSUAMKZPff5zesM1XSMM7/Tungo32ENdBEjQ0MAgI=;
        b=ER/csp6Od7TabvN+6zdobCVwBArDh/lwTtSWuqa77Lyqa1T7F7PiRsw3I2dy4+JkMN
         +opu6dwQ1ZCDuqsEqmXCyFauMIhfTvRRlnF9UXeHQYmvrpU25OEDANhWp9vWzJcExyX3
         gpIuk90BiRzCADlvFG2ac+nQd9hRCtLb7R01lqKgdgXIlCMscA4NVqJcXU+G2ZsiqnR/
         2GZJ55db/Xo55ixSpgY5/PmSicIX15jPEtSGgQHOpE6esQ/FpRlXi0sEDFueMXRpk1y5
         dOVUfV6ug7ImPWLPGaySFpKRRoep1sTS72KfwClzjDSht3Me0kRzbhz8TL892ZUUuLT2
         XcNQ==
X-Gm-Message-State: APjAAAX2qXeIjsJTNPhfdG+TnO2ER7ndCqHrEwTrLz5Q01lFO/wSduWZ
        /EX5UEi567bRZ+B39xYFnQY=
X-Google-Smtp-Source: APXvYqyDwSQqnyzkZMdYYTiWiZlcCCepKLjpsdlbKywnNPSdWkMsJND3QnJI1qd8YGwKigx9PRIO9g==
X-Received: by 2002:a63:b10f:: with SMTP id r15mr20757387pgf.230.1564130955937;
        Fri, 26 Jul 2019 01:49:15 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
        by smtp.gmail.com with ESMTPSA id 201sm62335492pfz.24.2019.07.26.01.49.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 01:49:15 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        tglx@linutronix.de, allison@lohutok.net, rdunlap@infradead.org
Cc:     patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] input: touchscreen: wm97xx-core: Fix possible null-pointer dereferences in wm97xx_ts_input_open()
Date:   Fri, 26 Jul 2019 16:48:16 +0800
Message-Id: <20190726084816.8487-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In wm97xx_ts_input_open(), there is an if statement on line 507 to check
whether wm->mach_ops is NULL:
    if (wm->mach_ops && wm->mach_ops->acc_enabled)

When wm->mach_ops is NULL, it is used on line 521:
    wm97xx_init_pen_irq(wm);
        BUG_ON(!wm->mach_ops->irq_enable);
        BUG_ON(!wm->mach_ops->irq_gpio);
        wm97xx_reg_write(..., reg & ~(wm->mach_ops->irq_gpio))

Thus, possible null-pointer dereferences may occur.

To fix these bugs, wm->mach_ops is checked before calling
wm97xx_init_pen_irq().

These bugs found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/input/touchscreen/wm97xx-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index 0a174bd82915..f7bd0726a577 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -517,7 +517,7 @@ static int wm97xx_ts_input_open(struct input_dev *idev)
 	wm->ts_reader_interval = wm->ts_reader_min_interval;
 
 	wm->pen_is_down = 0;
-	if (wm->pen_irq)
+	if (wm->pen_irq && wm->mach_ops)
 		wm97xx_init_pen_irq(wm);
 	else
 		dev_err(wm->dev, "No IRQ specified\n");
-- 
2.17.0

