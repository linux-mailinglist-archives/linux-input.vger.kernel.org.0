Return-Path: <linux-input+bounces-9517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB83FA1C365
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 816927A1EC8
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61D0207679;
	Sat, 25 Jan 2025 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tde4p20h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC22A1FC7C3;
	Sat, 25 Jan 2025 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809692; cv=none; b=i5jaLZk7hlFb6q/+S6cljtf9SeKM4AXpq7WTas4wZtBmpXASCCyvP0+RUDZ9g9OQ39KrPAYlveE0bKFyLiJR4FBhiEwnwRnD+mN3Msnwl/e/4cp5+eA25UzTVyuqtf+2rcWh63w/TsVepS6JswnMYmJZdFt6PK9tLHNrtHp9FuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809692; c=relaxed/simple;
	bh=CGtZyHW/IhLJ8G2ImtmjQ9/dyeUyd5xFN1CHprzhZSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g0aUCCHFBuhV1v0cvtlOsRA7fr6zqMEESVHQqm+a/W0fqaprOxZ7o/iIMMrdZwCjl1u51CzwHU6eBDAMsF5wtPhx1NMJdgkhnj8TIkcZ91oyGD2ZpY1lY8lgvqOTfQvcFPx1eIegUki4A6LzT2DvrsLugyQKhozb+UgeVZG7mf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tde4p20h; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5402ec870b4so448672e87.2;
        Sat, 25 Jan 2025 04:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809689; x=1738414489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCzGE/w6ShAbewfgFQBX/+PHxEYx9n5v+vKkrVVffh0=;
        b=Tde4p20hKa3rJ5/rlitECbemb6x7EPziFgRuxl+lR6YcilK8hnfvb1V+6w1DDgB1HN
         Rrs4PDlKPViGe46aS4gC+BNTpIyvcqgj20VfZUR0VCga1CuotKCVPcAIGGmm+FXyJnli
         lH4AK5h5jnHSjEUIkT3dEf/SZRkIvUXWdS//UKjmHrc6JdNc0vHKO3DfVYe9Vg2Ay7/4
         ZJ1aeMLZjSLD8hbWeGHlZQcDyT+YqjCGIZzxCSAVz3/0U5hckLA1IhKzhVJcsKYGtSb2
         JH2WtM3Rh1R5/4S+F0kCfdSS/TYNGd8vxU/6alrepXqpuLakuMn8rA0UAGE53w0LRWnS
         kTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809689; x=1738414489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCzGE/w6ShAbewfgFQBX/+PHxEYx9n5v+vKkrVVffh0=;
        b=tEnScOQA4j3bnZqfQRPwJAUgrdC3dGSg1nSnouFVVf8nwBr1+B+FyfJ72ONbj/Hl9F
         NhmhSB7Vy/kM89kIbRSMdpAtGoPlZJ07EiQsxIltBJO2ueRMsxqDssebsRllN4sA68hu
         Ak249JCZ5CAJGFK57dyixLpVVbUU0hlsadT42Icn4I72F4jxwM067cSacWQF4CpJAG23
         ZyYffOPMYbzfks2/bfh8svDPTZCKml2x2bgFnXTM0DwlEYRk4FRHnQ1y+wEmNeS58+u8
         iaikrVBsjxzxeOkBXgnozbme3FDadjEtEp27kIQVQraFld68EuyfLX29aKrTiSxBPnEV
         srfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfP3FQpsATkva1yXoc9L5lVJaSSNw3WzaF9+mjQ0jl/EUccDhNrr5dyU3EnyMIECCl1gZRgXAHM7tS@vger.kernel.org, AJvYcCXWb8yfhu4GvVathzaEYMeRVq637E5CrzZ+FDp/mYt5xKD1bsFknfSJ4nUtKjUnwGtsSsn4tOL5+lhvEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2pd5+/nI8Cc4EeAAM3wilxxQFonlpOe80hwpC5LPuBUdtt+fd
	j6HHH6m8eCOJC48Nvk52F68EGhXbQMW0kv2hT0seHrAh1Ge5t4Zg
X-Gm-Gg: ASbGncsnk8ieqWQ2HEogJptTLZrY4q5Y7doxcfZk4ytRdCIstdyGR5cRbos4vEfbp3i
	fQOQe+8P5Pf3BUHTp0i6sGFcOFZqRHVAtQ979fK2vIlrCaGXJztvYTSpRG5imttU09GzLVAqcsh
	4/MRj4kWDqHhh7WncjuP30M+g4Udpz0Q+aDqPVgM+HAbn/jniz+xkbzDw/HEEDO2cn5PUSXr7UL
	LvJ1zO+nijjvxTYpWc7ubFM7LWXH6+61c685jSpyzPXeSl/b6FKvQLwyQqAYQb8DqSZpY+GeBD+
	p2RMYVeklNjB6hGvKtllg0rXD7SAFqghXxGr0ZY8juXqUrHgDXY=
X-Google-Smtp-Source: AGHT+IES/XqkiZAvgr50W6ol6h96HAO7MQJCF76mAJ88Kge6M/63Hh2Z+KFvHbqLo3uxRsf3Bx2RgQ==
X-Received: by 2002:a2e:a9a4:0:b0:300:29ed:b7c1 with SMTP id 38308e7fff4ca-307587aa08emr22700041fa.7.1737809688715;
        Sat, 25 Jan 2025 04:54:48 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:48 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 03/17] HID: pidff: Clamp PERIODIC effect period to device's logical range
Date: Sat, 25 Jan 2025 13:54:25 +0100
Message-ID: <20250125125439.1428460-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This ensures the effect can actually be played on the connected force
feedback device. Adds clamping functions used instead of rescaling, as we
don't want to change the characteristics of the periodic effects.

Fixes edge cases found on Moza Racing and some other hardware where
the effects would not play if the period is outside the defined
logical range.

Changes in v6:
- Use in-kernel clamp macro instead of a custom solution

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index a01c1b2ab2f4..488e6a6a14a6 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -15,10 +15,9 @@
 #include <linux/input.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
-
 #include <linux/hid.h>
+#include <linux/minmax.h>
 
-#include "usbhid.h"
 
 #define	PID_EFFECTS_MAX		64
 #define	PID_INFINITE		0xffff
@@ -187,6 +186,16 @@ struct pidff_device {
 	int pid_id[PID_EFFECTS_MAX];
 };
 
+/*
+ * Clamp value for a given field
+ */
+static s32 pidff_clamp(s32 i, struct hid_field *field)
+{
+	s32 clamped = clamp(i, field->logical_minimum, field->logical_maximum);
+	pr_debug("clamped from %d to %d", i, clamped);
+	return clamped;
+}
+
 /*
  * Scale an unsigned value with range 0..max for the given field
  */
@@ -361,7 +370,11 @@ static void pidff_set_periodic_report(struct pidff_device *pidff,
 	pidff_set_signed(&pidff->set_periodic[PID_OFFSET],
 			 effect->u.periodic.offset);
 	pidff_set(&pidff->set_periodic[PID_PHASE], effect->u.periodic.phase);
-	pidff->set_periodic[PID_PERIOD].value[0] = effect->u.periodic.period;
+
+	/* Clamp period to ensure the device can play the effect */
+	pidff->set_periodic[PID_PERIOD].value[0] =
+		pidff_clamp(effect->u.periodic.period,
+			pidff->set_periodic[PID_PERIOD].field);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_PERIODIC],
 			HID_REQ_SET_REPORT);
-- 
2.48.1


