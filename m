Return-Path: <linux-input+bounces-12557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 164EEAC30D2
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FD483BCA7F
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C191F3BA4;
	Sat, 24 May 2025 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RS5Qb/zp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969861F30B2;
	Sat, 24 May 2025 17:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108861; cv=none; b=WrqskT/WVMXaZXfFg78L+AFluuPfZoXGksXgn4Y8E2atiVcFJu23DxFUHsynTJ5zaDnUqUp0qhOKwGzYbzj3yYlMQVD7Ss6EilwUn5ccS5+xCjEj3XGGvE8EQBHGgC6rTKI8XI2HZwTL9BSdEwECMJw4oRfAziNrTLBNQF+iAVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108861; c=relaxed/simple;
	bh=3tGDqnJBbu18AXgYPHchrP1w38yffpx8pAq6cn5Lx7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWcB+En0CQncD+ll60x56AsHuFMhnHrVxZ3i+wriA0k+PG03iGSc+Yvelp1rgVBx5Tqr5BwU64b9YA+Ax4+bqf+3Nuj+xZXotwEx0RduqWVzwgXiH62urv5p4JgAEigLiq2v0gdDAeGnS98+yJeSvDqbWqYSmrcuuhP2Zs/5dG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RS5Qb/zp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-604583107c9so41702a12.1;
        Sat, 24 May 2025 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108858; x=1748713658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpZ3BfemwzqY+Li8lN49igLDWD/37Rv71NUNEjaL7Ps=;
        b=RS5Qb/zpUvwsz2pVtc/AnKItTOfIT4LqcttjbZz6+Af+JjR6PL5r22lItDju3uLYYc
         bW8ByrGQn4CN4Mj9BnOR9LhMYyvsu8E+iPnA0YPff/YZW5MGHnv3tzETrpMDbeX0Qppx
         lrTkwZmEamQlzzzJiI/698/QVtI7cxElASKRtPnbIM3XXQqi6FUGRSiWN79na4cn+Ruk
         sJz8DAEuayF/D7krXZfqV6IBPIppXVJ836/iuXCqqa9gCt/418susstzZz+2SzRb98KV
         i4pjAKQzW1RQfduPlH7q6MsEdFaSw0grc/RAWbWVrqw8zYCVnPEZtrlTYvCJbrbJWfMF
         eBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108858; x=1748713658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpZ3BfemwzqY+Li8lN49igLDWD/37Rv71NUNEjaL7Ps=;
        b=bCN/dLTPcaVci74iXvtFBXfSizsk7yGOV7adeFs2TWUmQu8cEXgJXlnsI4Daxw25xM
         nhTesr++mhEzUTNW/S5Ni3R+fHfihKrq2mGH5tc02uVai4bAIwD2wlT06U/7H5JV8Gas
         xQvqN8Z9X034kCuPHjBGjjqxZiV8ZjEO9kh7CDt16bKV2HIcesdR57voMKcKQNg/sCMj
         X6E9YF4CeStcuGhlcG3yRq8p4bUjAdhtQI4fduFe7Wby+cAGpAdgXnfNOmEhDbzxQ29E
         n7KekBgJ4lb64Y9Rr9rj+H0umthuL9e4xET4E8Vmh59NP8y5HTy5Hx0Bml/jivUIwl3H
         5dlA==
X-Forwarded-Encrypted: i=1; AJvYcCUcHztsUwaG6RnPTwjmnnNUOUZGxrWkclH/RHIvYzeSpJWLqlo5ESvaNorR6YWwSJ6WQ+epG4Hp/PhH@vger.kernel.org, AJvYcCUvTSZVVsFP6+Ns4b+O5X4no4IpGEs1JCajhu7TMBSHpBXb3H8Y0K2jZw7h86Oj9Piiaj2jslXtzYsEBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwILUNvuWNqA4I54IzBsLHOa8FfoVH6usY/1Ufnc3M49nlHlyEc
	LFOLF5wSs19Tfkbz8Uh51Pvw9mO+iAYSw3dcoTtmixkgUdHj3m6Pcqoql8pw7g==
X-Gm-Gg: ASbGncsmsZ9TmuFz8mNXK2bChiGVvS3w/Mbv3FN7H6lnR4wjErgRAXe1r3sBR8PEavK
	keW+5BC2S5WHGHh04IB8OdGkKzrijlEnhbF6b/tOhNTn+mA9X/Y2GcCRX/1oyWBlH7Y0swFEHTi
	t5UTs21siB6NRiib+XKCg9e2pBHWvkyx6m9p9llia9QnwRQIfanCNTDHXKv5sn12Bkwtsy9AC1z
	6qRY8pmWPGo/l0JzfND9SIsSecIuUVqdyrOzTwhCkzt5DN5rVjaOou4hWvDq54cFBOwNwvx3wX6
	SnzCUkxhpjmco3popDQYk/Y4du8bLgLvZYBITIObB10kRaZIXmNNNRxniky7puoHHg==
X-Google-Smtp-Source: AGHT+IGA8M8TaUOaTMJDuUc02SNtUscC7ATlRgFt9ntYyWDQVilaO2DDZt7cyrbxDZs5o+FO7n+U7A==
X-Received: by 2002:a05:6402:354f:b0:5f6:c5e3:faa0 with SMTP id 4fb4d7f45d1cf-602db3b4ebdmr1141489a12.10.1748108857627;
        Sat, 24 May 2025 10:47:37 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:37 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 11/11] HID: pidff: Move else if statements to follow closing braces
Date: Sat, 24 May 2025 19:47:24 +0200
Message-ID: <20250524174724.1379440-12-tomasz.pakula.oficjalny@gmail.com>
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

Fixes checkpatch.pl errors

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index a07c5efddbe4..614a20b62023 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -976,13 +976,11 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			pr_debug("Delay field not found, but that's OK\n");
 			pr_debug("Setting MISSING_DELAY quirk\n");
 			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
-		}
-		else if (!found && table[k] == pidff_set_condition[PID_PARAM_BLOCK_OFFSET]) {
+		} else if (!found && table[k] == pidff_set_condition[PID_PARAM_BLOCK_OFFSET]) {
 			pr_debug("PBO field not found, but that's OK\n");
 			pr_debug("Setting MISSING_PBO quirk\n");
 			return_value |= HID_PIDFF_QUIRK_MISSING_PBO;
-		}
-		else if (!found && strict) {
+		} else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
 		}
-- 
2.49.0


