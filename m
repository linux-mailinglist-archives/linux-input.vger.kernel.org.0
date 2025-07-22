Return-Path: <linux-input+bounces-13633-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B723B0D774
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 12:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9C996C48E6
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 10:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0C22DC347;
	Tue, 22 Jul 2025 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="R8lacz1W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0954D2E2660
	for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180641; cv=none; b=dihM1SsX3zY2H+IVwlV1gxUIRrw3c72BcC2nMj16w1phawT/xwmuOCtx1SXkqlaXtai6zSFwTkNZtp68YcgUQGVW42fT4K/xZf7RkYuSWqPYPiAIskx0kq2HzfP7f15ExtYS45P/iCbqwaRFO4NwYCshAW3gMUVYrDezpUGvcgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180641; c=relaxed/simple;
	bh=mAnzVAui+Zh2pgPs+xFJHjOfsAlD+iZi1XelY8rp6FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmvOgXtIGhOvMIsT7Kr6xl0SzUYxFKI3oz5fy6UkomGyEyOpgkJd/EYG5s9yo98H3nczu5uSAozmdhLllXZA/2ABm07dXXM55QUnx/Jnu2hTdFql9uDuGqhdyg56JnYlOPM2FQXVudqgdr1AsekewyrkhM75lHUOV3y0ALlhaSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=R8lacz1W; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae3a604b43bso899810666b.0
        for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180638; x=1753785438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=R8lacz1WPk5aCKoaeN2EZyoqiHYTl8ljgWG15zNWMdAcJCvLgttVFZsYmFka4qMfuK
         KSQGTEk6zhP1N7FWJLrevRncDHyAzt2wVWPhWRW2V023P2yv2PlAjUQbN/1UKKj9wHSS
         zzT1kBByHRGfK6U6w6ZXTcN71i81WN1otjqUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180638; x=1753785438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=KylQ1sPPuzRfm3hPHGWUYW4dd5MV7U7nfr20TEIihFw/1fUPxfkDJl62UHxc9YQF1z
         uDLLlF9CQZSTHbFfjZOAaNn/Yj8FbN4JT9cSF+qmOhMZlNNgx3jneuzmCqiNWtE+s4oz
         JnJdK1fcroVphemi5IQKJ5IiM1qw7EHRdq136TArc6TBIw1ZmZ7o4TfbSBimz3dqyydb
         oO+d2spUfBlF3y/KPvHgUACeXheCc4Zcgwv77YSdiR6me9Dx8eQxWcjUVZtR/W5TzXEQ
         WBG18KLhF+U02dIZszRAB1jBOTGqm9LUqqffiChTONe/Ws/VIIIGFo5th37Uba3P0ppo
         29AA==
X-Forwarded-Encrypted: i=1; AJvYcCWso64ew9f75Grt0iMXLHrEb2viAKOuuXzykYy/S3NzLtkjIipUjnWXSsLCGfOJrEpxqB8YL1MsmWvROQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr3OOe9Bdr8kx/8pOKhFjcx2yk25Ngv8zs00zTEdAdteKhKds3
	xvkj1P7zsSseF6GBvXE1lZid5iOUlCLQJ4Dpyz0f9gZj/CTdvEXbxCFBmeEeCuLKb+U=
X-Gm-Gg: ASbGncsnvKxRgH2E1jwz0HDrIXrV975MQQRPbYJ1C3Tsil6jm/sxDmDNdKcbVbO32Kc
	+1R1XDwjFMXL9F8tmQ/OicaoBy+C8ptbQysf+t1JwTncy4tZmK3W5zmntIP919TayH4UZYc2Apq
	gUgGKzA8XPiYJPBo+oTOL4Ek8aN6nxovzXKmm9aiykEekAMzMVlkZzuQdnRFJltL3WsCfoWrWeB
	n+XpdH9DL4xIIo4HJCtPFLGTGtn3BUnY+nFYUDIqRj+meWBlX3y1PfEzu866F98bH/YAE0xLMoP
	sKEh+MXD2LjJ+Z0fKKwa0QWAS5TVsaVVRlivW/n3Fff2fPf/hpMrOfxExy18t/0pIq/zF3xGEVF
	ZRByMTzI9Udd3qP7j7VoEHaea/Xl0zt/0FdpYdbJ402SnK+ZNbo/0bnk81i8=
X-Google-Smtp-Source: AGHT+IF5XH+ULXAJm2Yd7fdwy7Og8oahMPwKCKBYQfiU9IiXyUwIgGfm5dtLgUZCNSYYUrIZy4YonA==
X-Received: by 2002:a17:907:cb81:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-ae9ce199db0mr2520430366b.53.1753180638060;
        Tue, 22 Jul 2025 03:37:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH 3/4] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Tue, 22 Jul 2025 12:36:17 +0200
Message-ID: <20250722103706.3440777-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the glitch threshold previously hardcoded in the driver. The change
is backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/imx6ul_tsc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index c2c6e50efc54..a6066643bd48 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -7,6 +7,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/slab.h>
@@ -74,7 +75,8 @@
 #define MEASURE_INT_EN		0x1
 #define MEASURE_SIG_EN		0x1
 #define VALID_SIG_EN		(0x1 << 8)
-#define DE_GLITCH_2		(0x2 << 29)
+#define DE_GLITCH_MASK		GENMASK(30, 29)
+#define DE_GLITCH_DEF		0x02
 #define START_SENSE		(0x1 << 12)
 #define TSC_DISABLE		(0x1 << 16)
 #define DETECT_MODE		0x2
@@ -92,6 +94,7 @@ struct imx6ul_tsc {
 	u32 pre_charge_time;
 	bool average_enable;
 	u32 average_select;
+	u32 de_glitch;
 
 	struct completion completion;
 };
@@ -188,13 +191,15 @@ static void imx6ul_tsc_channel_config(struct imx6ul_tsc *tsc)
 static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 {
 	u32 basic_setting = 0;
+	u32 debug_mode2;
 	u32 start;
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
+	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
 	writel(MEASURE_INT_EN, tsc->tsc_regs + REG_TSC_INT_EN);
@@ -501,6 +506,17 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "fsl,glitch-threshold", &tsc->de_glitch);
+	if (err)
+		tsc->de_glitch = DE_GLITCH_DEF;
+
+	if (tsc->de_glitch > FIELD_MAX(DE_GLITCH_MASK)) {
+		dev_err(&pdev->dev,
+			"fsl,glitch-threshold (%u) must be less or equal to %lu\n",
+			tsc->de_glitch, FIELD_MAX(DE_GLITCH_MASK));
+		return -EINVAL;
+	}
+
 	err = input_register_device(tsc->input);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.43.0


