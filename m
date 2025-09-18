Return-Path: <linux-input+bounces-14863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3850B85D7B
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 18:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4660C3AA8E0
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 15:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CA731A071;
	Thu, 18 Sep 2025 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gGfEm5vu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C93191B1
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210776; cv=none; b=h7NsQQpkcx7HGoQA4fbP3xYhKF0cMLIF+2cZwQRRj1jVq5VAOHwPaVViucfhK7XhHw+X9yWzCMRBIMxX6HWStppn0C4hv2XsDZ9X2K3Otugn3UIREcbEAHY9uNmuzeUw99Vo53iClb7QycOL3/YFWdCPkhjITH08MeAijQNSK6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210776; c=relaxed/simple;
	bh=yv6FeFDp/A6lsGDbam0/SBW6Pnp8tVcvuRDKL2ma60Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qFzlVfoLctwrDCMNTluRbfkVeTzNuyareuz33Mk96ybsjRP5jjoHxviD/7MGJkFSRaxJSWCzPESy17yomfGIAy+9rWSKaQPXwEV54wQBnhNjmZ4LNm1evr45Gc3/sEVe0QT4EdOHoycxqq8BdQit2s843X82YWK94m0+rNs5vFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gGfEm5vu; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0787fdb137so173092766b.0
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210771; x=1758815571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/20C6aqh7jqDUANzEy0rtZwUuYaJgtco0TQqT9aNmo=;
        b=gGfEm5vuOtREUjvUTpJ3mnQVWPak1L6q9qMujLasn+gAwEvF0h9oOym+JWfgHUbMbk
         HiAglOFR2u9KG9d1ueCDwUlIEgTTI7C8EGOZXGSTJksOG5hfMQXRKZXrljlM36AUqvTH
         LRkNHOVvGaa/u2WbQetdD6s5FVTtmE9JN4kXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210771; x=1758815571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/20C6aqh7jqDUANzEy0rtZwUuYaJgtco0TQqT9aNmo=;
        b=IED6AW4zDNISu6ZlIml1A9zDhM2OWopcukvuItANOc96kVwX8p8j4w/QTuoOtFoBgS
         N2jtzxIEhKxQs2Ia5jJ58wuJA38agzK8zcefs0W6nB0AwrRB3HlZgtOkjnM4TdyedfTc
         Z26ufwPWYjZT+dSyhTPss2aoYqI5G4/2cQv8yo0y26LNx6JMPjbZsgQTsk73pWq8/TiA
         ij/mTHTOikSbYTItVQktyUD7KwsX2vM+k5iLQi4MJ2cZVs4BlKiik48ZsWG8zSmdw4LT
         MKWiIxeZLFTsPsq/j9RSYKPy0kEg/CIn4c9BuLycS5eT9tEAHJAkqCu7GfXXqDWe82+2
         fz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHjGKeo675faIvoAJIgJgH0TIQfEiyvu4AqlpxIh6gNt3MQXA3AabzuiRx6dEsdkHvwo3TdjCBv7mVeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRIxClo3lWhQ8as1xWTSqkZOhjMg7thRU8Wk3eRC6k3/PhzNJt
	nstgX/V2K2n4B2/iMTFmca1sp4MLiP5r7wJ4J309AkBStudM1+nhCHkXEuhdPcTsyvI=
X-Gm-Gg: ASbGncuCgk+0JpCF/bUerqr/FkTPF9Tg4//YvZNbeENU/Q5ed6ilrkZ+j9xWoaIbgwf
	MOcP21Be1uFfKZdmxjmn3JS3SKGS/2/FIVecmCns3q9Vdi5zOf0hXxc0bn5rRT8MRX/0CCsUPAv
	nwgMozUwFvOo0rA34ZLFZEbIWxgn9Wx2SZ0UrMwy4pFJDrPyqhJUXdDHd9Jfdcc0Ps/dVVycxIP
	TSdK1AIcYrifUUG2M7emATvGyu+a/dm+M+4HiAE8H6a29nPdUM9eHVdAZsbSAPJ40ccJeynd8FC
	qGk/VCgykAAeKQ31pJEEQstI05UNViVXZ7GAx8E0pK6/r3rAjCNnodPfyne/DWam8hO4V+7MP8E
	c3wAaGk0ZCDxhvzZCJ4FHwOW+gq97j9LISylonVRIFmvP/lJxEqT2eQE0m7c2C1xoMKkvSzRAlU
	iA05x1q/xA2crDGwxIzqmnPmvom6+HiKayeHUdUa4hwIYQdFJjmVMTCPjZDdPFm4rfvsgyVkf3d
	WQHfU1VgFM=
X-Google-Smtp-Source: AGHT+IHdHnn6wGZnvdSsol0igEGKm/m7Cc1hmskwoyS0/5RbE78pl/2ywFREK0jIWPVIywFZyPEDcQ==
X-Received: by 2002:a17:906:730e:b0:b07:de95:1c70 with SMTP id a640c23a62f3a-b1bc02f66d5mr759256666b.31.1758210771452;
        Thu, 18 Sep 2025 08:52:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:51 -0700 (PDT)
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
Subject: [PATCH v5 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Thu, 18 Sep 2025 17:52:34 +0200
Message-ID: <20250918155240.2536852-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set the glitch threshold by DTS property and keep the existing default
behavior if the 'touchscreen-glitch-threshold-ns' is not present.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

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


