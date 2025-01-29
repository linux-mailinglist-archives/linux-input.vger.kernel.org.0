Return-Path: <linux-input+bounces-9614-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E1A225BD
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B0A47A10BB
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FC91E573F;
	Wed, 29 Jan 2025 21:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfjBj0X5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FDF1E571A;
	Wed, 29 Jan 2025 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186196; cv=none; b=sxHbCjXiJ5a+qJx/6bHUxuCpKBkH/oYPxR6vVDwk2xc8b0lwpLuy5NvMIBqth3zZqp78Yo/nxG7utGs2E7JoAEo2k+LGhCv+pzyyFPkXeOKzsZtXRo+7062cSoobt2vs5odF+/COiNBnIdEilIpZSjNf0kxDijmmWG2jsVc8Noc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186196; c=relaxed/simple;
	bh=Dmf3lA3aRJ1G4Xn/CCbTrBcvMiTCnv7ZMSj2gfYWlQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lKlpergg3e0/4I4fEGKsfn7Q6+s+Q7JtcNMTeASbqZTqAmaOaItK2J+vykEPKAAIQpsf85Cs22e31Wnl+BgqnT6KDKZfRx08XlgNhVtnLv7gxN/1aK/MQvo8iWiS8wG0dHSv829IGITVCfgWstnKqbLO6l9TvpHEqHu4kbe/LTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfjBj0X5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401c2bb7ccso16583e87.0;
        Wed, 29 Jan 2025 13:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186193; x=1738790993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwz+pFtdjDe32aEt/94eKI6IYzS9quZ3LOoIZ3RV8ss=;
        b=JfjBj0X5RDQeM5xb/R0AVc5+QbHdqlfx6PR/wYsUWe4RvjvqSsU6v0sD0oOfG/458f
         56nfFEyeVBHDqYd5+l+IolBUP1MGDBip5s1hVRiwYFGLEYtZE1Hs0qvypK8S3s+uiuEW
         nedk4KqEVhC14nJTzPiTqZC9fOi9mchApbGI2ZqBxot1ZhfMkSBZJ+AkcS9y64AfzPlB
         klxjTOws+92Y6KhP2MaODH8pN7ToPzWkg91WGZHV3ynGHlqunZaj5cgNklL8mvXDBqVL
         c13qDTP0VC01E7gD1Vh3Y0QnH6fWWHXzxCmC9br3zkPIEdEYlyI9zDSlKrixc5gHlxAQ
         B6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186193; x=1738790993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fwz+pFtdjDe32aEt/94eKI6IYzS9quZ3LOoIZ3RV8ss=;
        b=UsN7sfZTudPckwqoQMPQXJ/OJeFpsWQnqUg99iVhEbBkheU39ilH5Ya6gLDqcL4CSu
         mozbvyf6QwhSuCm4j+kCACNrg27LI+s2Uqy50LZviKn3HO5tiTqs7mmNJZcRljP+JPca
         cqIJkkFy69QL0s8ajVfiTLc7VUxQ26m7UgqGwfi2dpIVgtocj/AiqCehjRRoHlPMj1Ee
         my7ubThLiwXiRU2o8O4PeD6t7WIT/1+RBqjm4I8jn5UZtT1TZRJyQvlRp2tM+kw23liP
         JMBNyLd5hjQv9gAtOUgLqCoXxrR0+beJZAmBUBXmcIGOYnxYf3WePRtrGd43ekuosoTI
         qe6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFoM30394l7gARBbTZhoOotsrdyRPCSJcA0xKhf+emTAJFQhcJGXMhSl6A0qjlV8RlJ7slIfJogXYG@vger.kernel.org, AJvYcCUu5j+9atPnUwyz9VATolc0pGvI6gF36xafBrkgaRGQ3oOdSGZkIlpNFx5O5lpdf80BLZ5AOtTP73SiMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6dyyVbpgPdVuy0m6A1hXmP90PjcmydIyjBgSteG5dzQLhvpbk
	tVsGDZQ3ZvfYGubta1FMLCsDUh5lo0LVisRl1P+0Vz+u32tB8xoQ
X-Gm-Gg: ASbGncunCF3Hp2qK+rxlWFlGrftpZIf5NOsPpoz9ya+KUoAPFDofJTO5J+Gh4mZcJE6
	q+4HqHrQ077qrpcBorKnCvr2jMGwmQ+9NvxWUssXqpFQne7Zb5fPkFv9FyiK2DGIMjPc8l8qQ+w
	Aohuq9NQwfRkmAhdneFu7m4n7cbl3MV4DSG5nPLCiS0b4kxuGM/8CrMkx8wjgqP/WcYLPshuJrX
	Gl5TIm3AHe55I8UOktVIb1em4nG7BgHijhW6/QJfgWjLmVT4jGooAgMIDX81WVbSTSzKqHAprcL
	5Hzgf7zvvrTa4Y/Yzhwj0EH8ZBAFx+mMAunW5vz2RXR0kDhDay8MIOAdsCFjHA==
X-Google-Smtp-Source: AGHT+IFGWYsUfktEv3Trv/cUWnhk/Evc+4ARetPF74+8YEZ8XKr+y+x6eX1JRhe1GMutuk4aH9nkzA==
X-Received: by 2002:a05:6512:3ba2:b0:540:3593:9fd8 with SMTP id 2adb3069b0e04-543e4c02e48mr568192e87.7.1738186192978;
        Wed, 29 Jan 2025 13:29:52 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:52 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 09/21] HID: pidff: Stop all effects before enabling actuators
Date: Wed, 29 Jan 2025 22:29:23 +0100
Message-ID: <20250129212935.780998-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some PID compliant devices automatically play effects after boot (i.e.
autocenter spring) that prevent the rendering of other effects since
it is done outside the kernel driver.

This makes sure all the effects currently played are stopped after
resetting the device.
It brings compatibility to the Brunner CLS-P joystick and others

Reported-by: Jules Noirant <jules.noirant@orange.fr>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 9e03dfb2b1e7..c125f029b6d6 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -109,8 +109,9 @@ static const u8 pidff_pool[] = { 0x80, 0x83, 0xa9 };
 /* Special field key tables used to put special field keys into arrays */
 
 #define PID_ENABLE_ACTUATORS	0
-#define PID_RESET		1
-static const u8 pidff_device_control[] = { 0x97, 0x9a };
+#define PID_STOP_ALL_EFFECTS	1
+#define PID_RESET		2
+static const u8 pidff_device_control[] = { 0x97, 0x99, 0x9a };
 
 #define PID_CONSTANT	0
 #define PID_RAMP	1
@@ -1222,6 +1223,10 @@ static void pidff_reset(struct pidff_device *pidff)
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
 	hid_hw_wait(hid);
 
+	pidff->device_control->value[0] = pidff->control_id[PID_STOP_ALL_EFFECTS];
+	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
+	hid_hw_wait(hid);
+
 	pidff->device_control->value[0] =
 		pidff->control_id[PID_ENABLE_ACTUATORS];
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-- 
2.48.1


