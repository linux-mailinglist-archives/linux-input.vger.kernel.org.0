Return-Path: <linux-input+bounces-12973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B620AE10F5
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 04:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB7004A11D1
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 02:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B833987D;
	Fri, 20 Jun 2025 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="GY7+7Lqu"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698DBBA36;
	Fri, 20 Jun 2025 02:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385719; cv=pass; b=ch1jZyeo0eF24GXhQv7BPaA0v8HgAYkXRPDLvMALnugcsoVDXXXoi83yWop+PJ1pcAjJ6DpI1BV9klA6euxKiRlHelY0grC/8rH67Ijg8a13xF+sHIAX7A37ef+Tkcc3hJYpgtdY9EhlB1rbjDwo2Pl/jYHCkA/lINiqgvSE2fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385719; c=relaxed/simple;
	bh=Dnw06XrKlV1Pifmoc3wsavKCjfEQvcsm8D01O777nTo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iHvtxmMPLnOBB3VEoe+m3j7lbufbSgbcDt9m37xC9oJ3c/MA1r8K141o/y48G7YvY4grsm/DTDdD85scsypQZIyPS1qK2tZ0RZE7PhxVS1VB6MLqn7BJkL9bGGwSPqnt588DwtI6lQV4fviOv4qXY+GXeW/c8yIbUBDEzzDCvgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=GY7+7Lqu; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1750385711; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ko5tdAtMkKmHYb0aCsKQsSUdupiheFcl83AyYfiCEK7Y1YvaplRFGX0sUka/hVNzvKd574siJIBjYFsK5vKE+GYeFiDMiLXo4jWnx8V4e0tnPoq+qyMrIL67O+3dHclnZ7fw7iDjDgaC2/eqJ8WOwgCgGUDKI4sJUdsqgV5XiYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750385711; h=Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=1Vj8KmK8OyZDLPbPaUEx7t3DPm7/E2cE1xd3qimBehE=; 
	b=Jm6w4vDBtAyXqUuppT9t6LAE+DTRqM1mSsHiUjJI8+IAPsDClF8nXBLped5lUmRxRlRaNlZGY0EeMTtgJY65sHlR7EomFpVn1pn0KTtib+uTSnM5lR8hjdTVm7JZU3wxTff60e9T9p5tF9eCfuB8PD42ly4fSjMpEoPO4UeFgUo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750385711;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=1Vj8KmK8OyZDLPbPaUEx7t3DPm7/E2cE1xd3qimBehE=;
	b=GY7+7LquSFOhq5qwfwnc0zAV3MNIVn567UBdi1BMJixFPGz37sOsKZwbOoOlTCBx
	7b419rcNzvxvtjXgpHENsx8/u8bZMah/luApee+lp29FZPyyia5WOramRKXdkyyHjd1
	rrXhP+JQNgqCTW1ZynhGYjjWSYX7a53WCV0f4etk=
Received: by mx.zohomail.com with SMTPS id 1750385709954303.7840196522525;
	Thu, 19 Jun 2025 19:15:09 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: rate-limit hid_warn to prevent log flooding
Date: Fri, 20 Jun 2025 10:15:05 +0800
Message-ID: <20250620021506.12624-1-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

Syzkaller can create many uhid devices that trigger
repeated warnings like:

  "hid-generic xxxx: unknown main item tag 0x0"

These messages can flood the system log, especially if a crash occurs
(e.g., with a slow UART console, leading to soft lockups). To mitigate
this, convert `hid_warn()` to use `dev_warn_ratelimited()`.

This helps reduce log noise and improves system stability under fuzzing
or faulty device scenarios.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
Changelog:

v2: Introduce hid_warn_ratelimited to rate-limit the specified log.

 drivers/hid/hid-core.c | 2 +-
 include/linux/hid.h    | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b348d0464314c..aaba7164a8c9a 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -661,7 +661,7 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
 			item->tag <= HID_MAIN_ITEM_TAG_RESERVED_MAX)
 			hid_warn(parser->device, "reserved main item tag 0x%x\n", item->tag);
 		else
-			hid_warn(parser->device, "unknown main item tag 0x%x\n", item->tag);
+			hid_warn_ratelimited(parser->device, "unknown main item tag 0x%x\n", item->tag);
 		ret = 0;
 	}
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 568a9d8c749bc..7f260e0e20498 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1239,6 +1239,8 @@ void hid_quirks_exit(__u16 bus);
 	dev_notice(&(hid)->dev, fmt, ##__VA_ARGS__)
 #define hid_warn(hid, fmt, ...)				\
 	dev_warn(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_warn_ratelimited(hid, fmt, ...)				\
+	dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
 #define hid_info(hid, fmt, ...)				\
 	dev_info(&(hid)->dev, fmt, ##__VA_ARGS__)
 #define hid_dbg(hid, fmt, ...)				\
-- 
2.49.0


