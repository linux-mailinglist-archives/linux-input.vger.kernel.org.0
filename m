Return-Path: <linux-input+bounces-16563-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FF0CBBB30
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 14:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A6893009F8D
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 13:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAEB253944;
	Sun, 14 Dec 2025 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/IBapsS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CDF1FFC59
	for <linux-input@vger.kernel.org>; Sun, 14 Dec 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765719455; cv=none; b=WfAj+9C7gaz+w+Aht8xBt1iB6iWRZIXcak01YbfwHeEDhT6w3mBRz62kXdfRG9B1mtr5bbjHTTxtx5zKmZlhXrzOo8c1e4h3mXhkEP9PsXnX8wysXUXHixxhfwW3dhJ4TJ1+Lhc8BRzxaZe5nxH7IxViov92w7FvyTpsGUrd/O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765719455; c=relaxed/simple;
	bh=GgKsx6heUewGhARloPAFtts82i99IDOpKTpDSX25vTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heJhkJ/aAaTU1tcuPw9rYCdSLYkpXrms+4alAT/uDUJg4SkqJYK8d3vEo7ZI6sKlJqgYN8ASVM+u4Ld71GRI+Z+LNb7BdVX98yRZX5WiqgxJJtsPvG3e59j4uSFVd7W9P3nTDEQqD9z+munowB0pVeh4bouBLni/WGwlmADYlDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/IBapsS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so4092872a12.0
        for <linux-input@vger.kernel.org>; Sun, 14 Dec 2025 05:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765719452; x=1766324252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/CNC4c90ZLQXC/SqsRpyM13dqGQWN/mqJb9nm77rOk=;
        b=N/IBapsSaaZ8qFFeTSzuCn30q+gIuLPCpzmrl/E6NqQJ6mY3EclrAS3Ynbvi8HIVqq
         r+kOosim2nvnSlHijTR/pMG1ftvWAQuOAm+XPWMF1q4eshkZfMcWtxHHFzMmKNF5AOww
         hS6tzNu5cZ1XxkFpIGdmbA57onED40meddVcD090KBGepk7aKoP2DSK2Ex53hU375j+z
         IC4wcw2R2Pvr0pr0tnCp0vpbwDDXCQ+t2CYYce/wN3cVaIEFTKGpC9eWiGZGgG/Nh4Ew
         VfQdZxDC/njTSBJcuoxPClhirRGvshkjbmc+kE8v2MKdUUOxbbvVvxdQeaBkJyl3sWIF
         Xv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765719452; x=1766324252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/CNC4c90ZLQXC/SqsRpyM13dqGQWN/mqJb9nm77rOk=;
        b=oDmn4GitpobtNCXYhdzufZuEI0tdk0Nyl66QDRIiBJA9kDyHrgB20VmsNoekL3upuN
         Evo+A7+jDdaD7nKNGtYP7EgFTNi6Te0tgZiQScm+CDq4kVqUiZNK9SIr0fbaro56R+/8
         JO3PiSVYwwQP6BLWuAMoHbEXD8+IcEpGnchvpxnpofuMRpinotD4QCdWbctjDh/USc7o
         WcsdCXT63MGD03dw1M/F4erQQ21RgbE3Jm1vwqkaAHG5ZNs41PGCD8m3ukxjZPAfUG67
         JMGDSQVB/pJWJSlo+/OiK6jp0fQRshe6VzfPM16AspUDv4F8tXlH3mzGy0CHlZ9MrICu
         D2oA==
X-Forwarded-Encrypted: i=1; AJvYcCXRgbkV0YPlMIjgtjivV/CMZKm/ZjRH3MuCpw/k8miKC9dIk7H0OzK1K73sqH7mf9yfqpBcXS2HCEncxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdajk6Tb+oBppKMPTfR7zAISHHXjOGQ4uR/aWY2Qnlq0HCOv0g
	R/YDzMoN/DYJbYvqd2s6ihhbCPrOsoQps5CcDewDc01hZ1K0MWPmLymQ
X-Gm-Gg: AY/fxX7+KAC+ehdhigf6PX9w1Iuc4qb91gKzd6v+F6aAoNWW60eELhC+akyKRjZeD0A
	Zi4AZLgFzHHMXAjGYLW0aycKbT2TzWo1c7Q2E/D67NUbt/rwKSeDnqJnZxNX6FS0iiPzHkwZSrs
	2UdEjUK3orhN4ubrul3u8eIes//wWwfx6+uRBduI495A2dUmsB2UMxI7KfmK+2ko8RNofzJ6UGb
	PXUXBAnC97YCAuZzPXXlYOz+BSYNfAUWwh4qSXeGkQ38u7yNO7NipNQNS66+H1REjUJzSUrd5gO
	Kh866DH6UW8Mdt/Z3zh/36XUNyUb4R3taFJzUcibzSk+SYfAGBs/IwRg0ko7Uf1iNytibkDZ9mO
	PS5zjmz1zq7dlibsGSumH/d7FJFImu7BaF7Akl5IrNXR7xKpM6MNy+g2Ps2ngEecSL6D6Jurb5P
	e/Afch1VwSp5s=
X-Google-Smtp-Source: AGHT+IE1ebTVFVfjjcSokHzsxMsvRax5p6HNeybzloZtMpyISV5CNY3oC5tzlGTUx331s0ZE52eiPw==
X-Received: by 2002:a17:906:9fc7:b0:b72:dc33:3d36 with SMTP id a640c23a62f3a-b7d23a1c49dmr762099266b.49.1765719451868;
        Sun, 14 Dec 2025 05:37:31 -0800 (PST)
Received: from daytoncl ([109.245.167.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa56c1b6sm1133979166b.48.2025.12.14.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 05:37:31 -0800 (PST)
From: DaytonCL <artem749507@gmail.com>
To: benjamin.tissoires@redhat.com
Cc: jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: multitouch: add MT_QUIRK_STICKY_FINGERS to MT_CLS_VTL
Date: Sun, 14 Dec 2025 14:34:36 +0100
Message-ID: <20251214133648.307106-2-artem749507@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214133648.307106-1-artem749507@gmail.com>
References: <20251214133648.307106-1-artem749507@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some VTL-class touchpads (e.g. TOPS0102:00 35CC:0104) intermittently
fail to release a finger contact. A previous slot remains logically
active, accompanied by stale BTN_TOOL_DOUBLETAP state, causing
gestures to stay latched and resulting in stuck two-finger
scrolling and false right-clicks.

Apply MT_QUIRK_STICKY_FINGERS to handle the unreleased contact correctly.

Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1225
Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Tested-by: DaytonCL <artem749507@gmail.com>
Signed-off-by: DaytonCL <artem749507@gmail.com>
---
 drivers/hid/hid-multitouch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 179dc316b..a0c1ad5ac 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -393,6 +393,7 @@ static const struct mt_class mt_classes[] = {
 	{ .name = MT_CLS_VTL,
 		.quirks = MT_QUIRK_ALWAYS_VALID |
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_STICKY_FINGERS |
 			MT_QUIRK_FORCE_GET_FEATURE,
 	},
 	{ .name = MT_CLS_GOOGLE,
-- 
2.52.0


