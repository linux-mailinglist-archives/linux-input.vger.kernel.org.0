Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2B77619A
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2019 11:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbfGZJOp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jul 2019 05:14:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35537 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfGZJOo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jul 2019 05:14:44 -0400
Received: by mail-pf1-f193.google.com with SMTP id u14so24235774pfn.2;
        Fri, 26 Jul 2019 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TYiDJjF4yOS8bkmjhmB2OznvRayOVVC1oxEpAkjtmTY=;
        b=I61GsoczxdHQtaJ6fHWGIB4x4LyJFbsdK7l2wJZBTM8JstVMhrNZuzZUEfXnocjdD7
         yVW4nrN9xNDsJYYymIPOQ+1TgmY9cqEMM5hAM7Z0ZnxahB/dFGJJF/FgHKMY2EnmDuF6
         81mqT7wx5lhXqI1xVYHgFcAWk7LWkuwy5fRbvWCIqGo1OvH6nyouRgROWhEciCu9dn3u
         74Gku8Q9fbvNP2dSm5q2L/lflTNBXi8cUXfM5pNrtViUxxcX5B80TvJd7jIbdTi0HDCS
         Fl605ATEigDLBGWTTlGI9lyO1mjTgwt4mma/cMy75D3CMPKpyz6owXurOGVJFwi07FHk
         PJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TYiDJjF4yOS8bkmjhmB2OznvRayOVVC1oxEpAkjtmTY=;
        b=PjsdDRXs6Do+fL3fBaXJdeDmI5jjmNjtdfpPtg3zMJ/vJ4Wv90gtDcT6wtW0DrD+rQ
         56V5MuTFjzWwaS2NBfJgT4Vh5TpqIiZ7E6ZEr0+tKwugoHUewy/pymnlpLrz+GMGT8wQ
         cDGViPJwd0QMYwxYOdjb2lI+WmBBmFLU5xGlCDS7npSgus60JV5ZHRfH4OJ/eB/ypQPO
         SwMwSb2yPloE/+Nh2eSjPMEeZZU9sq1byGo2TnGFK45xCr5iGVTG9JWvM+Vyx+25cYdp
         gyJebwfiUSGd8ngMQt34Wq8JwdPoDjCeq2WiCJwLg0Cs8gafDCYHev3pO2Yk+JA017be
         o1sg==
X-Gm-Message-State: APjAAAVXjNvn/0pmVbrRtaM5WS9b+tqE1qaILmIKdrpkSv+n1GBbvQlz
        gPwNuAFJ0uE1ms6/RW/qcyc=
X-Google-Smtp-Source: APXvYqyzGncQMVpBKteXwxGu8JqgLDcbIaKfg9VkHM8Tr2D5sXtgT/oUseLrE64Vg0RtdqCDvWN0RA==
X-Received: by 2002:a17:90a:1b4a:: with SMTP id q68mr96898848pjq.61.1564132484301;
        Fri, 26 Jul 2019 02:14:44 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
        by smtp.gmail.com with ESMTPSA id g11sm54686920pgu.11.2019.07.26.02.14.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 02:14:43 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     dmitry.torokhov@gmail.com, tglx@linutronix.de,
        gregkh@linuxfoundation.org, allison@lohutok.net,
        rdunlap@infradead.org
Cc:     patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH v2] input: touchscreen: wm97xx-core: Fix possible null-pointer dereferences in wm97xx_ts_input_open()
Date:   Fri, 26 Jul 2019 17:14:36 +0800
Message-Id: <20190726091436.8866-1-baijiaju1990@gmail.com>
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

To fix these bugs, wm->mach_ops is checked at the beginning of 
wm97xx_init_pen_irq().

These bugs found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
v2:
* Add a new check of wm->mach_ops in wm97xx_init_pen_irq().
  Thank Charles for helpful advice.

---
 drivers/input/touchscreen/wm97xx-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index 0a174bd82915..50b016abf492 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -374,6 +374,9 @@ static int wm97xx_init_pen_irq(struct wm97xx *wm)
 {
 	u16 reg;
 
+	if (!wm->mach_ops)
+		return -EINVAL;
+
 	/* If an interrupt is supplied an IRQ enable operation must also be
 	 * provided. */
 	BUG_ON(!wm->mach_ops->irq_enable);
-- 
2.17.0

