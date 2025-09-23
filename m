Return-Path: <linux-input+bounces-15007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9BCB96594
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 16:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FCDC3BCD69
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 14:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3D125B31B;
	Tue, 23 Sep 2025 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gkROpMAa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36542231C91
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638275; cv=none; b=XsXTYy9ig8qkEsGU3zG1k8gcl6vmJQ/G0utLRp1VmT6GbuukUKZllMeNq9J0mLHyz+K765nr2j4OY3q5IFH54XY8l/IAaZUyr4oECKiYubs4xkP9yRov0cHxNtUzjGLY3Nmk4788KlOAFCKzWPvm81RFUCJC1B/lfZmgFkZ7eks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638275; c=relaxed/simple;
	bh=BRys3ZutdevswohgMnBrm5EhSN86iKLozXVmHM3NKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6P6D6Ew5qIZcpfM9B0xVBWRkRUtvVDTZy5U81K7Qb0ZT/e0wyOBIbAMtM0SUxOHQ1Lg9+PfIQ25eOvbvxv3esAylOGsx/9ZHODfVXN8VvgdVrE3WFVsqTlBrXpbP9jZOhYgoStdjEmZPs6VDAgUTsSxqmLOKKVB6fAMEdL2gxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gkROpMAa; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ae31caso1003433066b.3
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638271; x=1759243071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=gkROpMAaLs9OSrFAFeLRr5cRX7rM+lFYiu5PoCgSovgC7NVDfIrvIv/PQQrr9PcrsK
         N+FHhKAcf8m9meZwYNIeAb9z9bqOmTHwY2RnTlmQwW9lnyI2vKSTkVp+Ndx67Fx6po1O
         q3is+TT3wpwbAS5HLfcydQGAuIBo/38Ope0NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638271; x=1759243071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=beevopSpDRjImAJePBFOCisQI14zQ8mHmp6Bfn4rp798OJr7ryC1X3tSErHd0jzGQI
         hyLeF3mx1MkVcankvU2t7dzzCefe5oTa54HRhUiLEpa+prV2M5svDHszyVH2N7x2UKsm
         FIOlXNR7S0yogiZX2D4KwfDAi3Jz6rLOAcuTUJYGjyPtedfiaTjRMhS7Jr+QavXjGz4D
         DaMC/4tar79ogRHpz2EJhHUbnDkdXFzQFiqHTJXsZmcVgBWN4WI9ZT1iBQGrVqcEemVL
         O9+qTYxOcidTYuW8wPvXyaIzyQKPKglqmsoCk2FF2Ll42/ewwoH3J33Wa8kjThcsnU3z
         pa2g==
X-Forwarded-Encrypted: i=1; AJvYcCWFSeGzt1mS3htre4CBKgOagyP5nwefm03mAIQGDxSFjEYFsoFfncePvov05kfMh6yZccPk8lME5GNWxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBV7E9MD1KPjB1wca3CX6oDQy//X4A7uVlSOlZy8ooEMpL9AYG
	RpOZNLhcBTCfFSr85TcxOu1Ow7fHa0nohGCjqO9zaA2HTdT/pJwXFQgePg3Ury1FgeQ=
X-Gm-Gg: ASbGncu8TEiydkwUEqPGsaRgwh5SOlhiKy8gIrTWKngk1r8HHvw8de1FuSr7LG3ZS85
	D3FvQ4lbgdgyyF5NaxhrC8yLABKMd6eL02tSfaqDu3piVjGYuaeqjyL2Ifxjnb3ovb4IK2SYRRe
	DPlY4X48y8aR+qIsjftai9XTpf0sikICsaSzW658HB2hI+HbXyrIlhkgJT97OgcYmQTe47paQrS
	gYfMff9WQtLtig+7dFNJGJnyMrPzxXtdahz+lo7TBFOmYFoL13ZrHUoWEeTbGoZXnDkFXhHPd3h
	nI7IWGhxlC/jr3jmysDlisvKZl6Ea65cEd/xtZ6dPvJaz9/3hh2J+/aeMe1YB6SFTPztesTgeFy
	1UrpYAmXpN8Xj/BcTlPfhuLpp946FsmOVcqtS5o+LcpjLS+cZWLddpWEJogEJpehy5mP9jyb5/4
	vz5p17ALgEza0v9IyPon22R5Fj2tctAtRyQW6o3mLT0gy7bOzaqsX8MkF2YAAuzSLY
X-Google-Smtp-Source: AGHT+IHaqS5GNeMUhn9N2QSUvjss8/1xeAtf3qXgVO60HOyrcSqyn/pZRNK3lgknrBEjEWoU4iqXeg==
X-Received: by 2002:a17:907:6d22:b0:aeb:3df1:2e75 with SMTP id a640c23a62f3a-b302af24e64mr265873166b.46.1758638271431;
        Tue, 23 Sep 2025 07:37:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:51 -0700 (PDT)
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
Subject: [PATCH v6 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Tue, 23 Sep 2025 16:37:32 +0200
Message-ID: <20250923143746.2857292-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
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


