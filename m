Return-Path: <linux-input+bounces-14101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3205B2AD32
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 17:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEA901B6472B
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 15:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC57A271450;
	Mon, 18 Aug 2025 15:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfT3AiPf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC69257846;
	Mon, 18 Aug 2025 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531805; cv=none; b=OyKR1wm3K6GRv90PqG2O5QfFKRQCSZldB93Lj+XJXJPZYfY4+C6B5J3BI8JPw/rN8EoMmvdeo105jdbOFcn/tJIfGyM4217jymfF++kUT8J1UAnjX7QRMwa6ZSGMxQuZFw7fNL8r5+mnNi9FMpoPAKy+latZe8oOsZA6zCeKL5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531805; c=relaxed/simple;
	bh=KYMP6FkfCg7JKeo88RFMhWk1DN454moSu5L8teqBS7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dsfSWAj+4d7XYzpTgBparFS5Rf1tQ5VJRQwE3L7M3BwI6oiaFfXtoedyT6BuuVMMidbzU0ay+qpCZFIhsyvgQBxV0FfU7kTCphB5aUCQ4IvWv8yPOIDkRfPuNKrz4oFP4tk2d+Grw7pl59MJ+jXtMR5T7SMEkjD20yt1enDx2Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfT3AiPf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2445806e03cso42371765ad.1;
        Mon, 18 Aug 2025 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755531803; x=1756136603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gJ/PV0RGi6n7Ose80iY3fbX/G2TGqZFVsosOFly79w=;
        b=HfT3AiPfMGXYnoW1WOMK3+DmNsfPETw7+XaMNyOO9MsKqS26EIMWnVpkBEmgVS9NSt
         ZZCVRuVuj92vrpdIa02DOjYHfK8uEaQS8s5UDHMGs1j7IgwYTDfMUwS8OPZYrgOXffFc
         ezmszkKRQU4pEl97BOf/PXwATLLFelHHSMnZu+WhSIZtT1oY4PBOUHzudtMyj6rK7fcZ
         qu0Ev1CblEy2+E0tz927sU4ZdgfhtiFkN3w32AuOuS76NAh8sXK9kklh/foq1RUdElKt
         FC+Nz6+Is7Imu8Gewgyu5vVOOkRPkwdLAeBh/ZN9RftB3M48QJ1OjMmjw9bZmPMg44RL
         ktIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531803; x=1756136603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gJ/PV0RGi6n7Ose80iY3fbX/G2TGqZFVsosOFly79w=;
        b=JvLBR9yGz/dEkd8L/wovk6YMG6mlAkf9KHKz90KA1LtTn6VYzhA6wlNJxF/QhxhSHD
         TZTwmOjlH4bYsfEshhst7spDMpo9UHarHwd5H1r40leJ9mMNr+Ksftl+bfk5FTSOhXHg
         6prCBr82XkgSaiUrVyKjW05Yeuvja9FGUN49j/QExZ2iXThOhYskN4LIIc+uKIj11XG1
         5nZLuVeDjeWPS3GMEsAWanfYobXXtH1DK8Su/pYgvCpXA4pq1XXGTHRL5Q4Tx6ePcPrW
         4LAAZ6JXSG8Knx2h4miLB7uq8DAkAlXf07JOiXanIBoW6kyTnVlh3Kc4GaKdTkI4nMIZ
         qcow==
X-Forwarded-Encrypted: i=1; AJvYcCU6nCn/HRwhgQXXpRCFFx2ndpC/ZSOD9sqaz7BUcmX6j5eFbpSdnrnPZjRoGvPSOZgmdJHCqivc7KwRFg==@vger.kernel.org, AJvYcCUbKQD8LLCKjkoB9tNt/52sEOaDkQkldp/JoVEHav96phdX13CZ6XQtFKm7ZN1a6L0sigGAoefcZmVyiCE0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9czdMifxcRZ252SRriRm63qI/YGaoM5qS2ix07w1gN6bBYlMe
	F37UMc9nY9N/OCDXNCpoUdNZ8IS4X6XcS3S8IaLXm8HC8TFxNhKjn0c/
X-Gm-Gg: ASbGncveILD5KhrL8ja2Rko79DIvJoMRvqIfVgemBxyhM6lRorwfyxW11+0ixOnlZJF
	lXqjyKVkHMFmDG/7XJqdkwaZkiurGZcy6G6bXAnP9dzUi4BBZX8FUwd4Suf14h6JlRff3fM8hAD
	9aXF53A7F3AiLOasqCJrWa6ppS43BdRzJp49ZmfZvKx1z3I3nVrXadpi0a1QJD38F5Av9ICDKZr
	yiE8yJHUo9oGIEF4iYTHx68LOcVv/0QCIQqLZCHtQMofps2oZdsGggrmJQ6vaBosNv6hIsCab/T
	I8olM0wSfuJ4fD2E108d/AEYG7eFxa/qz5qthl/oi1EwuNB9pvSl9dNKYD3+/UB7jqfhdn/C3ME
	ln5X1MlqF2L70COevZcu0tuHgJA+dXS0IQp7U+8oBO/lY2vl8KQ==
X-Google-Smtp-Source: AGHT+IFjllZ9Rn0cBvaK2dkXox+Fg9pWWu/yOe7wl02I+mJYa9anzCVAf0uxoBm0B7fCwAN+ICJKGQ==
X-Received: by 2002:a17:902:c40f:b0:242:9bbc:6019 with SMTP id d9443c01a7336-2446da2271fmr167677415ad.57.1755531803392;
        Mon, 18 Aug 2025 08:43:23 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3c31cdsm316885a91.3.2025.08.18.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 08:43:23 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dtor@mail.ru,
	x0r@dv-life.ru,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] HID: axff: add cleanup allocated struct axff_device heap
Date: Tue, 19 Aug 2025 00:43:02 +0900
Message-Id: <20250818154302.811718-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, acrux hid driver allocates heap memory equal to
sizeof(struct axff_device) to support force feedback, but there's no code
to free this memory except when initialization fails. This causes the
allocated memory to not be freed even if the driver is detached.

Therefore, to properly clean up and safely manage the allocated heap,
must be modified to use devm_kzalloc().

Fixes: c0dbcc33c652 ("HID: add ACRUX game controller force feedback support")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/hid/hid-axff.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-axff.c b/drivers/hid/hid-axff.c
index fbe4e16ab029..b8202737f4c8 100644
--- a/drivers/hid/hid-axff.c
+++ b/drivers/hid/hid-axff.c
@@ -96,7 +96,7 @@ static int axff_init(struct hid_device *hid)
 		return -ENODEV;
 	}
 
-	axff = kzalloc(sizeof(struct axff_device), GFP_KERNEL);
+	axff = devm_kzalloc(&hid->dev, sizeof(struct axff_device), GFP_KERNEL);
 	if (!axff)
 		return -ENOMEM;
 
@@ -104,7 +104,7 @@ static int axff_init(struct hid_device *hid)
 
 	error = input_ff_create_memless(dev, axff, axff_play);
 	if (error)
-		goto err_free_mem;
+		return error;
 
 	axff->report = report;
 	hid_hw_request(hid, axff->report, HID_REQ_SET_REPORT);
@@ -112,10 +112,6 @@ static int axff_init(struct hid_device *hid)
 	hid_info(hid, "Force Feedback for ACRUX game controllers by Sergei Kolzun <x0r@dv-life.ru>\n");
 
 	return 0;
-
-err_free_mem:
-	kfree(axff);
-	return error;
 }
 #else
 static inline int axff_init(struct hid_device *hid)
--

