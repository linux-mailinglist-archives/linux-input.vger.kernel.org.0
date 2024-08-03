Return-Path: <linux-input+bounces-5302-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9009469AD
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 14:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58D26B2151B
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 12:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE4214E2F9;
	Sat,  3 Aug 2024 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="DTnqFPvF"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443113A24D;
	Sat,  3 Aug 2024 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688479; cv=none; b=NOaTXuLAcevQQttcSI+0/SVlIQVpbfOwSjyDowT0qepjxV9KnQ0VYM+b6+V+8bOSGMLByR/X0oeMlQiOPNmieDQcl6brGEdI8lNkPds9irX6PcxBC7KoOCVI5F2aVknyfoOpYIhHSsG9cAj5hT+prXC08KlkO2Qc6tBWgCVKs2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688479; c=relaxed/simple;
	bh=Ye+Se1jHXdT0yhJQ5K0ZLTO5vrH33EndOJgJ+SFjo4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5prADWswFMUtzT7YvkdhnzIEsKubciujs59Lj06nM/MJprjsMvqKWGcVhuO+kpxnDGN1v5+DwVX59QE5CKA2gci+AI3A6dOH9KlOOYGR+bqtsAEtIrFks9ysKgKgj6DUl+jufjeULWxLKNd+Yc+4VzrmNFDI4UbG2RUif8rvgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=DTnqFPvF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722688475;
	bh=Ye+Se1jHXdT0yhJQ5K0ZLTO5vrH33EndOJgJ+SFjo4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DTnqFPvFkSc7yjrvOwL4Lkij96qaZQ2XL76I2lELCrw0aILWHtw69h6hDfLCffVLE
	 C5f1P1DhimbWhpcjdyusgpiIyBC1k+uO0q4nUIINrO+DkhUpiJzWGDKKTQpxiYJYic
	 EQXaePGQuOHQ5uC2dDYAc6vbFzCHerzCix0SKW+c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 03 Aug 2024 14:34:23 +0200
Subject: [PATCH v2 7/7] HID: cmedia: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240803-hid-const-fixup-v2-7-f53d7a7b29d8@weissschuh.net>
References: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
In-Reply-To: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722688475; l=1211;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Ye+Se1jHXdT0yhJQ5K0ZLTO5vrH33EndOJgJ+SFjo4c=;
 b=tVdbWtGXshD2pV58/YbAbvw9Up+nAdKSqulY7YKCT2xq9zp561GNH9Ezqw9KekvyxhjXRUJQu
 RKkv/LxPqBhA8m+YPxT7OoFws4jz7UPBb79SCC2aVKeSD+J+F9ZB1WK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The HID core now allows static report descriptors to be read-only,
make use of it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-cmedia.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-cmedia.c b/drivers/hid/hid-cmedia.c
index 01009c95613c..528d7f361215 100644
--- a/drivers/hid/hid-cmedia.c
+++ b/drivers/hid/hid-cmedia.c
@@ -26,7 +26,7 @@ MODULE_LICENSE("GPL");
 /* Fixed report descriptor of HS-100B audio chip
  * Bit 4 is an abolute Microphone mute usage instead of being unassigned.
  */
-static __u8 hs100b_rdesc_fixed[] = {
+static const __u8 hs100b_rdesc_fixed[] = {
 	0x05, 0x0C,         /*  Usage Page (Consumer),          */
 	0x09, 0x01,         /*  Usage (Consumer Control),       */
 	0xA1, 0x01,         /*  Collection (Application),       */
@@ -204,8 +204,8 @@ static const __u8 *cmhid_hs100b_report_fixup(struct hid_device *hid, __u8 *rdesc
 {
 	if (*rsize == HS100B_RDESC_ORIG_SIZE) {
 		hid_info(hid, "Fixing CMedia HS-100B report descriptor\n");
-		rdesc = hs100b_rdesc_fixed;
 		*rsize = sizeof(hs100b_rdesc_fixed);
+		return hs100b_rdesc_fixed;
 	}
 	return rdesc;
 }

-- 
2.46.0


