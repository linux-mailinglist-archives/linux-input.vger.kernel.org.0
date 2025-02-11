Return-Path: <linux-input+bounces-9955-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2582FA30DA2
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 025A81888805
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3FA24FC1F;
	Tue, 11 Feb 2025 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kP4DFTwa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD78924CEC3;
	Tue, 11 Feb 2025 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282592; cv=none; b=Biy7svdKMEMgeAkrfEM319Yk3+NkuokgCspvhhIbSSZzxuOcFudTLPyhKenqEI+AyNYDUx75lanp1YgbMP6abemyy5rQ9sC84mUSY4eoD9qqNKqHRxLtnEoJjMUxbaHbcpcTjRLh8d18jP7zJ4ajacS5FUMbxZRausGDDq4cVis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282592; c=relaxed/simple;
	bh=kNGRVi3mkE4Ik7DuVSzb0dE3caW/bhvIv27XtZ4uEmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jugcu3bzAOENGS2AIxSWA0PUuEOXa7wkf5t329kVd5ABi5l6j0gV19rQKR8tkFKzO/KR7B3dsRsLv4BbmMNsGZ7IFuaTrCk6nNIZJiHTzFNWPoWRfcMmJQ0oDvE5zD/4d/6G/anA5NgZIyyt2rJUzjWp23Pnhk4KBYOoDlP1xAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kP4DFTwa; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5450e08f300so283387e87.0;
        Tue, 11 Feb 2025 06:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739282589; x=1739887389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2CWaXsm/K/mNvLz1mhLGG+mDBgTiXMcIaNXAmCgOmw=;
        b=kP4DFTwaG6UktNTEHN1ylbocF4K8KRWmONtKoM9fp+T7Sht9ZDElW/qGwYlqljNei5
         eosxH/Ouq4djLJ3c4YAsDvqFnRpVBXcRSsy3tQRG1N5KHkAhF/VSbMHG7M4ko0DsJoJ3
         Dy/Q4biFr5ii+7lgxBA9IAiXFDHxYJMHXL63+Yji7JFE9FySvcG7fIMLxx9cppbr/92c
         xh9CGbLtIhmDeTX9PBh9rahVP8oXiV1PVjI2/EQtQFKRS85P1cEmw2tIJ/fcyhEa0EtW
         rALqyjeiLcEXERRjU6Vg1z/0aVJz/8fZG/0IUYZ5K7DEl/e7zzqGtYmnxakW+SL1Nijw
         hCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282589; x=1739887389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2CWaXsm/K/mNvLz1mhLGG+mDBgTiXMcIaNXAmCgOmw=;
        b=c6bTtJhsIlKOonQx/v7g4YMvco1gEFpKtu2GOMWBVT94nN0JNWDcDO/sxS8rV8qp3y
         wpjju9HLY44zcFP9FRi9tHH0czIm8n6UvrgtLEoYIi9c0J6vf4qoB9CUh+iAZC63UpNp
         Ah/n/pnZotzdU2nc786/1kI+G2BQNmM6IFfys2DO9JpSLNuwBr8knZru9uwrIE6FXNgm
         68Ccmi2S/7AbKpihL6HDX+ZGTzQYmhRa9kQSUqi6bLY8/6SG8Ow9I82aBJoClp74uTzI
         swwG7TFzGvOVGC1dqNHIqYc3yriuIn7VaiDKfWfzsh9O6nHNkMnDIHO9ANfOCOdRvOU2
         lgqA==
X-Forwarded-Encrypted: i=1; AJvYcCVTM+DMDptXguuGQQO2sbVk3xIomSZzmytlgEiHwz8LM+o/P2v43WvnfqUpk8ZxgzlwfHp2Y32tdaZM@vger.kernel.org, AJvYcCXgX/vNIs0xjzexyNErEDL5/29si2gdLh4qDZe5+EqqekP0Nwal0vZdhhWSx7VaMCtu9ZHaBBJ0e4InRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSl5JVsh5u/CWjkJ7Lgb0mOcdMlYQkaPk4i880yzkowl7XOGr
	75VlPdDbSkRSkJLGLEWqUEzdFayPuNqHvZsqN7ajewhD35dkgPOl
X-Gm-Gg: ASbGncs5USk7aQXXTv1YHlozfpiwqGhLRAZ/AwLnD+be5lQIH6ynIctTOjbDVULiKyu
	WE53i+nRWA3n3lA+bQHVKA0EmXgtk1SXCQYjD4C5NFyiTXW8G3Q1mCDrptWF5OSQCW8jihNlN/2
	krwbW9ca4d0UrruPAnPyXvNUBHJdR7bjOEmTydh/D053mRrzsQCdrJGRLyTFXQRf93xAhG7nOG6
	wdgjw3XsYDvjy02D0OLk20oOb0PIGvK5JnqxF/ocASjwl229xg22zEd96sS5AXDPXdvMF6vc70x
	EEF2vhGEi7bOH/Si/1/xb5Jb4vP+a5xQNAL7dwYhGYZnArpd0KNVYUFvqFrVHA==
X-Google-Smtp-Source: AGHT+IHVPqTnF/S9xuKkuuUBxGGreITBRohMmM0gNs1PnjpP+f5eajnP/XaxJNiaIPpKHi4xf84zRg==
X-Received: by 2002:a05:6512:b22:b0:545:ece:82d5 with SMTP id 2adb3069b0e04-5450ece849dmr827307e87.13.1739282587061;
        Tue, 11 Feb 2025 06:03:07 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545014af0d0sm1118721e87.184.2025.02.11.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:03:06 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 5/6] HID: pidff: Support device error response from PID_BLOCK_LOAD
Date: Tue, 11 Feb 2025 15:02:51 +0100
Message-ID: <20250211140252.702104-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If an error happens on the device, the driver will no longer fall
into the trap of reading this status 60 times before it decides that
this reply won't change to success/memory full.

Greatly reduces communication overhead during device error situation.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index e2508a4d754d..d5734cbf745d 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -138,7 +138,8 @@ static const u8 pidff_effect_types[] = {
 
 #define PID_BLOCK_LOAD_SUCCESS	0
 #define PID_BLOCK_LOAD_FULL	1
-static const u8 pidff_block_load_status[] = { 0x8c, 0x8d };
+#define PID_BLOCK_LOAD_ERROR	2
+static const u8 pidff_block_load_status[] = { 0x8c, 0x8d, 0x8e};
 
 #define PID_EFFECT_START	0
 #define PID_EFFECT_STOP		1
@@ -666,6 +667,11 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 				pidff->block_load[PID_RAM_POOL_AVAILABLE].value[0] : -1);
 			return -ENOSPC;
 		}
+		if (pidff->block_load_status->value[0] ==
+		    pidff->status_id[PID_BLOCK_LOAD_ERROR]) {
+			hid_dbg(pidff->hid, "device error during effect creation\n");
+			return -EREMOTEIO;
+		}
 	}
 	hid_err(pidff->hid, "pid_block_load failed 60 times\n");
 	return -EIO;
-- 
2.48.1


