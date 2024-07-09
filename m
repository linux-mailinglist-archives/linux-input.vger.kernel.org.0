Return-Path: <linux-input+bounces-4916-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EB692AF9F
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 07:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBBDB1C21949
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 05:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0ED537FF;
	Tue,  9 Jul 2024 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlbKLo3j"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC1139F
	for <linux-input@vger.kernel.org>; Tue,  9 Jul 2024 05:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720504671; cv=none; b=cUxdLdbKjFPij9aMdlNhQ168eejbEujsURSVhm8ghEirRgHEKgoReT8fLWu2LdNZMic5FJXmvxVCVY2DClLjM8wd4n1LQ1BHwKT19qHesAWyuKEN0ELmYpuegsogXJYYlckNHaDPQqc/hPSMtw0VHym+dJ+QfnH+dcp4+oeW2vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720504671; c=relaxed/simple;
	bh=6NBsQR96j36bHa4/mI+862OwYJaQF1EXf8mTOjDEAzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vaw2VdJ4y09FV/DwetXRtto/KChVLilQAaWH2j1eN+pgxIMBnYM6DpKW6+Fa148QeEq3KQJrx5dZ+siTiJLh9/ZyW9+Vj0OiMQZP5XplSQN8mCQeImp6QQ7iYVtiSexO9Zma8vtzXXOr+SV1MXeYb79awut3OghvFmEfsAwWCe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlbKLo3j; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-25e19ad0050so630403fac.0
        for <linux-input@vger.kernel.org>; Mon, 08 Jul 2024 22:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720504668; x=1721109468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMWm7OkP3zH34bdqJEOL1jL0lPJQJ6koAxbCrHhVG7I=;
        b=PlbKLo3jiZJid03BOdFkqryVCZ4sYWoxC/HoIWOSk+5dUhgVGLwYyN3b9GiiJh8+EW
         LoBzXfJaWCN0grj0zUrOwdYvOVGZ7BFLTjUbNMTM+vzQXGQwXJomKwKfJak5lJNcNIvC
         AHmaspvfEt0fW/O+xvJoFeTBOx4Jte5gT2T2B04mZHpKPQzq8LC8r4YEgc9VfqGzPMvp
         esh1K+qGD0H/QhfiYydZfKmMv67dvD8ca7Qi9zQbUXsO8l8wgjfjRU5yWdDc4t6uP4E6
         ObVd/I2znJG58wWhlIdw0ZbIfgDIOdSW0Ng6DflmMCCxMIrLfTNvwpkoRf9/njQ0Lw/J
         XXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720504668; x=1721109468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMWm7OkP3zH34bdqJEOL1jL0lPJQJ6koAxbCrHhVG7I=;
        b=nffgQIRAttRDQhr3Cu4dfPflfFJmxIaKTQhb4l3fa9bs4jqOU8Wq8mmtvczFTgbhcR
         mkW4LWdDhIA1QtS6ZxmRMUtFtVLH8J/orwgSuBWccOLkPgXaOq2HQAAGfNxmQlMCVs70
         zeA9Z1zIIcGE6Fk6IfOBCJdKm67RovAycQXPvTMgyvqJTgvYO3dWQO7D0X7tEI4lyO2V
         X2cShtTjPUs4870LDv9l97k8z02l+48KtZ3NKnwpoxNIPPdc1dBKS5ITXb+4lhkIjtbV
         Og63H2DtA8wy712NdLVVTDNWvZyazTQ0946OU+SYOZJPrA68ptQKRRl70mXjFuh3JvnP
         DODQ==
X-Gm-Message-State: AOJu0YwWdA/dfpqPG8vDcToUC14s9x0/hxsO8Jg43MK8AnhXQADGCMsc
	S7o5NEnr4QSJVgvkmC8sb8aerf7hqh6AmS8DBnbeA/NJW5WI30ihIJaiQg==
X-Google-Smtp-Source: AGHT+IF5YXOp3Hf/Fn1ny3u0htB4Z1WZhiniXJHHa796WkT9Gznw5utq3YUMYdHw1k506rjtYLHNkA==
X-Received: by 2002:a05:6870:610c:b0:25e:180:9183 with SMTP id 586e51a60fabf-25eaecbbec3mr1498024fac.4.1720504667838;
        Mon, 08 Jul 2024 22:57:47 -0700 (PDT)
Received: from Holt.corp.onewacom.com (softbank126139002022.biz.bbtec.net. [126.139.2.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439bdb6csm895344b3a.196.2024.07.08.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 22:57:47 -0700 (PDT)
From: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Erin Armstrong Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>,
	Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
Subject: [PATCH 2/2] HID: wacom: more appropriate tool type categorization
Date: Tue,  9 Jul 2024 14:57:29 +0900
Message-Id: <20240709055729.17158-2-tatsunosuke.wacom@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
References: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>

Recent eraser and pen tools are able to be distinguished
by looking at its least significant nibble.
This modification applies it to wacom_intuos_get_tool_type
function and reduces its code lines.

Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Signed-off-by: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
---
 drivers/hid/wacom_wac.c | 66 +++++++----------------------------------
 1 file changed, 10 insertions(+), 56 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 20de97ce0f5e..1f4564982b95 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -692,77 +692,28 @@ static bool wacom_is_art_pen(int tool_id)
 
 static int wacom_intuos_get_tool_type(int tool_id)
 {
-	int tool_type = BTN_TOOL_PEN;
-
-	if (wacom_is_art_pen(tool_id))
-		return tool_type;
-
 	switch (tool_id) {
 	case 0x812: /* Inking pen */
 	case 0x801: /* Intuos3 Inking pen */
 	case 0x12802: /* Intuos4/5 Inking Pen */
 	case 0x012:
-		tool_type = BTN_TOOL_PENCIL;
-		break;
-
-	case 0x822: /* Pen */
-	case 0x842:
-	case 0x852:
-	case 0x823: /* Intuos3 Grip Pen */
-	case 0x813: /* Intuos3 Classic Pen */
-	case 0x802: /* Intuos4/5 13HD/24HD General Pen */
-	case 0x8e2: /* IntuosHT2 pen */
-	case 0x022:
-	case 0x200: /* Pro Pen 3 */
-	case 0x10842: /* MobileStudio Pro Pro Pen slim */
-	case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
-	case 0x16802: /* Cintiq 13HD Pro Pen */
-	case 0x18802: /* DTH2242 Pen */
-	case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
-	case 0x8842: /* Intuos Pro and Cintiq Pro 3D Pen */
-		tool_type = BTN_TOOL_PEN;
-		break;
+		return BTN_TOOL_PENCIL;
 
 	case 0x832: /* Stroke pen */
 	case 0x032:
-		tool_type = BTN_TOOL_BRUSH;
-		break;
+		return BTN_TOOL_BRUSH;
 
 	case 0x007: /* Mouse 4D and 2D */
 	case 0x09c:
 	case 0x094:
 	case 0x017: /* Intuos3 2D Mouse */
 	case 0x806: /* Intuos4 Mouse */
-		tool_type = BTN_TOOL_MOUSE;
-		break;
+		return BTN_TOOL_MOUSE;
 
 	case 0x096: /* Lens cursor */
 	case 0x097: /* Intuos3 Lens cursor */
 	case 0x006: /* Intuos4 Lens cursor */
-		tool_type = BTN_TOOL_LENS;
-		break;
-
-	case 0x82a: /* Eraser */
-	case 0x84a:
-	case 0x85a:
-	case 0x91a:
-	case 0xd1a:
-	case 0x0fa:
-	case 0x82b: /* Intuos3 Grip Pen Eraser */
-	case 0x81b: /* Intuos3 Classic Pen Eraser */
-	case 0x91b: /* Intuos3 Airbrush Eraser */
-	case 0x80c: /* Intuos4/5 13HD/24HD Marker Pen Eraser */
-	case 0x80a: /* Intuos4/5 13HD/24HD General Pen Eraser */
-	case 0x90a: /* Intuos4/5 13HD/24HD Airbrush Eraser */
-	case 0x1480a: /* Intuos4/5 13HD/24HD Classic Pen Eraser */
-	case 0x1090a: /* Intuos4/5 13HD/24HD Airbrush Eraser */
-	case 0x1080c: /* Intuos4/5 13HD/24HD Art Pen Eraser */
-	case 0x1084a: /* MobileStudio Pro Pro Pen slim Eraser */
-	case 0x1680a: /* Cintiq 13HD Pro Pen Eraser */
-	case 0x1880a: /* DTH2242 Eraser */
-	case 0x1080a: /* Intuos4/5 13HD/24HD General Pen Eraser */
-		tool_type = BTN_TOOL_RUBBER;
-		break;
+		return BTN_TOOL_LENS;
 
 	case 0xd12:
 	case 0x912:
@@ -770,10 +721,13 @@ static int wacom_intuos_get_tool_type(int tool_id)
 	case 0x913: /* Intuos3 Airbrush */
 	case 0x902: /* Intuos4/5 13HD/24HD Airbrush */
 	case 0x10902: /* Intuos4/5 13HD/24HD Airbrush */
-		tool_type = BTN_TOOL_AIRBRUSH;
-		break;
+		return BTN_TOOL_AIRBRUSH;
+
+	default:
+		if (tool_id & 0x0008)
+			return BTN_TOOL_RUBBER;
+		return BTN_TOOL_PEN;
 	}
-	return tool_type;
 }
 
 static void wacom_exit_report(struct wacom_wac *wacom)
-- 
2.34.1


