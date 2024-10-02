Return-Path: <linux-input+bounces-7030-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 962FE98E450
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 22:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34285B2124A
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 20:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A49216A20;
	Wed,  2 Oct 2024 20:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeOdAwVh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0631D0E3F;
	Wed,  2 Oct 2024 20:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727901757; cv=none; b=BspM0gPyLlwvNM/Mh5vMeHvIFbFbOwktjkHDK0f6jgcWfgKETlXQ1ivpnhaI9fWBekPqrBHpn1uSvkrXfi4g/DtHge4EfqbKLO/NdwZmDP+Y5+DJdBwGy/4ui68kkSrGjqOf/Q7T/pyW5uCWFbjCB0wrkdn9K7663XgAXKFoWb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727901757; c=relaxed/simple;
	bh=csNhqH9fbJydpJQnY8d5J6s2t1YR5Qm3QfOmnPMXNhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NFwKfEoKkdR+HEDRABWJ+V7Lmo5JBDliIU+09XyHqZBqfbnMSuCE8GgpKhS0jAXxiCB4i4KcJBH6mnOI9C+Mgl91iydNe3NTrb0wMBke5Zl/xuSTtwh3UTqQpBatHa0CRVOqzwHN/JdOeZF4prnuOipWxxLljpEOARlM0QJvySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeOdAwVh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cd8972738so178736f8f.3;
        Wed, 02 Oct 2024 13:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727901754; x=1728506554; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPomD3F2YZp22GUi4/PJc8Bpqr8RJ1AX0BnpGS9WuBo=;
        b=LeOdAwVhRIqoDEiinmEHex46r/frmc0oIQ9lzBjnbdO1iA5yIt472azzqQ3zFVSasz
         wVU9qsWErGAoCNeuBZW8B+Nd7wG19tHgRUXgmh7SdsPCcC5MhLbvehdJmzKHowCTIUo3
         hRkuS++8eHSHk8juX636RFKeF62qbuxHrtBVYxm4XHqM+eWJqsB96H9lmbgQAmY6C5Ip
         ycRCsDsICWArs9+khYhTCj8ll99kHOidTXmIOQod9kR/MWEHdjScUkFbcbAqIMUETN5R
         Kxqs0Z7BhVfLX+sB6+avCXfw3t1GlJP8H20coB2veRRZa+8XAnmQHwE8QJIcX/4cmsCd
         rNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727901754; x=1728506554;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPomD3F2YZp22GUi4/PJc8Bpqr8RJ1AX0BnpGS9WuBo=;
        b=Ax+GwV6/3WSQpBrjUy4qJwcQ4fnIoHiOAC8iECTxmfedSxwl1zdM+t13VqcqH0Vft/
         K0KMifIw1EuzyNRHFP22lgmQyZ0NC0FPCl2J2V8hfHFgq7V2BqZvX68ULVYiJrt0Wa4/
         4YPl3GrlzabfMkxz0xJimgN1MVZ+KLmpEl2SY97oKThEBNyxKw+Et8rER/8WCo4lRhTV
         MBcS/hQFTNPhGqz+OxAJ+c65orEAaRVjwx93mlnsO+b3K/XA3VjY7ZYPWiu0JRX4gH5e
         xUNOHlvMMaoqHBMKaOXIvGGuu3nkK1OERJ0R6NpnwJc2m9pZmixllpJS5G3LtAJOQihg
         MY3A==
X-Forwarded-Encrypted: i=1; AJvYcCWlZhj9mAbvxQ5gorQtTcF79x6UYTk2bEZyeO7vA2l0ZcWAaxUCgDF8W3/e8/pFXr8tDQviJlRyRNPYNGA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfds56Fa+IlkXrK+/nn6NvQ3pp+/70q4qr4G7o4aCXaArU8kAF
	TWgtDlmKPoxEfHBf6IMQg6LkF/o21gaDtLmYIvod0vrTP3ahZIY1u2yLo4e2
X-Google-Smtp-Source: AGHT+IEYFitHtaMq8RbEGikp9QEK/WTQ5o0bpNZXaFI0JkzJDJoFwI9mO1f/SwwnThKgV1oo96ZJ2w==
X-Received: by 2002:a5d:410e:0:b0:368:5ba0:622 with SMTP id ffacd0b85a97d-37cfba0a780mr2713536f8f.44.1727901753458;
        Wed, 02 Oct 2024 13:42:33 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-28a8-6b99-3729-0965.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:28a8:6b99:3729:965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cfc262812sm2528862f8f.30.2024.10.02.13.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 13:42:32 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 02 Oct 2024 22:42:30 +0200
Subject: [PATCH] Input: hideep - add missing dependency on REGMAP_I2C
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-input-hideep-select-remap-i2c-v1-1-6b0fa1dd5fc5@gmail.com>
X-B4-Tracking: v=1; b=H4sIADWw/WYC/x3MQQqDMBAF0KvIrDsQQ2tsr1JcaOarAzYNiUpBv
 HuDy7d5B2UkRaZXdVDCrlm/oaC+VeTnPkxglWKyxt5rYyxriNvKswoQOWOBXznh00dW61lc+xi
 e0jgnA5UjJoz6u/53d55/ovihWm8AAAA=
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727901751; l=1066;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=csNhqH9fbJydpJQnY8d5J6s2t1YR5Qm3QfOmnPMXNhg=;
 b=SuFSoBcUQRWD2/FR+f9U7V+iyd3CfagxTVCGN8Ujxl6tPelGR5soW6guClCtmp2LwLAJB9Ss+
 iBwitVILdw9CUugSuN5eKAuxMvTbflk8ONTjcP5zPHU+egR/dYzG7M3
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

hideep makes use of regmap_i2c, and it has to be selected within its
Kconfig entry to compile successfully.

Fixes: 842ff286166e ("Input: add support for HiDeep touchscreen")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Building this module will fail at least with gcc-12/13 and a simple
.config that does not include REGMAP.
---
 drivers/input/touchscreen/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 1ac26fc2e3eb..601fa7ec2e8a 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -420,6 +420,7 @@ config TOUCHSCREEN_GOODIX_BERLIN_SPI
 config TOUCHSCREEN_HIDEEP
 	tristate "HiDeep Touch IC"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  Say Y here if you have a touchscreen using HiDeep.
 

---
base-commit: fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
change-id: 20241002-input-hideep-select-remap-i2c-d785b9d677db

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


