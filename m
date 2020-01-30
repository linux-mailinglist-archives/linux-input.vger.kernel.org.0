Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72B0F14E431
	for <lists+linux-input@lfdr.de>; Thu, 30 Jan 2020 21:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgA3UpY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jan 2020 15:45:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35064 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgA3UpY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jan 2020 15:45:24 -0500
Received: by mail-wm1-f68.google.com with SMTP id b17so5993987wmb.0;
        Thu, 30 Jan 2020 12:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aMCqGO6pzPjnIyQyehlTcprRJgNKArYeT/n5QqHWbwU=;
        b=UA36xoDgTEicI4r5nCLrlVqzHgrzXysWdmtx31gNpABAIOsJuk0v+3QP2ouvk+YhlJ
         2vH5O2sWoMbksgVYszFsqclSd+57iH4e84b1rZYInAjYbBEZ3bD/cSuI89kgfOv55bLX
         NBFBagHCc/H8p04ZiSW/y1UWtJn7ulqcvbIcf2Z2F+yMHXZo64R6f6EN9oES1nb5ZFop
         yp1H1NOEdOPvJ/trTWVu4J1nILdWtuvRKVrgETMv/YU66GQfKP2zOk7rC6ioQj0ExDet
         Cc0c3bhHvQftpynu1ab95jQKnIlGs6eTBa2XJ+VhfopEAyaBa6d2x8+DDpVLik0/Iump
         x6kA==
X-Gm-Message-State: APjAAAWhzuxAkSZkufRYW1sOw1krY4VPOuPcTYK9q9xbSQfqYeEu9ais
        dsOyWFrk1iC9IM8oGayxc1mBstDjdGs=
X-Google-Smtp-Source: APXvYqzrgdzJcsprJtbQOSYTQznza0XkNwRyr+mAW4GFha2hvfsajM2WB3HFwV4uoD1PbB+UUbeBsA==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr7380983wmc.111.1580417121978;
        Thu, 30 Jan 2020 12:45:21 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id x7sm8874885wrq.41.2020.01.30.12.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 12:45:21 -0800 (PST)
From:   =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Date:   Thu, 30 Jan 2020 20:45:15 +0000
Message-Id: <20200130204516.4760-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200130204516.4760-1-git@andred.net>
References: <20200130204516.4760-1-git@andred.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

At the moment, enabling this driver without the SNVS RTC driver
being active will hang the kernel as soon as the power button
is pressed.

The reason is that in that case the SNVS isn't enabled, and
any attempt to read the SNVS registers will simply hang forever.

Ensure the clock is enabled (during the interrupt handler) to
make this driver work.

Also see commit 7f8993995410 ("drivers/rtc/rtc-snvs: add clock support")
and commit edb190cb1734
("rtc: snvs: make sure clock is enabled for interrupt handle")
for similar updates to the snvs rtc driver.

Signed-off-by: André Draszik <git@andred.net>
Cc: Anson Huang <Anson.Huang@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Horia Geantă" <horia.geanta@nxp.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
---
 drivers/input/keyboard/snvs_pwrkey.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 2f5e3ab5ed63..c29711d8735c 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -16,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
+#include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
@@ -38,6 +39,7 @@ struct pwrkey_drv_data {
 	int wakeup;
 	struct timer_list check_timer;
 	struct input_dev *input;
+	struct clk *clk;
 	u8 minor_rev;
 };
 
@@ -72,6 +74,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 	struct input_dev *input = pdata->input;
 	u32 lp_status;
 
+	if (pdata->clk)
+		clk_enable(pdata->clk);
+
 	pm_wakeup_event(input->dev.parent, 0);
 
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
@@ -96,6 +101,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 	/* clear SPO status */
 	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
 
+	if (pdata->clk)
+		clk_disable(pdata->clk);
+
 	return IRQ_HANDLED;
 }
 
@@ -140,6 +148,25 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return -EINVAL;
 
+	pdata->clk = devm_clk_get(&pdev->dev, "snvs-pwrkey");
+	if (IS_ERR(pdata->clk)) {
+		pdata->clk = NULL;
+	} else {
+		error = clk_prepare_enable(pdata->clk);
+		if (error) {
+			dev_err(&pdev->dev,
+				"Could not prepare or enable the snvs clock\n");
+			return error;
+		}
+		error = devm_add_action_or_reset(&pdev->dev,
+				(void(*)(void *))clk_disable_unprepare,
+				pdata->clk);
+		if (error) {
+			dev_err(&pdev->dev, "failed to add reset action on 'snvs-pwrkey'");
+			return error;
+		}
+	}
+
 	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
 	pdata->minor_rev = vid & 0xff;
 
-- 
2.23.0.rc1

