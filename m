Return-Path: <linux-input+bounces-12983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1E4AE1A65
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 14:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D35D1BC2FF2
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 12:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E23235056;
	Fri, 20 Jun 2025 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="jfpltqY0"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8418417E;
	Fri, 20 Jun 2025 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420967; cv=pass; b=dptS5XyVlTaYuUv5Cmp/TBtrcycaedgVU2ARbKYtuxR1dNGqXyGiWyQp+fig8sDHBnrlTdvh85AUvE6c5bjgzwTPItRy8dEbJJnL/D4f7cxWzegplgcfizWqwmlyEELuB2V59y5fG+QUjp2nXLGmaWxTE1F9ml/7mP42UPlBhU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420967; c=relaxed/simple;
	bh=xDm0ilED4qPz4FF5p1rUzW0PoZs/y2K8SzBuBuvdZsI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JF2RpAT6y58IJJ1w4WfamornRaqArUYvBdqrWeNJMJZs5dQb0ehTL+m3XHNi2TU1iEuEdma/J4ps8/rkCXE5w79Uby2a5cebPAitt4MaDsqgU47/FnLKFsxWYqmjdWJKCuaM4b/mmUzhVFw0ScvKOsTNZCx7okaLvmgc2GvAnGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=jfpltqY0; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1750420959; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N+QHe5pw9fa2FJ8hG2sJV2cR50ujkIWOmyIwBaDnYfD0VIjzWeFFp0uFF3xRqLmKJL5zQGAY6SaG+8vdtvz3A2KpcAyM39GWQnjXC8OZ8O6ibFsiJ4XnAaBN7tcK5l6phmdodDFO1IQGdRDoJWB8utN3OLIiy0gvH5RzawKsbsc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750420959; h=Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=3ZzuSg//Ia/otYj7pJhVIPVxw+jAtaRKy02IhuwBd9A=; 
	b=Qb+WRunsVQML4i6+pdWu2LFoCoRnrdFN9apd2RRqcgJ9LSPwS+035O8JG8jga032j0ZxGKhkGCSJy44nBDRdIamlcYZLqUfgcYMmfMNf+4aoCZvBFdEiS2CFF3lKu/ZuZwNaLfebGY30nhvCdSXYJqrhhtqkznvNFgOWmT9nj/E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750420959;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=3ZzuSg//Ia/otYj7pJhVIPVxw+jAtaRKy02IhuwBd9A=;
	b=jfpltqY0Ok8CGXnhXC0aiD3G2LvKLi1dRNBGJIIIEEdDOerB52pBOgkyAbbcMwKp
	9CjUsajMiVrkmefXoI3/CJLT7gL4fy1iixvY1sdUBsNee8XXF0wBnumbpgHKQ+k1/0t
	Qxkxs+CnGLiJwLgjFVNaG9u/GRjDZaD+FtVaKDCk=
Received: by mx.zohomail.com with SMTPS id 1750420956566126.73019613968916;
	Fri, 20 Jun 2025 05:02:36 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] HID: rate-limit hid_warn to prevent log flooding
Date: Fri, 20 Jun 2025 20:02:31 +0800
Message-ID: <20250620120232.81649-1-me@linux.beauty>
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
v3: also ratelimit "reserved main item tag ..."

 drivers/hid/hid-core.c | 4 ++--
 include/linux/hid.h    | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b348d0464314c..7d6750f05324f 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -659,9 +659,9 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
 	default:
 		if (item->tag >= HID_MAIN_ITEM_TAG_RESERVED_MIN &&
 			item->tag <= HID_MAIN_ITEM_TAG_RESERVED_MAX)
-			hid_warn(parser->device, "reserved main item tag 0x%x\n", item->tag);
+			hid_warn_ratelimited(parser->device, "reserved main item tag 0x%x\n", item->tag);
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


