Return-Path: <linux-input+bounces-14792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F516B8043F
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 16:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA1DF7A6B37
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 08:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382D2309EFD;
	Wed, 17 Sep 2025 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TUu9Ub4x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A833093CF
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096350; cv=none; b=GqFkU/Py9TcTwWf6JO2TMVrMf5x45cV7DukbJQJFdIDNgk1doU4Lzc6tZURnCJe40KEyXwDfbpb1/hJ/Ltgfck4ZtQO9wgUX20XwHCSTp6YCuoBFfRh7dq/BcduObLJBAwsi80PiaGMQTVT1HrGJvQQ5aZjMF6jzHioW8I5Fc5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096350; c=relaxed/simple;
	bh=wAZaEZozJlMdBdZEd/EmVdgizyzZlx0rNEkj13bbzo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJ6vnS9TMJGzjVQqJecJd8yhoBg/dzmYHOphJ/JqgKhuupUU6ilEUQ5CIyHqkhTWA+oIjuteQVTzmZ/3ZGPR6YVm/pKCYRrdQ2Snn6PuREWqE4xF1AH/2u5GYp5HRxeY00KcLrsO8PYdF0q2HcCfyHkLlKR333uujcyvv39Ipe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TUu9Ub4x; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b046f6fb230so134416566b.1
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096346; x=1758701146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/q3PAqpa8JFRI5D9goTpJtfgHgbqQ+Qd/SJYCaxuYg=;
        b=TUu9Ub4x8uvOhmj04rrrxVUMzRkPXHIR8WLD+a//p82m047zI8XIVK4Ksco3u7LpUt
         pNIDQr7ZMX69ZQlYXr16YWK6ZXEmxDdk5Lah2NFr367dWctBbu4VvZjuc27+OkoSjzPK
         h/NAiqb60SNmsHwbmEfoBfbpMUGZHpP0+qJtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096346; x=1758701146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/q3PAqpa8JFRI5D9goTpJtfgHgbqQ+Qd/SJYCaxuYg=;
        b=Jydx2j+nnumTpY2e+7eARcROoYNTQX/lFimcwe48pA6LOLfND+XRNtp6x0EDBk0bNz
         blxWLhi6CU9WQPOd2hoCFttejlbyfhZwNCrgwkomrzn2MlaGR5crNumeeiWW3vXzCpzC
         saLef7yAd0k5zZLeq5AN7z/zYIL2oIISxBu7P9/cy+lW+HwE4C0M3pIfL2zd3m4ZdrwX
         45fPhXsbCg5SJbku62SsfJrl40B50EJL1mqz/o1P6rbb7RYp0IYc11zDc7aCb6tkvWv4
         Nget92Ez5xqCwV/jONHwlmAK/a38GrbX4F2ISyAR8f1QWKkDMx/zfxZIb+jVpiXfXNyq
         QY5w==
X-Forwarded-Encrypted: i=1; AJvYcCUcIEw2C6+Kbh9LOxonlAlGcZniAUQhfDVW3U4bMvzm67Vu+pa5DN5I1iAJqlMXsjysOscf4tJR6A93Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhblhiVms+vcCEmneq7tEjZqs3ZjSjeiKtLHKdFNULhWo4N1lS
	Ll5hrFVan7qjTM1VrN+jgVsgGQfK2e7MQZnEHPlvMvv+OQw/HLZFq2wBIWX4NakFc7c=
X-Gm-Gg: ASbGncvpPBkKp7ZcIEI8JGgU0fIVdCHm5DhSZIKrn17OL/P/VmfBc1Bg/stbZ2Ry6dO
	69YilFbDbzamOKjBrjBBT5AU+2eIfYMZmALsTMnDepoEACoz1b3vVO3PyiouxQ+kccEPf7iPqxo
	3jrQX/Ncaa4Rm8VlhdOZSuaCyePY0RpPe3UYsdAQ2cktTtNgBpy2LAV/2/AckCbZBN40cyZOyRa
	PTmJCugLTYim+OzQAkZKWaB8kYfz3Pokdlv+3pT8siy464wzhIEk1Bcds3NYiW8LIGnUfVf3QMW
	UWQXDWPl2rPm82jSLI3tzdsZx8DqBqfiUWXq36tQgJeuAww8LJ3YKOK5Q8FtI/2FvX/Parg9Vmi
	tdYYensiypzL/ju4Ez4Er/Iqm3Aqyh18g4+KK67heV38fP//SOdjd2lbw7Ko07LdxzaD1DQ==
X-Google-Smtp-Source: AGHT+IFI+EUW9a0B9XdUO1VlBQi6AjaLzsT/+VpJZU5LQRGIlw+U+tPUlEHvyjyZdrFs1s7rII991Q==
X-Received: by 2002:a17:906:c14c:b0:b07:c383:8104 with SMTP id a640c23a62f3a-b167ea6334emr662752366b.13.1758096346480;
        Wed, 17 Sep 2025 01:05:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:46 -0700 (PDT)
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
Subject: [PATCH v4 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Wed, 17 Sep 2025 10:05:11 +0200
Message-ID: <20250917080534.1772202-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
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


