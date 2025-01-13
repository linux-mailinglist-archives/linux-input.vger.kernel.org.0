Return-Path: <linux-input+bounces-9188-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55858A0B76F
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0103A49B5
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4BD235BF3;
	Mon, 13 Jan 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etHV8lWa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9280C2343AE;
	Mon, 13 Jan 2025 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772576; cv=none; b=G9fQMgztIDRJINOJn54RvFjVPgnzMQa8VLBlR/C0rY1lzaXGwqoWZJ0C56Dt3LFiR7cis8xwcbRcERQyXPQakzuOHXRTa7xeGTSog2zNl3ReKZivtTUHBzEh2pVhwNZ58eKk33kLi4STPX/0to+rHWByiN5cxfMmbyVt+vZiErw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772576; c=relaxed/simple;
	bh=mIV6vVTLgoqMdIh6ptgFHVykZQegUSWZ88SkxLdjZS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iajdJv3zNHaI66PHSengWqE4ILxTh0ruQyCrNj0vkL396abGEpeIwoISyANDVhIz4ZDp3KkDWl8WleJS1AqCrTnJl1rXpN3X5W2BHvrwUPLHDiTRjVVjBCk/eq3nLSL1J22HWMGaNVIznBiZ3DtdvMjD4WrW5eJSxIrqGM6VPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etHV8lWa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c2bb7ccso448208e87.0;
        Mon, 13 Jan 2025 04:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772573; x=1737377373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AmMrfDKAOcMysNhMtuiAGss7W3D6be+68Km4J+O6cE=;
        b=etHV8lWakQmo2CQvoOkj2k2zXTZJtV7/w0Xq9NZhMCH9XWarK/XmGg2I3Z5N7L3HA0
         FNhiL0fbAuRwFRhnGZ3LMp6DiE0B+tCz62szoIoAqpBI31zxPrFzZLS6VZWGc8va6IdC
         lcDiq/e9oNxZ4FUZ+YHRPTFJMFgVOWVuoHQ7fuUHgC6dLTapAgVKMiSoLaXs/qy0RIDG
         V2MPdK/kKPq4OQsSlE+q62090FUjGP9UfFoer3MqwjxLkAGwCg4+iSpVCtVdciuLYnTw
         7ilJ1fD/X+Vn4X9JGHieg4qJCRrP6OEY0jQjlodQOvBDHEYhc2nmgyapRdaPk3ZgHKFj
         0dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772573; x=1737377373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AmMrfDKAOcMysNhMtuiAGss7W3D6be+68Km4J+O6cE=;
        b=HKFgxGUMG5Pvb82f8ZWiRMZ3TV6MK8lgtO03P2PYebEPaXPv/rCu7vHvvd/Hc6jgg8
         XrrfztBfD0JiT47Kb5qFqLG0SIKCTzJdo2vZ5rUN3T0neYjHbX8pmQFzA05H0vLo8gOp
         J1SV9VNmwUokz4o1CLorj6J5wlu8zwGbxbvI8o2Y+X0bQojgcuM+kbKU88lwLT6eb9fy
         74F8hKNGyKvaG649ZdvwuKuDVJUMtivcD9lrPdx5yoe09NHqWldAvzbvfh+b3BuYJYge
         2rcY5uEjRw+sBHsK9/OGApcTsu8zzhoJQHogsubx0vCf5qenH621OLDiCedz4N5c1GWc
         F2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCCLE0O/fId5GeU00+oTugjvL7gGn995B4MYtdFn90Ans8RaGRacs7ocI23LjOemznb7jOagi33T4WHA==@vger.kernel.org, AJvYcCXNDWN8zUCHoYomEWZgg2JyH0Ss6PiHMQH/kOFnnXKIIofog99b6xiCwMcBm92x/lz3vo/RtJZH1ylr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4TlLXPCi1ojkMso5dkQBm8drH6W/27i5nUluFLZZ+CDLaXI1c
	Zl3tNChHd2aWZifxTSqIxoaVtSYUGaXCYFo7twqZWrsSBKz6tLNv
X-Gm-Gg: ASbGncvpIw59ujkh0lkgXGtQ+9Xovfa80HZ16kj6WBj3TF9x16v74HzPP2GGzJ2uNn4
	BJitqF29J21y2l9uqb3j07OZjklzz0hw24SPdFz8cDTdY3VPQh8KJB0lnx0V0vKlaKQtsgUXAld
	TrXC+wu9A7IWgZyKU05vCaAXPp6faP7RdbOEGDsu1Md81LB/zc+qi/vVeQumOCAi3vmIzjIArVR
	bxKTE094RqfvXVZpNMKcuQpws1zRWkYz/VDAZr63UPM7XcjS6075AJBhuVQTwhQ3l0r1dVNcZeZ
	7NlHnGlJhQk3zClNVpntj925rK0=
X-Google-Smtp-Source: AGHT+IE+QVxc/eMSAAQHH3siCOUD9cLG+hVBDAULZS0cs62WnoJ66dhfSz6BJbdIvMgnLki7ksZJgg==
X-Received: by 2002:a05:6512:4013:b0:542:1137:6124 with SMTP id 2adb3069b0e04-54284546adamr2330911e87.5.1736772572463;
        Mon, 13 Jan 2025 04:49:32 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:31 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 06/11] HID: pidff: Add MISSING_DEVICE_CONTROL quirk
Date: Mon, 13 Jan 2025 13:49:18 +0100
Message-ID: <20250113124923.234060-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With this quirk, a PID device isn't required to have
the PID_DEVICE_CONTROL field available.

Some devices like VRS Direct Force Pro do not implement PID_DEVICE_CONTROL
in their descriptors while still having the necessary control fields like
PID_ENABLE_ACTUATORS or PID_RESET.

Fixes initialization of VRS Direct Force Pro

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 include/linux/hid.h            | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index d792a07b5a5d..53b16a4e54a6 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1000,7 +1000,8 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 					 0x57, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-					 0x96, 1);
+			0x96, pidff->quirks & HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL ? 0 : 1);
+
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
 					 0x8b, 1);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 29f0a91f505f..2af9db0296d1 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1228,8 +1228,9 @@ int hid_pidff_init(struct hid_device *hid);
 #endif
 
 /* HID PIDFF quirks */
-#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
-#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL	BIT(2)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.0


