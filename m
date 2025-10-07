Return-Path: <linux-input+bounces-15288-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44FBC127F
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 13:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4310519A0563
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 11:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FFA2DA76F;
	Tue,  7 Oct 2025 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+jnj6UO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCD52DEA74
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835909; cv=none; b=W3gXylHf1+AcHRoZPn8ivCohhGiWcSXdYXyCe98oTd39wVbKtIMj9BOiwno2Gr0g9UwHDwo6m3hbYVjzULkrlWeuyftBQWDCwseHTgQKc2/DSGZMCiqEDHOy1z+2L6Ex1GkCjhijjgbco6n0LqyZjfYT0vy3W1vwTBmH1H5jZ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835909; c=relaxed/simple;
	bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtrUMTsqipEq7yVaqwdR4GDVcciYZTI4Gozap0hoYhwa/xFTsp0m7DKmPFOa8uQf98fMm+NI8X8mtd6YAjKCCETp20R9Ylyp957cmbyIuDTR7jG2BVXxbmCjpGavYUFM1llugQQbIC1pwEGoslVyxXfpV8eSZkGMClPp0UEtQIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+jnj6UO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5f2c1a7e48so4164493a12.0
        for <linux-input@vger.kernel.org>; Tue, 07 Oct 2025 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835907; x=1760440707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=b+jnj6UObutrWihY5DzYo1hdQkb4zq9q0OX1jft9AfFJJ7TnzslKEHnAVHzD6SaPy9
         NS/nacyK7Q1ldGnj4NT+KCtLJovbQoY32F6OxS2OTYegbG06gREre1s9hkDzIz+OKGmb
         gTVJ103Hi64t82XlsMCT3hOn2v9AT3Irpjd0HHhk577ICYA1rL3Pmh3Y5DEzUGhs4oc6
         XlRgsFm1oT0Qf5lsEXdq10vqnUVs9znH5xZ/ltk48nPRLv+sxGKgYxOZP0vJMBztUXeY
         ARIYeKMT0Rz6Y1fBVTuzv5jdX87t9QZ8IyE6zYxeBmQHoILrXHvmHP675tmP7nDbcEh7
         Q0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835907; x=1760440707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=wMmlRYK2/tiTb13n96TmKpqIoa0tpWlJTBcPMFN8L+aLuoTPqozfXS6jiPNNtcU6eV
         PPwPTt8hudOm8rlznuF9AIjSM4ZDxmBleKJh6NCgq9HX6F6RcM29ZNM/Ff1d/a87KjQE
         AoPSwZHka7ZoKbW7jnmyWr4WfsqIkOpAx4U5jWQd+HS+scH3UMC3il+nj+f7g5M78S/E
         I+SZT/8JN6RFhHYCfJb79ra15BmCnIkLEhf9x776aQ27U2GHW+HnIB7fAxacav+sEMpa
         lIBchPw79833LpHW6waH6Dzw6bz0iYGp22EO2M8eHMj9DDGhb2jHFl/zx/r/polYQjHA
         K2cw==
X-Forwarded-Encrypted: i=1; AJvYcCUSnxiiF5lc5RhX2OooleYr+TS6IYPAq8A5JEFQENPT9x/5iCH/VKutY8TkyMM56xhHRnBYaIUQIsS5lA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ssXFgg1HnMONUgmRV0btdq2mynvCr0w9J25wqejYtmmxsDnR
	hYQVoyXr/hlP9KRGLwy4/ZIylCd/CcgGIY3UYJVA8AX91DEz33bH1/GB
X-Gm-Gg: ASbGncu+v06/+w/hPOFpXKfcSrmtlVbMKhjH1VKLyFQtb9oMp74+1vYV4bngSopvOeb
	tXwJgGr9J9pmRFlTQA39DTLHAnI0B/x/mkQBJ82sF7qBuTauxOE7hoDEQVlrnV0U/2mUXG4xc0j
	SxNELf71jo8zyI4AzE7om34iwtD1RJOKY3ZRE9SM4uuKrqN0jUuuhuie80bwXHYC/784P2Tqtyo
	TGKZqUq05WAtEsLQuUgJCSgZ5BzO+F0WTfUkVthOS6rAAIap57Gk3lGRalfvKKi40PF/CJR9Y2K
	FWWdS43QNC1MVRW4KgtZqSDKBmYogR2gkXBczxppmLyHeJwcQIY3xS7wCsNZe24YLWPe3VctLdf
	Us/z99TlsgVIHPLuJF1M2l3eHlcxemsjDzIH/NHsm/f7OUtT40fz7j/tLiQVtkPRf2g2uqadREg
	oyPAOaUFqlKfle5MPIxliA6mjEjzUk2dS65LrYctrgLQ==
X-Google-Smtp-Source: AGHT+IHQowcxR6757+GlLYRBHRpFuOKwNlnMD9n4eoDO0fw6pZm/bFX4pWpzRYdC3fx/Hl4yuHMEZw==
X-Received: by 2002:a17:903:2411:b0:269:6e73:b90a with SMTP id d9443c01a7336-28e9a5f9e35mr217258715ad.15.1759835907147;
        Tue, 07 Oct 2025 04:18:27 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:26 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:50 +1000
Subject: [PATCH v3 09/13] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-9-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
 bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3bdvpC9h7ukB/rRA8obS89f9hMtfzQ5LZlU/1yf
 m/m3NIwuaOUhUGMi0FWTJFlQ5OQx2wjtpv9IpV7YeawMoEMYeDiFICJlK5j+F/ecz513768gKhX
 oQt1SgQCP8Zw/Du3t4Dro0n/rujl184y/JU0nKG83EgjvuMO9/Z7PNYWE/aGVTK4N/ksY9ifXeX
 EygsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 51dd667d3b5f..3b69eb6d032a 100644
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
2.51.0


