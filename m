Return-Path: <linux-input+bounces-11843-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA66A9431A
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 13:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A1317FDE9
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 11:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E452E401;
	Sat, 19 Apr 2025 11:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFNMhcF2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B0C259C
	for <linux-input@vger.kernel.org>; Sat, 19 Apr 2025 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745062326; cv=none; b=QU2XEtSf5T0tklqrcJ6SkJHpqe37IuKIYZFjN6it50s7Tnarg7m97JEU68AcWyYiHGzcIgPt4/A/lYfX/kNJ4X0uQb+CeZvowvgoUvNyIuQNT7COEgFEYzgGlCkNOOUaDiY1L/zhJmlof/TNrWRgDvV2OA5VP24CSXtigXMohtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745062326; c=relaxed/simple;
	bh=Bwx42kYah7uaN/uURZx/ZqiolAexM1DDnPEM2ISVQIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dO9g5M0Gr7dp1IIlPY8iqHU5q1DZcYn/RsVkwi4tlIKlrTqxD/s1leLz8l4ChXRQtpNGFi3u+mApvDEMevG+xnhN6tUjq6TzeRuI5eY21sBLgEFw9j3J1BMuDR/9x9FHwlf61xMznMu1Aui3KuSvNXiE0WTTLq93Awv3VGKFTSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFNMhcF2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225477548e1so26174005ad.0
        for <linux-input@vger.kernel.org>; Sat, 19 Apr 2025 04:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745062324; x=1745667124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7aWRLySlsQU3rVwrKCjxh2TzOAKwg0UAz+XkSqowjq0=;
        b=mFNMhcF2TNB/YxKxoQixIxorQ2Ja/O5OpNcuNm+ULb83NKpfwpkXFzjEpiAWy31He7
         U/4rqXxD6MRq4CWYXtsURjIsX8LAS4VEvh1757or36wx17J4mRhKFj/TKOA1lNClb3II
         +NT7V8g9NOm3Sp/YDZO23SLgtY4WacLlCDG3T91eXYQT0ND4n2FTU8AvnHeOIoUfs8WZ
         kbBfgoScbYwN6xAnjMXYW8AC8D6/fKRv6MlWppsevRjzdSCdp7QE/+1pW77qzzDBrBPu
         yTjA3JuU0xVmo+FuNR+8o9S8A85r390YfpIDvzydCAzlLLuurpkBQUt354PEPFk+S4h+
         m1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745062324; x=1745667124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aWRLySlsQU3rVwrKCjxh2TzOAKwg0UAz+XkSqowjq0=;
        b=GIlLnp3oUfWQSjmjp6pl2HWXZbtaF5WMIh9JcuFgj/lQcxYmkxx/SRNDtoc6BNtNZn
         1nXN/2dDYbZjxcXPOpoyOIMrsJVBGgtPhjSF7riu6+27+wESKjz14iRph70I+M+yVg+L
         NFyf9wdz5bhN1ZyiWAqgaiV/M7lp+DiTLQn+Dhwp9GjSGU8Q5t23rut4h49NOuelE2p0
         Hfvrqll3jBYPUS8jfHWatKk5YzMl7OORkf0L6uKi/PBeoGcqIQrWL2FbgtIi6kEuS5/X
         2babxSLGp3teTlcNHC3Pu5sk0dRBoyrrV0P/Lx0Ro902TUPN2Q/uYdq+xlm8z7XMGf7F
         qLFg==
X-Gm-Message-State: AOJu0YyHr+/KmvtdcLNO9W8b7pYQ13xkk363JDAvNnj9rTZajMIFFf1R
	4ScLJClkv07hhuaSOoR1s/xsP5glBBM8NteWbGjfHfHMOoCJnZsh6o42nto1
X-Gm-Gg: ASbGncu0SgB4UjifJXxIX8qrOTP+tCyn2jXHCY5eaqZldF289PvLgbaTwH8miF4HLRS
	dejaLiaV9qCr78fGfXnRu6HIwd+rx9sw9DDtlvLW3POyhQUXGB/9y0paiwWsYQjZ1FL5CeRTeLk
	SLvNFBfWuUeZMLHxrRJMeZKSZu6cGWmz5HnT/nFlv4yOzOhGbBKN4/6GgcJJ2c+5gRCnole4aYz
	McSS0jcZY+qeZgsaLYTgNBUw0nK8UGXxGZLnWU4wbtXpmGkVwTO25d2Q1UlqDu13Hyxtk3YgQy1
	G2Ei6PlSK+nGpt0sYklzW0A6gJADnhDKDOMj/NFpag==
X-Google-Smtp-Source: AGHT+IGdRpyU5Xy/OaJT/YulC/13baNN75yTnociYbdydi9llH2rDtLnz/B4bAz2wXmNzgYVntji/A==
X-Received: by 2002:a17:902:e5c9:b0:220:d601:a704 with SMTP id d9443c01a7336-22c5357f3a7mr67653495ad.18.1745062324101;
        Sat, 19 Apr 2025 04:32:04 -0700 (PDT)
Received: from glados.. ([2804:d51:49ad:6800:440e:4d60:f7c:332d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8bf7ecsm3133251b3a.31.2025.04.19.04.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 04:32:03 -0700 (PDT)
From: Marcos Alano <marcoshalano@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Marcos Alano <marcoshalano@gmail.com>
Subject: [PATCH] Add keycode to Dell G-Mode key
Date: Sat, 19 Apr 2025 08:31:18 -0300
Message-ID: <20250419113132.36504-1-marcoshalano@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This key exists in some Alienware and Dell machines.
On Windows it activates the performance mode.

Signed-off-by: Marcos Alano <marcoshalano@gmail.com>
---
 include/uapi/linux/input-event-codes.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 5a199f3d4a26..85c6a612ee84 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -765,6 +765,9 @@
 #define KEY_KBD_LCD_MENU4		0x2bb
 #define KEY_KBD_LCD_MENU5		0x2bc
 
+/* G-Mode key present in some Alienware and Dell machines */
+#define KEY_GMODE			0x2bd
+
 #define BTN_TRIGGER_HAPPY		0x2c0
 #define BTN_TRIGGER_HAPPY1		0x2c0
 #define BTN_TRIGGER_HAPPY2		0x2c1
-- 
2.49.0


