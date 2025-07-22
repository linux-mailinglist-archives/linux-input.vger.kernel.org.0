Return-Path: <linux-input+bounces-13631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C462B0D76A
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 12:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F049C5615F3
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 10:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502FC2E1C5D;
	Tue, 22 Jul 2025 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WzssT6P2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916A62E06DC
	for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180639; cv=none; b=gChHhRXJmRx82ckeJ35l+Z2HqVGPtHT5GhUYLW1jTxgtMO7RsWzn8NNRHzu6jNqrR/IZNBclswUmc8tTQMuv2AuFcULpqmLEmafKzazYkeKh5Fxlhomx86JCHS/o5z/BSIJVP/+RBSVFi9LBS7ptlo920u2yxq7z4deIAc7rA/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180639; c=relaxed/simple;
	bh=Uu0KyPQm4WIIkWykK1EPIZXCY66nvgOqnqJpxxXLb8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlUxsglqMo2HkfLPewutoEoTT3wtntaBBiAaggHYx4g4aW83pqT0ah09MVxweaVnl8aJzf4UGfBSeTJ4nELDtqVWLvgqaizTTCOFf/F1W/5sWK/udOQF0NpvqSIDYHQCn9GBM0ANqcf+7fJRGZBOZxPJuNLqU/TS90uwcphWwyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WzssT6P2; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so11250576a12.0
        for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180636; x=1753785436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=WzssT6P2Yc+0olfOyZynspepgr6Qop2x2D4OQ3UJfNNlCoPXnG72njclIIfk+rHN0V
         far2osj6nzbOFn59Opn1uCKDbdQOjlunSvxhfWVo/4V30GD/HoLGOUbhDVUrYfi/v1mA
         hen8/xKYD9nVPR8GN/IQy+YrkSNBSqMzVJfGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180636; x=1753785436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=Emgpg3hWaGIabjSmDtwUCQVlGYwZ/+h1ZdyCeiAEcwK9Vl8kc3JPqVtfyfNl7UorT0
         5nMCvN5eIGQZCh18hNbAJLtrRNlqVrdq3/ofmGw2S/11NgGf/Q0aevqHnWXhBeBHoJsr
         5hmmPSmfi77JgaAbWxOarGOWjw9Z8oKUTQ5jtY1NTDeZ3PqNwu1SpCliio0YGdVi67pH
         OY1UdWkGemQ5rmr+pS5MN95as4CR81Kg9QlA6StBtFr6JKyqW/BJTmOhSf/UwRBlxmmn
         JExPIVWobTct4mUsB4qujKTHyS1QShYvZSSrtiiVD6dMIVce+YAy+dMPypIGqG6+mMxa
         pWJA==
X-Forwarded-Encrypted: i=1; AJvYcCXQy8uShJyBeacldYI0nCHotwYHuyC3ZBOXLSOJteQ/tvDIt8UPZny1zGhPtK8M9h8vhKbaXHA2GEZcVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlc2DDiot4wkERrUXJnvZrVp3xsjCyA+5IaHyYix14BZRYLDKq
	jQwp0XZ45cKQ2ba4m12EJqoDWe/dFALy3afLv/6RpV2l/YFc9PN1p6nc5tqYfpX/qJY=
X-Gm-Gg: ASbGnct8eKs+1WgOtGFfVFuq8tZ76UUR4Ic8vICBrrS8Kd5Vz2jB3++ZxCR7lvxdIj3
	RLqkbVyOQnDjjOfTzB/BvKMSb546jDaFCHsUZsBsBIsfSghIbYdeBriCpk1DS8LicOSmENtmNHf
	+QX7nZmty6SWr+jcFT1VzZyyUH44FRdKoEFzp32h83lIleAw+/QLzfb11Rqm+Ub6XGEPCW1VYS9
	BDQaqoIc4Vvpre8akEtCyahhqQAAxwO7toxQ+/LUN2/xuHxJcI+7Lt8/w2jLgvQ1qzhzlK5dE8U
	023rrSC2UgvEmVoJCqxRN0BDEG9FcDScILPdMIqTTIn+mLc87YV6k4L4pkhCNUHOtofe/HQwDdF
	L4MgE7CSLKJ/0Defzjjro11mNExokDJcen96m7YnIdmYXGctICVmE6CJQoJ0=
X-Google-Smtp-Source: AGHT+IGu/rHAsJZdTDesHIy4THsJpwWha/3OdhJMXkmdfz+OLlrTD1ZQyBKwuFnDcJvQVIDplpGbew==
X-Received: by 2002:a17:907:2d20:b0:adb:2f9b:e16f with SMTP id a640c23a62f3a-af153339173mr333989466b.16.1753180635127;
        Tue, 22 Jul 2025 03:37:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:14 -0700 (PDT)
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
Subject: [PATCH 1/4] Input: imx6ul_tsc - fix typo in register name
Date: Tue, 22 Jul 2025 12:36:15 +0200
Message-ID: <20250722103706.3440777-2-dario.binacchi@amarulasolutions.com>
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


