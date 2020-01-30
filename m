Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED4914E436
	for <lists+linux-input@lfdr.de>; Thu, 30 Jan 2020 21:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbgA3Up0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jan 2020 15:45:26 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41841 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbgA3UpZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jan 2020 15:45:25 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so5820773wrw.8;
        Thu, 30 Jan 2020 12:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ieWAQTrOem5SRCTrltmfG6dgZLD+sBaJH9/U+lcfZjk=;
        b=aMBF2zKEbx9veZdKawIcTaBy+201a6IZidPg2le9miaRo2O6ggXD1t1GFVx1WiXewo
         GwvavFunI1UMP54qrnnaUx3rG0WGQNOEaoAwmkHHDFdzZXViH3sX/0J3gU29OeVp49FA
         ugPbMUfdNF1q0dgs3z1A0mTMckk3o9hVkyShNEUZZEe9A/M+7nTAfvXE2K36G0zUOJuy
         DmwMXs+Y765Fb4iM0FNSUYMkfQulWLwunCxj8KtdbfCtLSWF1ceerjCaIh3bTfoOW8XT
         4jUIlaSduCLAmshZyEZL0qV0/MqZAPNBK8A+m8oV09IVj/20nIsdDgwFUOzjw9yC8YeC
         8qTg==
X-Gm-Message-State: APjAAAXLmIATy1grgoZoKGQ5nRVc2X8xozH2aIPdMacUWqNSSoVmMQVU
        jf3UkcHpt8AgKVb5VzWLWFLchBCq0a0=
X-Google-Smtp-Source: APXvYqzffeOZN5v031xJHMCR8/A2sYa+jJ+fAZHoBGPXzSZH5J0cKA5elfcwn4kPbGf9RhXNEadMKw==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr6962723wrv.180.1580417122955;
        Thu, 30 Jan 2020 12:45:22 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id x7sm8874885wrq.41.2020.01.30.12.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 12:45:22 -0800 (PST)
From:   =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 3/3] Input: snvs_pwrkey - only IRQ_HANDLED for our own events
Date:   Thu, 30 Jan 2020 20:45:16 +0000
Message-Id: <20200130204516.4760-3-git@andred.net>
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

The snvs_pwrkey shares the SNVS LPSR status register with the snvs_rtc.

This driver here should only return IRQ_HANDLED if the status register
indicates that the event we're handling in the irq handler was genuinely
intended for this driver. Otheriwse the interrupt subsystem will
assume the interrupt was handled successfully even though it wasn't
at all.

Signed-off-by: André Draszik <git@andred.net>
Cc: Anson Huang <Anson.Huang@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-input@vger.kernel.org
---
 drivers/input/keyboard/snvs_pwrkey.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index c29711d8735c..9f51bcc5b5fd 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -80,7 +80,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 	pm_wakeup_event(input->dev.parent, 0);
 
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
-	if (lp_status & SNVS_LPSR_SPO) {
+	lp_status &= SNVS_LPSR_SPO;
+
+	if (lp_status) {
 		if (pdata->minor_rev == 0) {
 			/*
 			 * The first generation i.MX6 SoCs only sends an
@@ -96,15 +98,14 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 			mod_timer(&pdata->check_timer,
 			          jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
 		}
-	}
 
-	/* clear SPO status */
-	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
+		regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
+	}
 
 	if (pdata->clk)
 		clk_disable(pdata->clk);
 
-	return IRQ_HANDLED;
+	return lp_status ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static void imx_snvs_pwrkey_act(void *pdata)
-- 
2.23.0.rc1

