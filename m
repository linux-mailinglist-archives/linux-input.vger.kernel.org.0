Return-Path: <linux-input+bounces-13634-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC7B0D776
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 12:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F10736C4C7D
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 10:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954BE2DC35C;
	Tue, 22 Jul 2025 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cZTJWNCt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE472E3387
	for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180643; cv=none; b=aQbFAfwNuSuWb6NRFghDH+dF04f79+ScYBZG1EqJ6Rzp6BCImoAbzSdg5JYOhh0al5VmEUPf3+TgXQYqJWWEl3Xpgwf/k3oFVRPwRiihy1pTN2AZptsbs+hjxPx42mFOVKE5KvY91tdQRTMyY4MWOvocp6sKQ/O9/063goJ2k1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180643; c=relaxed/simple;
	bh=544owQth2eYHOtuZem85B7R//X9yXkusHL8qgRLe1MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGaSO2YVEfbsx/GLI3DZErtQOr+9M464UbBSD6aR7eOECHvuHn34ojjkB8R4yXQeksJ1xYtA3DL0g7OInQxb3PsmlbyDqPtQwI19z0tbgtT38ZPkisCtxfXNkFWj/tKEWRUJyygYHK6GJ0AyL+tfnjNbkvWt49X2pujARYBd888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cZTJWNCt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso937018566b.0
        for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180640; x=1753785440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oVD/JfoNNaDmsm+Xmi5oDSaNjfSX3YkjZgxJuhnDRo=;
        b=cZTJWNCt1oahuTLJgvUnpaJFe383xquzJRztA6ETtINmQNOaYXJeJ3GHLnRHlbUjUb
         yCoOduARpvSfVQU+bVttIVQ06FIuONYw1KfhzLNjawfxxucNZMgxyqR6Pq+Yx++tIhoC
         65pTJs66Q3DwRNMNqdVDeLI0ZtApL88SxTPl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180640; x=1753785440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oVD/JfoNNaDmsm+Xmi5oDSaNjfSX3YkjZgxJuhnDRo=;
        b=CsLJ5utd8Kebr7A5tzwaZGeWwcwoZPN0HzHeVJR5dVm4uPm+9q1JuG1UbHlg/OKagI
         IuUCF+oic2wwbV7lNgHD+aungVzUuyWelLmbHgMWuWQX6YmboX5u0k8V5GRQ08XGMarU
         5HUQ+rWP+czhZIfdDavXdPMSweBzzmxIaD8FRXpeZM6/7tItDKCFe+VJnvcBWPgTFmXB
         CV1mgPIK5JglT3rHisFErqOCY9Y+qn5MYWTGzKW6zOBJmrC0rSFCTJLpBoqvwpk+Eosm
         Dwasy1ZiBFhfWgIgSlU/r8h+47soDipWqSNoHYqtO+rh4kiEMgMoI8ZmP16ixKBkL6lK
         ZpJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4BRSzgog+1BvkNTrxdMe2AHYg9Z4Yq5IzgkprBfQ9mWYlyH7vCTwdGB6KfBAkI04CKbRLm9EAzP7Xxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYCo4npBeCTz2fGvtoRtf+eA2/hAJVZtkZgMoBENT7SGtAtPh
	7k98GYbzDZThnjqt0WwHhAwR5Vr0yIpXB6e4J9f2cz1ZLQpv9L8Q94KPG2mLQJxPAuA=
X-Gm-Gg: ASbGncsCplyhbQj0Mypitewi7B5kuue1h9vThR3hfLFCimwo64pzy1VJ+4VLYtOBWVS
	m4IFLaFMIBIf/Zn/PQN7CVYz8ETSyGgiKcs599IEHQOb7UguLCu59W0c+qDst2OjzGJzJS3fH7k
	U2UVTCu9zfaNd7Z1EMoAHSfNlqSfVYKH9VEEMa8f+czOUNQ8CVTMF43+dQvTEUmXnc7gV1e6mjq
	Ku3Dl2nmmehy5OWxKylDneFtAuNgeeiXoqVur6SQiHVy1RLT00e+RddzpZzsGeF78Bw+BMpT7Lx
	G5jkMJfy+NbNvPkn8v/sfiju1XlnMNvblS8bh93foKONjjfHBH6HHlVgV0y4m9hnvq4nXAMUYi/
	xHNDyGDrVMSDw/2I9igPothauOeJ6M4+vajBa4k/wc7vxMm1SYCwyrncQrNM=
X-Google-Smtp-Source: AGHT+IGStQC9p3KnKnSdXHMyUMvaqHcAacRkAh69PXIKKkeDsY2m0YgH1GOz6iF/AlAHUl9+4h+0Uw==
X-Received: by 2002:a17:907:3e93:b0:ae3:d026:36cd with SMTP id a640c23a62f3a-aec6a6235eemr1682182966b.42.1753180639487;
        Tue, 22 Jul 2025 03:37:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:19 -0700 (PDT)
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
Subject: [PATCH 4/4] Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
Date: Tue, 22 Jul 2025 12:36:18 +0200
Message-ID: <20250722103706.3440777-5-dario.binacchi@amarulasolutions.com>
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

Replace opencoded masking and shifting, with BIT(), GENMASK(),
FIELD_GET() and FIELD_PREP() macros.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/input/touchscreen/imx6ul_tsc.c | 88 ++++++++++++++------------
 1 file changed, 48 insertions(+), 40 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index a6066643bd48..e74999c5e22f 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -21,25 +21,23 @@
 #include <linux/log2.h>
 
 /* ADC configuration registers field define */
-#define ADC_AIEN		(0x1 << 7)
+#define ADC_AIEN		BIT(7)
+#define ADC_ADCH_MASK		GENMASK(4, 0)
 #define ADC_CONV_DISABLE	0x1F
-#define ADC_AVGE		(0x1 << 5)
-#define ADC_CAL			(0x1 << 7)
-#define ADC_CALF		0x2
-#define ADC_12BIT_MODE		(0x2 << 2)
-#define ADC_CONV_MODE_MASK	(0x3 << 2)
+#define ADC_AVGE		BIT(5)
+#define ADC_CAL			BIT(7)
+#define ADC_CALF		BIT(1)
+#define ADC_CONV_MODE_MASK	GENMASK(3, 2)
+#define ADC_12BIT_MODE		0x2
 #define ADC_IPG_CLK		0x00
-#define ADC_INPUT_CLK_MASK	0x3
-#define ADC_CLK_DIV_8		(0x03 << 5)
-#define ADC_CLK_DIV_MASK	(0x3 << 5)
-#define ADC_SHORT_SAMPLE_MODE	(0x0 << 4)
-#define ADC_SAMPLE_MODE_MASK	(0x1 << 4)
-#define ADC_HARDWARE_TRIGGER	(0x1 << 13)
-#define ADC_AVGS_SHIFT		14
-#define ADC_AVGS_MASK		(0x3 << 14)
+#define ADC_INPUT_CLK_MASK	GENMASK(1, 0)
+#define ADC_CLK_DIV_8		0x03
+#define ADC_CLK_DIV_MASK	GENMASK(6, 5)
+#define ADC_SAMPLE_MODE		BIT(4)
+#define ADC_HARDWARE_TRIGGER	BIT(13)
+#define ADC_AVGS_MASK		GENMASK(15, 14)
 #define SELECT_CHANNEL_4	0x04
 #define SELECT_CHANNEL_1	0x01
-#define DISABLE_CONVERSION_INT	(0x0 << 7)
 
 /* ADC registers */
 #define REG_ADC_HC0		0x00
@@ -66,20 +64,26 @@
 #define REG_TSC_DEBUG_MODE	0x70
 #define REG_TSC_DEBUG_MODE2	0x80
 
+/* TSC_MEASURE_VALUE register field define */
+#define X_VALUE_MASK		GENMASK(27, 16)
+#define Y_VALUE_MASK		GENMASK(11, 0)
+
 /* TSC configuration registers field define */
-#define DETECT_4_WIRE_MODE	(0x0 << 4)
-#define AUTO_MEASURE		0x1
-#define MEASURE_SIGNAL		0x1
-#define DETECT_SIGNAL		(0x1 << 4)
-#define VALID_SIGNAL		(0x1 << 8)
-#define MEASURE_INT_EN		0x1
-#define MEASURE_SIG_EN		0x1
-#define VALID_SIG_EN		(0x1 << 8)
+#define MEASURE_DELAY_TIME_MASK	GENMASK(31, 8)
+#define DETECT_5_WIRE_MODE	BIT(4)
+#define AUTO_MEASURE		BIT(0)
+#define MEASURE_SIGNAL		BIT(0)
+#define DETECT_SIGNAL		BIT(4)
+#define VALID_SIGNAL		BIT(8)
+#define MEASURE_INT_EN		BIT(0)
+#define MEASURE_SIG_EN		BIT(0)
+#define VALID_SIG_EN		BIT(8)
 #define DE_GLITCH_MASK		GENMASK(30, 29)
 #define DE_GLITCH_DEF		0x02
-#define START_SENSE		(0x1 << 12)
-#define TSC_DISABLE		(0x1 << 16)
+#define START_SENSE		BIT(12)
+#define TSC_DISABLE		BIT(16)
 #define DETECT_MODE		0x2
+#define STATE_MACHINE_MASK	GENMASK(22, 20)
 
 struct imx6ul_tsc {
 	struct device *dev;
@@ -115,19 +119,20 @@ static int imx6ul_adc_init(struct imx6ul_tsc *tsc)
 
 	adc_cfg = readl(tsc->adc_regs + REG_ADC_CFG);
 	adc_cfg &= ~(ADC_CONV_MODE_MASK | ADC_INPUT_CLK_MASK);
-	adc_cfg |= ADC_12BIT_MODE | ADC_IPG_CLK;
-	adc_cfg &= ~(ADC_CLK_DIV_MASK | ADC_SAMPLE_MODE_MASK);
-	adc_cfg |= ADC_CLK_DIV_8 | ADC_SHORT_SAMPLE_MODE;
+	adc_cfg |= FIELD_PREP(ADC_CONV_MODE_MASK, ADC_12BIT_MODE) |
+		FIELD_PREP(ADC_INPUT_CLK_MASK, ADC_IPG_CLK);
+	adc_cfg &= ~(ADC_CLK_DIV_MASK | ADC_SAMPLE_MODE);
+	adc_cfg |= FIELD_PREP(ADC_CLK_DIV_MASK, ADC_CLK_DIV_8);
 	if (tsc->average_enable) {
 		adc_cfg &= ~ADC_AVGS_MASK;
-		adc_cfg |= (tsc->average_select) << ADC_AVGS_SHIFT;
+		adc_cfg |= FIELD_PREP(ADC_AVGS_MASK, tsc->average_select);
 	}
 	adc_cfg &= ~ADC_HARDWARE_TRIGGER;
 	writel(adc_cfg, tsc->adc_regs + REG_ADC_CFG);
 
 	/* enable calibration interrupt */
 	adc_hc |= ADC_AIEN;
-	adc_hc |= ADC_CONV_DISABLE;
+	adc_hc |= FIELD_PREP(ADC_ADCH_MASK, ADC_CONV_DISABLE);
 	writel(adc_hc, tsc->adc_regs + REG_ADC_HC0);
 
 	/* start ADC calibration */
@@ -167,19 +172,21 @@ static void imx6ul_tsc_channel_config(struct imx6ul_tsc *tsc)
 {
 	u32 adc_hc0, adc_hc1, adc_hc2, adc_hc3, adc_hc4;
 
-	adc_hc0 = DISABLE_CONVERSION_INT;
+	adc_hc0 = FIELD_PREP(ADC_AIEN, 0);
 	writel(adc_hc0, tsc->adc_regs + REG_ADC_HC0);
 
-	adc_hc1 = DISABLE_CONVERSION_INT | SELECT_CHANNEL_4;
+	adc_hc1 = FIELD_PREP(ADC_AIEN, 0) |
+		FIELD_PREP(ADC_ADCH_MASK, SELECT_CHANNEL_4);
 	writel(adc_hc1, tsc->adc_regs + REG_ADC_HC1);
 
-	adc_hc2 = DISABLE_CONVERSION_INT;
+	adc_hc2 = FIELD_PREP(ADC_AIEN, 0);
 	writel(adc_hc2, tsc->adc_regs + REG_ADC_HC2);
 
-	adc_hc3 = DISABLE_CONVERSION_INT | SELECT_CHANNEL_1;
+	adc_hc3 = FIELD_PREP(ADC_AIEN, 0) |
+		FIELD_PREP(ADC_ADCH_MASK, SELECT_CHANNEL_1);
 	writel(adc_hc3, tsc->adc_regs + REG_ADC_HC3);
 
-	adc_hc4 = DISABLE_CONVERSION_INT;
+	adc_hc4 = FIELD_PREP(ADC_AIEN, 0);
 	writel(adc_hc4, tsc->adc_regs + REG_ADC_HC4);
 }
 
@@ -194,8 +201,9 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 	u32 debug_mode2;
 	u32 start;
 
-	basic_setting |= tsc->measure_delay_time << 8;
-	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
+	basic_setting |= FIELD_PREP(MEASURE_DELAY_TIME_MASK,
+				    tsc->measure_delay_time);
+	basic_setting |= AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
 	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
@@ -255,7 +263,7 @@ static bool tsc_wait_detect_mode(struct imx6ul_tsc *tsc)
 
 		usleep_range(200, 400);
 		debug_mode2 = readl(tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
-		state_machine = (debug_mode2 >> 20) & 0x7;
+		state_machine = FIELD_GET(STATE_MACHINE_MASK, debug_mode2);
 	} while (state_machine != DETECT_MODE);
 
 	usleep_range(200, 400);
@@ -283,8 +291,8 @@ static irqreturn_t tsc_irq_fn(int irq, void *dev_id)
 
 	if (status & MEASURE_SIGNAL) {
 		value = readl(tsc->tsc_regs + REG_TSC_MEASURE_VALUE);
-		x = (value >> 16) & 0x0fff;
-		y = value & 0x0fff;
+		x = FIELD_GET(X_VALUE_MASK, value);
+		y = FIELD_GET(Y_VALUE_MASK, value);
 
 		/*
 		 * In detect mode, we can get the xnur gpio value,
-- 
2.43.0


