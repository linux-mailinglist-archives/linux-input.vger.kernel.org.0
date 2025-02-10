Return-Path: <linux-input+bounces-9908-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05226A2F14C
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 16:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D54D3A8CAC
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 15:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3955E22DFAD;
	Mon, 10 Feb 2025 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McYskzSX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED7B223310;
	Mon, 10 Feb 2025 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200689; cv=none; b=eCD7giFGp2016Rds5mM25340Yt/Abm8iUVu17afUKACSTMGJcmymZ23p213p5LLawF34goqm7OJLnFtFjZoJwuGiV45Wc4sjQzon7t6LMqrvZ40ZHsZjUhF08VqQEE1v6GuPCECzb9Tq8xaYhguohS+OsqWwpSzvEnhCPLjZKcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200689; c=relaxed/simple;
	bh=hEUOz4r4b063cF//KxITwPn2mFWBVo4aXCOANEAY1s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MB/GF5Z4ulLG/HxJP4FJRcNPww5WGigKNKwwSiUJnr9PEStf/2bsO/qrXJYEY3lGi1VMi5PNBbFpcB44JJMhtUjIwgozaOpmBJyaiWjFKWiSL6MZqscFWwW5xGrGz1QKCISyiLPHgeK6S5/ZJ8r2liaIPA4ZC3HJ/HGlnXhAVPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McYskzSX; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-308e4bcd978so2238031fa.1;
        Mon, 10 Feb 2025 07:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200685; x=1739805485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0Vht8N9aFzyUUZgls7mKnoAuTHlmKN2cyTZvLxlmsU=;
        b=McYskzSXm95eA/kyKUGfhsNBHdAa9SZcbkzifkHnVD1B/L6Fm94kfE8BIA4Vkc3H3a
         ujKUoT0VRi2be4L2bBqe3klDwhwNHGOZl7lVUAwoNUwdHbtWR8yTqTKjvquCmKFsXpTC
         ewXHqcp66e4H8AlTH/Ro1bc0Yp2Fu9Rf+o+SZINf5gFS1p0mw58p8R8Ci8+B0Fk/m66d
         h2Bj25FDOn1vWRiVU63aul1+PbZMZl57HU/RtxpD/plTWH7gpiuEYRW7hvhfOpsz2CUS
         l0HTeq+fpVK6QA1g+Nm7L09hQVkvFCmViwZzDVGQqaYYEM126nMk7mRaEIO6CUASYO/x
         QCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200685; x=1739805485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0Vht8N9aFzyUUZgls7mKnoAuTHlmKN2cyTZvLxlmsU=;
        b=wFftui7TjO2KxKKIpXaYR15w9r4lCAVqQ27p8ud/jXXZVE1nMngZTlUZanq1RLrzZj
         4U4lNePiDCN6EZZwfJKGqEVflfVnya0Y72pco83RUyg/OhE3Xwf9XID8PEqAC4+jS/C4
         Tc9FMb4sLPY9rcGGwj1rNmXLy9UGiqf4f0ASnKUkfEAZh5zv1yqG9L2Oj1WpTQ9qkBoe
         xnLIGmcH0JUK332QkiHhN/WwUDvMhk9i6iWEVHEf4t8ODEAv8xewleeslKJj29WggOYo
         KfAvPh88Ka7OlV62vzUpd8XnLbFH/ionDdBbVHIum7HLf2AqD6QfYLITbCqk2mjNb7/o
         JLLw==
X-Forwarded-Encrypted: i=1; AJvYcCX+luoEzOf3DAEGptMrQTXVvKjGr2gtIcDEHJEr4x+s6DLEjqXNKPI/AnAGGBOFx1svGbp9AbLYcn+eGQ==@vger.kernel.org, AJvYcCXbja2OUozm/Ij+D1wAw3kUQ17i6HiGvRC6r0y+zH3SmSrgG0GeTn99+zeSyX1rMxJx4mufPC2g2Lfp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz242L+1pY7DRONAd4DaJHA470WhKGufnAViyETKxlrAuLoGUUt
	n0LSq/3hYP1OflQeLG/nR7yIYENV/3jmmH/9o/7mOQo9GYrb2lnB
X-Gm-Gg: ASbGncsrBzgz0Sle45FfpTkwV4gk7A7DLUH23E0a87wYLKfWukWWenh6Ew9kSubdHNR
	En/6Ua2K1yOl1ksI+BWg3Q06qNr4Q2pWLUbLx7JyD9XSDJHQLY7JnEIemWFI6+Cu8GHs1k112z3
	DviTRRIcEM+0JmeL7GUKbfbD4GIi18aZENwwWciFzySLkb0QfGINCPSZIAITC5/F9RRjnizY7EU
	Kx9TeV26sB4Zyz9YW4fL9eyt0b4zOhDNPqsYy99aNbQVUVbYax5mIuMBSeU48AMcYl2xB1wED0V
	YF2IUeuqZRn3gs3i5asFi/qicwS3a47zxTpVtGNVEtlIIhYF7bPDcCT9k7gEeQ==
X-Google-Smtp-Source: AGHT+IFAJ1rrft1I8aKeni7LYJc0oUgBmxNzG5D/ZcfnAGHT/2EQTbOnO73ZB21mwbTwMBqtqXtF7g==
X-Received: by 2002:a2e:a556:0:b0:300:38ff:f8e1 with SMTP id 38308e7fff4ca-307e57c0305mr19374761fa.2.1739200685308;
        Mon, 10 Feb 2025 07:18:05 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178201sm12090561fa.16.2025.02.10.07.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:18:04 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 5/6] HID: pidff: Support device error response from PID_BLOCK_LOAD
Date: Mon, 10 Feb 2025 16:17:53 +0100
Message-ID: <20250210151754.368530-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
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
index fa9a98b7c28d..f31b95cca3dd 100644
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


