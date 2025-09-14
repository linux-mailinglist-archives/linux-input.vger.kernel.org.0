Return-Path: <linux-input+bounces-14711-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E3B56AD5
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84C967A4670
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 17:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54242DFA31;
	Sun, 14 Sep 2025 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Z0skW9vB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E852DF14F
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 17:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870187; cv=none; b=LNtlorHPFWpLi+S2SgUxhNS9ceeWu0cKfkK2G4ilPVugJ33fXcJS4Qy6Blv6L99NEj2M4+as99jmdtORlJ980xJMhhoFOjaYy3wW7fsokqReBodhxZo1c61X9xxfJ8TIGdnzd6gVqCdxd0ulj5J+CkdHOh8ZcTKjIxqoqTqq7m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870187; c=relaxed/simple;
	bh=OV+qmjeU3NDC/Cst8F7wHNfjJbgMYyX+vlId2SAEZuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOQ5TYtihtQZ7sDm23QAFfPltuRwr9g804mwG3gXS+ZuF9Ey11wG04ZyvLW6svsTX4AcNkcKNJxzKbHKx/SkrdMzABYrhUFo7oBvWGUmn/1R8qDayczLdbPqnJUaDYkDxMT/irFKBSkwnbdRTC3EQZknErPMrzLd0hd5ZilRuSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Z0skW9vB; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7322da8so662763566b.0
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870184; x=1758474984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeIUZQnFQ6a6zAGoQDZv+bvlaQadCTCZH0QLhkeT9NE=;
        b=Z0skW9vBv0VTzA0nXahQ+hGdrEpjI4hEeWxnvprqm0sbqRkGZyWd9PpWC/7CKVOBnB
         /RFw0uEIPXlWaB6VPFr1MyRNsGM2EqwvAdfn2Q6I9dKMc+oQMSYmStmno8JHy7D/sI2b
         +Z3k3zfkKlMtQOLRIU3W3qnosqqZmP+Y30gXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870184; x=1758474984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeIUZQnFQ6a6zAGoQDZv+bvlaQadCTCZH0QLhkeT9NE=;
        b=wq6j+eWAm31wjeeZjIIvlS4aLaJUvRKpGqAWf4b1/RyewNguFIrg1EPNjyorZ0VEeF
         jHAUwV6lZFhYlEBdL55qtTTalJEyGW3UUg4JWt83dc0BJIfbGaMI/PF/rhHA5iN3uUCD
         YBhkCcpPZ8QcE2/c3FmN30I527OjwqwctOv7lnIrqTi/fGP532P/WvDvJOpJOpYyejcC
         tePNwqTxLXACbx7BGJd8mFEitYG02Xd/giMCDJQihviU7qVVm3OZ13guZ7mljsTwh4Pt
         IKQ7Giy2vw9vOAJ0P/HtmPC/GY3+1iJ/bCcoC36WXynNQUd3+hgHWcyaK5Bw0e0Fawt6
         ikNg==
X-Forwarded-Encrypted: i=1; AJvYcCVaYyZR3Ub4K6oMRv/bb5h7jadCxSv/gC93HNt3scTlKH//2RiqhJVIW++ji85Vj2qx4asqPMDCicflxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM/2qA1MVwqRoMzq/97U94hCmWGZrItg+EjR744lnTu96omuQT
	yzmk1NnPs0sIetUmHFviT1pnAIp0jt7cqi8pPWDx8PZGUO5OMUlv3qpU3kqytatTU18=
X-Gm-Gg: ASbGncs5Ca4KsnI1nkCp0Yd2I3OL9fNZv0xNPRGlw9dvLwkOpf1IGrVwBp+1ZMCpeWs
	ebNE54axq+yAIJnExUGeywwjUYqXc4XXdz8ob+FR9nv1xNRVfyB5MYIeOmP0Cesrt/I5lDSSvhq
	KnwRjDEqgUSlG12GYWZ1ySX28eY+DUbpJwze5oFNBnjcO3uMpxPW7GSMDuEXflk1eKi+f/69bh8
	FYtd7gzLLGaXLY9Rgrsh3QDkdNy22g9+0ba7VPn7rgKGs2YvPoTPD15Mt2RO3gC1+Sjy12FQbkF
	J7C6EaVfQ2PqHpAEzBKzV38C46yE5Obi0lKJd0jE5w/AieqxsS9GC7+X6eEpymd+wbQdnm+F7q8
	t8wgqHIZQRRAxw/plMNdsL3m9f8BTnONCeoW5ZxgBbXB/gH1O0sOyYjzQeF+wcHOVDXyRQ0O89s
	CHqhr8nRwil/9JiGCd6eH2ZvKeW2ByrpUvyU5xR+ZlhtzYmyW/tOcREadfo9XYRJ4g
X-Google-Smtp-Source: AGHT+IETORtFdx7V7/ajkoRQBW7LbAmBCbFNX2/FEUSZSUzDQGbJV03GOggXdksYhxvqH+4PusvMbA==
X-Received: by 2002:a17:907:78b:b0:b10:aab8:3816 with SMTP id a640c23a62f3a-b10aab8432amr71331666b.32.1757870184256;
        Sun, 14 Sep 2025 10:16:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:23 -0700 (PDT)
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
Subject: [PATCH v2 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Sun, 14 Sep 2025 19:16:03 +0200
Message-ID: <20250914171608.1050401-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
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


