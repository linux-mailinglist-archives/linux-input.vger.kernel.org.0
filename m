Return-Path: <linux-input+bounces-5842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2795E200
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA341C2137D
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C724986277;
	Sun, 25 Aug 2024 05:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl6vJEcg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623FA84A22;
	Sun, 25 Aug 2024 05:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563016; cv=none; b=kxrk9cwPUmZxx16UafTnByX8KXePLjbvKgGyDukk40o5t+lEM0WDckp9F6tWunvyNgWM26GoX1NQxyfSaIALbeGOZ1P1L7iExAXZn3qeDVai9mz7M00QRTpncI+ypAJnr6A4O4MZeKDRFjZdDvLQrZQzvtbc0KZ122aDkUFgkPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563016; c=relaxed/simple;
	bh=2WGS4zDij+Ixhpcdfhz854o1PCDNzbO0tvum2hvSOgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJPhMTLx/wUJPz5AxsCvR3JBnUBVDKKtvqkanHCUlt/uvPpa3ZfcTwZGXb0YjG7d4myTKnSiotWIBcafsodBk44UrOv6tdvk5dQapQpDilgS6Vqvd/JO3zxG7x/6X+mShiHRUIT6kTtz2pE6X2oeFeNdyeHD6djnl1/LFFr6S6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl6vJEcg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7142e002aceso2659942b3a.2;
        Sat, 24 Aug 2024 22:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563014; x=1725167814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgrHzPeIHjCQToVGMM9JpdcPooP9HE7kqNjFtcQ3CT4=;
        b=kl6vJEcgsVCFbDmEo2paVNJZss7mW81rcyrWJpnjDbHdBViPykRw4MAtMaIgFn42+K
         W6h11b8TJp1EeKqLn8icZOFbeNXX7NivWQnyfGwRhGO/0IzGF1Jv0JLRQpDncWIt5tMe
         DjOsXSBWdf3ulpVq6c1+CB/jplQrk2YK0Ds/+mBQm/Cv1QhB9NVTzNAvw/YOYcIp22Fl
         MqYtvfzOeQPfGGReuyHfjdKhcAqM/5iJTSMkloKj/lta5KsoiTyCdDIVvWHz9rTbVHPM
         T+s5vS5szTDueN1DxrMjOH/5i8VuJOKbXJNOHojIaqTqGfn/GqftBcLW0IcRieRWKOOR
         oDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563014; x=1725167814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgrHzPeIHjCQToVGMM9JpdcPooP9HE7kqNjFtcQ3CT4=;
        b=V/ntkCyVoBcAUsDoHrW/8koFIV23ddtQaUzsocJgVjNVMM8KJ19XgvQAthrF1QrAkU
         F62Lgf7VNT6QQSzvNVY9eVzSVEq30bQ4/WiKxv1GsccpcCNnb8S5o32hsxPGnz9dZ/Ue
         TLG7WtjSgE2GQLwpcE1hxz8UHOQn3/WtiNq9j692WH5Xpv/DJQvf5gpzkUEFVGTfKcT3
         unsV1oUXLQxrNTHTDYIM6zti1NOMC0Mp+n5H3+myGflB1Cz4uPQbP72P/Dm/WQCJh8OJ
         cuWsscFpUvVbAk8QVaKNXDoP6H6xFIyFWFQcHVGWT3SiFmYIyEGeOPNVlL8AkZRgg5od
         pjHw==
X-Forwarded-Encrypted: i=1; AJvYcCVPrjcehAGqWTSxJu72vfZdcg3LpWv9pRd3e/WThe9wdhzwxMaHf6QquYde+dRMI6dB1XTp8Ldw9hcrztg=@vger.kernel.org, AJvYcCVosHi7oMLqu6h3L0eSSU6vLU0MZNzmL5O7O3brf6Zn+CWrUzaEu5leR6RmEfvYyHuewiGejGf7+WK9OQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC7qper4uANrYcQU5hKehVHN7eHOgQm6eKWXC7C8gKr7mAM+YJ
	7Rln5YpNXGxCc5iRdO19EsKZPoMWXAA5DmD5EPwxtGL34dz2X0ZiZ8Lxcg==
X-Google-Smtp-Source: AGHT+IG9GzB5hV+R3jUFqV7C8FiDWaB5skbl01e83Rq6Yxznn6igCC+xVD3kT7dOcBsXXHvExd8ddg==
X-Received: by 2002:aa7:8895:0:b0:70d:1fbe:b96f with SMTP id d2e1a72fcca58-71445893b63mr6876250b3a.21.1724563014434;
        Sat, 24 Aug 2024 22:16:54 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:54 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 12/17] Input: omap4-keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:16 -0700
Message-ID: <20240825051627.2848495-13-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/omap4-keypad.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index 040b340995d8..935c2b27b81c 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -144,7 +144,7 @@ static void omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, u64 keys)
 {
 	u64 changed;
 
-	mutex_lock(&keypad_data->lock);
+	guard(mutex)(&keypad_data->lock);
 
 	changed = keys ^ keypad_data->keys;
 
@@ -158,8 +158,6 @@ static void omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, u64 keys)
 	omap4_keypad_report_keys(keypad_data, changed & keys, true);
 
 	keypad_data->keys = keys;
-
-	mutex_unlock(&keypad_data->lock);
 }
 
 /* Interrupt handlers */
-- 
2.46.0.295.g3b9ea8a38a-goog


