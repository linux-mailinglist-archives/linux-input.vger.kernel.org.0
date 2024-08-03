Return-Path: <linux-input+bounces-5307-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A29279469B8
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 14:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CCE01F21861
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 12:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB8A152E0D;
	Sat,  3 Aug 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="mhiFi7Iy"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EBE1514D1;
	Sat,  3 Aug 2024 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688484; cv=none; b=a6g6XCOydTS2m9FyqYlSKutIPRhhj3qjDArNIQT325Ve/zkzQ0z3uqF6jMc2tr0SKvixZPTMBC9HzuKKuAjG0CUgh1tvGjrTYmvrmqUWv2Ug5tw1RoTvN5Qh5Mi6qfhaUayw2FU8vwep80M738RZIB1LVw3ISdIMaxCCId1LOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688484; c=relaxed/simple;
	bh=41db0DCPljjefLQISTecFIjtVv/OPNT2yjlTdCnDI90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WL0wx5a9ljUdsWUpgxhBYcX1X21E8IPhuHYLKBnO1Q+ZRyGqDfkGEUPRNJf50bMR+byqPHeNg4y090sw5Mb2oHeT3p/u7fKGHdfqjIU7+zflJ0bqBt2N/6124AzagEKKeRDNOfXIIAzeoWY8SxMzpB+mZmN60KScTLHQf30vI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=mhiFi7Iy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722688475;
	bh=41db0DCPljjefLQISTecFIjtVv/OPNT2yjlTdCnDI90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mhiFi7Iyya8cpLku7OF8b+ZCM9J9WSJ8b/sNwC1Ijpck/iUZThgnVnfuP5K46QmYt
	 Ab0qzdaqEC9yCq6H/WMHqn3vWKDzfH4Nr9iHX0pswShxSY1ibfHQS5l6L0L6pf+EPy
	 RuwHaNj2WisVDAW1ESMkykEAl9Qb4GurNsakavY8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 03 Aug 2024 14:34:20 +0200
Subject: [PATCH v2 4/7] HID: constify params and return value of
 fetch_item()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240803-hid-const-fixup-v2-4-f53d7a7b29d8@weissschuh.net>
References: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
In-Reply-To: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722688475; l=2018;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=41db0DCPljjefLQISTecFIjtVv/OPNT2yjlTdCnDI90=;
 b=Wh3BXYGRis3m8rEtQ7qvpsRFbo7loEXB01t3D9OFeSU3NFjrM7I1TDYgGP7/KbyBJYcGqmSoU
 sE5W5xbMHzeDN0LWAn15LrRduwoKjuUfvKkV8YhxNCgMr6qXbFBBK4N
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

fetch_item() does not modify the descriptor it operates on.
As a prerequisite for the constification of hid_driver::dev_rdesc,
mark the parameters and return value of fetch_item() as const.

Also adapt the variable types in the callers to match this
constification.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-core.c | 12 ++++++------
 include/linux/hid.h    |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 0d2cbe491708..311069588321 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -723,7 +723,7 @@ static void hid_device_release(struct device *dev)
  * items, though they are not used yet.
  */
 
-static u8 *fetch_item(__u8 *start, __u8 *end, struct hid_item *item)
+static const u8 *fetch_item(const __u8 *start, const __u8 *end, struct hid_item *item)
 {
 	u8 b;
 
@@ -880,8 +880,8 @@ static int hid_scan_report(struct hid_device *hid)
 {
 	struct hid_parser *parser;
 	struct hid_item item;
-	__u8 *start = hid->dev_rdesc;
-	__u8 *end = start + hid->dev_rsize;
+	const __u8 *start = hid->dev_rdesc;
+	const __u8 *end = start + hid->dev_rsize;
 	static int (*dispatch_type[])(struct hid_parser *parser,
 				      struct hid_item *item) = {
 		hid_scan_main,
@@ -1204,10 +1204,10 @@ int hid_open_report(struct hid_device *device)
 	struct hid_parser *parser;
 	struct hid_item item;
 	unsigned int size;
-	__u8 *start;
+	const __u8 *start;
 	__u8 *buf;
-	__u8 *end;
-	__u8 *next;
+	const __u8 *end;
+	const __u8 *next;
 	int ret;
 	int i;
 	static int (*dispatch_type[])(struct hid_parser *parser,
diff --git a/include/linux/hid.h b/include/linux/hid.h
index dda34d8cad19..502bbc6f078c 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -46,7 +46,7 @@ struct hid_item {
 	    __s16  s16;
 	    __u32  u32;
 	    __s32  s32;
-	    __u8  *longdata;
+	    const __u8  *longdata;
 	} data;
 };
 

-- 
2.46.0


