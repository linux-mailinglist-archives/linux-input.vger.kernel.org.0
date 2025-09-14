Return-Path: <linux-input+bounces-14707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D26ADB56AC8
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FBF3189CF17
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 17:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE7F2DE71C;
	Sun, 14 Sep 2025 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Nw5Jg+jb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258E2DCF46
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 17:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870181; cv=none; b=P3UCWZwoqvOxrxNkwbgR/P11bBklfpHPD2BTVE7AybKD+PQ9CYeXItPNzvjqODUWBCwrK39L8obCFjXym9jH2QIOArmmXhhf2WKyNLBHSyPlgekc6CNB55j35gq9hmlAbOpgTGbfJPC8u5mh9ZiOCU3gHCvQZUmhP5NUrzWZ6WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870181; c=relaxed/simple;
	bh=ipys+sa9gnvK/DvJjMtWh3ebWZIbOPBtZHEYTv7XZLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnhI/q1z+cNJ62VpulR+NOxbA34E6UmwW2sgDCmXpyABVhVkUIfu6f2dZ40LZJEbfqwZ44mQBripwX/Aer4H3hdrz84m1MquElnQDhMwlTykmIWA4tsgqTNaBMD0iGmIKX3IG70Z4C6cydV1m41u1/w2wS1x3QxKrA/Vb/tXC5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Nw5Jg+jb; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62f4273a404so127754a12.0
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870177; x=1758474977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0a/vjTQEtX+/yGwy3GQfrzKjZgyz27Pw8rW7Pi3j2A=;
        b=Nw5Jg+jbOFbWUksSwkY0mb6B6Q038Q5TZhYDW3v5l2psvaMLMN6unRyWC2LJNrxogc
         nznuaSqQAPkjfdGprabEvMHN0w1nXzuDdPgfqw0Cd9Uc5VPM7SdvaPVhXXJ2XNgt19co
         iq0FuX8HesrhSjhTP0GYm+ar7ToHiEALl5/zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870177; x=1758474977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0a/vjTQEtX+/yGwy3GQfrzKjZgyz27Pw8rW7Pi3j2A=;
        b=b1EmxWefSU36v3thQwy3utZVry5/AMegaiKY/t4kk+5HIpLCWz51pPsDkhBCiJrh/R
         lAv+nQ9hC5hmZh8buwBSmXXNcUTDtUUTzRvZB8q3dbfuEAYzOS6OtcCb/01g6rS1dHF5
         ukyJV/1L+P/XuIacJ2+Vy0q3FBnDN4PD1BRI/4k8fIf5MLgA+cfpFgFibpQqZCVPsZGy
         VOD+zl8fdw6sszDF6po/NaooR70Mb1+2cK5qO83bxKbsqL59td77Os/kikqUvDLdjZtY
         32+DDWYzpmJHErjuFmQ8Lq52GZuStgLHkaqAK/xXEoW3HR2Z8IoFUWNnaACNkdN3bt+j
         awYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLJLKulK1uOkLZeMMnW/2IYOHl929kBsHELofjC6JnyJ+bEEeTEReHTpkQxbO78paOG0+jmSeWE5t1Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweMYYzKm1Z+rdmcCggUx067uVfyePNwyOwdAUfef/bwg8ZSdJ+
	6/Hu5JxHgypcpsD3rznICnE2JcJsRejdWA6sqV808+9rjvg+j+igSm1nP/RqZywllxU=
X-Gm-Gg: ASbGncspA+ioPAhR1fZGt+C/OSGTFalqBRPPz32jHjE1uOcWOfGQr4u/bnA5I1uPIZS
	D6c/3McXas1uGbUcMFHjMoZyR+Dbuc4EdFkLnfKjEui6hbw/F5nOw436sMAJGGDSusonZ2EvX6l
	bluyZR3ybLU0TDvAWIvIF7Ti+omBDnirrzb024VtpW+t3baZp/BMPI0GPgsmW+7mhqCNrMklbPu
	4xea8QKZIUfzIXX2ixmFdIkHR6Oq0ifFxXU3gTQtguX/AK9DkgK78eR7nTB7T6TALVgs5yEv95a
	8N1+8OYrGlECHvc5BUIdKeXe8AZFYy5xsfjpEVuV7nbB70zgs76ZDfAJJBLC5CJ8z19WQxCd5bt
	N3VEUnnF5rf9MsnJZNvUe4kC7/BVQ2pxBYwOLtZNdCvS2muX82BU5bjwOUAisVqNDBGGpxydeKK
	KkN3G8AvsnDImIpEUwLKygEyfoXd3LdtiBYzQcKnKTLF+Ec9VBuMIMrZFiARKpS6PE
X-Google-Smtp-Source: AGHT+IEvX+quO6ICKhJRdf8NKT/j6OYJ6Pe+ZtB6ww1NFEvD0skqRYkw1DUilScz0LuELvehDfDMmw==
X-Received: by 2002:a17:907:971d:b0:b0c:7269:8459 with SMTP id a640c23a62f3a-b0c726986afmr363002766b.7.1757870177023;
        Sun, 14 Sep 2025 10:16:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v2 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Sun, 14 Sep 2025 19:15:58 +0200
Message-ID: <20250914171608.1050401-2-dario.binacchi@amarulasolutions.com>
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Replace 'SETING' with 'SETTING'.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v2:
- Add Reviewed-by tag of Frank Li.

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


