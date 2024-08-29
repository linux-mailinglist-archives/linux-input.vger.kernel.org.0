Return-Path: <linux-input+bounces-5954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64934964E34
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 20:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1981B253EB
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 18:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1648A1B81D9;
	Thu, 29 Aug 2024 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG4jwAxW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971D9481D1;
	Thu, 29 Aug 2024 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724957470; cv=none; b=BUrLsw7RY6ONv3N9koFpbL1If6AYbdM/kbY39CxnLuCl4jEZ2GSFvpoXKi2HTeKjO51dvEkNSKK8hhOxsft5yQTI/b0ypwAs1HP0UDbHV9st+erjZrOkbvVefszBQmaupjM3Y0H1Uup4ABkfXGZcAduR7hTQc4XNGJLOsT0e3z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724957470; c=relaxed/simple;
	bh=D42KJ/YIG3pbccGOwuLNNQLlJrAg2tdeLR/yfTxAKgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EAAf2K+/0kO2QgDe5QJ1NabcGQWE/PWfPXTThQNbxiOlnpX1955ocAeiHCNjCsqKGiTO9o+gfFnzidgqhVQrMeRgCIQpnL1Xxl7rO4YfTr3jCHw0KoylW+c55w8unM6GyNR4tEQsBuodIVPSwQV2+I2eO3SRp9zESEay6xc1+XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UG4jwAxW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7140ff4b1e9so858662b3a.3;
        Thu, 29 Aug 2024 11:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724957467; x=1725562267; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDWW96TyKQxT75kLOIMnOo6yCk9tPy/z6V+9aoVRcVo=;
        b=UG4jwAxWlOSqitiVeHVtQKuHpKjQJKDWz+PhneceNb2ZTNGlJjK7R42t2OGTwKg6lu
         VNe1SvLVE6zENGeQ2srpCbPTRiAFulfAFHl+x0lOfXR9IJk1dX8NN7EcXrS8RfyotHvl
         mihFgYeJRo7ijldCMWDCk8PVPNO9+DCyCWtuXisMa1XbccvoPS0cpkGvL+5Z1qvjxNc9
         3HG/MWDF6kVvV/5G8JIe/Fe6hTJP+38nYMqvk798ZSwPV7fkFANRCeoJhFlX0r5x1TY4
         fPPzC2DRXHxDc+nhAlUzchdeKgNZCMeZC6Is9x5S3kEHYLhO0D7/DI6nBN8FMNmBE8H6
         f93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724957467; x=1725562267;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDWW96TyKQxT75kLOIMnOo6yCk9tPy/z6V+9aoVRcVo=;
        b=PzZDAurVfmDoDuGtnl7cJ/b5ENw34eRTGdsUwXjlGLKBz62YOtWSQIw7+lxSd2mdVJ
         xXL9heLcHdsOT+AaWQXocti6loZfBn2FMVcoRb2obSTQB2MH19tbX/9OIufmyXaSWaQZ
         aa0LFfNi7jLx9N+hPlW8EUnKYxWqDu+a2phjvJhoTxS0E7qGwzVLFwZ7KDsYj67BTfSl
         NpDh6Jt1NESxZZT/OWIxnVsEjQpvpSUZRgYwAXbbGaqD9AiCLmk3wGC9t1lY1PnZumG7
         QYODf1RJ3NI3k/Ttx8OKpOE/rCjSpS3asrp9hetE2QYqvLJb6M7BrwgwjxhZwMUCHqc0
         1P2w==
X-Gm-Message-State: AOJu0Ywv8LL3+GiXT0TVfnRBinUkfzyOuFnGqawNp04lpt70WLVP/0uL
	dAyyRvNDEw/Ceq5QLp1cgVzts8EJFppnXN8D455VrdPPfmtiQ1SxTk4e5Q==
X-Google-Smtp-Source: AGHT+IEcvhJogEx51N7fP0DkjmBEFPe3SOAYM+Yw27YuFnX7XWob7hV270eXU1abRmhV848wsMQmZA==
X-Received: by 2002:a05:6a20:d046:b0:1cc:d2d9:b408 with SMTP id adf61e73a8af0-1cce0ff0fefmr3688330637.3.1724957467252;
        Thu, 29 Aug 2024 11:51:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ed6:5fae:d35c:9c2d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56dd267sm1447369b3a.157.2024.08.29.11.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 11:51:06 -0700 (PDT)
Date: Thu, 29 Aug 2024 11:51:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>
Subject: [PATCH] Input: snvs_pwrkey - use devm_clk_get_optional_enabled()
Message-ID: <ZtDDGMaOFlMYjOrt@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Switch to using devm_clk_get_optional_enabled() helper instead of
acquiring the clock with devm_clk_get_optional(), enabling it, and
defining and installing a custom devm action to call clk_disable().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/snvs_pwrkey.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index ad8660be0127..f7b5f1e25c80 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -100,11 +100,6 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void imx_snvs_pwrkey_disable_clk(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static void imx_snvs_pwrkey_act(void *pdata)
 {
 	struct pwrkey_drv_data *pd = pdata;
@@ -141,28 +136,12 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
 	}
 
-	clk = devm_clk_get_optional(&pdev->dev, NULL);
+	clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "Failed to get snvs clock (%pe)\n", clk);
 		return PTR_ERR(clk);
 	}
 
-	error = clk_prepare_enable(clk);
-	if (error) {
-		dev_err(&pdev->dev, "Failed to enable snvs clock (%pe)\n",
-			ERR_PTR(error));
-		return error;
-	}
-
-	error = devm_add_action_or_reset(&pdev->dev,
-					 imx_snvs_pwrkey_disable_clk, clk);
-	if (error) {
-		dev_err(&pdev->dev,
-			"Failed to register clock cleanup handler (%pe)\n",
-			ERR_PTR(error));
-		return error;
-	}
-
 	pdata->wakeup = of_property_read_bool(np, "wakeup-source");
 
 	pdata->irq = platform_get_irq(pdev, 0);
@@ -204,7 +183,6 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	error = devm_request_irq(&pdev->dev, pdata->irq,
 			       imx_snvs_pwrkey_interrupt,
 			       0, pdev->name, pdev);
-
 	if (error) {
 		dev_err(&pdev->dev, "interrupt not available.\n");
 		return error;
-- 
2.46.0.469.g59c65b2a67-goog


-- 
Dmitry

