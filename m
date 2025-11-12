Return-Path: <linux-input+bounces-16022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD114C51EBF
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 12:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D537E1887C3F
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 11:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7F430E0F2;
	Wed, 12 Nov 2025 11:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2ch7Ctl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F7030E0E6
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946287; cv=none; b=p7vZZUfyps5Q80xqso5oag5bYHrLlouBZb6ZWue8mRZpKZU27qA9g/SXH5g4m7oWpWMsEz1sgd0SGII9pSFW9aVyAZapAgELrs5RqJXQkvhYPnioeCuc89TTnRPfn3VXz1wFxUmwgqQpd2JPGtHZhgrrYXlQzF5IbOHVfbrsv/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946287; c=relaxed/simple;
	bh=0X8ztOxPIoLqy18jxO5aLU25sae5cz22Tql+G03LG0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhAqmnmN8QsopmMUM8LSTNwhQFMTK3buGYhMRkPhE79Qp0NRf0cjhwGEokSkPeHcryfndf0lmz1VbMTs67lRRs7BaVEl6kuaUUZQGWh/FQ0gqGNUTu/hohwFAPtjeGfBlc1p+J2kGj7/j5Uu/EX+4+Hpf1zxG7+dklI8vQGlye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2ch7Ctl; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so127524b3a.0
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946285; x=1763551085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=I2ch7CtltF7ZjK8PZWnMl98TvD+vcCsYo2nQMCkMSJfgU+/XI4nsU8MeXURmvBMj0V
         dggQ52R1mlyS00dRB/AokCUpPEKXsb3WsP19jw+GnufzI3SVI4CsAvbIdrCHrDhwPrNU
         QG9O2wYsoM1bqcKVJwpT1vF2ZuehqtiayXshaPda2+Cz6kqz1sOsT7NKRSwD6nizSoF2
         L+CPQBUGGrJ/H2fFiGjaCypKEfbxHK3Ry4GxQ52QPFma2CrPA5Z2PR6VBDtr/jNdDRFg
         VBu/cJnWDGfx+92e40SEdgke9g2+qLGaUA31i+iP0QElbq6HdjJpfCYi/fgY4QHquRg0
         hs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946285; x=1763551085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=AVx0oQPqPehwnMYef9q477fxSlpHWGRElw67XrcZRhWSAWXoSyroxJWfpBS2/B68My
         HHQPDaojraXLLt7reCkCPDIMXOk0UlRT4rXJd/edFR2wwKe7XotA4Vbm6rMWynU2gq91
         Hy7YraPOsEbVTO/5Y0gYOHTr5fygnh9zrdoKodXifZCzjo5Tj6tWtuPZCc90Q4PpxEDk
         KNq0T3/3lOfc4CDiiD1pOFQws1evrVN1ZBhI0QupZuqEa/TABC2jo/pG3NAOqh4pGHsF
         rD3EnKbqXBIIiA0U0IX0YfSMp0tb233lqSd4TYmjB+xn+YuN6JwEUZ6oIBXyUShVcWDP
         RDHA==
X-Forwarded-Encrypted: i=1; AJvYcCVtULgExjNXo44EOcVLel3C0fV3xNGBD8RW5r0oU8OUPjPD1VOJeeVh0hOCODnhPKEPAQkMuiu+esXqew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx40d0g1QJF2a24RZob1AxyW1AKQzRXSgubIdxlb3oLW5nMCQak
	dgxLmxykCOP4J/T2A8fcQ7MBEgOLtIiUdSpDyC08brIAJxExCS0wuSLZ
X-Gm-Gg: ASbGncuZ7TUKL9SvwjxTVpSJB3QTzZgcRuxnAQGiXpUHB+FG4Nxn9BkIZxIHtUBtnhy
	bTKeSs6IpHJRAEWtRw78QGR5DxDTEyN5svDRP8hfCYAFlR2GKowseoUWaoDIbNQcpiRIl15CcCP
	pb+w7Mmfi226x2VT9tKs/vgYkr7g/QOJ4hz5t6yVZR5uI+bxpytXwN0W6/ZrhgaxRqsq06mbgBx
	+gIfwsz2I6274cuU7ja3nPJjh3T1QoG+oYpKA2tG7V9Gq///ANOBlFBGDMNbNwNeQW8AX4MFX3d
	1McDxz9XoUptPBn3b6aksZoBjCmvQIfY2FjH8wYyuwsJALJcsnVkDCE7eubTQmD1k+Jb9HT69Lx
	ux3uttvBEC4veb60NpCoV6ulICCD+D+1eSOHbk/3KEGda74trYCo7gaXaoZ6bYEU+Q+dU5YvCDC
	myroaWhg6ncTDiXs/ckmN0PLsQbrK8PkgC511tdrSXrZwccNBp+GuuCr79vxMoQFR0TJF8bYuXv
	39Ux6Sak6OwsypqXbfAGXVmpU26Z5158TNwApWmvHkqGIDSyo7tKdc=
X-Google-Smtp-Source: AGHT+IHA0P4UnsPFIhj4utJwEq6rWs7Nkg1EY8pIQ9eKSlMotkC1tp8iAeDrvqrEcOWVVi+EwKFK9w==
X-Received: by 2002:a17:903:2f88:b0:274:5030:2906 with SMTP id d9443c01a7336-2984edcd3a1mr35066775ad.46.1762946284740;
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:50 +1000
Subject: [PATCH v5 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-4-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=0X8ztOxPIoLqy18jxO5aLU25sae5cz22Tql+G03LG0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUeYXSp6HTiumdkXFc1P4lS9PK9pZfHi1fzZ2ef4u
 HINXwV1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MAptrWmuF/hdDOyUmTfkptiMp9whlc1h/rFWiQ075Z8Ps7E5W4r7/9GRkmt8XcOv9
 ZLjFA4cGDV3ZBzGeuTKy/kmDxwz4r+r3ILmcmAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e6cdae221f1d..500395bb48da 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.2


