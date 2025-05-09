Return-Path: <linux-input+bounces-12255-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD797AB1D60
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 21:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72BD4A236D2
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 19:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C20925D1E2;
	Fri,  9 May 2025 19:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLCa/q8D"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80552153BD9
	for <linux-input@vger.kernel.org>; Fri,  9 May 2025 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746819438; cv=none; b=i9+JOVnEnvBhESf8GZDa2tlJBBwUMlTkAIR7ZMPyukwfe/S2aKH3fytO5Qil+AOPUL2aRIykPKHwILRYgxxh9CZe+3RKMyNoXgjmgIzVOY1b+Z4p7PY4e79VzaopJXmz7whkc+4hY1QiLe64yaSrxsfAIDmmuRKekjzcjMO9bK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746819438; c=relaxed/simple;
	bh=9Fsr5jdnGoeXrhIDlopQSpHoWGO+eZqnnoNB/p1AdFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MIbwEfbGDoSU6H48yjd8fmdp6dC88ZRaGf2GCPkUPwdtZ8uWUAj3F+HPE01VKWA78kHAClelyRy/SFxZDPtUeNOaR4dh1kTIedan46TJXyebsducZD1zAdY4qJlLsp2BVCd01nz80t/CJOipm7phMSBNUG3zls8TpV1HrmoZkKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLCa/q8D; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86dde90e7a3so786830241.1
        for <linux-input@vger.kernel.org>; Fri, 09 May 2025 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746819435; x=1747424235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0KtsL3zC+zilUq5YygCJM+1/KuP28fziPrOKAyFWD8=;
        b=aLCa/q8D9wzb0kmpxMRjtQZZCGNedF0duJeP2yHAv/511RJIbu8xdtcfVkzWreWLHE
         whoU6v6unFe1U4k8HOOPyQx5Np2eWY9PRYjMIjYC7khcq8yvyzc+71V5rF79TnGj4JZC
         syIr3wrL8iDGN4ds1T1JfQZB9GYdzQjz3fF04fKy+dcTcf1irVvv2Tjo5VbWQhtyz7sO
         0WPpt9vDrwPsnx2FPYcbQZGVfBSfo2MVfN/GnbANSfSZT/VpGtybCIXQ0PqAlkk/FXWs
         SM2Z6rj1S6ekOxyGVwH5qfwQi6ZIlI8pSjqNXBeb3DIZUrkqxLwtAro5jfGnsowhIP9e
         d92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746819435; x=1747424235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0KtsL3zC+zilUq5YygCJM+1/KuP28fziPrOKAyFWD8=;
        b=Cg5C6lQerhFjAk4M888JNXUVWIqIQqXCJbbj9UsKM8Zi3TUGmJO+TSF44z/8RVam1G
         LMxvQAcsygP9fByWAwW6WFUIpppdl3UkrAjhpk63j25rK0YlMnIHrZPN8Fu8EDiNw+qb
         w+D8vftV4WSdjR/E51qXXgZsLPplNVJBqDgvEBJZAvXs1970k467TEJZG+g9ijZ1GHOM
         ZCgeidwXZER5jmtG1rfM7lLoAduH9DyZ/G/FJa9OsiNlOolhzhjzI+CLcexnxWbuKo2j
         pn5RUnfmfPaXZHGvZWKNJgZUxECPPMPl8SCZ/EZL3cN7OqBYJSWXRmEa5jvN+/KarCl1
         t9kA==
X-Gm-Message-State: AOJu0YwS6znAU+ZHqaUtwbEtq9cJ9kMTWTeyspkneAs8h1FsmOunqMq4
	/iBNd2rU00OHbjqIGhuwxjjxtBwuXweKByciOcfhvtkQ/BPvLJ0ZzdgH0g==
X-Gm-Gg: ASbGncuC7niksxlQ0wLVizOsyvClf6TXmoMIgyz5pswG8eKYB2cFTHJY2EIxHY0YlW9
	oPCao1vIC6HnZTnwZ7QfWzms8EIaKydE9xNufKplAcAARUDX1KPY7XG3UWQtuYXfY9rWFMN9lAe
	hGJZDvWYe/fp5MCGvSWQCHA6zodopyW9sqat6nXL5JFboRDEJ7vdQpFd/Xr8uj+Y7tl+Hru8RGi
	exEvhl0JZ5M2Y1ReFneZj6gHnUUtXnpznoQfX4X60UB9QYjWClJ2sKhD3o782MoSsrt+SBUu4+W
	bMwRFVGmdIu3peAFAqxdrkVGFt3Ebqr4HDOj5slNgRx47ERfJr9Mjb7fsOlX4e0=
X-Google-Smtp-Source: AGHT+IFzi+PopovZUWaLEtkA9zV7iLVm+rukgIld9TvuEkxsJXuicoURVoimmubV/vcZ2utFyEYcow==
X-Received: by 2002:a05:6102:15a1:b0:4dd:ad88:b9bb with SMTP id ada2fe7eead31-4deed339ad0mr4420424137.10.1746819435157;
        Fri, 09 May 2025 12:37:15 -0700 (PDT)
Received: from glados.. ([2804:d51:49ad:6800:54d4:409c:93f2:48f])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f62964c4sm1595447241.29.2025.05.09.12.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 12:37:14 -0700 (PDT)
From: Marcos Alano <marcoshalano@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Marcos Alano <marcoshalano@gmail.com>
Subject: [PATCH] Add keycode for performance mode keys
Date: Fri,  9 May 2025 16:37:02 -0300
Message-ID: <20250509193708.2190586-1-marcoshalano@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alienware calls this key "Performance Boost". Dell calls it "G-Mode".

The goal is to have a specific keycode to detect when this key is
pressed, so userspace can act upon it and do what have to do, usually
starting the power profile for performance.

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


