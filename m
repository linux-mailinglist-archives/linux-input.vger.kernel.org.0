Return-Path: <linux-input+bounces-5912-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1C2962132
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A85DB24A50
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3DE158DDF;
	Wed, 28 Aug 2024 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="N9hi94oc"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1564B14A4DE;
	Wed, 28 Aug 2024 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830458; cv=none; b=edCYJPWFr1um/j72FHv3wpMBpFMS6tG3fHDkK70K5tx6As5LEsHqhfVjIzmcyZDrSNIMfaEcrKZMI4cs572Ut3lxYqcZ0VlOfZA6kNn6OHXS2RF4dz5dwNSLszV/oI6Jeei6mnV17d6LP3+Co6XYHBh+7c76dCXf6BDRnYb7W18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830458; c=relaxed/simple;
	bh=/LXtOmCU2zFuuNlqkKTl59SXgr5KExLhMDjjwguuWyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDdlNife6hl+ClLeqm4SN2oOgm4Q+s09P5awtvYHDnGepM650uxj6EEf4SXDkcbRU0xo89G1vtsynv+ju99tu8nOuIsLjMvmCGASUvuOIRPvXYbhN0S1tsOB1ZuflcZvx/eWvQe0Ws1Oox0/SXq+PdUu3WAd/zBeL7c5vyYRmvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=N9hi94oc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830452;
	bh=/LXtOmCU2zFuuNlqkKTl59SXgr5KExLhMDjjwguuWyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N9hi94ocXKq0DDKsYkUzejNSpXU3+pd4gSTvtl9d8EvcihodNkRAeldKmcs0bP90R
	 5hq+89uEyvNApDneG5ILRPV8j7XwTTeABDw0iRf8mSexPyuQk0JMATZgrvKRLDynf6
	 q1Q48rttW+96q62lkH+uGtAgeZoJ1NboqEn6pRJQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:22 +0200
Subject: [PATCH 03/14] HID: holtek-kbd: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-3-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=1199;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=/LXtOmCU2zFuuNlqkKTl59SXgr5KExLhMDjjwguuWyA=;
 b=ZcBuRqUY5aSLViKNAZ6GzlysA5jtILE/+PI5DU82ARJ+K6OMWxLSvuo5vvq4bevLrhbX4qyLn
 /N+HhJaLauRCEzR6lRc8nFSkX6W5NyuDskpzKGEi5Y0Eb+y8PDdKVER
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-holtek-kbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-holtek-kbd.c b/drivers/hid/hid-holtek-kbd.c
index 794d609c2e31..d13543517a6c 100644
--- a/drivers/hid/hid-holtek-kbd.c
+++ b/drivers/hid/hid-holtek-kbd.c
@@ -27,7 +27,7 @@
  * to the boot interface.
  */
 
-static __u8 holtek_kbd_rdesc_fixed[] = {
+static const __u8 holtek_kbd_rdesc_fixed[] = {
 	/* Original report descriptor, with reduced number of consumer usages */
 	0x05, 0x01,         /*  Usage Page (Desktop),                         */
 	0x09, 0x80,         /*  Usage (Sys Control),                          */
@@ -108,8 +108,8 @@ static const __u8 *holtek_kbd_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
 
 	if (intf->cur_altsetting->desc.bInterfaceNumber == 1) {
-		rdesc = holtek_kbd_rdesc_fixed;
 		*rsize = sizeof(holtek_kbd_rdesc_fixed);
+		return holtek_kbd_rdesc_fixed;
 	}
 	return rdesc;
 }

-- 
2.46.0


