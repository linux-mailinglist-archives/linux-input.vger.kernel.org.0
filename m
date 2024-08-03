Return-Path: <linux-input+bounces-5300-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 933139469AB
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 14:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C97111C20B2B
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 12:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931E214EC48;
	Sat,  3 Aug 2024 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="VSq61fZ3"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738349659;
	Sat,  3 Aug 2024 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688479; cv=none; b=O4zXkQDkospF99kUuL+UHNqIjfKLYYsf6J2Gpj7/YKxD7HLo3wcfjWhHCR8XTPFMS0MiFSA1g/35l89YcV7mDeedUQvdyPxLtG8y13LXaADt+FqRUNgimEIZ2Z4dAx0/VgnxHuyveIlHduY/S/CIrmj5z3QUEv7d0sIOVWuSuiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688479; c=relaxed/simple;
	bh=GWOMFHYuzBRoDKc5Q4V1fjiaApN96tHpO+li4pf9Qv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wvlkc4RcZtHVjW6l/7EOfowqIz5JsHJz5HxGSqBINuhiIGEvmD9X4rDpsvtdD/XvikeyNZwNKv/NRdxPvbicvXdMxvdqgHFULcYVUERdxt6JyR0+uRcd/LUJ+4/MDVb3rNOV9uX9L/cbnPr4JJj1fkv+YSXHjbFJkd4hlp32VBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=VSq61fZ3; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722688475;
	bh=GWOMFHYuzBRoDKc5Q4V1fjiaApN96tHpO+li4pf9Qv0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VSq61fZ3jUFbw3jyJ4R+mz1G1n6jpIoQn+vabzpRC42oxeiT7Wv4sJqXHqabgDIAy
	 7/SZ6Zh9kv1FQgq1x0kzOSXtmBnNyBKAKFvS8/jSL5xdAQonyga2l3r3vU/V6/2NFd
	 dsX8oGlHWlKtJIuGZPlVtq0QEMW50lctnbvGSSME=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 03 Aug 2024 14:34:19 +0200
Subject: [PATCH v2 3/7] HID: constify hid_device::rdesc
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240803-hid-const-fixup-v2-3-f53d7a7b29d8@weissschuh.net>
References: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
In-Reply-To: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722688475; l=809;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=GWOMFHYuzBRoDKc5Q4V1fjiaApN96tHpO+li4pf9Qv0=;
 b=Rp9kyvG7rK3p9q9imIpa2BEwUnrA6FFCyJ4ALvH4ikxZD8lpc3cJOc/3e4ZpiuBceXBkZZMjH
 YSnR/iJI01dDLXNgNOIScenaFExkXNc2f7Ma0Ags++UsVDI5i1Zj7w/
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Once a report descriptor has been created by the HID core it is not
supposed to be modified anymore.
Enforce this invariant through the type system.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index e7a5d6f2f2eb..dda34d8cad19 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -602,7 +602,7 @@ struct hid_ll_driver;
 struct hid_device {							/* device report descriptor */
 	__u8 *dev_rdesc;
 	unsigned dev_rsize;
-	__u8 *rdesc;
+	const __u8 *rdesc;
 	unsigned rsize;
 	struct hid_collection *collection;				/* List of HID collections */
 	unsigned collection_size;					/* Number of allocated hid_collections */

-- 
2.46.0


