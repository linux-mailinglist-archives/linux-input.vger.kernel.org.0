Return-Path: <linux-input+bounces-5910-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B2961634
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 20:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 727D51F23B44
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 18:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B2C1D2784;
	Tue, 27 Aug 2024 18:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEvUnY+i"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43213199BC;
	Tue, 27 Aug 2024 18:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781662; cv=none; b=o0UqxWt0MhA0v1MyFCnfRgOvzlvTNcKw1zuRiQZRfIjYUdxR1jz5noYmwzUnFzhqTtE3r8tmnbFO0A25Kt9L3kGhHNe4pexwNW6+e/qc28QDarqAtgmoHr6DplUlU3WS8paCsEkhQtRHyjVdwU+r/He8+CcWY4ouPs0lg0LdlSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781662; c=relaxed/simple;
	bh=Aua7+lcALsAkgaRgTec3cCZqyc5LaTnbXenq8uNXako=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fk5lapZxX02rPyQsfQrg/F7s81vyAu7jeQgwZNix/r1HvQaJ36Dnvjf3imLjoP520aFLYOYTMdVgNChRSX1CF/wmFzgQ9MAI1rSMuAGPTcHV6NDLNaZvjrGIinOZ5v4My1amTo6a5P1pYakdzXuzH3oFvonw96aTF255V+EHs5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEvUnY+i; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7cd9e4f550dso1838496a12.0;
        Tue, 27 Aug 2024 11:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781660; x=1725386460; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WF4VTRtZNd3clMftLMxr7DHg+OlI4KSvYXGAf+Bu+yg=;
        b=nEvUnY+i5lwlNdvaByUw+rOKOar8RTPWdhgaumC5VRUTF+yi/36KJ6eSyxFeVpXH1Y
         iujetxLYH7WSer1GREwjKg9GwdGW2Oa1JcaukgnBQSceFPYv7KrhIUNXjYC6KqhnwYIb
         eAhbGxdJLiyx/pkXI7AXcZX5JMtBozJJss5Dw/sh401ny32IcsApUScKdY/4ZSVQFiyh
         MlL39JYUYCQp0XAsbGm0x0G801DjFc+KBeCAJjNPXN15dAB+NKHUdBtpu/W/usaKoO/N
         JafMKWSP1ChN14TKRp2WfI43U7+u8T9R+7KnB/kip3rrRNBQz7ILmeftsAPayy62EYA3
         fRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781660; x=1725386460;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WF4VTRtZNd3clMftLMxr7DHg+OlI4KSvYXGAf+Bu+yg=;
        b=YMXckEYxdy7XDApAf309a1k8/EMZ0rsQeOtim6u5Y8G11SDJCbFGnJ1hwfV4XveAfL
         hdFUtZuzpF8g9nwBqB0CMlDJxftsQxitOG/rNq8JENRfo+tRmB2OZNoKZucBDJUeYuvW
         1Dc8NxatLMkk6W2ikKi6YmEhj/WNcm/WUl+Ms8wn49bjDrXf3E+JaLHVcXynbeSt1sCP
         vuEXo2YY+N0pWNJsqMz5Y2UgKIbaOOeIbkSbyMIyVd4gCSgXK/7R46nf9PO1MtgM2qag
         T5tTzaiAgL3b0crtwdH4e72qRGSlCdxOrBVV3KG0Qv2ALDzFhgNOgC/YNjB7esHbIyX2
         CsOg==
X-Forwarded-Encrypted: i=1; AJvYcCV0BpZ+7aZcSY/ftgDb9l/j1bnheBDEMUpagVmrcHSsTeOx6iZamgDOuOxcgoHft2s0tUby6CLKkFxlSw==@vger.kernel.org, AJvYcCXKwEHNC+ATlr82aEwphtyDT5Ou5zTdd/eImB5+6t0Hu2nhEHg7KEYnRRpE4ud009X11hX+0UWaTM/TvFR1@vger.kernel.org
X-Gm-Message-State: AOJu0YyYB2vvv4Vz0LGes+cIgGddNv1suNHVgrwxdYlDTXfy8O0nerhA
	Qjps7dipqLqQZufZNrmV4P8fPAdeEG284CM6LTQr2uTMVRiR2566
X-Google-Smtp-Source: AGHT+IE8LnpOrHa2Dd6gdAWN/kM8M6D91dSPSnXXq8Wrs/MmG8w2FcHhVbQRORX1zNnNtBCMUDMWHQ==
X-Received: by 2002:a05:6a20:9e49:b0:1c2:905c:dc2 with SMTP id adf61e73a8af0-1cc89d6bab9mr14937066637.15.1724781660186;
        Tue, 27 Aug 2024 11:01:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:95c4:e75d:161d:a90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e440bsm8811619b3a.124.2024.08.27.11.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:00:59 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:00:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Input: mt6779-keypad - use devm_clk_get_enabled()
Message-ID: <Zs4UWGKt3hLjNmoP@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Switch to using devm_clk_get_enable() helper instead of acquiring the
clock with devm_clk_get(), enabling it, and defining and installing
a custom devm action to call clk_disable().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 19f69d167fbd..c13880103429 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -92,11 +92,6 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void mt6779_keypad_clk_disable(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static void mt6779_keypad_calc_row_col_single(unsigned int key,
 					      unsigned int *row,
 					      unsigned int *col)
@@ -213,21 +208,10 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
 			   MTK_KPD_SEL_COLMASK(keypad->n_cols));
 
-	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
+	keypad->clk = devm_clk_get_enabled(&pdev->dev, "kpd");
 	if (IS_ERR(keypad->clk))
 		return PTR_ERR(keypad->clk);
 
-	error = clk_prepare_enable(keypad->clk);
-	if (error) {
-		dev_err(&pdev->dev, "cannot prepare/enable keypad clock\n");
-		return error;
-	}
-
-	error = devm_add_action_or_reset(&pdev->dev, mt6779_keypad_clk_disable,
-					 keypad->clk);
-	if (error)
-		return error;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
-- 
2.46.0.295.g3b9ea8a38a-goog


-- 
Dmitry

