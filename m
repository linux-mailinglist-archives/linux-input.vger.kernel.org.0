Return-Path: <linux-input+bounces-15011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B235BB96591
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 16:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4721D188A1F5
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 14:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C692E11B8;
	Tue, 23 Sep 2025 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="at2RdAaO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9792690D9
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638283; cv=none; b=bvlKrs5le5e0Etyg/2u+cjRFfvzQrLoRs1N7Brf7BeyOUKT2W9Ym6AwZAKsLfTzFM2K3TDJdunpYRd7jXhjr1V9/SLw5xchTiBIVLro7ZVrErafquYGY/hb1zKp2Q0amuMj1K2i1vybJBWRHFCshhj277sctfk/QzbKLO8CqEmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638283; c=relaxed/simple;
	bh=cVdvKFAidRA798hHdWHXhbSX4GS5WDwzy360IlmoSTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QsbiYiYb2FdkyZmPASESVXbM38lDopRxKCwJnsDHNI2DFYmja2B2mmJc9Q2g60VJP4uumKMmF92KPnQr/1EQYcEiE5R1WtPTwZELQtMIdp+4CZqh6ubaDWocvLwMBieqPt4EODCbk6z6JYDOLMloKtlmoOSYSW7B/yzcbyHOvA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=at2RdAaO; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so9635907a12.3
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638278; x=1759243078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1NZM4v8G7kVFRobZkkcSJXgVxob1GWmO5LhOiwNAgs=;
        b=at2RdAaO493br7CLtqAGzJucOw+OYmLFLVbhked+iMNsITm0rH6mRvhs1krmmDzZJg
         ihD5nl+9v+tIfBSCJGKQ3fQljI5S9i9m758aqhY3bLxgGL5VVwwdOEnalvxA9wAGbXbq
         hwXyHtObCVlqiqhsgB0vQcMNUOl6Ah03mSq6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638278; x=1759243078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1NZM4v8G7kVFRobZkkcSJXgVxob1GWmO5LhOiwNAgs=;
        b=JQhiaYLAGTm67+hpf7tEtyJkXuGJ63jzSajnjsVGYuf3TpHaFpcFdxE/iYFnpxy4Rz
         jzMO/QnI10Cfw2Kk/vFHGGA7CAtfly7dISVlZc9MieiCLWo6Fz6xAhK7gPxhFYX+g0Db
         ttIkjHwBygDGJ/vbuVVAve1gqIVAz79/UcyJ8Gzn26XW7wwggzYHv9N7aU9PkIp5gD+J
         itinvyQsSNVNWcwrf6gDlqGQ9q56VdEa+kbZ7YkpZL3i3g5OXm7vKsJ/yF2pQEZxQPGy
         yWBsk3nvp3FSphJ47iPnk/6gTFuTKI5vi+Uq3jN5+1HrnL6KGPH7H4tp3hAjykB0xf8a
         cZuA==
X-Forwarded-Encrypted: i=1; AJvYcCUuovCBPjaZt/fIXsfmjiSnz0cHRgpBpax9rbvAJPOg5ErU8gKpBwA+zkziPa4o91Sz4QUSx4ZAQ3ctPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLG50RC7ji5ho60qX/l2CglLEL1IJC/OyETr0RLTrZWFb/mMXB
	DknTtxIhprOW0sYz7xlKRpJKQDasCDMHR/jYm2+uP8Wmc19a11ZLGlfX0FURzOuZF5g=
X-Gm-Gg: ASbGncsSGRUYbbsy7uJy6tzfcKdHiD10jeD+CbC4VtKmMgiuj+vClbUVgg1+5yCl/xt
	cePA9a4ZJZvOWcPTrxzJV1QLRGa7PwTapwmKLzQvW1M8E3V3keJAR59sEDqhTsLEmwElLOoubpM
	GBw+TNU86BfY0hwGm7UGG8dggSAr2vMl/6eVrsqhnCy3AYIweASULriABdFUpMBodlSqjUurZ+9
	CMHdowc7LWL6iPGKKvAVAvbLV+nca5TNPpBDc2mOz7RegGcn2eoZ4revKBF8n6bdxQuZlqgdXHc
	e/KXCNlII1J+XLaK9XDgFkMdUJWPCG0FMWYaCQn5dRM53OKE+LL324DFZY83XDZinBA2y09CKNZ
	fAd4pHuYHJZ3a7HjROUiJTIHm47uWn2jnQwKoVThXC/uXb8PP5LtOqVsok95gNy6NNVpxhg+ENr
	OnjqMZk8Xh6l13dYiskH7f6oKpLyshtT1Ybp7Bss7jlZ3E1N/N45p8XHlJeD96b40Z
X-Google-Smtp-Source: AGHT+IEUmE6xkdZeJdkLL9TsBhYJubk/EzndUqe5eNZwoBqgNfIIOlpziTlRhmGHtKqRgY6aB2HfsQ==
X-Received: by 2002:a17:907:7b91:b0:b2c:3967:eb71 with SMTP id a640c23a62f3a-b30268949e6mr298598066b.3.1758638278355;
        Tue, 23 Sep 2025 07:37:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Tue, 23 Sep 2025 16:37:37 +0200
Message-ID: <20250923143746.2857292-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set the glitch threshold by DTS property and keep the existing default
behavior if the 'debounce-delay-us' is not present.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v6:
- Rename the deglitch property from touchscreen-glitch-threshold-ns to
  debounce-delay-us.
- Read the DTS debounce-delay-us instead of touchscreen-glitch-threshold-ns.
- Udpate the cycles calculation.

Changes in v5:
- I didn’t remove patches:
   - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
   - 1/6 Input: imx6ul_tsc - fix typo in register name
  even though they were accepted, to avoid generating conflicts detected
  by the kernel test robot.
- Re-work the commit message
- Add Reviewed-by tag of Frank Li

Changes in v4:
- Adjust property description fsl,imx6ul-tsc.yaml following the
  suggestions of Conor Dooley and Frank Li.

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

 drivers/input/touchscreen/imx6ul_tsc.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e2c59cc7c82c..85f697de2b7e 100644
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
@@ -513,6 +515,25 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "debounce-delay-us", &de_glitch);
+	if (err) {
+		tsc->de_glitch = DE_GLITCH_DEF;
+	} else {
+		u64 cycles;
+		unsigned long rate = clk_get_rate(tsc->tsc_clk);
+
+		cycles = DIV64_U64_ROUND_UP((u64)de_glitch * rate, USEC_PER_SEC);
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


