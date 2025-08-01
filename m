Return-Path: <linux-input+bounces-13749-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64261B17B64
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 05:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949E85667C0
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 03:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3535F16D9BF;
	Fri,  1 Aug 2025 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAwOVOei"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E017262B
	for <linux-input@vger.kernel.org>; Fri,  1 Aug 2025 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754017803; cv=none; b=PfAhb+Awp/h0KOdYqJKhPVIZZMZIFaKV0VMhrATT2hs61/tyULOmVPgqfy/1Dy/IDuJvFZcPuqieYCvPtgb9nCjL9iYU8J2ofCpcZVeIWZCP9KISZJJVSylLuVXQg3j58/ZLa6Z6Rd2V+qj4y1ssYk0mgw4XcV/oS4V84xzpSy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754017803; c=relaxed/simple;
	bh=kpPVwXU506qGDP2XLZpLrVkFHaAF/DmDyNKvv6kA90k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jkBgC+K6op94jEJ0GWpkVTWkPO2fF64duriVoAHR/0eaGNFfiTOxiSNR68c5NVGBEpucvX8RlK34ykoSzbWEHGOeR96GWejdT7hdedA1ZjtHL8Lz5SB4XcLTQ2pgBq7XMNPgw2AZZfloecc8RF5CHaryuEyEx0kTO7c9k0HBu5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAwOVOei; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2407235722bso17258135ad.1
        for <linux-input@vger.kernel.org>; Thu, 31 Jul 2025 20:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754017800; x=1754622600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cETyuE3wvamROXC4Lt1c/4pgEuTp9p/utbq8DdU1MPs=;
        b=fAwOVOei2wLRNc8s/rejgWrMiFJq6X/7RPSX5lNgUULgvX9Tjqq+QI5O7Mj/qEl9F1
         8g1dbxH2bzThPz1tOjPELF4izFbctRkkvAAX3xMHTD0abayJpCmcVglyDutz1EdZPsj5
         CHv5ag1SR0p5jEWD8aRb9QVmMSKFhwLK1mJ6Engu4l2C49xfxYn4s5ctKv2B0uhPK61M
         dPSvV2YTUDL7R6l+5prWT/dJw8yV7NIgebffNHU6+WryGKcjJ7FXoinX8OmiAq2V9KES
         E95qSNrYBL39AxcfE2sNu2O+ddCWnIUoCLDNJe0rXxJY0JdiNruaJs6MFcQhVA3lttbs
         wgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754017800; x=1754622600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cETyuE3wvamROXC4Lt1c/4pgEuTp9p/utbq8DdU1MPs=;
        b=pMwp77mhOnvxIm/9YlRowdTFKPAU8QQ48FnMMEfecw6AuoqtYvc0+LZBUHuaXFuYc0
         dSIB+4lDK/r+cPZ/MMXDULBxlr4cpEKgzp+ac+jFxEdLA9shM8jB9IfUQeUw7giY+hZN
         Qj9nTaOnHPoeMGuoE9YrMp6zRWjaqvSsqkfqd4GAI7Wn0k/wXWl/mbGCemd9fDzXW+lc
         uSBQzmgSdZXUywizX+VZyXg18b0k+hcVKROv1GGrpu3XoYgNEXd8uH0QGDW8zgJt1OI6
         IXuMto4O64O31VVzcma2KycHhnLvclDj+JTI/8ytnOztw7aSqskc3Asv0wIybz4kVxY/
         f2Ug==
X-Gm-Message-State: AOJu0Yx9irXeKHuyi05t9MaINxak1j6iqMtO3MiBuLlp6c/R1LV+a+hg
	TQMFeyiYry7AJkPcZB72AW2VWg41B3fRn7A+2nt2B4d5P9T2bg1pAyLrD2/lPTmmNbQ=
X-Gm-Gg: ASbGnctCoStgK5HYt8nL0IakH7ETyaYDwT9d/Z8bxdkQg7m/7PeE7np5NhkRVsfl6r4
	vwiEmX43wWHC3PaEugImDK2XSaqOUL36D8X7n6a+3U0lov5eg2Cba0NvIVqhhBqxCwECJOZvhjp
	BcLpT/debngbznMDJHivgNYa+NXX18kFm4vCxuCKUEqWEaeb4A/iFocecNiBUOcIK/TtIivPNfe
	59BlK69UdZuFKk54NUyuzmM6jM5crlLCEhWNpRgDMINZRwrc58l8661aZjywOugN1n7NCVToAzJ
	OSINfU9QxZMzXTiZ5C4uQtsMH0iogj3/jqTEma39I7/ggLMCrAxK+AbPMu7t21Ei5Fu5SGbzwze
	C
X-Google-Smtp-Source: AGHT+IF/xRwr31b/zkC4PSliavs9581oG9S6covzsL7EdfHkNr1owCdzvMZdIDzwS9ENKq05JWeYbA==
X-Received: by 2002:a17:902:e848:b0:240:636c:df91 with SMTP id d9443c01a7336-24096aef320mr141208035ad.34.1754017800400;
        Thu, 31 Jul 2025 20:10:00 -0700 (PDT)
Received: from fedora ([2607:fb90:331e:245::f165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899d28asm30215185ad.142.2025.07.31.20.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 20:09:59 -0700 (PDT)
From: Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To: linux-input@vger.kernel.org
Cc: jkosina@suse.com,
	bentiss@kernel.org,
	Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: Wacom: Add a new Art Pen
Date: Thu, 31 Jul 2025 20:09:56 -0700
Message-ID: <20250801030956.17198-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
---
 drivers/hid/wacom_wac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 955b39d22524..9b2c710f8da1 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -684,6 +684,7 @@ static bool wacom_is_art_pen(int tool_id)
 	case 0x885:	/* Intuos3 Marker Pen */
 	case 0x804:	/* Intuos4/5 13HD/24HD Marker Pen */
 	case 0x10804:	/* Intuos4/5 13HD/24HD Art Pen */
+	case 0x204:     /* Art Pen 2 */
 		is_art_pen = true;
 		break;
 	}
-- 
2.43.0


