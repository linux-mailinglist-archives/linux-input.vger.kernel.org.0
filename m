Return-Path: <linux-input+bounces-8872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91252A006CD
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 10:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87721884627
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 09:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FAF1D356C;
	Fri,  3 Jan 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OE7msc0t"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B31A1CF5CE
	for <linux-input@vger.kernel.org>; Fri,  3 Jan 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896111; cv=none; b=Nw9hsdnwtImaSjsIBIjeznUBjEY740h9OWCjREA0TJq3Y+6fL7xAZ8zCoNTx0rRMbf/1fBpoNgiwoipLB0fY6pb7dMtuiLbxWhzkOCpzso+QVy2qa8WrvIjweJLd+unSRgMeDNWSKj26iKp1UCY7YKynhAml+SIFf7g8E4bVyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896111; c=relaxed/simple;
	bh=Cn/7/TPNYeOE+2g/2l424KGbAevrj9ZsheolFBBsRSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHPYcGlBVdKKF1Tm4E/ij/72KzEb4WDRARPkskWamfZApDZ06gY7EwTsAgSXInmD4lwDKrSpuTbDjIvZ81DjrgGEu6CPl+IGEfECUPWQsqyAQCnDmp6p1GZUQ0i149YLnWbRDkFAg9rXCn7K1XYygRUbyhKgmY0aqjj/2O6qxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OE7msc0t; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso1661263066b.2
        for <linux-input@vger.kernel.org>; Fri, 03 Jan 2025 01:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735896102; x=1736500902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVDJte8gphg5oXk1BsgnY1RJiMM2PoJiarukFRgU+Eg=;
        b=OE7msc0teW3tzudu/hjt3cKTved7Ivx9UhvVNK8LkAY1T/qz4PjMxjg891RTucFn03
         eUi3DXvwcUDXjEkmFEgy4Zx4Ve4pDdTZ0nr7nLqRI5aIcZzryWdEQPoQXsIKVlfPVhzR
         96eLIi68QrgPUZd12d+3jRSGy52kOHVawZr7ekcfKwDo5ZWz+5zP8e+m8ZoXwywt0Vab
         pkp5pwfC84p2hLRjCyOsCuTPcloTuY8vB4KX9uApbiLoReCKbsOrt+SxU4cke0ZUYS/D
         b8r5c8A0oxSYKCTSWso/SVntBQ52VW5II0I+a0F+yVqRjHItYfdzFVWW0WwlzTWGDh7k
         YcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896102; x=1736500902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVDJte8gphg5oXk1BsgnY1RJiMM2PoJiarukFRgU+Eg=;
        b=azbPMyHiiSXJuiXdZt2X68nu6P0RUu4Y3CYK8fCFXAVUkw4tgMw+bk5lyDaUp638CD
         cLxaU/xsDxsHt8wfUxA63GIxz6fjqQC9VCspO13IhpzWaP7DMjFwrpEV5qnZNFh7pPdX
         +fGzkmmGv5UYSUKUFkkqqInOHC0r5I4R+9iUX5eeKezQNtBs2B8ZQrR23d1/93mg/DG9
         UvVeToalvdgxKqKanJlyw+D+dA6g3msHRUg9wPc8l9eEYxi1YfVyDw05lYVQKgOaHRFM
         J5tp+5pM6UzRnf5iHQCBBKLWlT1+3lBwDCVYo883/m2Q+5JjaEiNyhkjV8iJtDcUtKZb
         yv0w==
X-Forwarded-Encrypted: i=1; AJvYcCUZMW2fpqAseGNY1CDq62Xi1D80plFWbR5T2rcRQ0p6VndMzhKUu0EiwYSbPQNEJ9QfF9WVujWg9aK6aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhBcMoDmhKm/eADpYNIEdXSmhyyEsxnLvU++U/hf4kQV0DF5y3
	hj8l1mNpLWpJCCW2jmVRZlUSEKX/SrJSh/1wev13F4RIQZfesVg+Jd1BSmhC2GI=
X-Gm-Gg: ASbGncsObSNSAwWJQs8dLK+4CnJgSBjmiWKk9dQ+efTX03X0jpVnUnjfLpTLktx9DJi
	AepESFzo7SdZ9JMeU35fXgt/3A6Vhgpf+XrfPbEpT+jLNLAfEOO7rDCHcjjuPnAFauCmsV9l0KZ
	wg3FBjUZ6HgoGpGR+F8z82Fvkvyu8C1M8/uVdYmH6JdncH8y31S2vi6m3VPTIH5Tuz65wI1vjH/
	N9LMaYaiMshe8cHmYkIgsi6EBiXg7zngeB50DwVDUrBeWxzChYmQc9/p+3Gf1tfhrTaFgRAOdlk
	z4LlQ3x1SR2507KcH4N1viGmRA==
X-Google-Smtp-Source: AGHT+IEP0pqzjNcKpMLHv58TycLuFbHDFEPtWZPP5wVDvFEESvjEvQXGbmwzN1VeN1K9zq9lytBpOw==
X-Received: by 2002:a05:6402:4405:b0:5d2:7199:ac2 with SMTP id 4fb4d7f45d1cf-5d81dd83e12mr112825622a12.2.1735896102436;
        Fri, 03 Jan 2025 01:21:42 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f0e4sm19235306a12.42.2025.01.03.01.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:21:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 10:21:35 +0100
Subject: [PATCH 1/2] Input: goodix-berlin - fix comment referencing wrong
 regulator
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-goodix-berlin-fixes-v1-1-b014737b08b2@fairphone.com>
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
In-Reply-To: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
To: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jeff LaBundy <jeff@labundy.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Charles Wang <charles.goodix@gmail.com>, Jens Reidel <adrian@travitia.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

In the statement above AVDD gets enabled, and not IOVDD, so fix this
copy-paste mistake.

Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
Reported-by: Jens Reidel <adrian@travitia.xyz>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/input/touchscreen/goodix_berlin_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index 3fc03cf0ca23fdbe36028a6228030d3ffb8d3a09..e273fb8edc6b92bcbad0fd35223a841d7da7d671 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -263,7 +263,7 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
 		goto err_iovdd_disable;
 	}
 
-	/* Vendor waits 15ms for IOVDD to settle */
+	/* Vendor waits 15ms for AVDD to settle */
 	usleep_range(15000, 15100);
 
 	gpiod_set_value_cansleep(cd->reset_gpio, 0);

-- 
2.47.1


