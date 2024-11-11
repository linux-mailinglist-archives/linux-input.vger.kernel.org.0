Return-Path: <linux-input+bounces-8023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D019C46B9
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 21:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C597D28A645
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 20:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D8F1CACFE;
	Mon, 11 Nov 2024 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkT7xbLi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98D71C9EA6;
	Mon, 11 Nov 2024 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731356418; cv=none; b=X7wUZA2flR7s7o5z+fyRBwiG7L+uGESP148BnLB8EcLR+zAFVtBxP1NEKf5LEqpL6ZJxqFOA9mp2t1Ux+gcdRU/09vDM5sbTpMEIcF+U4OU516dbsnCOMsTi9XlajsVHYn1lGLPh874zjQenf3WiSTl4Pci3g3Cx6DSsPDRH+Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731356418; c=relaxed/simple;
	bh=vCNsRg2RULMRgn6h/rZA4wBCYVEKg21gJvIFmtNIt3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M5RaQD3sfBMl9cVRj3Rfix/in3umB7v+R9i0hLdr8CFNwEO7TvVdZCC+L97iH5rYvxbF+dAxQvybgXN1bciFGwLT9RJvfkWkU1QPlwgIusSQ/+PiAgX0yKokcchLmbStEWDEQtJSIjFc1cuNpWgzmVIk1Y05LX8civPzZfpIVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkT7xbLi; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d18dff41cdso28840696d6.0;
        Mon, 11 Nov 2024 12:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731356416; x=1731961216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrQs/OYc3daykzkmJWefzlGVlzHWJgnkpnytdRTsj7A=;
        b=BkT7xbLiCd5f0ivWvgTK0pubugBgVNnMbObjxD+0oFhFV4HYgVQNREvlZ1bTG7lBmc
         GuiXmKBL+FGnxUy8Rma8sgE14j3s3Y1BcLN7f7mr9dsyqs4zMEleWLWD05or3CHaD9S3
         6mIuqzEgh4zdlrvNzRhMC4ZGJcXnJGjNm98xR36jtUA8c8/ZtwS1K9ZaqM0P645QRlES
         Nbi4YuLQcv5hVcgTUoKk1CVaefPjjRpdZcc58aqPvjKl46rt6i18AmH1mPZXc9ta1as0
         BhwhpaDSedvmI7LfMHcoFFhanUo9kwTEtFAfRE4I/FUP+tDqDhW8LbCz6fWYVt1+rvIZ
         z1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731356416; x=1731961216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrQs/OYc3daykzkmJWefzlGVlzHWJgnkpnytdRTsj7A=;
        b=LwpP/d5/JEM0REaCBHOpXYUqcvWBlyHYz1dlQT0dcUi0S8yctD1evZblTnfj+YNtVO
         LDa/GZYxZtknCsalTl6qlXsdZLOIhaWRU9hTIcnF+d3h6FPzsAUdvkDNBUrgoM3jqwv1
         P/Rwr4lLDfX2BEZb/5qmBr4ZoWqKujCkgE0x2BWx8K/TKh17Ffl7xh86njvrRLgqup4c
         Mmcj5/gpOb55dtOMip+7Rijy5GORbTNdKoplFXftn6j2X8eBGJFYGNfxRhL4y+g+ZIk9
         5bexrtWIg+iVOr3zvVgpLCgSav+1arwhjlVJ91BpTVJ1GraG7HU72Awu2btbXjW3WPhL
         G4dw==
X-Forwarded-Encrypted: i=1; AJvYcCXa/P/hBMOZrrMg+E4/1JJD2+8mT1VBHNrAD61RZSdQTV6dxMZf97Pc41dPjQTdJdZFbmV7NhbPXA85fn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YysR4gre7vfO3TwQmUt5KcIXRHoFDe6bip/DnODuDBUN9Qwpgm/
	UHeTyTIXciEdDS5GZ+bJPdzBgKM2mn6B4n/0u2FxsTMuBabl+pdR
X-Google-Smtp-Source: AGHT+IEl0MljiI7wwIIsG9uI/z3cXsL++QA9CqJw1RY/KjUos/+zmfgWLWzWGBJWsXUl3rjl5aUf/g==
X-Received: by 2002:a05:6214:320f:b0:6cb:e5ba:3117 with SMTP id 6a1803df08f44-6d39e197839mr197721056d6.23.1731356415704;
        Mon, 11 Nov 2024 12:20:15 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ed242sm63254846d6.34.2024.11.11.12.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:20:15 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: dmitry.torokhov@gmail.com,
	broonie@opensource.wolfsonmicro.com,
	kgene.kim@samsung.com,
	kyungmin.park@samsung.com,
	jy0922.shim@samsung.com,
	vkoul@kernel.org,
	arnd@arndb.de,
	nikita.shubin@maquefel.me,
	hartleys@visionengravers.com,
	christophe.jaillet@wanadoo.fr,
	shiraz.linux.kernel@gmail.com,
	rajeev-dlh.kumar@st.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] Input: spear-keyboard - Add check for clk_enable()
Date: Mon, 11 Nov 2024 20:20:06 +0000
Message-Id: <20241111202006.6669-3-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111202006.6669-1-jiashengjiangcool@gmail.com>
References: <20241111202006.6669-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() in order to catch the
potential exception.

Fixes: 8314f532ebd5 ("Input: spear_keyboard - reconfigure operating frequency on suspend")
Fixes: bc95df78c456 ("Input: add support for keyboards on ST SPEAr platform")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/input/keyboard/spear-keyboard.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 1df4feb8ba01..fe0a33862e60 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -273,11 +273,16 @@ static int spear_kbd_suspend(struct device *dev)
 	struct spear_kbd *kbd = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = kbd->input;
 	unsigned int rate = 0, mode_ctl_reg, val;
+	int ret;
 
 	mutex_lock(&input_dev->mutex);
 
 	/* explicitly enable clock as we may program device */
-	clk_enable(kbd->clk);
+	ret = clk_enable(kbd->clk);
+	if (ret) {
+		mutex_unlock(&input_dev->mutex);
+		return ret;
+	}
 
 	mode_ctl_reg = readl_relaxed(kbd->io_base + MODE_CTL_REG);
 
@@ -325,6 +330,7 @@ static int spear_kbd_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct spear_kbd *kbd = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = kbd->input;
+	int ret;
 
 	mutex_lock(&input_dev->mutex);
 
@@ -334,8 +340,13 @@ static int spear_kbd_resume(struct device *dev)
 			disable_irq_wake(kbd->irq);
 		}
 	} else {
-		if (input_device_enabled(input_dev))
-			clk_enable(kbd->clk);
+		if (input_device_enabled(input_dev)) {
+			ret = clk_enable(kbd->clk);
+			if (ret) {
+				mutex_unlock(&input_dev->mutex);
+				return ret;
+			}
+		}
 	}
 
 	/* restore current configuration */
-- 
2.25.1


