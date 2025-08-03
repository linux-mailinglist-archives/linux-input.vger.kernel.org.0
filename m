Return-Path: <linux-input+bounces-13783-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE5B194C4
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C5223B6A1E
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8455D1DF72C;
	Sun,  3 Aug 2025 18:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR2SWNjo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA821E500C
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244851; cv=none; b=MBz/BzArQJnUciMBTEx6e3zRRQbhpL27fhPcAW6w0RpnMsePH3iYMPWRxtUFd5U/kO6ZcXqDol9y6mJBbPg1Udua8KSiSXyRNox2Y3K7X/rvjQCIr9XwjlIqVRINW4ceO7/wRwaNeB6zquZZx3w3R2D7sRqr4HC2eA/lZcnWPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244851; c=relaxed/simple;
	bh=ipb7CMfVlWDViwMXObbaiI78LBakQnjt/B5a8cgdPZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ry6CZtCaaaa0GbkEkQF2WRd0WO4QMsQjgMQwao5M5EyGUDmacydH34eYwbesQMbU78n5iL2NDNBcDkjouwwoUswJLc3q856g/fJTmyczrur/aXsbOembx42QLtC/w5Uj4K8yztOSjOAP/NuQN5g8UtHTQk3lkDZSkoRKmYYxWHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR2SWNjo; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6158745f51dso589461a12.0
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244848; x=1754849648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5qhecK0dnT1ahGSmzHdyTH/PY5UW7ySDF2bInYw2wI=;
        b=lR2SWNjo9Njq/0JhvTQLOdySnzPdofANeI2gTgNDmQRXVGSzgV6HMzG1horxDMSKVl
         uDy82ieWnWvcKe7Cy4G83RudXgh4hKrH/U24ZUV5VGkGsp+b98M40h7ITDjRtLbB/S1u
         WiEwHd97tic8HW5Z2ccSVsdi687zk2eLg9tFWEuZS9M5IITtBn8QgJd+7Y7HacAcVRBt
         XuBhVDAEFNZYSlA76vJzgCewtnfOaQMWxG30Tz3AbqNLFXkLP0s/azehZOhSI0rY9FZt
         iaL+igLOnujnRxO53GrUTcw3/DIfmqWpc8dquoHKRqkAZWRMOHxqjtRh8ik4miVoM9DA
         +uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244848; x=1754849648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5qhecK0dnT1ahGSmzHdyTH/PY5UW7ySDF2bInYw2wI=;
        b=GWj5AIuPVxJfqdVoPtBppgwCR73acO3xvLusVNE2J8xvQomYz3qufHZGsWkLFjmleK
         WD3+J8ib0ENK0woTquygLNqKUD5NON702fWActc4he/VcSKDwhwSOCo/14m6HW0O7WN4
         n5/HlB/dHN0dF3I6L9F3WApQgsQ9zvD8fHps1lJpIp34S8fc9WviE89ZuSA6lJaA08BG
         6MHnO91DAEP5VFrGE1pZD932TlmbbTET7e8JzjbcrMRNmuW2MSdrSvlF0SwN0EFVzapp
         OoZtpRsAZp2GUlHi79LBn6c98eG7AbT++hd4L3M+xK04YCN/+ookxp7kpGqg5qKr52Gk
         R6og==
X-Forwarded-Encrypted: i=1; AJvYcCVdA1RxKPUU8l52oGzC1Nwc2jyzXMmALR0qWKSiUSkDL0JcqRJ78S82Ubee6TC7+XS/3n/VQo7D8rz2bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBmaVGYl5bopG5ne+coboYWRBg5eP/jh6bOM/xi35c1nr7uWUm
	xqPuGlZOnYSU0YD/2BLJtT03hThcY6Oe0CrXHEWCrsf2MShcOyDe4xXo
X-Gm-Gg: ASbGnct9OmZaRu6p2WxUA9Ckue4EU9hIvVF3Wze5aWq9trnMqPzQObUnt7UpDGoBBLg
	rIBrLJl9AVDjFqFZ7noXVrN8TGbr6K5LW28+Ecl6f1OLR1rTprMcO3MoWmO3Be6Tz84bB9YoRum
	MVwdj+HM8v9HdaYUmJblFdPtmOOSe04JRfYb/RWUyiE3NsletbZdEfXs9SHPbMvUgRlLW64J1Lq
	zIQ00gHLd21+CM6qsiNmnudDiL6sRC5kGADFgL+OsuXTVBP56JY0KH3PiCmvFx//JxAViBUyuEv
	GLFWe4xoXx1orT5Gk/RCrzovpCLHRNKcGETOgmmG+qLRHu6k19f1HJc/NdNTLreMcdJzlyaZYyF
	yPx+K+0dnH0jJJrLz5lFTt0ssh5L8O5T2kfj+CkDuEPcJUQzDzrPfLZfpcPK0Oah4fyvivYVwnu
	k=
X-Google-Smtp-Source: AGHT+IFFnM1PSVfpASZHhiLdfllJK7hktmlB8cNdIX0Gh0dYMYCjJelZGRksRMkE3WKRq+Naw4LL+Q==
X-Received: by 2002:a17:907:f818:b0:ae0:da2d:44bb with SMTP id a640c23a62f3a-af93ffa44e5mr317420766b.1.1754244848115;
        Sun, 03 Aug 2025 11:14:08 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:07 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 13/17] HID: pidff: Remove Anssi's email address from info msg
Date: Sun,  3 Aug 2025 20:13:50 +0200
Message-ID: <20250803181354.60034-14-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some users might try to contact him about issues and he's no longer
active when it comes to the driver development/fixes.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3fd51ad5cf56..ebebac5c4384 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1559,7 +1559,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	ff->set_autocenter = pidff_set_autocenter;
 	ff->playback = pidff_playback;
 
-	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
+	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula\n");
 	hid_dbg(dev, "Active quirks mask: 0x%08x\n", pidff->quirks);
 
 	hid_device_io_stop(hid);
-- 
2.50.1


