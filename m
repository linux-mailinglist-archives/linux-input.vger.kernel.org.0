Return-Path: <linux-input+bounces-12254-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA6EAB1D57
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 21:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01C88527392
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 19:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3131425DB0B;
	Fri,  9 May 2025 19:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWXj3npJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0B3153BD9
	for <linux-input@vger.kernel.org>; Fri,  9 May 2025 19:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746819304; cv=none; b=A9t+jo3+Qvua50dJvRwpBH5r4JDCl9aHc8kzumIovZjOn6uXB+K5+7fWXNvCzBaS5cVGaI1CxOntzbkA84+or9n5ejNtgD7bV3RdrlMaeffoSXpskXGVySjFy1QPvC5hGEeO6AuKgFCWMD7pVpIxzgski+BCh8odxh2rHeQsByU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746819304; c=relaxed/simple;
	bh=P5RaeOXbB21u0k5Ij7Pe4pHx7XFMVwmhUfCCKr28gcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRjOV/UQJwOnddUcfNKL3DAaiR5EXG/iK/p5Th6SCAV/L3OM3snLEyH/6QP1hIrgQuK5Z9zV1RUP8j7UdJt1nMeDWCjwXUT2KW/PBWqI54y1izJxcUvW8yCP232unA+h66EiaVnrmBWUL0GaTpVPoC3DorK8lckn8Rj74Qkl6sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWXj3npJ; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4def2870995so530604137.1
        for <linux-input@vger.kernel.org>; Fri, 09 May 2025 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746819301; x=1747424101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=teGDBz+oL+VepNScxLbhS8T7GRfFq4gMy5DrppvryVg=;
        b=LWXj3npJhF1biWoM+sDWhPlcY/wCSQN+AIRYs1Kj9w6v8j4MlAt3XIHX8i6NoYPr/6
         3vBcnWeLy0nRiyZc2/HYQ+b09zn2fr3gAH+JOOWhpmOb2++TVWMrpQ73VsNTRTQkfKKv
         XFkrftOXDWIup50aTlhtNDHc4xPykxVJkTyACUJMfnzY7Qs1pV6RcvLaSvs41SL1AnCF
         a/FSYJCpOnM32WdCfqKdVScPjBoGRZmHSzIZBKW649shLxR+/dkAB5eLdvXi6lHpwDIS
         1CwKcJH1C1in0FCMzG0QlYLVNpCaqn9KFgkXlUNvymIoTSR79/MENURjOUdEhM7c7kkJ
         EEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746819301; x=1747424101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teGDBz+oL+VepNScxLbhS8T7GRfFq4gMy5DrppvryVg=;
        b=M/pCR/DaQBJCAhIqBuYb1aMc+uJ/IhGxZMSiD5CWkvWWEPBsniuPBKP5x4aze1UwK3
         nA5mQYT52e8iiKNmMq7jot/EKyM9E2whjhsc5AX6KBSFvLM/SOnRH80LYRBVdrcxVjQ7
         oLxXPKKwbcrCK76TFnxomOAS7tAD0i2sQfst0r7tNWiQXVJZgUPkcIwg1WoLBSpqdH2H
         mGZphMV0A4X3viR3R/LfPlCYz4hQU9z9z2C6YaJSTgGcf/ACn+YcNMtJ0gbX9G8AYXH0
         Z13PEGhdBoJO+95nEdgvq5rhgrAoJjxt5YvPr0qa6Rl+UUU5neafNjPXL1UwfYWf07cx
         cJuw==
X-Gm-Message-State: AOJu0YyH1sCb/SFexIf7oEKLJfAPm8lxwjYC41kIWM6VySmOAkOn8XMc
	QtjZp6dfa001eYgFyHxU3+LBjobWaPvvwX9EkYpMi4NN5AVsrgvE
X-Gm-Gg: ASbGnctEerE/YDfdPjfoiQW3URKpKd20AccUEp0szbSvfPkWn2oClI4Kv8USJad5VJa
	fatClHPC4ktaAB1vBn6608xg8H+z/nMKy90y0WBlJNEsXTI72pSInmR92hYOjLOsc/VBKkr17Wl
	jbJy7109HITR7boNRz/rCta815y5uNpsKdlViSX73sqnIxm6GI955fCB6OG2A2w5rtQDpgPc1VA
	77ECwj1c+BqhiF1hoofEq8hWhS5wuAdKQWeCgnP5sDPcgKxq07dwGoWFgg708Tljb8V8yZY5DHs
	c2EkBfwn6Gkb79//zKrzxcOJ/irURECDYXzIkiWz2wbyGt070Oe7
X-Google-Smtp-Source: AGHT+IENkuS9M00xilQ2MKQnar7gurA/s0BqxVRVtFMEc1WzhFkDngzea6d6TlQAmOh3dBtBx/e7Iw==
X-Received: by 2002:a05:6102:800f:b0:4dd:ab6c:7654 with SMTP id ada2fe7eead31-4deed30a28emr4079844137.8.1746819301355;
        Fri, 09 May 2025 12:35:01 -0700 (PDT)
Received: from glados.. ([2804:d51:49ad:6800:54d4:409c:93f2:48f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb20173d5sm1604594137.23.2025.05.09.12.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 12:35:00 -0700 (PDT)
From: Marcos Alano <marcoshalano@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Marcos Alano <marcoshalano@gmail.com>
Subject: [PATCH] Add keycode for performance mode keys
Date: Fri,  9 May 2025 16:34:24 -0300
Message-ID: <20250509193432.2189533-1-marcoshalano@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alienware calls this key "Performance Boost", and
Dell calls it "G-Mode".

Signed-off-by: Marcos Alano <marcoshalano@gmail.com>
---
 include/uapi/linux/input-event-codes.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 5a199f3d4a26..f410394cd769 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -765,6 +765,11 @@
 #define KEY_KBD_LCD_MENU4		0x2bb
 #define KEY_KBD_LCD_MENU5		0x2bc
 
+/* Performance Boost key (Alienware)
+ * G-Mode key (Dell)
+ */
+#define KEY_PERFORMANCE                 0x2bd
+
 #define BTN_TRIGGER_HAPPY		0x2c0
 #define BTN_TRIGGER_HAPPY1		0x2c0
 #define BTN_TRIGGER_HAPPY2		0x2c1
-- 
2.49.0


