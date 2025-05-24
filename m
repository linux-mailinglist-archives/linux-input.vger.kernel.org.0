Return-Path: <linux-input+bounces-12550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A5AC30C8
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4C9016DE37
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA811F1513;
	Sat, 24 May 2025 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtEdiDOc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CC71F09BD;
	Sat, 24 May 2025 17:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108855; cv=none; b=sWlopS1+rZn9e98mshgZL1KEoFqbFZk9p24Hjhx9HjEEhM4g+9hH3dVHmFXvwJ+G/+eEL0xhAKJb6Fo76MgAbzx/cXL6f+WCL5i15zQ+TssnMwXOpbAV+3pvKHM2h8ISU7GJa3RSeobpQVNcc2y9xkmdpLxq0qbtNEGdAMX7kGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108855; c=relaxed/simple;
	bh=8zV2Zz38Klb5MFeLBdrn5DHAzPRNSVUba4ee/qaxcto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bo5LKwBy98IIKpcitaPnJCVyTWYs1rVHwYd7BR+ppgHDjBazbtQpJk3PXNCCyrjkPjghxuWKUS+LL01ppfglZykcCUFUVEDzbhiTJlsH01NsUejQTgVnsCk9AN4QWKYetSb1GTIr4RAe8CicxR35Z01lZKsetD/fWTPQ6oUMgps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtEdiDOc; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6041b38c94aso67194a12.0;
        Sat, 24 May 2025 10:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108851; x=1748713651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LE2pVpuHLxjaHNVGuCXTpw5e/6sQrWu/pWCwQjCGC5c=;
        b=dtEdiDOckII2V6yx9PM6GSykqg3d/3q6XYOk5HWVVHFl5yf9xUyaUIQwqe0lcBUjzq
         LTYH/RzvyITmFqSE7AJ6nIqk1tXniqmp2PlX92eVGyRI23JD0c0BSBnCxaGEMTI4w8oA
         TZbCO3AAJUpIcHmk95smn7jztZ33gYBZ8g7Fj2fjeqGga8XejXEeT3jP3QtnucCK6tTZ
         +DDegeFNW8lHfNTFzOPY/lyXpXVC+a/J+3qDdcaI/YjOQ1YHYiE/KXQvIMvqwxNJoECz
         zUpQaAlwjsUF6DoWj1R1RRvl4YkCpXIW518nbUSkEGmk9mTYw0dnhKaRKPA+ny3kBOym
         i2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108851; x=1748713651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LE2pVpuHLxjaHNVGuCXTpw5e/6sQrWu/pWCwQjCGC5c=;
        b=ZVarOXBX3s7AqYqNCaGNvbzt14oSoOwJO77kqMtQ8jaRV2hY5m88a4rNlTmYa7zw9d
         wSJfQH/LLmjLIgwAxG7yA/vUjPIvdVtPgJmG/bfKtY/xgMh1vPy4NWuuGv0d8fiu8eWE
         KUoHsFHmW406g2f9m1EhmiS/D/rGi1vgoA1mF29lDaNoOHK9CMMCiA8goPVcE3HZFxhd
         ZURg72nI9AjDPzacz0d8LQmiH7/vaPdBlkL0ZPjC/BfhPIbVgtXxTd/X009na3WuHhs3
         R3bHhCC01c0Q5Loze2zO+GYS9id4WliNf0rO3odRND+Eqd15p8L0SoiZ8UGKcFAz3+Ez
         zRag==
X-Forwarded-Encrypted: i=1; AJvYcCXT+pEJcNDflr7htb1ZdAWvpnzUxLM54sy2RyknEDVwyimObdEOZNNzi4ZBlY6+sQGbLXbfqSaJ3B/zhQ==@vger.kernel.org, AJvYcCXoPQs8iOu3SIiIFjvs0p1Yfl/hAXvzi9ejrJrACCaApS1P9U5nsqitIktxqVU2MG/1FSRWUtXAwPT5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Zb2H5j1856sqGgj25Cq6lSMqCPCbCVIM6EWm4Ng67P1k1BbB
	t7DgMpYlhUudBoKObrwzktV04EFrSdPr4JCxKHNS/OU9Gf+kUBFiZDe7
X-Gm-Gg: ASbGnctxVNz2KXefOGNrmFpZQv3m0d9QMfhhWqCv3vD9rioQPDEvCF8R9HWA7nghDwP
	5L3j96rhgEzTVd5gPqcS2m+9WMC6uuCCC1qfsh5OF8sKO9oUnFZ9Mk1panGg0cLkSIyoF6mIHZR
	4jUSsRRokWiRgUjCkYwsAIvYFKlaJkcURuT5T/4ZiBITUpsxt7tpfBi/xthTXvLpbKqmdXqqQnE
	zeQR7FPecLEQNc6blLY/onPBc+6/A5HVMFqaQstIbZ0B2nBWY/psHO5J+x8LmIe2lTsuKVvUkdJ
	pGlkkVPWp5SNymAGWUju/91mXoUrC/8jciZ3Nz/nBpKe49tkYcxZGsfRONRWa3No7qfAzpidS8F
	P
X-Google-Smtp-Source: AGHT+IER32neNIQnu4ymwLiWZkefU2hS2HcLHAH7jWfX7exDg5CYFWg8TX2TN/91xD2vXPTNQSbH6Q==
X-Received: by 2002:a05:6402:27c7:b0:5ff:9994:92d3 with SMTP id 4fb4d7f45d1cf-602d9cfb00fmr1039090a12.2.1748108850977;
        Sat, 24 May 2025 10:47:30 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:30 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 04/11] HID: pidff: Fix missing blank lines after declarations
Date: Sat, 24 May 2025 19:47:17 +0200
Message-ID: <20250524174724.1379440-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes chackpatch.pl warnings

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 8dfd2c554a27..3c2b20cf7853 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -241,8 +241,8 @@ static u32 pidff_rescale_time(u16 time, struct hid_field *field)
 {
 	u32 scaled_time = time;
 	int exponent = field->unit_exponent;
-	pr_debug("time field exponent: %d\n", exponent);
 
+	pr_debug("time field exponent: %d\n", exponent);
 	for (;exponent < FF_TIME_EXPONENT; exponent++)
 		scaled_time *= 10;
 	for (;exponent > FF_TIME_EXPONENT; exponent--)
@@ -332,6 +332,7 @@ static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 				    struct ff_envelope *old)
 {
 	bool needs_new_envelope;
+
 	needs_new_envelope = envelope->attack_level  != 0 ||
 			     envelope->fade_level    != 0 ||
 			     envelope->attack_length != 0 ||
@@ -715,6 +716,7 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 static int pidff_playback(struct input_dev *dev, int effect_id, int value)
 {
 	struct pidff_device *pidff = dev->ff->private;
+
 	pidff_playback_pid(pidff, pidff->pid_id[effect_id], value);
 	return 0;
 }
@@ -1207,6 +1209,7 @@ static int pidff_find_effects(struct pidff_device *pidff,
 
 	for (i = 0; i < sizeof(pidff_effect_types); i++) {
 		int pidff_type = pidff->type_id[i];
+
 		if (pidff->set_effect_type->usage[pidff_type].hid !=
 		    pidff->create_new_effect_type->usage[pidff_type].hid) {
 			hid_err(pidff->hid,
-- 
2.49.0


