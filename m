Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC5576369
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2019 12:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbfGZKXf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jul 2019 06:23:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34537 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfGZKXf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jul 2019 06:23:35 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so18351977pgc.1;
        Fri, 26 Jul 2019 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vy+KcGLywvSXtldrxHurSPKwSpgydiwK45sZFxwJSSA=;
        b=ZZX+j1+GLqOiZCZe44SRIgvt/sKqpR0yspUiWW/FfVzn/IScs7Q/OD4i37oVFgfT58
         MNFz+qO+euHt7eiazkJKceM1RHhraNHjcF4hUeglCHsnTJH+NJdgY3NZAKkphXAlLWkh
         0x6br3QR1WbjlBpvFivakfxlWG/bmSp38vGenbUtVS3UZUvk2giNxuID7YdVAV95MbJH
         KKHFX590XxVZt7uD/GcYVqARGFrSEnVkr6unubIjiiNPJ6n0bGmRXt33R8DOklxhg0Sz
         i/oYrlWJc/pkJErYDe94eGIQ0lMlO19uIFdr/2OjYeqOncjTRvSIE7Sa7u0+zl3ntIDw
         ouLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vy+KcGLywvSXtldrxHurSPKwSpgydiwK45sZFxwJSSA=;
        b=eRATD3WMjtyW6UTKRnd7CSitIVAqS2IoTJkGfj8XS8nFEfSxbuuF9Efhre1JTE5ZnO
         xl0Zd7AdBkn0YZ92VY1pLz15uHv91rhIh/xfORnRNbILsdAbZnK9CcuYR9bwf19PdPl9
         wKSN/xQMPA3cN17lZxpUp6yqrDvVvqFkli7zOXMGyTxKcJbzyOQ9jnn3LmVmWhJ/fbcr
         i1P84lo/Q48/7+xx/yZSNsHtN9EukT/ZgPvt54F9vdq9Gy7Cb41Z2lijr6bWMJ2w3q5o
         WvE1+V1KgXuqopHynYuyS0oKnexe88DICdotJv/s23U/Lq7Yj+O0v2H19jx1PId211EV
         Lqjg==
X-Gm-Message-State: APjAAAVqpdTBVLwgb+L7ltASi2YxiiO7flvPK+lgeuKMDwXchmhb32QL
        efS+U9XyBaTAivitmAM99yc=
X-Google-Smtp-Source: APXvYqx5PONLg7MP5tjqiNTNdhApqL/6abZjxDycSveBBxOEvSjkgUi9REaUcf384+jMJddV1gHxWQ==
X-Received: by 2002:a63:5f09:: with SMTP id t9mr57356468pgb.351.1564136614760;
        Fri, 26 Jul 2019 03:23:34 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
        by smtp.gmail.com with ESMTPSA id l4sm52896146pff.50.2019.07.26.03.23.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 03:23:34 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     dmitry.torokhov@gmail.com, allison@lohutok.net,
        gregkh@linuxfoundation.org, tglx@linutronix.de,
        rdunlap@infradead.org
Cc:     patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH v3] input: touchscreen: wm97xx-core: Fix possible null-pointer dereferences in wm97xx_ts_input_open()
Date:   Fri, 26 Jul 2019 18:23:26 +0800
Message-Id: <20190726102326.9266-1-baijiaju1990@gmail.com>
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

v3:
* Print a message if wm->mach_ops is NULL in wm97xx_init_pen_irq().
  Thank Charles for helpful advice.

---
 drivers/input/touchscreen/wm97xx-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index 0a174bd82915..bf754cb8965c 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -374,6 +374,11 @@ static int wm97xx_init_pen_irq(struct wm97xx *wm)
 {
 	u16 reg;
 
+	if (!wm->mach_ops) {
+		dev_err(wm->dev, "mach_ops is NULL");
+		return -EINVAL;
+	}
+
 	/* If an interrupt is supplied an IRQ enable operation must also be
 	 * provided. */
 	BUG_ON(!wm->mach_ops->irq_enable);
-- 
2.17.0

