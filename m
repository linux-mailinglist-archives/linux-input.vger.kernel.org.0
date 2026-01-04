Return-Path: <linux-input+bounces-16777-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D342CF153B
	for <lists+linux-input@lfdr.de>; Sun, 04 Jan 2026 22:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90E04300957C
	for <lists+linux-input@lfdr.de>; Sun,  4 Jan 2026 21:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694D82F0C46;
	Sun,  4 Jan 2026 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRcDpRW/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6262E7621
	for <linux-input@vger.kernel.org>; Sun,  4 Jan 2026 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562298; cv=none; b=rVZ9w4hKdXEkc/WqtyGdbtzXhHugpoEAKspG6Rz+SFAbLLM2kin/JIlreD7zbXXltDDYXLf5jl0Zs8AMToOftksoyTUINLtCqathpixI/oP/Id831Pfjv1YROYAdd6hFY5ljNFtDhI18/rM5kXUKoesXaDn17kYxJRT5W4rRbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562298; c=relaxed/simple;
	bh=C3JR6g0Sas4kB+Y9QTc/bGVdciXlgmAK1IrGoVCuBt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxPtO3RqWQCpDGg70z5R5pBxNUy7urunGaICis96wTY1JrympjmX6jhkh1JSGa6e4cUc6SUc+BG48MGCyda9sRySy/27EWnibg5bAlDQ6M+Q43XS5vZs8urnpdkCNQJobT7TJ+eorvB/qVmYQECKaTvR8GRkyOQUZ1qwx7oL0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRcDpRW/; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64b6f22bc77so3002135a12.1
        for <linux-input@vger.kernel.org>; Sun, 04 Jan 2026 13:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562295; x=1768167095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNOBG85Xy8cdjBjzjHxVJyG6BfNKbQYZeOQLA90PZUs=;
        b=dRcDpRW/BcZFkc3oHHO0U+nEQmu4slDBW/M7ASx8BUzdYu+jjHDCAjzbMxGm8aZ13Y
         +RsJbxgc3EY6rGpwITPfjXnqajV+P/m9bMoHRqZ0VUjgvJhgX3HEaV0vgp5Rrk/WaFmB
         6F3drwlB9/wl+UK9c8CUAPVjhJljkZYbhyjBaIeNSb+YyGTVt7G8wsO/UvhHrAKyBTMv
         nOX+KcfkHfgfbUvpek9sCnqMgqPiJjfLqZRiKWCIKRtYScoAJ8mX8cyKXuQDbXV/I74F
         +AegRp1v76a+xENR5TThaDPxwtIzJXm8qVkE+pvEc3Nhc5eSXFyLw+BpW3/ntcprOXFg
         6YWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562295; x=1768167095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kNOBG85Xy8cdjBjzjHxVJyG6BfNKbQYZeOQLA90PZUs=;
        b=JK2Va1/9uaRwEfk1bDq3NsjKjl2PJu71GEOTrit2f6M1o4U5RGCGcoBfN2leQeMfIW
         YczbtOhDZElIpTVBZ15KCFAyh0UUG8HtnqQUzJ+hET6tB5PGUYZWxnCIxRazyOZvX5zx
         hMsX/gkDW79tIWY9vZDotcsyRUwSf05VlMzyCuggLZpY2xGzHdNQGPK0gk7koi8tEHZT
         hbdCz+LbAd4r/lLvuVGOTKPTNwRap0ZHe4CBzVWm22P77wxAKG537g9EZGlfmmGd0hLA
         7RZ5dmGcicX2a6jM7o4/PXnIBe1z/hWSXKfN4xF69yI7mYu5aXWQnH6udT63VoWaAy+c
         2iOw==
X-Gm-Message-State: AOJu0YwpKc1oHzv2Jv1e6q07UKRjN1gRl2U0BN/Vk7e+58UeIWbd04W6
	4fVhRMsSjOU08RHYgCR+QeGhZ9jBcFYS3URYQwFUbXmHSIT1rOD35OrG
X-Gm-Gg: AY/fxX7s6IJUHJyFCUKLvaQ4zxJ8wddDBejw3nqX0qB3JK6wpbF5DWG1LbwrfYoJnXF
	d9Ao3CCGRjSVCHrJziaidU3Ta58p0ncUVHrB1oCGnRCa4qzIVa9BmgmbWQZwksJxfULB74fwRde
	O2S6cyeaxClZIhpfePQa1VKjUS0lQc/vLB7lnhwwpYRnZweUQPxYsqxV7KOituzk//vCk7pZY83
	W6MbmnYcjio4cmOR1rSduYLfBU5BzniI6gU50tnU5fBCOfLDpM867CYdvdc3kGEzT1lgBSJEl2T
	ghPhnyaApZmNg8D8jkbfKu40sb84fDCEVMHZcGEO2/9nThyY+kzKs7hqwys6Qx73j8CiFNsdGHl
	jdERCkW7WBIcdADdpMJynUivsF8YFrybiS37zBJLlr2vCl5slEhj27plBGzjzaM+j8r5LpNbLo/
	2ZcKJL25sNLBR1rFwjNEWZSFsW3hSBYb2PuEDxYzzTzEvtyhUk73pcXoVgRNdkaJM2
X-Google-Smtp-Source: AGHT+IFp1Q3/HUuxiOTFczGNZI4zqQO6mImnPSIg80YYgcO2gFHg65+7gjjTh3EfyWvi5spIDfDlww==
X-Received: by 2002:a05:6402:3550:b0:649:9aff:9f42 with SMTP id 4fb4d7f45d1cf-64b8e3a43e5mr24517580a12.0.1767562294773;
        Sun, 04 Jan 2026 13:31:34 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:34 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vi@endrift.com,
	linux-kernel@altimeter.info,
	peter.hutterer@who-t.net
Subject: [RFC PATCH 1/6] Input: Introduce EV_BTN event for generic buttons
Date: Sun,  4 Jan 2026 22:31:27 +0100
Message-ID: <20260104213132.163904-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will be used to fire generic button events that only transmit
button number and it's value, not related to any defined usage.

Made for HID joysticks but could be adopted by other devices.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 Documentation/input/event-codes.rst    | 5 +++++
 include/uapi/linux/input-event-codes.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index 4424cbff251f..c387eaa63dfb 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -59,6 +59,11 @@ Codes section for details on valid codes for each type.
 
   - Used to describe binary state input switches.
 
+* EV_BTN:
+
+  - Used to describe state changes generic, numbered buttons without defined
+    usages.
+
 * EV_LED:
 
   - Used to turn LEDs on devices on and off.
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 30f3c9eaafaa..1c853c37b58a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -42,6 +42,7 @@
 #define EV_ABS			0x03
 #define EV_MSC			0x04
 #define EV_SW			0x05
+#define EV_BTN			0x06
 #define EV_LED			0x11
 #define EV_SND			0x12
 #define EV_REP			0x14
-- 
2.52.0


