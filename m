Return-Path: <linux-input+bounces-14789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD91AB7E9EE
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B94F44642F1
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 08:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFFA305977;
	Wed, 17 Sep 2025 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="opUAs/zl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF94C305E3E
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096342; cv=none; b=sgvR4uSmQ38kK46Sj6yJWTwjK1f38Q5je/GpsalrNABESbKvcObi7e4A3pCwkmeemd1gyBplksfIvwB0SKcYDZfLXP8Pr9I3hzUihcO+bx2eTCnArqbZ6Qyu5/GhfrfG7xXvrSb5yaDc69U0Mn/HlbJH6DutWjRPXlTCQ6X0/Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096342; c=relaxed/simple;
	bh=BRys3ZutdevswohgMnBrm5EhSN86iKLozXVmHM3NKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GO/NlWbSbSbw8txaveeqIqGCF1FkDGrbKl3RV+WLe7JdaEaq9lbnnyrQaftH7VHOr1iUE3ZpBQbbPS4QTxXy+96MAYA/SYZJIX/OU6F1fNn4oTEC0Td40tjC3Ta5g7GJkQft9yxiTsBdi0m5knb0Spi+Ih0EhP5t2wtv/pmdop0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=opUAs/zl; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso3655551a12.0
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096339; x=1758701139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=opUAs/zlheXQLMA06+/wUOVs6Hv3UZXvpHVIfU9KBu2O7bI6NfZtTOujYtcY3S725X
         A1ohczR1UY4i/2qHEWUkJxvscGZ0zW8SnsVquFxdRAhtwgRtGpiTyLf5f95J8y/1lxP0
         0vv5QN0BrUDnRufwdzqc7BP8eC4p/iSerr6y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096339; x=1758701139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=BaqlozdOvaSRwOdAyoM8fPoDgk9jpAX27nFrJxKDFHd94MXEToVB5oowA4G3EAGO70
         VrJapB+YyeNud0BTtc5LdeiGGOOYVJ7QIqX+cwall87dNMjvXH8LTzmqaGO/IFgSfI7Z
         6pRE4y4l2PKORheZB5VARP5l349vDnbc74b0oZya1fvVzD6liTJwFZlzdlaD6qDXgM0x
         8HsIKUJhlteXi71ADnP5Ng07gX4TqfO57jayjigAKzlSz1Y8ZW2Y9+E1y851Ha0yzaDL
         BEc0Oeh2hnrRejsXfWRki+ndz0xVF0CBAMf3s0lsA7TIBslsnnA4u7APIwGYNKfbKHSk
         vcPw==
X-Forwarded-Encrypted: i=1; AJvYcCVJTxMbYOEEpxQB6+jZ1/IGRK2a4xf/1FoqPWBh1V97eq7cGU2NbFQ5QYt/QIpnb9/7CUy94GGIT+R0iA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/fPZxo3AJFHiKTk/rc2g4OPHXUisuE44o2RD1I2gkNdl37wQ
	aSbAB4wr5Jtq40Na8mIDsEYEPPbUzIUqDljBEwrGpSnuOfuKxA5x2Vk4hAoJC6nk4mY=
X-Gm-Gg: ASbGncsoXY6Td16mxif5GllTZ4EYbvYtJjk4TamsEzGvZHAlM70M8RAu1ihhF+WI3KC
	/nwaZps4NtUOnOOMTRHsz12xpSvDPs81JyU5u9vPLlnEKkQhihIhfTvFzln2rpacy2oKCn0Vc+v
	VwsmhYzzEIi8UjSyyMgVNlo68/TZncg8EPTScK94bjmTw1IUt2jNE2TPLxwgb07LCB/qUxp79Yr
	H4UOpmC6wR0PbqYI6OBNUd5hgy1e0dMR3CwDbtRW4s3kO+i2KRHN/BxQrCcrx80jsrpsotrz5HC
	cBnoiZ2aLKlAObJFW3+6WseEskEew4VQDgHde20DHQpx0aoEv8z3QObC5fs5lPY1FEBshUvMdzA
	2pcoK8Q5RGoY6lk3sulJdpdVcOyY0PRo4dpCBmSruaeU+kMUXbKJXMbA+36s=
X-Google-Smtp-Source: AGHT+IHQZ9rc3jl/nR/PWKeSWOjOjcRVyHb+GabJ2P0Cvoe8YSOsLplNCUEtCcN7qWi0RlLMh58DoQ==
X-Received: by 2002:a17:907:97ce:b0:b0a:aa7e:a193 with SMTP id a640c23a62f3a-b1bb559965emr139686566b.21.1758096339059;
        Wed, 17 Sep 2025 01:05:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Wed, 17 Sep 2025 10:05:06 +0200
Message-ID: <20250917080534.1772202-2-dario.binacchi@amarulasolutions.com>
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Replace 'SETING' with 'SETTING'.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

(no changes since v2)

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


