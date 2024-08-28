Return-Path: <linux-input+bounces-5921-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B82962145
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA7201C22E4B
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC6715E5CC;
	Wed, 28 Aug 2024 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PNaYCDAA"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8656815C12A;
	Wed, 28 Aug 2024 07:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830482; cv=none; b=oyD3F35PxEC3MxXEl9DoYHmvSFzjnUQv3DKZr1qOAuPEsxobO1LKkHtu+IyvRq48PgF7Rx7L3+tJ0YwzwJwYFIOPtGPhy9MJ0VJHy3XvT6cD1ECZQyTjohbwY82ysKWNfKIhQ97CLtWa3lR8/Y63B9xT+G3BAX2tMKG9NRAvYjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830482; c=relaxed/simple;
	bh=MgJKL2XjsDXY+tEpy3TzImqYyU4wicrtNzfGpBa8RSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJgJ3Wx5VOmBjGx+iDlZ5TShoOYAqnxgPJmrYNlZTOzIDrvPgQ4llpOCBGefT0FJ0ovsv+Ev6pHoIdxeP3FK0w9ziRHkYda5MQUZ8XZQHhRJ62AN4Dvpfm20SGiHqYEIzvOXh+JMPtnJ+bWMOY3Av7chIsu0ZfGpzg8mDZShIwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PNaYCDAA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830478;
	bh=MgJKL2XjsDXY+tEpy3TzImqYyU4wicrtNzfGpBa8RSE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PNaYCDAAIBNkTMWuobyGCcs74H1Z8O4Y4v/c4O4EHk0+u6XqfXYvdfdO4v/JcmZa8
	 U7PDMtGOZf877MljoEcp6fvDeKA+rnMBFGjbLcd1zWxHyT3uHMO8K2Agh3Rb2NNxG8
	 aMioIsH3fmuwfP5LYE/Y7UIqeeTosySWcKV1gJYg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:23 +0200
Subject: [PATCH 04/14] HID: keytouch: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-4-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=1246;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=MgJKL2XjsDXY+tEpy3TzImqYyU4wicrtNzfGpBa8RSE=;
 b=br3TPZgWMhWutdr3hVwy1R2KIzsGE33DLpluQl9Se2StE658EJYa9mKL7qYitzM6A3zJpZMgl
 GovMYUZDj4wCw4BjPvCFYHJDZjOiW3l039RoYrdy4LgGYwASLI4/6h+
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-keytouch.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-keytouch.c b/drivers/hid/hid-keytouch.c
index 6e3033bb80dd..b9abd53a5864 100644
--- a/drivers/hid/hid-keytouch.c
+++ b/drivers/hid/hid-keytouch.c
@@ -16,7 +16,7 @@
 
 /* Replace the broken report descriptor of this device with rather
  * a default one */
-static __u8 keytouch_fixed_rdesc[] = {
+static const __u8 keytouch_fixed_rdesc[] = {
 0x05, 0x01, 0x09, 0x06, 0xa1, 0x01, 0x05, 0x07, 0x19, 0xe0, 0x29, 0xe7, 0x15,
 0x00, 0x25, 0x01, 0x75, 0x01, 0x95, 0x08, 0x81, 0x02, 0x95, 0x01, 0x75, 0x08,
 0x81, 0x01, 0x95, 0x03, 0x75, 0x01, 0x05, 0x08, 0x19, 0x01, 0x29, 0x03, 0x91,
@@ -29,10 +29,8 @@ static const __u8 *keytouch_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 {
 	hid_info(hdev, "fixing up Keytouch IEC report descriptor\n");
 
-	rdesc = keytouch_fixed_rdesc;
 	*rsize = sizeof(keytouch_fixed_rdesc);
-
-	return rdesc;
+	return keytouch_fixed_rdesc;
 }
 
 static const struct hid_device_id keytouch_devices[] = {

-- 
2.46.0


