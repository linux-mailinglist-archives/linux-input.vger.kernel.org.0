Return-Path: <linux-input+bounces-419-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAD0802378
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 12:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 873E81F2101A
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 11:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F92F2F38;
	Sun,  3 Dec 2023 11:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng5xksxh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60342C4
	for <linux-input@vger.kernel.org>; Sun,  3 Dec 2023 03:51:12 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d07aaba357so7514485ad.2
        for <linux-input@vger.kernel.org>; Sun, 03 Dec 2023 03:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701604272; x=1702209072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+o0t0pjdgQJJ0K1mMayhpEJ8fFevS3M3ZrNqFytOR1k=;
        b=Ng5xksxheUPc4PTF10Ieok/G23Saz4BYHKrKDDUcey3YGhMiOw9fFhyVHGtqTA7B95
         rzHx8R4wHseb8E7LiQUaukb0l4uKZ3cjWcYUEEfZ1ydsUEzn3efOMXTbwizWyhQmu5o3
         T9XfIOX891En8+G5TagnuoBfs7LpqDsWoflmaic63D+DVmNeSdQXpIKbrIWWJVX7e0CY
         B9ywEFwsPAajcsJ8/a81+Tmys6DFkNKV/d8SE0tVStXc00jViSLNlx8DWeRbx+spoLH0
         g3Gpv99Oz5rmU4hAu1ynv8AgRN40vWoYL7o7P1MZpZxgRFVl9+MRsaRAVJOSQZhmQh1L
         ocjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701604272; x=1702209072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+o0t0pjdgQJJ0K1mMayhpEJ8fFevS3M3ZrNqFytOR1k=;
        b=bGBzNrSoI1TsOE1ydFhEp1UauwW0jPWx6KAoWUKBZXXUOB2NTYK/bCo1hYnPdWzJjP
         lL6ghjeTE6nKuUi3hEfOG6YVbWpu2FNqIOjGX6TMgS8hdgGJUTa2+LHLaEJg+jFJd+hg
         subR6YTffaOsb6EWafZv+rgFwvlStuut/CrA/vkQYdqfsI8RlEqqki6tsF9N44ydDsNX
         Lj/d/wWnHLVcqF5lSCoA2vkDSX1lZXdhWYrOuZWrFQ2v5oD6FuRDAAQaMi2+Rw/3tY9v
         ZRGIcaHgsz8TmHBJbWVRAYPyRfkPkJkOw4Thiwr4KZw0H+Fmd8c6hjqRpGR24jc4NiNV
         vAmw==
X-Gm-Message-State: AOJu0Ywx7wIVIM5eRa5DcL9HnNfhcaerJKNq5zU77DGnVyUBCbbU0NyZ
	IQRhrzkSEVre5+A5ejRy0UonCBXb9ZWOA6HrZ8sBeLFW
X-Google-Smtp-Source: AGHT+IG7G5SMd4wnuHjtQ5yM4koKBLCCtvqc5V5AnoGyPkhhVAx6ccyD7GOtVElePkTJLlFffU3/8w==
X-Received: by 2002:a17:902:b708:b0:1d0:9228:575e with SMTP id d8-20020a170902b70800b001d09228575emr673461pls.43.1701604271810;
        Sun, 03 Dec 2023 03:51:11 -0800 (PST)
Received: from arch.localdomain ([154.18.161.222])
        by smtp.gmail.com with ESMTPSA id j15-20020a170902da8f00b001c7453fae33sm6461547plx.280.2023.12.03.03.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:51:11 -0800 (PST)
From: yjun <jerrysteve1101@gmail.com>
To: jkosina@suse.cz
Cc: jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	yjun <jerrysteve1101@gmail.com>
Subject: [PATCH] HID: apple: Add "hfd.cn" and "WKB603" to the list of non-apple keyboards
Date: Sun,  3 Dec 2023 19:50:58 +0800
Message-ID: <20231203115058.54631-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

JingZao(京造) WKB603 keyboard is a rebranded product
of Jamesdonkey RS2 keyboard, identified as "hfd.cn WKB603"
in wired mode, "WKB603" in bluetooth mode. Adding them
to the list of non-apple keyboards fixes function key.

Signed-off-by: Yan Jun <jerrysteve1101@gmail.com>
---
 drivers/hid/hid-apple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d9e9829b2200..b9c7c0ed7bcc 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -347,6 +347,8 @@ static const struct apple_non_apple_keyboard non_apple_keyboards[] = {
 	{ "Hailuck" },
 	{ "Jamesdonkey" },
 	{ "A3R" },
+	{ "hfd.cn" },
+	{ "WKB603" },
 };
 
 static bool apple_is_non_apple_keyboard(struct hid_device *hdev)
-- 
2.43.0


