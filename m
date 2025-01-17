Return-Path: <linux-input+bounces-9327-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96558A14992
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 07:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EE123A3E64
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 06:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430221F7070;
	Fri, 17 Jan 2025 06:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxLWX0Lq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63D01F755E
	for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737094486; cv=none; b=OHzpi+wduXc97GmE+4DKpV4qAw44J1vb8HVWu7Xrh7nnjXvO5Nkq3NG0vVyZ7iiCbr7VIpPrNrcSDBFyN6Fl+d8k140dZc1AmY7En5XSDqtGDFJIQcbZ5OFIlc0CrB9BSC2DW4n1sKRUjb3lriJlXJwJYed2Bg7a38mH4Oc0rIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737094486; c=relaxed/simple;
	bh=vD9kPRVVROtAxuIr1bxXchHjiaMdNxehebDTZkEs+Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkWXa27+/MTngQZYrSqmyEyTbKW9nlgcDbzI5swZ+qYO6mkSoBjtZzVD6UFXxNa12Ys9tRN2875LtM1Xb/LMZc+16OBzaN7+xxunorfQaQuvPcWUmhTRZoPjuuBg0pFxOc3f2TcCgwNxYC7LzMmw/M8sD9uqm3/WhesVDwmeqn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxLWX0Lq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21636268e43so39765585ad.2
        for <linux-input@vger.kernel.org>; Thu, 16 Jan 2025 22:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737094483; x=1737699283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdbqEMZx3Yg9BtoWGCtBqWYLCJ9PVWDGh8MHbNF+pRw=;
        b=XxLWX0LqPHBY0X5bGEl+ClZUiTZaBPpWyml4WD9p95niwsPI3T/5mw1RMtb9Sn8ys0
         nFaSnn3K5b7Gidl/MxraCaSY5x2eGg0k+jq4WpQtddgllXOPPGWHDLKcYyOknTyDi8OW
         cZl1dIeFTzhL/AK7QUbZ7FTG9Ls9Gv7Y67ou8PpBjVXnX7Pxz8pr8o6LXmXpUE2cJm3i
         Ckm3vyoJPN01hBv37f3q5pS2zuRTzhJQt19Eml7s/stnVIfDtzS5VIzYLRpwgEzMYP83
         nNEfyMpeIeuK29JqTyoqziP++blKR24ixoZ8piV+YcFOiEH8AZVFNkS/Hgp7AvnbJvJz
         j0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737094483; x=1737699283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdbqEMZx3Yg9BtoWGCtBqWYLCJ9PVWDGh8MHbNF+pRw=;
        b=L7VFiwEMSvvEBhKf/GOgt0FfrC7NgvE7WybugdWvN87EQCyzyAcg6p+qQpsO5IR2YB
         qxy0wFnBfdJOAvTtYz5iaPgBnPdFUoSFSJ/SpVC4yZ1+DjrV9sHkICsIodYsybrfmdKc
         EgRbaD6uMXWeH5kldA1O6DLADGRpcVLE/+OV0gO5GuVecOsaNelMuKTA8mJ21gpCoyZc
         V7vUIFr2PDkwPgYcf6f2XWbkm9De/zoAfauz8q0jgUFsDXHmwRhM56DhCeK4MDIXZFp7
         cWaC+njFGdO+HvxTGosRHzowr7eCVlr7d5ar7rlnpmR8jJGqYNVBbo3lypW69ZlPwnum
         lSqg==
X-Gm-Message-State: AOJu0YzwsoY7/8RI5qrxZJln/tceUmFtQq3aaIVbPR68pnIZzcaoOj9P
	HwwGNQiSvmecWJgdFX1S/kzmplV6ptJJVArfCvLuLwBJEyzWxexZYzIXIA==
X-Gm-Gg: ASbGncvdro8j2mghiDWO1Jm3H7ESn4MBNK3nHlyVHoyjJgeMaj7vHl5OMTU7Kt0BF2J
	Z3LNveQV+RwLKv9g6i7DVsy9UvqUFyTR5c9RK2XogciA3DSamKI8tdVe1cyXQlZTP+sKE8uXjNs
	MfT9th0LBa9s0r421p1wXi7cQg1KUsrbbjwKODO3hKoMRdDq9RmJTI6+nuCec+tjfQ0FrailDpV
	96DYSb4U0vYwyo8bUWp73YmG6ovctzlG9fco0nUC6tXfsEbVK9FUUdzQMCcJgQ=
X-Google-Smtp-Source: AGHT+IFIL7yufAhlnleZ14NQ21tWvQQX2e1O9sl45jCaGb7hQs3Th0QHw9bcT0Y2ugv3WJVCR0FZ1w==
X-Received: by 2002:a05:6a20:3d89:b0:1e1:b727:181a with SMTP id adf61e73a8af0-1eb214f0747mr2151501637.24.1737094482657;
        Thu, 16 Jan 2025 22:14:42 -0800 (PST)
Received: from panther.lan ([2607:fa18:92fe:92b:49e6:c368:b6b2:5be2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdd30aaa5sm844070a12.55.2025.01.16.22.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 22:14:42 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-input@vger.kernel.org,
	jkosina@suse.cz,
	benjamin.tissoires@redhat.com
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
Date: Thu, 16 Jan 2025 23:12:17 -0700
Message-ID: <20250117061254.196702-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241001055146.543800-1-alexhenrie24@gmail.com>
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omoton KB066 is an Apple A1255 keyboard clone (HID product code
05ac:022c). On both keyboards, the F6 key becomes Num Lock when the Fn
key is held. But unlike its Apple exemplar, when the Omoton's F6 key is
pressed without Fn, it sends the usage code 0xC0301 from the reserved
section of the consumer page instead of the standard F6 usage code
0x7003F from the keyboard page. The nonstandard code is translated to
KEY_UNKNOWN and becomes useless on Linux. The Omoton KB066 is a pretty
popular keyboard, judging from its 29,058 reviews on Amazon at time of
writing, so let's account for its quirk to make it more usable.

By the way, it would be nice if we could automatically set fnmode to 0
for Omoton keyboards because they handle the Fn key internally and the
kernel's Fn key handling creates undesirable side effects such as making
F1 and F2 always Brightness Up and Brightness Down in fnmode=1 (the
default) or always F1 and F2 in fnmode=2. Unfortunately I don't think
there's a way to identify Bluetooth keyboards more specifically than the
HID product code which is obviously inaccurate. Users of Omoton
keyboards will just have to set fnmode to 0 manually to get full Fn key
functionality.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/hid/hid-apple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 7e1ae2a2bcc2..9767d17941d0 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -545,6 +545,9 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		}
 	}
 
+	if (usage->hid == 0xc0301) /* Omoton KB066 quirk */
+		code = KEY_F6;
+
 	if (usage->code != code) {
 		input_event_with_scancode(input, usage->type, code, usage->hid, value);
 
-- 
2.48.1


