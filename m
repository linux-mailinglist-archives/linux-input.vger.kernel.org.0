Return-Path: <linux-input+bounces-4803-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E158A923CC2
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 13:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 113791C22447
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 11:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE1C15B12D;
	Tue,  2 Jul 2024 11:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2Enjn2y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D214D703
	for <linux-input@vger.kernel.org>; Tue,  2 Jul 2024 11:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719920735; cv=none; b=EczaExNq/ogsBLpTP/sNQv0DWkPi/iq5mgMxEGJPdMq0asIqce4b0O8jBI3u6eVkA/zA21EHCE/3lw4vYGv5C3MLjNdyLMOEzohGo5rdQ3mUuVCJcPCu0VrbHTslwQZrppcVZ1Wf0dRejOZ4X2ZGXzUwwn4Bh58gUKmwWdixK+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719920735; c=relaxed/simple;
	bh=b7BEb1GMp0N0LB+ob72C4rjuxa75QUzMf47VJxy0J6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eRL1oT5UtRocnTujd47tXmbfLvTDnSEsDGiWgmXD2HnicXsy9QQSkC85sF207L78j8odzbb+/tbVmKqsh1ayqBFwxWki/1whOkrQ0yw/XWg8vDOlBc7JT7FaYKHBxSbWMF8zNB3HQ6uV2EfAt+YDTjZ5YUClpscvgnF3eRC/RB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2Enjn2y; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d05e0017aso1839399a12.1
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2024 04:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719920732; x=1720525532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vz3BF/KeMlnuaXXShA8godWdvP8SWS1ADPMj9tfaSYE=;
        b=R2Enjn2ysiEubCReEgMMXhWKxS/ytxrUuSLWdbURTdkLtzSd1uHnyxsoM2pkdBD3vp
         4zhHtni/NUuSMYglJFHGjqPq5K9TZl7NaV9fBVznx8U6dbe4RTCUYbV/CLCit/Xc2mlK
         3QlV877YAKIUnZub8hnsv2tmBvuL1IpKBhzgovmQHSXlxvfAbXvHU7nKXjGa5h6tGCH+
         p7lhrrAjt41tbVw+6OF9fDaS8sH0pPQR1fI9L20T9DohuhwARrqU0nimWGoaxB6LDu31
         INqZHQaagZsyu8qRQwTv/1tJJfTOFy2mZnsmgA9PY2viBce+1yPTIYa08ebeeYhptpSW
         C9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719920732; x=1720525532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vz3BF/KeMlnuaXXShA8godWdvP8SWS1ADPMj9tfaSYE=;
        b=sNn823vCKvqChFCkhYcFi/BWYhm6DIBOpAxu8AX7OZiotaL3VNWWm4M52x8F635SZ3
         mE5OyC/gusAc0BOYHdzZO6zXibK5AxLcZtJ2vbohlfbMlJkXNWq7Ump+dFCzs2xhBR69
         /THA3kxlZIOTuvFsfq/Oyur45NWjG4B4hoqI2ypJVrVbBh9M8tDzqmQF7blR64fxLIit
         NGGueEKgDJVKdkLYzlwcnEe+N4GoSJFHrM6Hx75TuzweZThXCzASe+eTRWqPnBU0n7r0
         UawglEcEyioJ7pPrRIBB9j7GW/k4Zn9N+xoJkh3fjMogTTLAqFW7z7EhJvYFLQSh6Q75
         dsyQ==
X-Gm-Message-State: AOJu0Yy4FNhJyStPaTEWKkG8pogDR3oXElokpFf61/YZybBOCIb+/chT
	tkbsAurNZVo8GK/QBnY+3CUMdnrkRfnDJDnUNWkv2prxA+hBCYouotxNYQEY
X-Google-Smtp-Source: AGHT+IHzM+0uVQNqKvgj0+GgGGkI0PiyDwii5lGsgpPMcnScovclTXiuuXjGO/0f9d7rQxMZlICNuQ==
X-Received: by 2002:a05:6402:234c:b0:57c:6ba4:3d8a with SMTP id 4fb4d7f45d1cf-5879eed9466mr5608228a12.10.1719920731762;
        Tue, 02 Jul 2024 04:45:31 -0700 (PDT)
Received: from laptok.lan (89-64-31-171.dynamic.chello.pl. [89.64.31.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-586138185ebsm5580520a12.52.2024.07.02.04.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 04:45:31 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org
Subject: [PATCH] Input: increase max button number to 0x3ff
Date: Tue,  2 Jul 2024 13:41:47 +0200
Message-ID: <20240702114530.11800-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Maximum number of buttons is limited to 0x2ff. This makes it so game
controllers like joysticks, racing wheelbases etc. are limited to 80
buttons.

A lot of input devices for flight simulators and racing simulators take
full advantage of Windows' input API limitation of 128 buttons and,
in turn, some of their buttons simply don't show up under linux. While
normally I'd say doing something just becuase other OS does, doesn't
seem like enough of a reason, Linux became quite a viable gaming
platform in the recent years so this makes it so it supports all the HID
peripherals without fuss and confusion (there aren't any dmesg errors if
HID device exceeds the 0x2ff button id).

I'm a part of linux simracing community and we encoutered this issue
with Moza Racing wheelbases, as they use top of the range for things
like h-pattern shifters, sequential shifters. These accessories simply
don't work, be it connected through the wheelbase or directly with USB.

Upcoming Moza Flight Sim devices will face the same issue, and there were
Saitek/Logitech/Honeycomb and custom-made products that also have more
then 80 buttons.

0x2ff was already sort of an arbitrary number, so I'm increasing it to
0x3ff to keep the value straight-forward.

Change has been verified on my Moza Racing R9 wheelbase + Moza racing
sequential shifter (it uses buttons 112-117).

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4338b1b4ac44..c2cb3a2d0dc7 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -333,7 +333,7 @@ struct pcmcia_device_id {
 /* Input */
 #define INPUT_DEVICE_ID_EV_MAX		0x1f
 #define INPUT_DEVICE_ID_KEY_MIN_INTERESTING	0x71
-#define INPUT_DEVICE_ID_KEY_MAX		0x2ff
+#define INPUT_DEVICE_ID_KEY_MAX		0x3ff
 #define INPUT_DEVICE_ID_REL_MAX		0x0f
 #define INPUT_DEVICE_ID_ABS_MAX		0x3f
 #define INPUT_DEVICE_ID_MSC_MAX		0x07
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index a4206723f503..a8eace215b54 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -808,7 +808,7 @@
 
 /* We avoid low common keys in module aliases so they don't get huge. */
 #define KEY_MIN_INTERESTING	KEY_MUTE
-#define KEY_MAX			0x2ff
+#define KEY_MAX			0x3ff
 #define KEY_CNT			(KEY_MAX+1)
 
 /*
-- 
2.45.2


