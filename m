Return-Path: <linux-input+bounces-8873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CF9A006D4
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 10:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D6B3A4548
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 09:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EF41D4610;
	Fri,  3 Jan 2025 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zwC/z2t6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A3B1CEAC8
	for <linux-input@vger.kernel.org>; Fri,  3 Jan 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896111; cv=none; b=ndfys/whdfyUTESjl8KRnRNFkUuSe2Pf3vcZWAmVqIHF8S8vQ/nwaGezU5brqoEY3Kete6/R6ZQHQP9aZ5gEZBBZw43e5CNzsZ9CHAcfBpURNaNp1Kwgfo04QHwVnRB9qwOUCNJfbdXNY9Pex/D3VNF9DokhuYWMxrJgp3L+7XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896111; c=relaxed/simple;
	bh=bk69j7cQAZWUSCvUWp+LMn64ePfcekugWmm+4CcpgZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=es6eNqFm5h+E4RZRrHQHwdzn71eEP1QlI4uoSQI0vst37GZHDz+cXjABiz/18tI/tjA4hkmgdeX6m4gS9apcRXpjVUT0YnDudBzIid72XkVkR4SlnG0dR/r9uspM+Yh+8oUZpCv6ipAxSC9rLyzbmlvWUvxf1bzhWnqpvvEkOuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zwC/z2t6; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so17348622a12.0
        for <linux-input@vger.kernel.org>; Fri, 03 Jan 2025 01:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735896103; x=1736500903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jY0TRDCrwLCuoqHobn/ChZNWc7XniF4TmDDu+w1tFQw=;
        b=zwC/z2t6lE/aHPL0yU0qB3SMOvlYEGa8W710O28bW8BB9y8iTD2xykBEB5hrj1CHF3
         RzXq+CxbSGzAFS4sA/XKGlEtD9otBxI+hSml/514Ne7leOUoRosvVOJhOCAE6sqjMVMh
         H0Ans6qjLIclaJ3A2hiV80zodwn6W00Xa7KQyFG4vXUIJmeImrs9Jkfxw1fNuvCXYA5e
         kw+AgGEqFpVqcR0knEAFQ/T5FRrvjJMj6dUezHVR/vKvLLkuGsm7Rs1/hCKQnI/IqgD7
         s9FKBCBA7lRSilOWWFUzDsizeMduGfUXINLrzQrJSzKI689s/qtO6+WM8Rr2gxj8Wa3m
         YeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896103; x=1736500903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jY0TRDCrwLCuoqHobn/ChZNWc7XniF4TmDDu+w1tFQw=;
        b=bRBl6mc5o7ZpPsMbhDNpQJ8wnPGFmcryHc1dDBvzf4xTxMI/ZecvxCPs2k7l1l0yPh
         t4hIL0vGkO54QN5GVv3vjNO/pjCtqZnQD/MUp1x4P6me7k+A7CUWbYrIqAEdupP3PbMX
         eBiMZux/n+BSwHQUYhvuCgYNfDmDonG3hLrNu8G9VQPh8LxuZ1GO61hCpwuUfBcliFSA
         /Dj6Vqnl66L2LGLIOWRi/UTW9OjQx5200cUWK+ECDK5tYLYzKBz4oKldLPxQgB0saTZE
         NazfFBQd8r9PTwAInDS+lenNOnSd3gc7LKNlOgb48ZlTguG1YUVPrqaJ1jAgi1lxZtf0
         t29A==
X-Forwarded-Encrypted: i=1; AJvYcCUT24X54UyTw6hVkU1idZX3G5StPJ2Z7z5VnKHIBATpFOBZI2VMwlC8xrAMpX/mi60xP5tdHc9vDgVYpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTbZW4xY/yYOZ0znXBd5KBqb62Q+8vIxbE4tEpSXrG2JJGa4UE
	BOKzeBksibhzIgBzK7Oj1/yTKaowgGkEA10qo5XDBxj5GTA4L6wSFN7feppA95A=
X-Gm-Gg: ASbGncsqOB4GPpI9bPY+EM11i2RdK2IaggXeSSMI7ibGM+Yr9h0xnzGPaaweGHl0MnA
	VvI5g6VQmZxRhgylSOWdfYx6Sff8iSJ89LrxqUOPttuc40uw/4b8zzjITeQD7Itx22gI4dNAVLp
	ucdH7bugyEhH30pSF/S1xv9f0HIFrTw0ofsk1CPNcPMWxJ9NGEjan242j5rSuAKobzByGFNI9JD
	85auY0XkbYBNT0b/+HkdgohVOScRTQNDKNfM7Pw8VjpHa+75yKFS7kh7MWCXN+z09ZPB2OpEqm7
	KsGTJAppLKY8KHAi5ys4tpqReQ==
X-Google-Smtp-Source: AGHT+IGCXFzPfanqGlEJoQDV1fyU2QHFADwXXJX1U6RXJVoelZD5Mwl85y29mdT44/KLplERiXN5YA==
X-Received: by 2002:a05:6402:35d5:b0:5d0:e877:7664 with SMTP id 4fb4d7f45d1cf-5d81ddada54mr44288721a12.19.1735896103190;
        Fri, 03 Jan 2025 01:21:43 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f0e4sm19235306a12.42.2025.01.03.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:21:42 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 10:21:36 +0100
Subject: [PATCH 2/2] Input: goodix-berlin - fix vddio regulator references
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-goodix-berlin-fixes-v1-2-b014737b08b2@fairphone.com>
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
In-Reply-To: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
To: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jeff LaBundy <jeff@labundy.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Charles Wang <charles.goodix@gmail.com>, Jens Reidel <adrian@travitia.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

As per dt-bindings the property is called vddio-supply, so use the
correct name in the driver instead of iovdd. The datasheet also calls
the supply 'VDDIO'.

Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
Cc: stable@vger.kernel.org
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/input/touchscreen/goodix_berlin_core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index e273fb8edc6b92bcbad0fd35223a841d7da7d671..7f8cfdd106fae03a6b197582bca4eb61f80182c6 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -165,7 +165,7 @@ struct goodix_berlin_core {
 	struct device *dev;
 	struct regmap *regmap;
 	struct regulator *avdd;
-	struct regulator *iovdd;
+	struct regulator *vddio;
 	struct gpio_desc *reset_gpio;
 	struct touchscreen_properties props;
 	struct goodix_berlin_fw_version fw_version;
@@ -248,19 +248,19 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
 {
 	int error;
 
-	error = regulator_enable(cd->iovdd);
+	error = regulator_enable(cd->vddio);
 	if (error) {
-		dev_err(cd->dev, "Failed to enable iovdd: %d\n", error);
+		dev_err(cd->dev, "Failed to enable vddio: %d\n", error);
 		return error;
 	}
 
-	/* Vendor waits 3ms for IOVDD to settle */
+	/* Vendor waits 3ms for VDDIO to settle */
 	usleep_range(3000, 3100);
 
 	error = regulator_enable(cd->avdd);
 	if (error) {
 		dev_err(cd->dev, "Failed to enable avdd: %d\n", error);
-		goto err_iovdd_disable;
+		goto err_vddio_disable;
 	}
 
 	/* Vendor waits 15ms for AVDD to settle */
@@ -283,8 +283,8 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
 err_dev_reset:
 	gpiod_set_value_cansleep(cd->reset_gpio, 1);
 	regulator_disable(cd->avdd);
-err_iovdd_disable:
-	regulator_disable(cd->iovdd);
+err_vddio_disable:
+	regulator_disable(cd->vddio);
 	return error;
 }
 
@@ -292,7 +292,7 @@ static void goodix_berlin_power_off(struct goodix_berlin_core *cd)
 {
 	gpiod_set_value_cansleep(cd->reset_gpio, 1);
 	regulator_disable(cd->avdd);
-	regulator_disable(cd->iovdd);
+	regulator_disable(cd->vddio);
 }
 
 static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
@@ -744,10 +744,10 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 		return dev_err_probe(dev, PTR_ERR(cd->avdd),
 				     "Failed to request avdd regulator\n");
 
-	cd->iovdd = devm_regulator_get(dev, "iovdd");
-	if (IS_ERR(cd->iovdd))
-		return dev_err_probe(dev, PTR_ERR(cd->iovdd),
-				     "Failed to request iovdd regulator\n");
+	cd->vddio = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(cd->vddio))
+		return dev_err_probe(dev, PTR_ERR(cd->vddio),
+				     "Failed to request vddio regulator\n");
 
 	error = goodix_berlin_power_on(cd);
 	if (error) {

-- 
2.47.1


