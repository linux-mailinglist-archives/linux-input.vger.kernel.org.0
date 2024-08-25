Return-Path: <linux-input+bounces-5846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9345995E20C
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDBDAB21A5C
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705B113AD1D;
	Sun, 25 Aug 2024 05:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxLG+lpT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A91369BC;
	Sun, 25 Aug 2024 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563022; cv=none; b=Si7nBrevrxVslNfQgb3sViCX+QPonX8OulthGpxeIr1BOasP937sHpiIVne+e5dHiSDWbqrWT4pJt948G7+hIurYIcq7SuutRtzuNLYrZup1jnuKyjG5KxUwTTRN6ONvh+i+VjrDmWdi3a+Zp96qqSClOJmarpTre/L3g9PrXB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563022; c=relaxed/simple;
	bh=jwVJzglfziH/nV1kcY0Uo3ZHM0I6kZU1L/m/bOzcWFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A4pUvCPlF6H5loxsYf5XyGuW/n6RfYiaJMf2pb3rYcndaym8Z+d9MTQ4q/0xbW7chjGkLXHQv8higZQAE1/+NBsG5kernvKTgh9QRkaHdcScCLVHapVq1tSkNfZJzlN5OtxWrBROedGQh2Ak2yFMkEVrxag9ELwTpiwhKcx22i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxLG+lpT; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-27022a3536dso2500625fac.2;
        Sat, 24 Aug 2024 22:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563018; x=1725167818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIA6h/0y/Yz1gsinooJtctLwNKMffY0VfmYdSxulMqA=;
        b=IxLG+lpTWU5BUWhhQP73JYz8ObqBEVukJhldiZXlnPBRWoEWcEreCB0g8zKWr2IQ4h
         xn9QcBKuwXFiah8xkvdp4Tq+Re7hJ77T0op6f/QSxrOaTTBoXu5eYHda8p3nBRDzS0dM
         jbdzic3pU1djenBpx6PwtiDQPeiJWEwaLhdiccRUgXxlsawZ3JVSNWcM32I/zDLp4xoP
         3blw8dy/1iK6eVoSiziUEWbJAmc3Qxdaidn4CirRTfOJUo6rdNcrhT6QBEQUjRDCuRgR
         9qAoIG7jRpctqoYlN1/zyWGjRWDpQCFxf97roTBcbCaYjm3rVPxNHajtwv7A0jlMbSky
         0I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563018; x=1725167818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIA6h/0y/Yz1gsinooJtctLwNKMffY0VfmYdSxulMqA=;
        b=nnvko0+2npddzLESQB/kDEJgbpQT9YVTW9oG1xj4gmMQyaNZHj0NbHG6wVYNulJvcp
         HKXZgieLSW0DQSdtKwBgKJ3OaJBTAJ4EZKDPtgzGXABiCLu8SKGka2laKKQ2PbLQ5rjD
         tTe3FWaISZYLOdBadpasGisA3DdhW/lCy8kmoHJal4M3No2trWmzhdqNkzU21Y8wzMtv
         q+rbPvedaPMU+fCc7fEnfItTAKx37Z9orFPcoQD2rqRQP0dKqwT3zjsm9rQySLpCCujI
         oBlyNIQCUoR29ILsN16M5HmlF67m+y1WaxUwDyBpWdypHC0R+LeK1l5heOcaOsATBLQz
         A/mw==
X-Forwarded-Encrypted: i=1; AJvYcCVrXe2UVradkWV/31T82WiMfIdzfELnYmtSac7q+KUYLavXVi4PSzNvBfK4gyEIvYtyecGLZeK3dBH+px0=@vger.kernel.org, AJvYcCXwBHjes4YEMIcs3FrPprQGMHhqwow5p0/VKeAJ6ehNN/Sy8vM+RniXlTXubOVea2GkCESAmXenvgZCTD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk6PkGCgrUJdYkQLyat/inf5zoL9yUa1TH3xh9wkOLByKl/MPX
	u2XS3QJv/DfScMIAznwcxB3WhrJicudJJUhm1V01WXjxDxeRICU1j6b9sA==
X-Google-Smtp-Source: AGHT+IGpby1l5kr49d3Ag7IqPDJ5s1jsbrR0tYx5ZtWy5I5Dnd9r2dAg+L7acAO7bMwntLfgmcpiOw==
X-Received: by 2002:a05:6870:548a:b0:26f:e09f:6090 with SMTP id 586e51a60fabf-273e6620ee7mr7487035fac.37.1724563018382;
        Sat, 24 Aug 2024 22:16:58 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:57 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 15/17] Input: spear-keyboard - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:19 -0700
Message-ID: <20240825051627.2848495-16-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/spear-keyboard.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 1df4feb8ba01..2d3f656e59dc 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -274,7 +274,7 @@ static int spear_kbd_suspend(struct device *dev)
 	struct input_dev *input_dev = kbd->input;
 	unsigned int rate = 0, mode_ctl_reg, val;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	/* explicitly enable clock as we may program device */
 	clk_enable(kbd->clk);
@@ -315,8 +315,6 @@ static int spear_kbd_suspend(struct device *dev)
 	/* restore previous clk state */
 	clk_disable(kbd->clk);
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
@@ -326,7 +324,7 @@ static int spear_kbd_resume(struct device *dev)
 	struct spear_kbd *kbd = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = kbd->input;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (device_may_wakeup(&pdev->dev)) {
 		if (kbd->irq_wake_enabled) {
@@ -342,8 +340,6 @@ static int spear_kbd_resume(struct device *dev)
 	if (input_device_enabled(input_dev))
 		writel_relaxed(kbd->mode_ctl_reg, kbd->io_base + MODE_CTL_REG);
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
-- 
2.46.0.295.g3b9ea8a38a-goog


