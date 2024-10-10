Return-Path: <linux-input+bounces-7275-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71998999471
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 181DA1F23151
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6AF1EB9FA;
	Thu, 10 Oct 2024 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwTKEWDy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90C1EABDE;
	Thu, 10 Oct 2024 21:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595580; cv=none; b=L+oSJrGz3VURsu1oeCFE08CSnQ3qgIyYHJtFHLCJsvgLUSoIR5ghxpe0K9XCOYWoDxP4gpqVkMbSZ6i9oPmvgJCAhGrR8t8QZhl23KMQl/EHwzGlzOVpuQY/Rv0QSgp10jjz5zxOg9lXZyvEQuCwDxEESTbjmAHUWU4eGBbLR2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595580; c=relaxed/simple;
	bh=osj1On2Z4WQ2i4hQXIWGqEGjGF6nBC2nMsxNyB0VvTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ldNowmxAqpYNmB9mE+PQBq0h/x0y7TvHiVSyYuJsC821HRffc3hun/GZ6S3mv8C8gn58hDq0Nkp+Pl3BpJspsf2BAk31F8CQSc5ykI0+lO19yqIVpMsFnT4fhY0ghl9SZJ4QypMQCdW1dW4DjT5yHTJN5XBVsKuxjCdH8myC8ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwTKEWDy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43117917eb9so9971975e9.0;
        Thu, 10 Oct 2024 14:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595577; x=1729200377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUDTsje5EfzdoMuNeif+3YwfWRAgSWK+tp+b+is46Rk=;
        b=CwTKEWDyEEEMV2HU7Ao5oJC2ZffO/M1vex5qrUQztVsHRz2KYPPD5j+eE+6LKEfZdJ
         mGOV7mzr2jL6PwvQSHaoR4oobLKa2SQRsCzQiabLigy/7Y/n7nP5ovn/LENGpD1GiRqJ
         hRl1mzRJyDjl2hRFZdP55qZeiO7VSy0jjeM2TyOH48zbzi0YgIA1uacCUT9snzLYlfYH
         HWgPzWfQhbsn0sld3wbjJS0KYFdEMhNE2HI0FpBDDDnesUu9MTo9Cr/WIF713uAsWz6g
         gUNq0+g1Nwujvu+Me94FNX6LKSzyptDSc2US/HV89/w/t+/cpqr8QYDwChcrNYJxy2qL
         Ef9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595577; x=1729200377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUDTsje5EfzdoMuNeif+3YwfWRAgSWK+tp+b+is46Rk=;
        b=FVqZRqJgDiMdtNzpHqYq88uAhUkj/5ta0IWMwJ0ml9xXNGVYhPbQaiIFldxGyT820W
         0vYOlrCnAkP8n2SS9d6reKGoev/smy8pbHVaB4umfov/VqhLCVZ1U/Q8pLa0JNylS7ug
         805OAF9cr0kO6fC9rmgqoz5t5hL3VWJ0X3UtBwdLrQXWhnpOs6qy3tf0QvVYigs5Ucyb
         WBuEnxlmcorys7+awhOS2UeXPd7D3ecIIwKW5G3GufyEaHaoOFp5f+hRE8k1Tc6soKEa
         4o16yG0HKJWlNnaArxxWh2oP9c9NniB/o0wCIEqUNytt8lgn3zo4bMyM8UCxfjjoa2wt
         7aRw==
X-Forwarded-Encrypted: i=1; AJvYcCUCCJxDxEoFsdrQb2vzrmV2l/JBCDLNkB+ADEDlM7XW9e3gAWQLvBU5ILXmXq77aJOe3NflxK4B6uoT3v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR7dlAkAb2bWmN4YB++7RnGg6UlaMkGdOAgbdwzC6vMu1D/GY7
	oZB3EgvOPbqlR0tAkl0sRQHAJHnTMJvJBAFIIEOhPtApydZUc2cC
X-Google-Smtp-Source: AGHT+IErfYIIobd2OyStqSYzXYY8mQXAN1McuuX/JaESc8XSKGTQGWz4nicjCFOz7wSr2wv2o2OOOQ==
X-Received: by 2002:a5d:6645:0:b0:37d:4e03:ff86 with SMTP id ffacd0b85a97d-37d55313314mr307553f8f.49.1728595576937;
        Thu, 10 Oct 2024 14:26:16 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:58 +0200
Subject: [PATCH 08/10] Input: i8042 - use cleanup facility for device_node
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-8-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1046;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=osj1On2Z4WQ2i4hQXIWGqEGjGF6nBC2nMsxNyB0VvTE=;
 b=jnKPKqCaHxm+V0jnKxBl/3/ALs7b4E092gZ+6qqIEjdd4p92lVndVLYBkmFyIyZ+Riv1vvWHl
 EyNknbnL/FjAys5GQDIwfXUWt02P6ak3U6BA9XJn0TyCcEaSZ5CS/sI
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to automatically free the device
node, removing the need for explicit calls to 'of_node_put()' to
decrement its refcount.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/serio/i8042-sparcio.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/input/serio/i8042-sparcio.h b/drivers/input/serio/i8042-sparcio.h
index c2fda54dc384..8f38b6f4ae77 100644
--- a/drivers/input/serio/i8042-sparcio.h
+++ b/drivers/input/serio/i8042-sparcio.h
@@ -106,17 +106,13 @@ static struct platform_driver sparc_i8042_driver = {
 
 static bool i8042_is_mr_coffee(void)
 {
-	struct device_node *root;
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
 	const char *name;
 	bool is_mr_coffee;
 
-	root = of_find_node_by_path("/");
-
 	name = of_get_property(root, "name", NULL);
 	is_mr_coffee = name && !strcmp(name, "SUNW,JavaStation-1");
 
-	of_node_put(root);
-
 	return is_mr_coffee;
 }
 

-- 
2.43.0


