Return-Path: <linux-input+bounces-9529-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EB1A1C37B
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B59D53A4872
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8546209F48;
	Sat, 25 Jan 2025 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3zBapY8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0F208983;
	Sat, 25 Jan 2025 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809719; cv=none; b=pdQASH20saqowyOMWeE08pu08IDaZUmB5NY9POKjRczzsu9A24QxoxedVEiq8hlY7KgcvMTo+wCUMSwtMzlGDwGWOSqDrsKhoVWhlILzbmngYN6eMmjT8ELQ30YW//nFW44V8TmvIqgp75BR6nRT1KYv0rMpyXWCgcWYmUOZHR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809719; c=relaxed/simple;
	bh=Wgx/z114BCNIXJeltqTlAJtNMYqVVfI/6qj7EN01q7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGXqo/kgvoCA0wYEqI1CmUV0+56sigX4Hy+f48n5MHjSRqmdRIFKsD7qvJWsHFFtNKyRAqKH+UPs26IsDF1iajHROHUbG6gYDzLUTIr5XcrurITgUabFI8mqr/3iQerQnjufbQcAEkomIXOaQSdBNMHQEijuocUtT553ZkKDimE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3zBapY8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e36a1cf4fso497424e87.0;
        Sat, 25 Jan 2025 04:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809714; x=1738414514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9F0g5M+5UOOEmkYaBzky0xN1+z4m67WrZHskKFwI6VE=;
        b=R3zBapY8MuoB6LvEvW5eWA4/F+wx3inqrM77RmPLpOrfWhk4mmGS1nw3Jvd/Hqktul
         87KDcTFtVGb9QItDWsxXwv2f2fyxSJBWmG6t1/O8cXfAnpDuew6r17kVyvWYD2+Y/Z28
         nPz4TLOL9UcRHdjY1B7ohnzdq+Zc422dDMnI7IZAxiqnHRImNmoBLbQZHRVr9RV/tBSr
         8ne7YcBfiy0dBx0wW0uG4baMsNbBhmXuMCtmaLMLn/KW3nfY8s5Rgb40JzARqBKvP8jr
         L9wD2k8Dple3hNxrF+VyYrlJm98/l0uQFtH+i0qMqHJeAFp8ZIk6ZkxszaXBoxc/9Ot3
         GVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809714; x=1738414514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9F0g5M+5UOOEmkYaBzky0xN1+z4m67WrZHskKFwI6VE=;
        b=I3oCZM/67iId+JtJeYNTsbge+UfN9I30EhLfAl5suOzb0fnA/3p5otGyFr9C1Hy6z8
         o3SqEnm0nZT3ykMPClKwTIeUYnI3pFCwoNQKaloUY0LIfl3DlqZwZDPTUY97Im+yqBUT
         oUSpA7okCzmCn+H0SKuNkaiMrwYH+LimaZuVk8ZCEKuQT/ZpUH+4hgeG5WRloP6PLqDv
         JFotgfwC2Og8zwlc23rMfhuKvYWZMCUzMFxMR19n5mg3akV92DTr6jAMdVz9YDZsJG+e
         d1a6bEOBOsFXb4ybdWdYIAhfA/SKGXSubrTlazlXOCOncf3irSw0uZvUi26SDx2+1yYO
         q0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRleQxUY1pS4V+bjMbMwpuTD76WBFUHw8wPkwYIe45YN+GmK/kauKhht8K2euqg1urs8JYbnOfwp/9BA==@vger.kernel.org, AJvYcCXUZ+NuxMYvgjDF7x+3ICyNNllIP/yVfSw2oQ+lnznli+yn8sT2MHcxkf2zr8I2ygK7LELUiidwi4jB@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9gJiRfsvmJT4PvLtrxpamC+6FxTDuFjCfnI7hGCKv66vpjw+
	eSsH7AqSjyiqVXBZZswH96hHqp6sE+NzhI80XGN3Kv/2TrcjymKs
X-Gm-Gg: ASbGncuEbGdHXRIg8w9I1KlrZTFGQu5hKjDodNbSTsVqF0Anr+QyEuWrCSG4qxCaMrM
	ewOnNLKq62nbXd0VR0wFDtel7dVccJ24l4Ki4sd5Xs8QfkaK9qOg3PUxE49gxY/mV0nXODiKshX
	Lv3qihtdANKZqJSVk87b7pnbZHdLEnWKqGETQxcVZ48D5bMVWyBQmkZv5iTVtHmVsViPottuHG2
	A3nPI3G7hmQrvVyKHv92JtokzmVETQ1KdTYtWsp/qx7EKPlOUVyNFCpkwPSh7qn6lx27uh/XkRP
	zyBZgdSVuOomlwXFXQhCaCG2Uh6ThYQNpxWqmf93eX3s6xKaWvM=
X-Google-Smtp-Source: AGHT+IEt52SjdRTKBTTtjGa4lxDSIC15hVlODiq0PPiqYS8zUxQKYQrR9XmM/XSZvW7Ix2Px3g9yog==
X-Received: by 2002:a2e:a587:0:b0:300:33b1:f0c8 with SMTP id 38308e7fff4ca-3072cb55835mr41747491fa.11.1737809713996;
        Sat, 25 Jan 2025 04:55:13 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:55:13 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 15/17] HID: pidff: Define values used in pidff_find_special_fields
Date: Sat, 25 Jan 2025 13:54:37 +0100
Message-ID: <20250125125439.1428460-16-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Makes it clear where did these values came from

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index f6dc6db0b59e..c5bd4ca71e93 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -48,6 +48,14 @@ static const u8 pidff_reports[] = {
 /* device_control is really 0x95, but 0x96 specified as it is the usage of
 the only field in that report */
 
+/* PID special fields */
+
+#define	PID_EFFECT_TYPE			0x25
+#define	PID_DIRECTION			0x57
+#define	PID_EFFECT_OPERATION_ARRAY	0x78
+#define	PID_BLOCK_LOAD_STATUS		0x8b
+#define	PID_DEVICE_CONTROL_ARRAY	0x96
+
 /* Value usage tables used to put fields and values into arrays */
 
 #define PID_EFFECT_BLOCK_INDEX	0
@@ -1047,23 +1055,24 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 
 	pidff->create_new_effect_type =
 		pidff_find_special_field(pidff->reports[PID_CREATE_NEW_EFFECT],
-					 0x25, 1);
+					 PID_EFFECT_TYPE, 1);
 	pidff->set_effect_type =
 		pidff_find_special_field(pidff->reports[PID_SET_EFFECT],
-					 0x25, 1);
+					 PID_EFFECT_TYPE, 1);
 	pidff->effect_direction =
 		pidff_find_special_field(pidff->reports[PID_SET_EFFECT],
-					 0x57, 0);
+					 PID_DIRECTION, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-			0x96, !(pidff->quirks & HID_PIDFF_QUIRK_PERMISSIVE_CONTROL));
+			PID_DEVICE_CONTROL_ARRAY,
+			!(pidff->quirks & HID_PIDFF_QUIRK_PERMISSIVE_CONTROL));
 
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
-					 0x8b, 1);
+					 PID_BLOCK_LOAD_STATUS, 1);
 	pidff->effect_operation_status =
 		pidff_find_special_field(pidff->reports[PID_EFFECT_OPERATION],
-					 0x78, 1);
+					 PID_EFFECT_OPERATION_ARRAY, 1);
 
 	hid_dbg(pidff->hid, "search done\n");
 
-- 
2.48.1


