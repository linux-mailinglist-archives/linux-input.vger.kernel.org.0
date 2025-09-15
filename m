Return-Path: <linux-input+bounces-14742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAACBB58592
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 21:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD3A208A19
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 19:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D116E289E2D;
	Mon, 15 Sep 2025 19:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YoaKsmJ8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D4F287271
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966035; cv=none; b=g/t1GgwK9DDZ9Pzm7bnQacIt72uLd2Bfe+bvZQEY/4lM8aMzgbateCG23/iEushGr1PKhzhNthQXoaPgPBoWdcY75xNGvys2jwevMI+U3fo6CeGMVlBnRX0h+ILO2g3KOn9WRkE9ouewrSbiYznIIHaLyequazXRiBoZ7tJDfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966035; c=relaxed/simple;
	bh=BRys3ZutdevswohgMnBrm5EhSN86iKLozXVmHM3NKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNIDS7C7veXaHLS9MhTTBNR2iYQosi+jE4KxZLqPRrfQUqR0A8aUTFhnWQUEZ6u+JtFSUoXMjzXJvJKiJDV4TpJfwjincsaIILluQonAblFSjIuNQ/tuW3h5grOsRmWoRe+4Q2m1YTdmneCPu/ulc8aJqReCxkJ0UxoddnImYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YoaKsmJ8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso47893775e9.0
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966032; x=1758570832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=YoaKsmJ801Qs+klLh4QnG++exE4VUIj3S+Sk6onsvfM1utKE4WwncvOR8gDt8n/S21
         aNm6AFGeuVx7kFqE47gpC9VQzidV3P1+gK03/uWR1cwtRkdCJrHxhib2G+QA/tCQtwim
         8Yj16JfeMJNSbeQoO2JI6PwnBqavqFBUCxIp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966032; x=1758570832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=OkeNzPvFhPEsrN3xzhM/0zvHwz0EduK+Rp68/PLw0+tRlejGIerCyJ2UddLNHf0NHg
         Ce+4u26RDDlWJEVsX6WI2t2253MwNkybKyqdswTOy+fARyuB3p0+DmH+3JwRfhosSAJ7
         xx3bdgpp+bwCbR/Lk1FLmcC+KdicNOGtoNQRU0CZJcVBa7BPnzAz+cyLZgtR4sd10MaH
         T8k0nTEmO6CXlgEWOXeIUzDQsTijOhzo5JNOP6qI2G87l8Be5fcr7QM9P7NiSbvanm/F
         8fR1M6GZeDhQBq+EqJVeZpt1EWKS2GmMu6D8pxKI7dyH7Q3mU1H2YqGLmJZevNEzVyDk
         w7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWYBGWnZTMSiMPyfdUIf1Gfj8/Iott3IEqzd7kUae6+Id0GmTkQ++PHDMzTEqUXU/D8zogresqRk0VV5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1cFnQgD1r9p+bBUuM+xIeMAFMJqD1eqgoCZ5CQCoDX+1s4S+u
	o04ha4wO2zGbXgGLvesANpX8PbfdFvVOZAusMtnK9eVM281hHAS3hntojBzz0082l/A=
X-Gm-Gg: ASbGncuqj+NhYkpaTM8V8Io2nPTp9/6bf95SJ9YhRNzOE2aLGEFlsDqNgD9onUKYaB6
	d5OmYoMIRDooFr89rfngv4H84yDPdila5ra/adrU+Ylyg6LMBcwZRVuf0aMdwcqQGJj744gAbvJ
	lmujgPxHoYOGWDNea+gD9ocVGoCxTQrhK01DLobB/SJ0VhrGPYjdZ2LWHr0geFO7lurZ5NVnzsq
	4LSku5L+TWMYo8NZtpX7Vl8O+3Ws5WrNeIHw0OeZuovVo6QEpxjBPem1RPwSQHAHO8V9vmWPheM
	eHg3d8N8CRL8KtyYH9OjLV/mquenj/oUSsBqTdVXSWjJMckoMWhxRd7wHAT/F7Iu1hVn3ViJcJ/
	HDd8B9aksuZrXImaTOaqh3bMo+TvxtnZNHg0uKYFHp6Ap0flC30SW4NZeu0CrDI1QZSiBobgW/1
	oyO/b9R6g5
X-Google-Smtp-Source: AGHT+IHfif4UVv4IrK9t7pQTUnYShPYNK5zEJaWSq2zpbicbbJiow2T3/MUB/cRMHEEknTaIP9xExw==
X-Received: by 2002:a05:600c:6a0d:b0:45d:5c71:76a9 with SMTP id 5b1f17b1804b1-45f211f6b70mr128799385e9.24.1757966032348;
        Mon, 15 Sep 2025 12:53:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:52 -0700 (PDT)
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
Subject: [PATCH v3 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Mon, 15 Sep 2025 21:53:03 +0200
Message-ID: <20250915195335.1710780-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
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


