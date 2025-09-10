Return-Path: <linux-input+bounces-14584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E822B518A3
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 16:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03EF0189EF98
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 14:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1367B322A2F;
	Wed, 10 Sep 2025 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qCLJgAmD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C337F321424
	for <linux-input@vger.kernel.org>; Wed, 10 Sep 2025 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512767; cv=none; b=JGZY+tjVuHKOV5SFYAGGbAUcDBnBxWuylwan+Z+Zn36CgOZMgVDcDOI1wr8jdjM8e3xNiyjaOlZ/o8i0g+gG17LpGlkThwpsG3esRahH87IgVDlEEZJwoD4haY4wJFH/T4RPQpYAz76gBJgJPAKTssmKFY2eNj4gyAb+n7U+6eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512767; c=relaxed/simple;
	bh=mAnzVAui+Zh2pgPs+xFJHjOfsAlD+iZi1XelY8rp6FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IpdaQ8Np0CwIUJ7RyakbpHBWbaEaxYmu3PPEQ7jiUb1VjcUENfRT+C07bSpeOaZ4HcduTFrJ+XWkrw3Vvu9eGkZn1fbXups4dYeLiFR8OvBGErqbp4JyHKGclr+zC3QbC5YcHhDQnWV/kUUurqmNd4EREmi/Psm1BpDfPrCpCZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qCLJgAmD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b04abcc1356so691635866b.0
        for <linux-input@vger.kernel.org>; Wed, 10 Sep 2025 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512763; x=1758117563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=qCLJgAmDSQTG82uJC/Z/l9e7PThzJ+Bqz6hwkcY03BJ4/6l17K7/AJiUv2L+iRZyNM
         cTeRm+BBGjOLeizkGcmikkm0WDX4PoUmHHHFx2SR7Z7c57aweqdugaaQUVIiM/TQPl8g
         e+DvS1GszZtg5bk9WyjVzNh8Rhl/pb2FQD9+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512763; x=1758117563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=wmihO38EKflq6eTrlI0qVKW98/P+13EnFcDByDK2GM1pEurl9jW78jlozmAQsOnRPn
         WVaHddipo1fU35R9U4l74l2ICuJnQh8OaNJ1W01cfBMEOI4axu3+1NZUmIaUa2tLUzS1
         enhpRhW3mZGA4VIPBcqaMWz13+Q7lVaRuk0K2Ny4YluJFxdVbitC3K6JZTpImtqA4cXc
         No+RStBVGBKyoWp1Z24StdL34+uhPH1WY/ONbKzmNuB2ylqaLcKu+lmwqTgHKXrNBv/P
         Djzg+5zn4ywxwn3hxa42V1VcRyrQZWN99L+QOvnB8/k5knkTvq0dytiDv2KM8hLEESib
         Iz6A==
X-Forwarded-Encrypted: i=1; AJvYcCX4fQVBFTtq+98b/9h9ab1yaE1d8iDIqBr8D/sr92CL2O80snOQjlUYZQfl8GG0I3CjHdMvxi4dGNbCaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4lkobTjxe1x+iPCGnGuni+hwGa42DcV7zsHVTBVXzFQsuUL0E
	ZeqJMgnYrZzFau5G/PoSNfLh8qKLsKxOx7JnD0/x0hqXicmG40VKcq4pcxNltTHM1Bg=
X-Gm-Gg: ASbGnctQzZqUSrII3jKcv5wYQ9eAJXvXGIQKHZbEKMudWEr+BJjFE7v4v2LOwYh8SYd
	ttzFi7eLYzn859uDuOD6mMDILqWZsnHjkaNSWxIErk7rUTpkJ+77yKfErvgaxCcA073X5Q6eOxJ
	EzmKZrCDxcMtMM4Uoen0BRabeDBJoPd39HHL4a+Li5rMm+6JNn5H4spnmFf/Sv1XkSEwS/8o51D
	iCOE6Rf3/dJ/65WzUeZKEPLlL6CTcRNVDTRHgPY6bWt7VYfGCw5TxwVZLtFCm/ZpDMqQyBrJQ5O
	W6++MVrz5YWuv6/vd8WdaPm6yp6Jn/k27B1d0CvC4a2PyoJDdh+IfAuqI5v33CgbXLqJb+P25gq
	0EWBNtdeRRRIcINXuxqgAFwhJ3LjWSbrKZdoNR1rYWL8NcOgpWeC94GpdVYqwmuxxgI+4D/cZ7q
	f8jeGO0pJN9ElQcEkmms/QjeqxF1tBcrGVvwyShbx4A3qr7S+APmM5Msaq+pLBqAPx
X-Google-Smtp-Source: AGHT+IHdweJVzi0li6Hab/FnHQdGRXCIG6Nx0PPgMqfpJ3S+dtaqUO7p5/p1o4bXf82vFHRmV8q+6Q==
X-Received: by 2002:a17:907:1c25:b0:b04:5c90:8013 with SMTP id a640c23a62f3a-b04b173763amr1525363866b.45.1757512762970;
        Wed, 10 Sep 2025 06:59:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:22 -0700 (PDT)
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
Subject: [RESEND PATCH 3/4] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Wed, 10 Sep 2025 15:58:37 +0200
Message-ID: <20250910135916.3939502-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
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


