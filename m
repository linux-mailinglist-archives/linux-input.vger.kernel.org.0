Return-Path: <linux-input+bounces-5220-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DCC942245
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 23:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1F452868BE
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 21:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD3F1917DB;
	Tue, 30 Jul 2024 21:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Gy6zEL6m"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B6E145FEF;
	Tue, 30 Jul 2024 21:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722375375; cv=none; b=ioeMqkbEs4heRhcNsjm/dHmGuL2g/ASTxXyZMeX1yk24Mrt9js7B7Ra4Bi2pNqkidseRfc0bMnybUZjNZZjoWPUg1+EgsXJ5gCpaFMuj753f6xFzukD+99bAK5HA96NTmA6z8uvU6G/Bw9FwTcKXQlGrBn6L/TtCvMi3g1AcQrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722375375; c=relaxed/simple;
	bh=CuCPxz/YYLzA4evHClClTWRKVOvvMIx6m6M1HhhjvJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bnCTya0KaOV9WwBclluqdw1k4XOyuwDtNSRyxkQQliNfUswt0apNm733y6cN8qr/43WlnbsXTHgJOWDTPLKlqXnVRH/XE3GFXuRswqRPxAFddDVaLuU6l8VGSLL+iiAlOosEZqw8PufUgmi8ScykT7weKaZ0iqWBVAtjyeaeaq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Gy6zEL6m; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722375361;
	bh=CuCPxz/YYLzA4evHClClTWRKVOvvMIx6m6M1HhhjvJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gy6zEL6mvS8A/NgRcnVeeOoVl948AKfpjeRrf1UXxIUGAu3axFwTrOT8xLUbL8Cpy
	 gITObj2lOL6F4VItRNZzjyavnGFHJpybFDoeRkpZcthyRW0C7mzVWmKkmVY3A0I7Ki
	 ZQl8w0+uZnwrO0p5+sB0sO1vvEpfDyldYVEUlFXc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 30 Jul 2024 23:35:57 +0200
Subject: [PATCH RFC 1/4] HID: treat fixed up report as const
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240730-hid-const-fixup-v1-1-f667f9a653ba@weissschuh.net>
References: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
In-Reply-To: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722375361; l=1162;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CuCPxz/YYLzA4evHClClTWRKVOvvMIx6m6M1HhhjvJw=;
 b=2X4hlJon375StyoXGzTN+k5j8d3rhRDdjk6ApotaD5JDflxLk7VNkWqCo9JtsdXGpFvFnPZm9
 ouBk3GCMVD9B7S2CLuOBh1fxgDAg4dTlpf9WtcA4fqns5CEtKQtLc//
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Prepare the HID core for the ->report_fixup() callback to return const
data. This will then allow the HID drivers to store their static reports
in read-only memory.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 988d0acbdf04..dc233599ae56 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1203,6 +1203,7 @@ int hid_open_report(struct hid_device *device)
 {
 	struct hid_parser *parser;
 	struct hid_item item;
+	const __u8 *fixed_up;
 	unsigned int size;
 	__u8 *start;
 	__u8 *buf;
@@ -1232,11 +1233,11 @@ int hid_open_report(struct hid_device *device)
 		return -ENOMEM;
 
 	if (device->driver->report_fixup)
-		start = device->driver->report_fixup(device, buf, &size);
+		fixed_up = device->driver->report_fixup(device, buf, &size);
 	else
-		start = buf;
+		fixed_up = buf;
 
-	start = kmemdup(start, size, GFP_KERNEL);
+	start = kmemdup(fixed_up, size, GFP_KERNEL);
 	kfree(buf);
 	if (start == NULL)
 		return -ENOMEM;

-- 
2.45.2


