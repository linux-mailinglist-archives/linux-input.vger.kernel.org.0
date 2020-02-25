Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81A5316EAF5
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2020 17:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731207AbgBYQMS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Feb 2020 11:12:18 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39694 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731152AbgBYQMM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Feb 2020 11:12:12 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so6593339wrn.6;
        Tue, 25 Feb 2020 08:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PehnyNjd4V5FhnMmSN6y9oe+uTRnJaBKHZh2ORrfGyg=;
        b=gPQa0Z4JPLDPGFO8t30CmgnRqeUMugK4I5dLRkwKFRy9tZizE6o7L/Ha0Cs4tJhxBx
         UtIlgSwDoke78zcgfFzRvQRD/qHFuXCBq6GCR0VYqjzjZo04+e2uB2gQXfJrJR56Ngyw
         wngWh7dQJ09gFe41rAAtUbcOvMBQ9J+VGSoeCQXqqLa7ZIETW5NIQPe5qdfGyyEevDSw
         bR8I1pB71H73c1V+5XmcwOjtbqhZAUHVMllolzC2iW0D9sgei93FwY6q0CnYDvblVU6z
         LEXME1OFFfI73nRau5ELAwvicIZ976ltSfp4g/D5aohDUq+4eDt/y1K2uE0arHMXLj2Q
         xt+w==
X-Gm-Message-State: APjAAAXutaii6yCyAIxY0hEz35TkX47kZWg+It/POlp1eBpSxOMCxczm
        7oJD/buNUnkonPuJwZTNVcPjHToG+/U=
X-Google-Smtp-Source: APXvYqxfwPA8/K18hEK9dZ/LbLLqMQ/rHwxFMS0s62Mkl/7CuOWqsdN/CRTQmIRNx5EexFElK7Lrzg==
X-Received: by 2002:adf:cd11:: with SMTP id w17mr77166388wrm.66.1582647129944;
        Tue, 25 Feb 2020 08:12:09 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id h10sm4757339wml.18.2020.02.25.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 08:12:09 -0800 (PST)
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
Subject: [PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our own events
Date:   Tue, 25 Feb 2020 16:12:01 +0000
Message-Id: <20200225161201.1975-6-git@andred.net>
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

The snvs_pwrkey shares the SNVS LPSR status register with the snvs_rtc.

This driver here should only return IRQ_HANDLED if the status register
indicates that the event we're handling in the irq handler was genuinely
intended for this driver. Otheriwse the interrupt subsystem will
assume the interrupt was handled successfully even though it wasn't
at all.

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
* no changes
---
 drivers/input/keyboard/snvs_pwrkey.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 382d2ae82c9b..980867886b34 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -82,7 +82,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 	clk_enable(pdata->clk);
 
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
-	if (lp_status & SNVS_LPSR_SPO) {
+	lp_status &= SNVS_LPSR_SPO;
+
+	if (lp_status) {
 		if (pdata->minor_rev == 0) {
 			/*
 			 * The first generation i.MX[6|7] SoCs only send an
@@ -98,14 +100,14 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 			mod_timer(&pdata->check_timer,
 			          jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
 		}
-	}
 
-	/* clear SPO status */
-	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
+		/* clear SPO status */
+		regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
+	}
 
 	clk_disable(pdata->clk);
 
-	return IRQ_HANDLED;
+	return lp_status ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static void imx_snvs_pwrkey_act(void *pdata)
-- 
2.23.0.rc1

