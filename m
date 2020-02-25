Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8CC16EAF8
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2020 17:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731219AbgBYQMY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Feb 2020 11:12:24 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32856 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731127AbgBYQML (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Feb 2020 11:12:11 -0500
Received: by mail-wr1-f66.google.com with SMTP id u6so15440220wrt.0;
        Tue, 25 Feb 2020 08:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e3LiUsdwFrYwevxlo/tz4vkKcjo7pGSKzPtt39owm1w=;
        b=Pa/j9RSPkF+ZT/audkxXrc7qIgzuS3iV9YEvFARLXjkFhOnc115wLQISqPvEnJR21D
         hx8R40jzoGdefDls0ewWpGaHxEiCXk7A0YXeVrzIvY9A4GrMWMSl74Wz2ZQ8KAKoisQH
         xdGvjoLYItXiCaVXw5yed87xeyrwoikKBMeTvZ7UAoG5yIeLkNT1HhYrBvwCiS51OgbU
         5RXpGVXMzjf/sjXsdd3VIeBNANxW1u1krVmaxd4XAcld527WJwRp48zMmEYfSWE0PlWi
         N72YZ7kaSRv9c1JWTA7sHhXcZXdBRntTqNX1sx1qbUdkutEAyP9GlRDrqsO7t+GqF6fi
         aNYg==
X-Gm-Message-State: APjAAAVGqKEScJAxCx0sqonXCRE9n8hZK4xcWsc7ib4BmK8g6NZJ9Pil
        ABhuYbGhcZRviqEEFP+vKaFB+brD+/0=
X-Google-Smtp-Source: APXvYqxg8OI6/QT5oIPTDgdPR6qug+ApccVoWzypMiLSjCLoZ5bHtn7thLRYK6+6Bvk7z0gzN3h8yg==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr71319194wrq.176.1582647128894;
        Tue, 25 Feb 2020 08:12:08 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id h10sm4757339wml.18.2020.02.25.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 08:12:08 -0800 (PST)
From:   =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Robin Gong <yibin.gong@nxp.com>, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org
Subject: [PATCH v2 5/6] Input: snvs_pwrkey - enable snvs clock as needed
Date:   Tue, 25 Feb 2020 16:12:00 +0000
Message-Id: <20200225161201.1975-5-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200225161201.1975-1-git@andred.net>
References: <20200225161201.1975-1-git@andred.net>
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
Cc: "Horia Geantă" <horia.geanta@nxp.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Anson Huang <Anson.Huang@nxp.com>
Cc: Robin Gong <yibin.gong@nxp.com>
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-input@vger.kernel.org

---
v2:
* drop redundant tests and simplify error handling by using
  devm_clk_get_optional()
* add clock handling to imx_imx_snvs_check_for_events()
---
 drivers/input/keyboard/snvs_pwrkey.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 2f5e3ab5ed63..382d2ae82c9b 100644
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
 
@@ -47,7 +49,10 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
 	struct input_dev *input = pdata->input;
 	u32 state;
 
+	clk_enable(pdata->clk);
 	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
+	clk_disable(pdata->clk);
+
 	state = state & SNVS_HPSR_BTN ? 1 : 0;
 
 	/* only report new event if status changed */
@@ -74,11 +79,13 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 
 	pm_wakeup_event(input->dev.parent, 0);
 
+	clk_enable(pdata->clk);
+
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
 	if (lp_status & SNVS_LPSR_SPO) {
 		if (pdata->minor_rev == 0) {
 			/*
-			 * The first generation i.MX6 SoCs only sends an
+			 * The first generation i.MX[6|7] SoCs only send an
 			 * interrupt on button release. To mimic power-key
 			 * usage, we'll prepend a press event.
 			 */
@@ -96,6 +103,8 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 	/* clear SPO status */
 	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
 
+	clk_disable(pdata->clk);
+
 	return IRQ_HANDLED;
 }
 
@@ -140,6 +149,23 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return -EINVAL;
 
+	pdata->clk = devm_clk_get_optional(&pdev->dev, "snvs-pwrkey");
+	if (IS_ERR(pdata->clk))
+		return PTR_ERR(pdata->clk);
+
+	error = clk_prepare(pdata->clk);
+	if (error) {
+		dev_err(&pdev->dev, "failed to prepare the snvs clock\n");
+		return error;
+	}
+	error = devm_add_action_or_reset(&pdev->dev,
+			(void(*)(void *))clk_unprepare,
+			pdata->clk);
+	if (error) {
+		dev_err(&pdev->dev, "failed to add reset action on 'snvs-pwrkey'");
+		return error;
+	}
+
 	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
 	pdata->minor_rev = vid & 0xff;
 
-- 
2.23.0.rc1

