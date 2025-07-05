Return-Path: <linux-input+bounces-13385-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C3AF9D02
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 02:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83982542630
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 00:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FB554F81;
	Sat,  5 Jul 2025 00:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLVEDaKO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9364689;
	Sat,  5 Jul 2025 00:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751676748; cv=none; b=VFQgRLOYm2asYSp1fCyZUsIXiqD0REfX/ckbp0hwsqKI0FaCdy5Ibtw4yo66CWuLpQ2dF2dfhdfB4yeUaBblcmzLsLuUneQgnbeQYt+zlm0PHqwy3youRnmqdjCEsro0+0PSj3OGhFQtDxti+7lSWHz9oJe25nCPuNJu9ZaGalg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751676748; c=relaxed/simple;
	bh=3u22m7V4oPUqqsklZhUxQdmmm1n0QAY2E6yerhJU/zc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gmTRU2tV97DjQ7qVJdNQoV3Uuy4E19xInCMMGXaQT+nivh2AhL0dHUp3O3jTrF56usz5+7sZEO2alNCsXANyskkXnqf40x6ALDna0TbuZ6v9+OXtB6XkSTvjP8Bwn0+NktzrxXCwb+scjwENAp1G8ZXzlyaVtcOGnRa8a4nb2+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLVEDaKO; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so1059214a12.0;
        Fri, 04 Jul 2025 17:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751676746; x=1752281546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EBHHcVa3W4XU2PHfzmcCgAEQ9gLAFZwUWX70qZtpbPc=;
        b=FLVEDaKObmE2Ga/JDw5LQJsCZuQsec3CamzVHVQo1g0i7WAKOD/0YnfmBqBilKXBSt
         NHTJIrcseVWmaANbj9zohMAMk7qXvV2mYfR3ZQgkSWbSEDOf7LSYLT31+3Pp+brFHWM+
         lGfDpZXENwU3PXkJI3gQqkojvPs7EjCisNo9ntejp23UGh5C5hO6git1d6ZXpvBUQUuV
         84A7QKPFihVfgX+IfRvcA4gKC4pveNnh1/U3EbcWyJUY4uAigi6Ctd9t6oN5WdjJRic0
         ctfSlODXB3CS6yqK56U13cqBxUXcfFc0vxcH+H65HsQxgL3hrHDYv48vfNjo500SVxc4
         ewbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751676746; x=1752281546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBHHcVa3W4XU2PHfzmcCgAEQ9gLAFZwUWX70qZtpbPc=;
        b=J1Ofiwj1sFtxKeJ5AadlDa9KiIgHtsMT+IKfIdKdUGOgk67VaCE3X7nrB2PYtDo9eD
         kVA68nw7P7RcmhRY9nOyf/BUdSS19PlO1Og5ka07J54dsrNvfPN9K4Sh8CW17EgvTbfc
         LTulfsi8z9qpPGX0nt++svWDhVRyN7zCEI0WgGoG1GxVRlJzFLOMCIhjoPaMqMlIStF5
         D6s4dwy2ppE60qkuocUpB3pJKOLYB6pNPn1MV9McDliU/0Tluv7gRa7PWFsoRax63ILk
         m7YSg1ghkFQtsIlyPIptPqCqyBB/vzpeSaB5/5mfyQtwsB+XpTWP4AKPspBP9ExG82m7
         oh0g==
X-Forwarded-Encrypted: i=1; AJvYcCUUppbUkCF6EuTsyJH86tgN2Vx7UPJ7vMsSCOvSvsrKwG5y9i0XjTkTHLAKNBtzQK0Xfp7g1cxMEus7qxMH@vger.kernel.org, AJvYcCVWpM0DHpw4QqyeTioVJjYqj6Zw4dJsSDHDzzWFiBn8uFhEVQay9xEjJQ2YfqtDQamEKMNCJWmCaf5Fyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZT3eF7WCs3igFUz7IzN8AT4z4mCsHAzZQ9O1GM8a+Bb0ISR8p
	3MAYiuDNWcUMIPe4XvvzPrLTxK7u+8ypsxr77LRZkHUXhbF1uSJXdVR4
X-Gm-Gg: ASbGncv8tJDqk0CDdr0y8kd8vc59ZRHvu7xJsQiLRMRlJfjDhfEtW7nONJErfGPtAZH
	pS6KtFrLPCLAIeVuIu/2ETFKh7uLD1hbDx1/hrLA/2mabOaN53A6J/WaWMaU4YSwVCktOqvQbTo
	W2+M+w1M5tsQHktKtrhTXVYVwsEN5JlvBNrJ4yMLYmoKDR/JUS2e/SEo7mUBMxnHZV4/PJMcSU0
	cbr5/Q4BaXCLFIXG7ibkGA2J/bo0KVOcIjLnRTcUtg7yDAA4+hbWJgIVNcI5IihLy81K3NlvrNW
	znpl0A4vJ0m84RPurVlYmcstUBpHzTMf4Ku/NQl4qYI902H6cY0KVw8+t7s8PdX0P+EpoDdEBGi
	rjtGdVqKYoFVk
X-Google-Smtp-Source: AGHT+IETy9RFjqkXH8PWGuIoz96s1UUnuk4tJVLobGtymAp0ENBgGogW9RsuihyxvG3+LgkXqsfh1Q==
X-Received: by 2002:a05:6a20:72a4:b0:218:bcd3:6d2e with SMTP id adf61e73a8af0-22724392815mr951793637.36.1751676745902;
        Fri, 04 Jul 2025 17:52:25 -0700 (PDT)
Received: from localhost ([121.78.21.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee63001fsm3018512a12.63.2025.07.04.17.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 17:52:25 -0700 (PDT)
From: jianywu <wujianyue000@gmail.com>
To: jogletre@opensource.cirrus.com,
	fred.treven@cirrus.com,
	ben.bright@cirrus.com,
	dmitry.torokhov@gmail.com
Cc: patches@opensource.cirrus.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianyue Wu <wujianyue000@gmail.com>
Subject: [PATCH] Add NULL check for OWT effect data alloc
Date: Sat,  5 Jul 2025 08:52:16 +0800
Message-Id: <20250705005216.279-1-wujianyue000@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianyue Wu <wujianyue000@gmail.com>

Add a NULL pointer check after kmalloc when allocating memory for OWT
effect data in cs40l50_upload_owt(). If the allocation fails, print an
error message and return -ENOMEM to prevent dereferencing a NULL
pointer.

Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 drivers/input/misc/cs40l50-vibra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
index dce3b0ec8cf3..330f09123631 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -238,6 +238,8 @@ static int cs40l50_upload_owt(struct cs40l50_work *work_data)
        header.data_words = len / sizeof(u32);
 
        new_owt_effect_data = kmalloc(sizeof(header) + len, GFP_KERNEL);
+       if (!new_owt_effect_data)
+               return -ENOMEM;
 
        memcpy(new_owt_effect_data, &header, sizeof(header));
        memcpy(new_owt_effect_data + sizeof(header), work_data->custom_data, len);
-- 
2.48.1


