Return-Path: <linux-input+bounces-14582-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 800ABB5189E
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 16:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62D54188030B
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 14:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257E5321F3E;
	Wed, 10 Sep 2025 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ow30V3hw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D573064AE
	for <linux-input@vger.kernel.org>; Wed, 10 Sep 2025 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512764; cv=none; b=mhx0tsMlFc3O5vbsoApGf4NumUWzC+ontQB52LQS4HhZDsmPaSnvacn2QkWXTHmROsIUrnqMynaczsXTn4LfG1s2oUAk6ZQuVQNdaj8/FJi1RyUVzqG0MZLZpzxUUSJDzCBr3RUKjecfsPFqUf39kLKJZwbFtoQGyaKjxVSRbYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512764; c=relaxed/simple;
	bh=Uu0KyPQm4WIIkWykK1EPIZXCY66nvgOqnqJpxxXLb8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJR9YlVsnY2pm7GSCaL0gflmdYdTCosMGf/Coq+/1TWXvG0Bv+yqifMl+D/4P6masHPwYRtzNcAjmzHDmY1cbtXSm3KBUJKmmoh2klTbpCTny6+kdQadosF7snzldX9SDKTFdo//wk2ch4uowzOk1RxGEKklK6wcrgQYB20SgPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ow30V3hw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b042eb09948so1322428066b.3
        for <linux-input@vger.kernel.org>; Wed, 10 Sep 2025 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512760; x=1758117560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=ow30V3hwhE8MsjSrY/6Bp4IHSaC7rKH+Ns67xvrmhuAODELBpx2hz7Gm4Lq52c068I
         sgDgyVTTK5PdPSnK1wg8fr/wyVIzsYPj9mjgWk0x4y8o/sCZkayzpy6ts6QnTSR6UXwY
         5OTu0TOVqok6ZgI2dPM0eUdpEKn7aF55h95Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512760; x=1758117560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=poxaUS4jrbPgk2DkZe06UuUbIeqkCMhqIGntobcsYx1HQ6GUgjnyXTzqSmzDStcJRZ
         FQ3gu34sSWflBkrtIOR0dpffV/80uyvJO3ru+eLfAHPN3IaEUjtwXNcpiup+nWIe0a6O
         yC4uKgxDkTPIbia8HPcJCm6a5YyF8vOTPOkgSkuOgTcH/YPK2a4tmzvOnQ4sNzBVl2Et
         rA8xTnvinfNeYS2aIfeam7oKkrFP+87zAlLWLrUoH+4ziYmi2ycbK0UdLM0bhO26xxKx
         ByCkW6/Ae1Yn910biil2Y99A17zO2nUMUwXx924ZvVcrkh+A2Bsw4ZNgfJW/VIDroiJ6
         vBmw==
X-Forwarded-Encrypted: i=1; AJvYcCUExuws0KoW8YWtOtu9NhnLEluuOP3GFBqAOISa3yZj/lHREvzVns1P7h7eIfgdiCzToVNGEmuD7GPf3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7yqw3pX6tcIy51iJZ8c+fJZgCmlbMIqhwM/Zj/BxJroLwEI0X
	NJWjeZEj6Gq1AI5x5zUzS00gmQWohI1vmy0XrxscD8H2X7rCN2DLLCrDemCE6xihiJlEerFXDPG
	jEqRd
X-Gm-Gg: ASbGncv1NlVsK8s3uBDXrdupouykjbM+n5f2GXXO2XCOdtM1noa+afrGoFwH6KH3VJt
	FffV/ILJ16p0mhfiDjtDhj0Dlt/68iq/UQSP8n8yTZxfN2/HOJpkgSCUXrZLeCr7HagO4XtUroH
	wefiDoZXush03c6EOu8sahFlJ9x2LasvdSnPs5wmd0q7tMNWrFIJvElxrZV3KYJnb9Ef6ZP9T0r
	NsjjjY11n5gClSywh342+7Fz0YRQGC/1QZucpms6ESgqtyFBJ6KDrdBtbaBk3rRi/Nri3bZSpdK
	QLFcAPYgeNMtJmq9BPQR8Hw0+F8ACi9xp20teHFAX4VXjFumzGfD/I+qfTwA8+V1CsC+CEZLkwZ
	ukk1J7B6AuwLnPgDIsy0//kTeYhsPKHsBg0vjbiGFyXy6TGpdnF1vCmCJyYGXeEWn9GhIg3mHPM
	NJT/51TCWUmA8+W8OvvHty1sCPc8Nl+dqxPHwNMKoIqHXI+C/OZDz5zM3MTcGGdypJ7GO9q6UfS
	m4=
X-Google-Smtp-Source: AGHT+IFx4sggugwyl7NvTvxiC9DVo19Rr8B3xJJ7gt1HragPcAUN78syGn8W6pBdTcWy3/sRmc9Emw==
X-Received: by 2002:a17:907:25c4:b0:b03:fa9e:4b68 with SMTP id a640c23a62f3a-b04b1696b7cmr1544984566b.32.1757512760390;
        Wed, 10 Sep 2025 06:59:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [RESEND PATCH 1/4] Input: imx6ul_tsc - fix typo in register name
Date: Wed, 10 Sep 2025 15:58:35 +0200
Message-ID: <20250910135916.3939502-2-dario.binacchi@amarulasolutions.com>
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Replace 'SETING' with 'SETTING'.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/imx6ul_tsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 6ac8fa84ed9f..c2c6e50efc54 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -55,7 +55,7 @@
 #define ADC_TIMEOUT		msecs_to_jiffies(100)
 
 /* TSC registers */
-#define REG_TSC_BASIC_SETING	0x00
+#define REG_TSC_BASIC_SETTING	0x00
 #define REG_TSC_PRE_CHARGE_TIME	0x10
 #define REG_TSC_FLOW_CONTROL	0x20
 #define REG_TSC_MEASURE_VALUE	0x30
@@ -192,7 +192,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
-	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETING);
+	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
 	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
-- 
2.43.0


