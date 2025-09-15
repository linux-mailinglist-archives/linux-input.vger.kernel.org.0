Return-Path: <linux-input+bounces-14746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B9AB5859E
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 21:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ED0D1B25573
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 19:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FD629BDBA;
	Mon, 15 Sep 2025 19:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eLSgs7mf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE29296BA9
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 19:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966043; cv=none; b=rLa6z5QgUPDUQxAdEEdg/4PYPIPEY3DRm+KSRRWsQyZjPUXFXY2zWtydVenMj/z3o43y4XexSYGw8HAqwSPd/O35hcGohqJNwh/HlV5pQSEQQ8BYhLO1pUnqdeEQHhPbav0ZMMduGpFMjROgLbozfmlBtW2vZeoQDuwvxLyut08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966043; c=relaxed/simple;
	bh=PWtJQS5FRtbC8eI744kro5v4M7mGct2HyyMhtJCrfWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qISKSRbtTpjHIcoFtiBu/178kev7xrzRKMWENkznQdWl9ulQWuRzxO2wdsGL4SS4T2K84rPGAjlNb+5sj1VUkGcP/1Fgn45SCT15dqn4oepcS7khTaB5GTDWLFQsZI+iQkjZYw6SaNAq+S1Bj2AXvlEr8WdeYxpXxqr7wLVc+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eLSgs7mf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45f2c9799a3so10222935e9.0
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 12:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966039; x=1758570839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqadXdSW1D0YdX9y/VYCHcP9OLLjsnrvbDdXfqIeuyU=;
        b=eLSgs7mfaHakYzNlHjHaWCqnI9rMMfERSv6b8h+gm4xco03BcA4W+0ChR+AQlbFqc9
         cfLPa0aBCz++dyB1tIEIB29YTCqwsvK/QNzyJwvgkYcwskDLqNqkm6GImb2c8q94bqpV
         lKirCffCdmgJpB1HBgqw8YDCR49gMiiPwe3Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966039; x=1758570839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqadXdSW1D0YdX9y/VYCHcP9OLLjsnrvbDdXfqIeuyU=;
        b=ZLbP58fUAAwzz4WtV6mGI9L4lyDbIFJpeCuD8XGgt6CXq47vXcS7vvPoeMsyHGki1Z
         0pnxXBsnl6vPyPnoARW+3AKzdRYLgoc+CD6m3m7M5eK1XtjFGz/WoRbiPy6XyA5Z65bb
         g0cIAzh8XXC4nb4m5xLfOMIIH4l5vneVjALZl3PFPfL46tpompONvFipFg+0aiXs2wsu
         xUQ9AG9rfGlp9bkvFKaS8h0pOq9BhCzl+QIq/w3PgByggal3oziqG5CtZR0jbT4c83wR
         xp3ztLEopKFVaKz9wqNa9InWEUYQoy0FnGSaXKHG9uwJ/K54BbBvOJWH37v9aRjjs08G
         eCRg==
X-Forwarded-Encrypted: i=1; AJvYcCXDvXisc6Xj26TtvvpRmlj2RJaWOxXK0dkDN1+jhBkxILjz4dt4mVtHDY3kewpCdNB4cdlI8FEPHaTZUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlOhn3J1YTMH/wgRPes1yJkL2yeBLK87/eznjAFHMlBp36pevA
	rcVgN0GZ5sqyQjkg0WtAvp4JUx2UKWkcn9QDb6aGeyqZ/zmDHoVfuk8PKx6hYCY0A1Q=
X-Gm-Gg: ASbGncvCbvAswUqtIH09mDqRhefptcSpV/X3odtEk7UadXto2XXOx4jKFlUOgytqY9L
	Fl98tfdRCA0APYW92DT3Wckg5w5vHgDgogX+MtH2jtlQC/hPhDJnWCf0J2yFtrJd6/lfvFFDQZR
	ls/c6KQhsI0AzjGx5mHN0Xh9rzZo345B2yRXwvDXTsbN2iTLrslxOz1ZeoCeCmiWaOxUe2MndJS
	HFB9SAcbpBuOF/HYQ/8uS2dYLxJVWNOzKaLT6UIgLsRhAa+rRrJdpFu9IuoFGmbKPrakPz4Sfhf
	aBZBhpdRKRNq1WMhPlsZ5/Qu0mgXjrtGCiK8AMxz8ivla9Td0nb5wI9dhE0y9iIChBh3uzEmKbX
	QXaput/3QdRP9zTsSSJeRgEG5ntdW3geJ9/DoTOj2LO97bYsCxrcvNoo9Q1TxYLc=
X-Google-Smtp-Source: AGHT+IFX174NiBczGaK/x3CIfQpHj6Pi6AzSfzk1fSmasGkNMFC1MAnI/pPMBLk/mLUpvLPRyiHwCA==
X-Received: by 2002:a05:600c:4453:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45f211f2fbemr160469475e9.24.1757966039580;
        Mon, 15 Sep 2025 12:53:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v3 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Mon, 15 Sep 2025 21:53:08 +0200
Message-ID: <20250915195335.1710780-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.
- Rework to match changes made to the DTS property.

 drivers/input/touchscreen/imx6ul_tsc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e2c59cc7c82c..0d753aa05fbf 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -79,7 +79,7 @@
 #define MEASURE_SIG_EN		BIT(0)
 #define VALID_SIG_EN		BIT(8)
 #define DE_GLITCH_MASK		GENMASK(30, 29)
-#define DE_GLITCH_2		0x02
+#define DE_GLITCH_DEF		0x02
 #define START_SENSE		BIT(12)
 #define TSC_DISABLE		BIT(16)
 #define DETECT_MODE		0x2
@@ -98,6 +98,7 @@ struct imx6ul_tsc {
 	u32 pre_charge_time;
 	bool average_enable;
 	u32 average_select;
+	u32 de_glitch;
 
 	struct completion completion;
 };
@@ -205,7 +206,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 	basic_setting |= AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, DE_GLITCH_2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
 	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
@@ -391,6 +392,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	int tsc_irq;
 	int adc_irq;
 	u32 average_samples;
+	u32 de_glitch;
 
 	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
 	if (!tsc)
@@ -513,6 +515,26 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "touchscreen-glitch-threshold-ns",
+				   &de_glitch);
+	if (err) {
+		tsc->de_glitch = DE_GLITCH_DEF;
+	} else {
+		u64 cycles;
+		unsigned long rate = clk_get_rate(tsc->tsc_clk);
+
+		cycles = DIV64_U64_ROUND_UP((u64)de_glitch * rate, NSEC_PER_SEC);
+
+		if (cycles <= 0x3ff)
+			tsc->de_glitch = 3;
+		else if (cycles <= 0x7ff)
+			tsc->de_glitch = 2;
+		else if (cycles <= 0xfff)
+			tsc->de_glitch = 1;
+		else
+			tsc->de_glitch = 0;
+	}
+
 	err = input_register_device(tsc->input);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.43.0


