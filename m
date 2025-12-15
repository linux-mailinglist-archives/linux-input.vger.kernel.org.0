Return-Path: <linux-input+bounces-16569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6886FCBD348
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 10:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23566300D339
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 09:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD2B32AADA;
	Mon, 15 Dec 2025 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcohmrJV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2B31BC8C
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791523; cv=none; b=KLLE6YSxZVjnJrf1xHYQysIzqOeOSBaq6BheIOK0ztgcs4gdU3C2g1n3e1CO8dmluYq0qJt0uRKctexlWMaCOhOIW1sG1A3QXZEuGPI7rUMGUawRLdC8nb3VeYXO9OlkZEFReu2USEGILLuNSdVmWPvK92/wkDUtegVDCIvEEnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791523; c=relaxed/simple;
	bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7Ug70H+WEJPj9eXCpIjGgp8RntVT64E99yktNme1UtbQnB91o+8xzks6I7QFXOkrSqalUqqjc28yOLIaXx67/CO4FRSpCVdu6EkW2uhCoDWePN3F5LONVG2UUwysyI9F5LY1PkKh+MU/EVzwObRQLFI2tBJsgiVQR16iiZAesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcohmrJV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d5c365ceso13891955ad.3
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791521; x=1766396321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=WcohmrJVPXOIaZoAVi/8VnUN/zIaNUmh+7pEmFpwXF8EJF9pVgdaakiL3m9NQydIm7
         miA7VWJ9INDWOIu6TPv3x5Es3Z2QGiUVmn3LF9ZcBxT8QamYi7J1KToQzeBg3PRrVDi3
         Sp6/QtNNozCrh2FM5Jt1s+udMt58eLtGpT4+RutiSwoM9ob3kiAlN6gsZHZ3h3CxiPEe
         RKKmnFtdHO5CoE4Q8QUtXV/j6SI5XO9nRp24RzOJkPYjIjTqrbOhN1E0NI6GJhGQufgA
         6lr3FUNF2QFzersiKVHnvL6Ey4l/Wat0bW1BJ8feKRuk8hij8BYfLbdRJERoswYF2fRl
         7KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791521; x=1766396321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=YsfCGkQUu5uAnpAi1zslq4jRquP30X8HPkKsR2FfL2LHHHXTUiZnCMAB4TGIDi/5r6
         NVgS/CMcQWy0rP9ByQbXgPeTO5zujqydN/tmfwmj8xs+T/XTZDRZ/JzwMwXwItlir2ug
         iBVlKvmJCpkO/aRsXb9uJiyfbWbw1FP7dQm1VFvdNCLoSh0vuqgNnvWnwJm4BwrWgVdz
         B/jkzK0ImRSUR/BB0dvETf9rKDI6P4Y/KhfxtaPX7Mni2q3V9RGJvj+1zlH5dh8MYBFe
         qo0SJHkn5D7sGuTdEYkOckqshAipiu34xPM6mqCBVMumQkFGt8X4qCuPD6ui9kqMoC9J
         bm8w==
X-Forwarded-Encrypted: i=1; AJvYcCUqskZgOx3zY9KBtkkMjy+gZCsKGcDxvGGCeRUJQEGMohfRlOE37B+I1/KOrWw9fOObw58Qk4FghJmIEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztoUi8OLtHcEIAYUN895mn+WsstVScUyHzaJn9lzvOYDqP+0kw
	TFqXA5XyGvz/LwNeRcnUaasmW6HE1vTSjJYS+r0PdrUEdm0ejT2zNR8y
X-Gm-Gg: AY/fxX5f60GkjCM0Y1Yo5iAP9jhHksFgO4+0JmFuwwb3TjCbl/qzArkY+lTmOciTqPx
	I/2wLScMHT1y0BZe383B81AIAn9tHoUbxtqehtWs+QVfshpEuBNQ+vFk5Uytnrp/1+XRtxotpt5
	A8vTr/+xdjPkYE3soE1rg6omL7xYCgE4fNuHpV9xfO0v4Y1yY1u7FtYgXQ7bhgd8GIcqQH05QTO
	qD0bIlMswt9etcY9Cxt54V6anDe+3nHcIHLDjwtl246Qrsf+fm/ePJ3NFcWii6HmOCaMQXvQPxe
	mFPyHD1UkHXvDvzst6W7IHghNPLfXSteB2wwrK/yJt2H8DVqs/0IJ29qoIbD8CNpgjzPbwTjglL
	5bzjqjC7cSio8oXgZmLWXFdg9IQN9oLiiw7/tSHbMOaLz9UL+S42GtPz0Ojjd0MYflxLyt89FDk
	acyWbo2XWF6Br0IKD3DiQXpRsDrwp3f/ea/N8/hn54t+pTv4JWDVAxLpLrUK3Dtoh8AbJxQx4CW
	ggxlLVVlMhDobBkoHDctVpZl6bDMMkfMJfGMgiA9PF2Mu7CQvs+W/ZSxwPzXNACsLuQ83tX9+il
	vt77foaIJaCDRVpqYmlzjsErU/tlKyaDprSiqxfx2cBYwJWiy/E=
X-Google-Smtp-Source: AGHT+IGrLdLzfp2H9tiVac+SQsAe4bk4AskKgVbq1niNwYTYkBxJLkhYZNfHpCAC+5TQzOHObd9ruQ==
X-Received: by 2002:a17:903:3bac:b0:295:560a:e499 with SMTP id d9443c01a7336-29f23b1296cmr99473905ad.5.1765791521288;
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:47 +1000
Subject: [PATCH v6 3/7] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-3-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215lvbGxWfZmTpGq3Lqym4EiH8s2A7af357WZxnZyZ
 uYn2O/rmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATPWbr4wMO1zKc7g2zW7v4HwR7C559/WHjwy7/16ymvClxfJzdduSfEaGPtaOhFL
 JJzUP5q6folLGbD4z69LuKwW/Ls+1WpDgv6qMDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 9099a7a22f1f..fa7b822d55bd 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.52.0


