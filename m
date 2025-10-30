Return-Path: <linux-input+bounces-15796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4285EC1E9A6
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 07:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1322119C14BF
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 06:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CACD32572A;
	Thu, 30 Oct 2025 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ojLVIWMn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78362FB99F
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761806233; cv=none; b=eKWLpfOe9RaxsLzzdTB2SOxxXY9HloFLWSxufUzxkJnruT/v78KSaHa44DbJZeK3tgqxOKBLbxnJsfTqo6As6i3VfIKLsPfVtV12gKQTccMWbZ9PyndfbueiZnXN9pDz27x6na3wRNqxh/nMBMGbTnTucU3jNyKzRPxmzTgjvm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761806233; c=relaxed/simple;
	bh=z6RMcyk5XD0HE6+7NbYB8avXShQxig3SkzJmyzRO5I8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rZWiWQcjk5BnPyE09tr/pIweT1jla+zkE8mUm9aHGkj6ztbiWvSMy2j4RFr+xjCp5HwpuSI2pTXHm/ZcHwAYu1nlXHEQOtpamxUbGXvWXl4/hvtA5APgoqozfPjsWurYWOWyh4TlHXxmjcdocCSaQ+5HQeSD6l+aZSP8KnwDiZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willyhuang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ojLVIWMn; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willyhuang.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so1230768a91.1
        for <linux-input@vger.kernel.org>; Wed, 29 Oct 2025 23:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761806230; x=1762411030; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MoYlSypTMFSr6JglkBvey7GxaEYRPECj/uuYV5+iM1E=;
        b=ojLVIWMnVhbze87l5K+Dc1z7HDAK3y/Oj4O2KD35TzcgA3eFmHRM+JU6wajxgz6D+n
         v3Jfle6FpzwWqjxDb7piMxyXDig+rCR7zQSiHKkznyfXefvkQXSfl/qCTdDdWH7vnyZ1
         oLrIQwYS/+Yc2acKrAFzRlaoM+EVOwl6tmFcjr84cH8CAAs0F6LODDk5VWR+jQafvXy6
         jY8KbB7GDltE2s7WP6FbvbFZk9/H+f/J7sZzro3UdmAECz75/KUwQFnvsHo6IgiJTzpH
         ECUqS2DMJSjBZVZsy3Hm0hXjrT0RmTB/Ta5lSVi0Hs96MdnEoIJB/RsaoWmcAGeypwtx
         esUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761806230; x=1762411030;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MoYlSypTMFSr6JglkBvey7GxaEYRPECj/uuYV5+iM1E=;
        b=W9mg0k38ckxYYzChVH6LsQXObvtsPbSSp8f8H+M8r3apzqBd4l0LS5j6RWQQYFh6Ck
         U+I9g4prEOrM2+xq9VdBJQ/+UrExMDW1dIgYlDxW/tviBd+CIz03B6yrG6InJtJfcMJv
         pfIW8znM8JUHaUmsQJz+wbKXo5DehfHtuWe+Evh75gZxalhgc9rbHLjID78tubsMXW/8
         10clfB+wN1btNPq2LefIS6uNdX+2cqEnS7Ls4Qo5oFPVMievMRoolWLCPZ7yLJo4YJIk
         CMDTUJuCByFHIsed4dDyQiQaC1/S2DRU3ltS50bqVG8GCQ9VZeykqx8CwzFfZW2saR/h
         +wnw==
X-Gm-Message-State: AOJu0YxZS+QRnGhBBL3+YUAhV6DQJIJW0RaRCPM7iLBbpDSs8ktg5HdE
	CcgbqoKCHAUZMKec1AmY4Sow0uAEiuYwOwO4MvqAMfHYPI4bwZA3Q6ht7L7gNjkfsjj+64vRQyh
	Zlg8F9KdQ2UxtF6Pp37N7NA==
X-Google-Smtp-Source: AGHT+IHAGgw5s3hEmyfwxh0QyF6n/uwNh5Ln8ayUug972f15fOZ2MS+UtAFmFMuPISJpw6fLDTKNs63Tda82X+gP
X-Received: from pjlm20.prod.google.com ([2002:a17:90a:7f94:b0:33e:32fc:fc4f])
 (user=willyhuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5108:b0:31e:cc6b:320f with SMTP id 98e67ed59e1d1-3404c3e456amr2241897a91.5.1761806229967;
 Wed, 29 Oct 2025 23:37:09 -0700 (PDT)
Date: Thu, 30 Oct 2025 14:37:04 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251030063704.903998-1-willyhuang@google.com>
Subject: [PATCH] HID: nintendo: Reduce JC_SUBCMD_RATE_MAX_ATTEMPTS
From: Willy Huang <willyhuang@google.com>
To: "Daniel J . Ogorchock" <djogorchock@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Willy Huang <willyhuang@google.com>
Content-Type: text/plain; charset="UTF-8"

The JC_SUBCMD_RATE_MAX_ATTEMPTS constant is currently set to 500. 
In a worst-case scenario where all attempts consistently fail, this could
cause the loop to block for up to 60000 ms (500 * 60ms * 2, including the 
additional retry after a timeout).

This change lowers the maximum potential blocking time to 3000 ms 
(25 * 60ms * 2), improving system responsiveness and efficiency.

Signed-off-by: Willy Huang <willyhuang@google.com>
---
 drivers/hid/hid-nintendo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index c2849a541f65..342cd6893502 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -819,7 +819,7 @@ static void joycon_wait_for_input_report(struct joycon_ctlr *ctlr)
 #define JC_INPUT_REPORT_MAX_DELTA	17
 #define JC_SUBCMD_TX_OFFSET_MS		4
 #define JC_SUBCMD_VALID_DELTA_REQ	3
-#define JC_SUBCMD_RATE_MAX_ATTEMPTS	500
+#define JC_SUBCMD_RATE_MAX_ATTEMPTS	25
 #define JC_SUBCMD_RATE_LIMITER_USB_MS	20
 #define JC_SUBCMD_RATE_LIMITER_BT_MS	60
 #define JC_SUBCMD_RATE_LIMITER_MS(ctlr)	((ctlr)->hdev->bus == BUS_USB ? JC_SUBCMD_RATE_LIMITER_USB_MS : JC_SUBCMD_RATE_LIMITER_BT_MS)
-- 
2.51.1.851.g4ebd6896fd-goog


