Return-Path: <linux-input+bounces-16571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2094CBD396
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 10:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50800304D9DA
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 09:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F63032ABC6;
	Mon, 15 Dec 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjkvHY0X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D974315D50
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791538; cv=none; b=uTLUVScpwju+aHOooPNgTn4udIusMlSScbQNzTVBIvNpuWT+IEY2Ieo5ijFezPczeZBPrXDmiXzA4v7fstgKy2JNicafcLDQ4+KEXn31GCtjzSm6DQXVBcprCKuPVcBvMiF1DzhHnn7che/ti8DFkNq8GI6rj7FbwsD6YZOoU8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791538; c=relaxed/simple;
	bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWZT+XjTsV1OcnHAEc45Q9FmgNRCknWjulz+gVg79Ezwn2Ih01811WQNtLRrsxGhHXhtkozShKSajisy4PITx6tChu6EnzhgrQw00U7CQ/tT5BENPAlecVo4BQsXdUbvqUurIGMCfu/piy41PWHhP2Qagyp5JilxTBGLN6AkqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjkvHY0X; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a09757004cso19544825ad.3
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791536; x=1766396336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=UjkvHY0Xq0UJy73I/OqNKpoBSQdfFQq4EqazPhDCvXTFAZv6dXFPgoZ7LizwceY3c4
         nOAcliXa6uoVCLHLEFuzqRNfgpDPG8Ha39dKcYpWxQa0StnCCvmPUUJSmSwGO1oFAgvH
         /RTKri5+BrUcs8ZS6rDZpfhg3GaPiNmQM+jdcabWogNkq1iiuQlFhCBzIKYM7y78CcB+
         1pcj8QvNyOXcebiflMSfvNKtI30AcIvyIW03yPFYi++xHj8ZZaGUqpGIK+WMfa2wg4K5
         8vGFkXxARywAmmovJ1legc+uCwA2nLWrReziRO+93oMUoO/zyS+0/wHyQ3tZhcVghsFz
         t2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791536; x=1766396336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=vm7YZxWFZX1awefdUs+mVkL/OmUu2So9WRnH2fd3OFV8N2RFgqFbYOVCfsUczXTHeZ
         rFTI4Ff7iq0VMc82zSD3YES6mFzMwq1qDEOOQJLvq4NOLNsko3Vn0zK0LL89Rk3dELnD
         pTUrhckPO+/BLNmmPiijyG2HoVATJAllkDW0EaQ3n/ml0g5pXhjJqOyGlVOtt0T5k0fq
         0sKzRNQrnXnQLvQaZMhBQuTagVlzrLB9EgTPDF3Oj4ShLQtjLDx6jBOLaE8HbQ7dXGdA
         Ec86TCFmxu5rYfG4N3BirQ1wtTJVQT/I+l7S7W8HKaSu2Pkyd2aGj+3yN/gr+Jqq8J0i
         bRog==
X-Forwarded-Encrypted: i=1; AJvYcCUp0eSUgmDgH51Zs0rgkGylv2ifEwumfvsumPWZuS3MbmnGWglHMZkada4P7CBcyRYlvzisHvgUojPpuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL3FW0YkwmP5Sb3iAwidqg82k2C2zLRwvuc/cy+hc7sKDos1DX
	iwaSzxLXEOPeRJBd6dHrfbURoK5Q5XxdDhISHdNRU+GT1EUcEn+r2WGe
X-Gm-Gg: AY/fxX4xloXdqDvnV7nEivzlRwF7QnuRpDPRvdTdpM4aBkS9s40rNKBKeUg6MIWGL9B
	aa1F647g/Miiqez/tjlhKokwteVeTTWvP8oLIXOiiTMcQYbM+3lbgowpwy7t2cFOBRdMKuDCaVy
	JkCDUNVsKhdRuewPVvhq1jUenWGuQvGaAP3HFAHRL53AxNoHZP/7ItOec+jVpkP6D2F2OhpAi3D
	c/nqoNUcYaEwGTYyHFK/nxIPPtcJgoJPjnUSmnOeBuuTj5BC0zHWzuXD4Fp/TloUOkJdYgu5TPJ
	mkEyoEedHl18Qy6ijnHyhMAEv3ai3Rw0qL+DlLu3Ohrh/jTwD10gDtnii3+ZM1okp48C8+uAqQs
	4KKnME98NI2GigXBltURWvD9l/gxUYJ13ItXaLIhs/yCANKDJ0R01Wg2tOWXMu6powi+Fs5B9qZ
	gjG9I23LspHlLVx62JyiRVC/zJ1FSHS8wBrtPGIVjeGM8i0PCLwx4dlcYZk31dWpE54bFb34jOE
	Cgpuf8TIApRwS5iNL2OWaqg+0HWTQeabkdzHyX+UFWVVvpgzGRRp7P444OlOTnIe0HhtMUixG9i
	/3jwsDBFIfLN/qn7m7a+LKe51aJe1fz1WskPjBKGy0dtsFNh5aY=
X-Google-Smtp-Source: AGHT+IE7R5Rq59mcZglu2dMbSmwzQA0DuoEDw9ET7Cf1MleDlYYipJlEUwm/OuRe6KJQVxXlQvBRNA==
X-Received: by 2002:a17:902:f70e:b0:2a0:97be:61a9 with SMTP id d9443c01a7336-2a097be6574mr64303105ad.35.1765791535968;
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:49 +1000
Subject: [PATCH v6 5/7] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-5-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215ktRXclLcr81bZJ/cztR0mm1/JFf93fenKz6+6l8
 py6fnM3dExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKY6uJGR4amuWV/mXtO6mp0XihoUH5fHRSRaVhe2f+TVfXRAQXC6GyNDh446+7P
 CrSess8xtlknsz/4hc33JghmFvFFfQ2ffZbvLDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index fa7b822d55bd..85410f357603 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.52.0


