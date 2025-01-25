Return-Path: <linux-input+bounces-9542-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D9A1C56A
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE183A4D01
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C9C206F3B;
	Sat, 25 Jan 2025 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lafTPp5z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3317E206F2D;
	Sat, 25 Jan 2025 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843943; cv=none; b=hmF3a30sq+VrKreJTdXi4wlEQBQyw1rijaYqQd8bqo+A7YJqTsg7NtARkl+gaesHbI1qQlqWZ+kPR0XkpyJrQMp1rj5xbaGHhiyh2ptfEZTOXHWQnZpIKY+hn0M1FDfLlWVyIy9M/0gYC+wvmVB7I9z5R8cFSuX+yFZES3150iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843943; c=relaxed/simple;
	bh=dwCcjto78uvhV6q6g4fAZmQ++Yk3NSDQ80/OcX+fJyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dggxhqWBCw/nyOeMonHS3ISSAPFiHVmcelzo3fqI/BAVsELssFBE4vaANsynfr5V5dWxJ6s2X/eavil1g4IMffI8Z1v57WoUKaU3h5a1VMS+SbC/oL2TotaTrHMcWQ5MTMUwZqPgu6+VWGV/frc91THgTrceg37mpR2ui5Ryl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lafTPp5z; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso687835a12.3;
        Sat, 25 Jan 2025 14:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843940; x=1738448740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn3SV24FXGrk6D9U/sonjVWTrzb/5doNCYeJXjxGMWM=;
        b=lafTPp5zRDqwqfU2gE66xcV2eVzPFJScrJZsnzUGQMvKZ/rJuAYW1s9efbGXiRwWVZ
         F625dExyNLXB1H4BOMo+rasSEvot12eeaIpUYSxHESf7mRlRJH4A4y+G/lcKi/nspuxr
         Mh5jyyqHfaCFBbj2OA5RxKEpsTOOG3FH/0Kcy5KrbmssRPDw+4gVxGhQJkZAbIvELd/h
         YE8aWOxbU7O808jT1OoOJE4qRQded/wy8dT39CiKHnlxZo3kED8OcE0IeaN/hWCnIHo7
         o5C/NQiJ7qVn6vl4Cc16yS37YMCEuMAcEai+dmtnkiN5cj9FSk1jAsMj5zgb/kEeaFzc
         Kbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843940; x=1738448740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yn3SV24FXGrk6D9U/sonjVWTrzb/5doNCYeJXjxGMWM=;
        b=cU2p1cwtoxi5CR/vNUlwUy+HwTFwXwMBGAetL7d4q5aFflVu2QfSHYISF5HO2/Lmll
         X1JLMniI4QIoq3yAW5hrlxZut10SWcEXh7Sxt0zsG8N3hkNblGSV1V4IGUFq63rU7xNP
         X/mBhWBzc4IpUWctHNsdRPGMQOW1iqwAikzqYs9NBalpoSoqrx3WnoqFt8h9kdo2e1A9
         ds0hqzUwqg6wNuKy1vEPA4CzFoBkhV2d/2BxW1DUpbQ0SUR6DXeOCOhgeHdOXhHXm7re
         YkuZkgyAcRDWyGyVKcpDHe7jUMMLJhgEmttwGUofT8dtJPGreBBPbjcW82o9Ih1yhTFv
         Zz3g==
X-Forwarded-Encrypted: i=1; AJvYcCU9Hj47OIUNro/ng6RI4/aNCWXg2aUGG4yPxj8NMHCPCNm+ABiNaNiIfPPBlZGRISNO1uBaDkvERG5CFg==@vger.kernel.org, AJvYcCW7s78FebSArGPOw45iglitej2HPUmt3Wsn4mJ9bMPVfDHKEDcobaoxfzO6HwxEa4VFJSLeKXtZy14E@vger.kernel.org
X-Gm-Message-State: AOJu0YyLxdVE79N3tG8NRqpuhGB6vKDqzFP0KmQlK3XwCtD13NiE8QAn
	keYJZQeJxXbgqhnS0NqHSip8258Mbh7sdXEJYI6a4CAQRGn1QS10
X-Gm-Gg: ASbGncvS7SZA6846+qsEayDRDZZ+OiRzf+xctdVSDGhevlqvPDChxumyqsSO2jHw2nu
	fRhnmJrNo/ZsGnFbg2ovLxwx4AbcFTKt3Li5GeU1bVHPpDk9L5KfTZvC44LeMLcjmsa7z9mwKaI
	AeDJOUb0H3Xb89HCU+uQYSF+YS/Ln4USnlBwXWblby78Ay7pLw8hpZ3DatYghdl7XzzEtFonGYS
	bU4Hh8/xwyh+yUA55hjT3wSgCCYe/ao2z3rpqgTm8d+nwTH0guiXJfNkLmlzw5AXOAQvh/1CBMh
	g3KglFot2iO4/QSX+IKvP+JXv0qhECh8tv32huKILdtyjFeIPzc=
X-Google-Smtp-Source: AGHT+IHtUOwNTzy0tAzq/qeoGL6CKWP/WHQYkZX6ruEYQ4CUkP7L2CuRqZGvthdh+kssRkX0q/sAng==
X-Received: by 2002:a17:907:3da1:b0:a9a:1a17:e1cc with SMTP id a640c23a62f3a-ab38aefa8d4mr1170216966b.0.1737843940444;
        Sat, 25 Jan 2025 14:25:40 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:40 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 06/17] HID: pidff: Add PERMISSIVE_CONTROL quirk
Date: Sat, 25 Jan 2025 23:25:19 +0100
Message-ID: <20250125222530.45944-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With this quirk, a PID device isn't required to have a strict
logical_minimum of 1 for the the PID_DEVICE_CONTROL usage page.

Some devices come with weird values in their device descriptors and
this quirk enables their initialization even if the logical minimum
of the DEVICE_CONTROL page is not 1.

Fixes initialization of VRS Direct Force Pro

Changes in v6:
- Change quirk name to better reflect it's intention

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 include/linux/hid.h            | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 89a1b6a55c1b..3f429936d537 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -982,7 +982,8 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 					 0x57, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-					 0x96, 1);
+			0x96, !(pidff->quirks & HID_PIDFF_QUIRK_PERMISSIVE_CONTROL));
+
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
 					 0x8b, 1);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 29f0a91f505f..92a484f65a87 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1228,8 +1228,9 @@ int hid_pidff_init(struct hid_device *hid);
 #endif
 
 /* HID PIDFF quirks */
-#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
-#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
+#define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


