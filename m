Return-Path: <linux-input+bounces-8954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1F6A0200F
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 08:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6833A3E62
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4605D1D6DB1;
	Mon,  6 Jan 2025 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEh+G34I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756151D618A;
	Mon,  6 Jan 2025 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736149919; cv=none; b=uylcZJo7WUzh8jphGurrg6itKg33qBNL+VI9yX8Q0toAYMHa7eT5TNZON1ilbNqF+vzioO+7tFp2kDKgZB+lcFuLeuhgGkhp6usMw8L3naLr+ONzVPvbK/4PhFSZxpjmbCnNwDKn90Q71hH75PrS7Dm3VpjqDHf8N+jKLCownys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736149919; c=relaxed/simple;
	bh=2csjHoqQcpRfDM94N3XXAUIg8sNLAt3B2YycP/MSvhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+XPeJf7hTNlAh7pHr0Il6mTByjXPTZ1Ato9lqoRsyGp9mQwyPBHHpBb1ZtmEtkcE6IkwZJGFEJdDhl3qZXPMawU4B2CF0EGH7k9fv5pmGWoYDybgEhpAECHe7SVKDsuzSDVadrn1fMORXHVVDPn/4PIAnQH7Z98a9wrsB69Ptw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEh+G34I; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-215770613dbso148055975ad.2;
        Sun, 05 Jan 2025 23:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736149917; x=1736754717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0qma0shrrMCeeXF13xRPSHcFZ8pwa+2uziGqx/3I6A=;
        b=AEh+G34I/4Y7hd7gXF7f7RJ2JAFriZXpds8nIlh7E+cgMbEkRWSteE1aVYRTzR/kkP
         +bvYKgN4Pj9dFEMLgYzJIcJx+VVyQpHDcjHZo4mY2WxUgcr7Yjdn3b3Gze9Pqvxbv49Z
         XG3GIFvYwn/qxNs7ztKypGzQUzfCj+UBku315F5ptwE39cmcU/9EloTh8k5ds8D9q7ev
         ImkzVNcMpNV71qgCOeoX6u4vGgpebFQYftvAf2ClvO/qGelUaNxsZ6k+mZ7nzRgTaR6F
         D1HTI1mHqZjyN4gG0qDeKytf9XYgMp19puvkoW80mHjO32WoMFikOgc60eAvwa3V+2wz
         K5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736149917; x=1736754717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0qma0shrrMCeeXF13xRPSHcFZ8pwa+2uziGqx/3I6A=;
        b=JtHtDM8b3OqyeaXmryETpGH1/oAXs6X4H+DSODvODY1J/zAeWxI1SJSfciguKOp97n
         aNpz4JcfmVqgFhH49gUKb/EdgQea9VvBzdEEuU8rWPNzcZ6ltDantrhu9wPtPQF+Noe2
         ZuhNl9S9gxKODFN+L1Tlaw3PJVJpjv/TO4iWS3Uqc1MPRQhKnW7ctML6oOKBpRI5qY+5
         Oi+BwU98Caws0ZUOisBGgOG9BnUoPmPUGkdyvFfB/P384zx1yGrdVSTJWq/ZwPBqIYAM
         aXesf47Bw6DrBIFw1p389SUquW4WUrmZluXkOI6BP/NKwUSIQ+Zhz+ecEAGYKEYqzE1q
         wlqA==
X-Forwarded-Encrypted: i=1; AJvYcCV70VqpxDKuQNSm6A/OcH3aGLHOd0FGpmJy42qgw0MxJAwE6gAvdFNt+0h7da2yhfV80GhPKwe+pETZT5lt@vger.kernel.org, AJvYcCVRGo+CQEKU4EsIl182E3aGMKg9wYnvJn/mFhSTZKM+KArVeYfyJhhVbtLRyimKDPDyn+mu2GiNRBV+9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YydGTNxnHmgFxEBDwPFmzC8a4BlmFS/Vcgoj0dXaKNDt4I6cbF/
	MsZs7nwCkRfI2tm5pQ9rOIIBq9PhDKu1BZr6XjglIV3tlb375y6ItlaLpq+O
X-Gm-Gg: ASbGncvv+zF8vKRRTmLChSuLD7scaJ4V7sXah8ZrawlfJzau7EIvjQKTZOvsk2Oy7Aq
	eu/oVudQyI2/E0uPvCUUT7d6eGHWsmUkKhdDa4rN5aQsWyqibadeSbjXVMgifuPK/Wejs53aHxL
	cbv0pIOfydEtu/55qz837uvUeTaPkuo2mHVnXLVrsZwpibGgcM8LcV4XsbZ2A4oQnERc4PIY23c
	A50yrb1WdI0Ah99XZvF830kOran86bJk7wQw8E0caUNOjyqiWTbY5D7yd5YrQ0+j6K0ovow/3s=
X-Google-Smtp-Source: AGHT+IGc4mJOWUVmLr+Rr8ndPG5J1MLtjlRPeL1cZrGCNQoTJQeaSj/L8089a8nneGBAu1v8QQo63A==
X-Received: by 2002:a17:903:234c:b0:215:5a53:edee with SMTP id d9443c01a7336-219e6e85b25mr835563565ad.9.1736149916849;
        Sun, 05 Jan 2025 23:51:56 -0800 (PST)
Received: from localhost.localdomain ([89.187.185.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d15sm287451115ad.11.2025.01.05.23.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 23:51:56 -0800 (PST)
From: Tatsuya S <tatsuya.s2862@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Tatsuya S <tatsuya.s2862@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2] HID: Add reserved item tag for main items
Date: Mon,  6 Jan 2025 16:49:11 +0900
Message-ID: <20250106074911.69770-2-tatsuya.s2862@gmail.com>
X-Mailer: git-send-email 2.47.1
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


