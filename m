Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46DF16EAEC
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2020 17:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731134AbgBYQMK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Feb 2020 11:12:10 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42722 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731125AbgBYQMJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Feb 2020 11:12:09 -0500
Received: by mail-wr1-f68.google.com with SMTP id p18so11750019wre.9;
        Tue, 25 Feb 2020 08:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5iVYMAf3KBBmBN8bPXGHIYJDp6KSir9PCdvRV/c4buI=;
        b=ZzuHnvjK7FAcHFoPikOh3iLCFksYqEx1slSgUTeOgKbeVFIevGLfaotmeEgZ2FJmWL
         MVFMUnn/KjtHAm5uGnsn7ITF3knLkMuH0x2oSe6zNWXj8Mxdp4ySYzm3304M54G2UbPV
         STfticLkpBHNF4IX1+ukvxoiMDmHoJlFL6S+Ift7G49JGYJb0I7Z6T8692YK237Srnpi
         ebMVSXaxOVEvVw+FOuAIEOHHnIaQUhl4wAg4no2Te7zRMjBGU22PoPnu67uR+02zeccq
         igN+khRIkvbl9RoHG+h77Cskdlnr8Z9A7cMeaj1rhv4KugcYON6+IJ28r210xbDQm0Hq
         fXAg==
X-Gm-Message-State: APjAAAX8urQfgenqaKTKJXOHGYQKnD4ubgd6pBYNnY4NghBYYOuq1ios
        punWasO0zwckrppBhT4Mg2YWEqHjZYY=
X-Google-Smtp-Source: APXvYqwVFbTeK+gtM5LGRrDz4P5JBGZYNZnTL7U+Ql1eq5kiHsrnuyxsnSA9ZxfS5KEcA0Yx+tY6xw==
X-Received: by 2002:a5d:5647:: with SMTP id j7mr74240686wrw.265.1582647127853;
        Tue, 25 Feb 2020 08:12:07 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id h10sm4757339wml.18.2020.02.25.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 08:12:07 -0800 (PST)
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
Subject: [PATCH v2 4/6] arm64: dts: imx8mq: add snvs clock to pwrkey
Date:   Tue, 25 Feb 2020 16:11:59 +0000
Message-Id: <20200225161201.1975-4-git@andred.net>
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

On i.MX8MM, the SNVS requires a clock. This is similar to the clock
bound to the SNVS RTC node, but if the SNVS RTC driver isn't enabled,
then SNVS doesn't work, and as such the pwrkey driver doesn't
work (i.e. hangs the kernel, as the clock isn't enabled).

Also see commit ec2a844ef7c1
("ARM: dts: imx7s: add snvs rtc clock")
for a similar fix.

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
v2: new patch
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 7f9319452b58..e4ab037183d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -501,6 +501,8 @@
 					compatible = "fsl,sec-v4.0-pwrkey";
 					regmap = <&snvs>;
 					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&clk IMX8MQ_CLK_SNVS_ROOT>;
+					clock-names = "snvs-pwrkey";
 					linux,keycode = <KEY_POWER>;
 					wakeup-source;
 					status = "disabled";
-- 
2.23.0.rc1

