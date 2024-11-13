Return-Path: <linux-input+bounces-8049-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE49C6F50
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 13:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76351B26330
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 12:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B1E1FF61B;
	Wed, 13 Nov 2024 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpZqK6fr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E21FF5F9;
	Wed, 13 Nov 2024 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731500669; cv=none; b=jdE7QU8bECVelZAY/wyqoTE5NkzyGLdXCxrnymY5/LNCdEJZKLeadKQUnyCO7P8It+RCo3BwZVVbWVLxihLljQllPz1jJAL9T3baiYqomX7fOxBttb0rsi0nX2SBGPnz6nzS0zGpruHSySSiPHxf7RdAvsfv468y+GVUQNNkMRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731500669; c=relaxed/simple;
	bh=2csjHoqQcpRfDM94N3XXAUIg8sNLAt3B2YycP/MSvhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PDJEKONh3ojuXd5ST7/l0BK9i7kzc3nzMMdOiTsOS5vDcTu1/jeKFAyi8TYRPXAD3d3rG2IaXWzEc6Zo2W0m5xPhVkbQ4QFPJJS6ot3+d/EwfhLSJDJiRe8HHm8ux3aL1J8XI7FsI2DpViZl6hJ+lTWYI+w+OQpzE9fe8PL2lJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpZqK6fr; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7245a9d0e92so490394b3a.0;
        Wed, 13 Nov 2024 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731500668; x=1732105468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0qma0shrrMCeeXF13xRPSHcFZ8pwa+2uziGqx/3I6A=;
        b=WpZqK6frs6JTQw6HI1U1c4pan2RRNxvpseugGSE36YlnvJP9pZtjDAfmE/SOlqAvTF
         8w3ImDcmVOpfnEDZBYJlOzhuz3tAnjKufkPKkU3PC8GypThdpLhNX8gxKzk+29xGFHt9
         bm9A9RMwVitnKR8BkovlIvmVSezdPx4BKUPHu46ZocIuD8nCLZIE/H1cKAoxDFYZf34L
         of/mY6+5J/NkxtZWWtoj3pX4EmBlw/kkXUcZJQe+yokGWmsR4P9ZMs/wcv8zVrnS5N+/
         pN167XCKyQnFcFOU8WCDTX15T5EzEN7d3Ndg0+FZ/MNR/xKZazoG1mYcUYIuZHiYJxjZ
         Mcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731500668; x=1732105468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0qma0shrrMCeeXF13xRPSHcFZ8pwa+2uziGqx/3I6A=;
        b=MP9neFIQ0/oWgju7JJuzs+6M7YJnX4AxMsfJaCRRso7Yy961kXmRoj9Ngz+iJO8Rid
         ygQ0YGX1KmYMiODNv/puvuefaKuRGRp2vBpFwiLhj63UUmrKRshIdXo/gRiDrGKiwQdh
         pM9BwPggF2xX6vKSXzmJaqCP6r8H4db5wCIlQu9AH59pcEf/zU29MvTwLtUIR6NAXWAu
         sVjm7WhoqsBA54Kj6U+czG9SFF+pJ8kTKZ2wQTa75pnvlJgEH2/2cc/NZR4d69fY4xtA
         gg6OPMtUMJLCD9ttPtkhRZUf7qoL5gal9jCDqX6Su+0+i7x8XWuySGpxoHbJIHGLUr5U
         g3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtrZnSret6MVoSOwH7hel8tuWGcrha7uWkmUrml06MIfvFStgx6FtzSDHp/xgGirIzdqypUvsHycMf/ytT@vger.kernel.org, AJvYcCXrQas6ASeW/gxZpP2c4aN4nKMpZBdM0Ibx72w9t12e/R+kD70f1sT5FCaX1lNbKiSPq0oxJipwN6a+Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2mhABj5Wa9Neg5Y7HxwsIQvEO3cHK2U1VVmBcs4e9c48Ia6IZ
	QJqogK/hPIYOOfNwwLfRHhsjK4EpBwIWYF5ljEj07kB6Rxvz4z+m
X-Google-Smtp-Source: AGHT+IF94vGe0MkD2vTT4OmsQmuLzRHX2FLPggFg6RK92J5lfqisYMZMHadq8JFyeGVCBv2RBcK7dw==
X-Received: by 2002:a05:6a00:998:b0:71e:3b8:666b with SMTP id d2e1a72fcca58-724579c5ff7mr3088226b3a.15.1731500667725;
        Wed, 13 Nov 2024 04:24:27 -0800 (PST)
Received: from localhost.localdomain ([240d:1a:13a:f00:391:3085:9292:22b7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7240785ff9csm13148875b3a.8.2024.11.13.04.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:24:27 -0800 (PST)
From: Tatsuya S <tatsuya.s2862@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Tatsuya S <tatsuya.s2862@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: Add reserved item tag for main items
Date: Wed, 13 Nov 2024 21:24:07 +0900
Message-ID: <20241113122407.24477-2-tatsuya.s2862@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For main items, separate warning of reserved item tag from
warning of unknown item tag.
This comes from 6.2.2.4 Main Items of Device Class Definition
for HID 1.11 specification.

Signed-off-by: Tatsuya S <tatsuya.s2862@gmail.com>
---
V1 -> V2: Add specification location to commit message.

 drivers/hid/hid-core.c | 6 +++++-
 include/linux/hid.h    | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 582fd234eec7..98f557fa9e17 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -629,7 +629,11 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
 		ret = hid_add_field(parser, HID_FEATURE_REPORT, data);
 		break;
 	default:
-		hid_warn(parser->device, "unknown main item tag 0x%x\n", item->tag);
+		if (item->tag >= HID_MAIN_ITEM_TAG_RESERVED_MIN &&
+			item->tag <= HID_MAIN_ITEM_TAG_RESERVED_MAX)
+			hid_warn(parser->device, "reserved main item tag 0x%x\n", item->tag);
+		else
+			hid_warn(parser->device, "unknown main item tag 0x%x\n", item->tag);
 		ret = 0;
 	}
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 121d5b8bc867..e3894f38bd96 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -81,6 +81,8 @@ struct hid_item {
 #define HID_MAIN_ITEM_TAG_FEATURE		11
 #define HID_MAIN_ITEM_TAG_BEGIN_COLLECTION	10
 #define HID_MAIN_ITEM_TAG_END_COLLECTION	12
+#define HID_MAIN_ITEM_TAG_RESERVED_MIN		13
+#define HID_MAIN_ITEM_TAG_RESERVED_MAX		15
 
 /*
  * HID report descriptor main item contents
-- 
2.47.0


