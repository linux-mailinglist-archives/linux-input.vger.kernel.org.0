Return-Path: <linux-input+bounces-6735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27321986D89
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D6E61F24E24
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 07:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BDB188A32;
	Thu, 26 Sep 2024 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LykKmUkC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95EE185B55;
	Thu, 26 Sep 2024 07:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335603; cv=none; b=syUn1AOBZAcEk9zRdlkusLrr7167HQ9VgOZnHKotSObioQIunfGy1M7CpZb88NwWs0SuPtZPFoxuDPQDMWUEB5WP3YCu+kQo+rTBebnK3zdMZEotgMJ6J8ukoZGpsJV5wvRcdO4xTqcpDpksSY6OqJAtbrtu0Vb6M4mLYQezEZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335603; c=relaxed/simple;
	bh=juqhsBDgk/qJ2OoFwalVGkUMzZ8OxYXE80kYUkcez+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7qUlsmx06j1m2U+UH5ULGQUqWqtNVOdAHluV0m+zTV0v7y4bTZzLYKtiNmyE1R2/t7ps0NDn46U3HBQz5nmZDDRrKfPcIoUVhScRnk+tNM/G4eCz9XSTuQAYiM0zMYJg/TVj43eavsz0T1KeSFVlO/bzChshAC8hKxRG1iBHEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LykKmUkC; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-710e910dd7dso408554a34.2;
        Thu, 26 Sep 2024 00:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727335600; x=1727940400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCku12FFLOCaOziMj0MbSv/94Oa74+TUIaChEUsPCYg=;
        b=LykKmUkCF8y3RHYYlbVFNTuIxXHzlDWr1+xDQ2wExGDDMM7QnogX8zgQs/GNZpNruC
         Vk8D5uPPX+q7mlVaaRX+9Ipm2+F46LCeQHX2LDQIP7lRcZG8GLWpQ2kjCjYAAUbZeQoh
         brfmaghMaI/1x88bP+d9b8GGcJsdBtCd4phc3ZHjDcVSfRQzsktIFZWNL3fyZ5fW0MNE
         Kpnn7H71r9xDZXOyebpynzrOqHo+OldBQtOHfQ7dZ3BM0FBmquO6jw/dE5Vy0D/CweOq
         0jVknt8v90FxGFEpzkGJe96Dd/k1PFKLKgKgrd4SJIu1e1cbRwhIHdGbxN+66pvY2E7L
         DgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727335600; x=1727940400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCku12FFLOCaOziMj0MbSv/94Oa74+TUIaChEUsPCYg=;
        b=hOq+EKRBeWrls62Jv/0iWGVigdNlI7YfV6NQp0uozMWJYlHIohBJTV9k8wWu9VPxEs
         79vFW/fvEzSbiHWdq09NQadtjH20tHtPwaaAZT5pALYI6KKbt1Nzx7u70rtqnsmgPJ4z
         S23I98voBsAPFpu+nti98+qsn/Pfyj1efU7KJaW5+9x3QYzOt0AP7jrDCpPe1CNViOt2
         RyqxG5btUpit/Gj7Hhs/Ub/AajqOpqx5+2BtxYSUjaSKb6OOm3IxOTqcDxjxVXrBN9jA
         KxR0XlpsFuNsq6xPk0G1IKEnB8AuSsiyvGw1NNe3JAkPebzyetDg7j7qN5T3XNBwP6xz
         tQVA==
X-Forwarded-Encrypted: i=1; AJvYcCVqc3UKVXaRKh3Ht4BGdGc4u/33XCvRv4p9hlMpQiEw3Z1K+sjVArCZ2hYfEgX4eLk2oVfGQ2+t5fTBZGXH@vger.kernel.org, AJvYcCWgnB3zfEXpBK3UJ27eDCZAKSGzk7U80JtejCh/SdPNKik+325NO1avrbVSSDECNa4M6MQdqoXVH3lvZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5U7sao1EmYHHMqJac/JYh1ek7D0W897rdzabo7M4wCk6gbXLb
	05/P5Bii4HGmvuzCPaNwK0cwDrbnEW/DXvu4Xn5fcMYSHtoNdXSQ
X-Google-Smtp-Source: AGHT+IFpp0aO2P1B8GMYF8tHd6ozNiC6/E6EZFKELYRx2rZeoWtrD+VyBcOu2IxWQF2JR5BsSDHgCQ==
X-Received: by 2002:a05:6830:6206:b0:710:e61c:7a4c with SMTP id 46e09a7af769-713c7f344ffmr5085007a34.29.1727335600670;
        Thu, 26 Sep 2024 00:26:40 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:13a:f00:4b94:68e0:2d8b:3983])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc9c78eesm3708899b3a.210.2024.09.26.00.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:26:40 -0700 (PDT)
From: Tatsuya S <tatsuya.s2862@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Tatsuya S <tatsuya.s2862@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: Add reserved item tag for main items
Date: Thu, 26 Sep 2024 16:25:40 +0900
Message-ID: <20240926072541.109493-1-tatsuya.s2862@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For main items, separate warning of reserved item tag from
warning of unknown item tag.
---
 drivers/hid/hid-core.c | 6 +++++-
 include/linux/hid.h    | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 30de92d0bf0f..1793edb6239d 100644
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
2.46.1


