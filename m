Return-Path: <linux-input+bounces-9588-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAC5A20366
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 04:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAD68164425
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 03:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAD215A843;
	Tue, 28 Jan 2025 03:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="jEuJl7UU"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C0014658B;
	Tue, 28 Jan 2025 03:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738035394; cv=none; b=dALQ/MaH7G3/b1szUUE8RD7tiuEu3A5AVD0zuKQihooP1Gzl25YllQ5DvTXCWq/R4ow5SDTH0yginexDB/H7ntHK6npdijqCIuJ/14xeek2ZJoSjifO3CQS09WsUZi/4IoqHvxd3w7Li9ecSGm7R5BDbEKpZH0HXiTYPw30UBo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738035394; c=relaxed/simple;
	bh=trwKfIc7pmha35RziwIPe1nDpxGn+pdJgYP5pE8ntyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5dCWukmG+mAZFaPhlcrbbBM1PB4VDa/qAJYdkri2eKT4m7ljycyliOMAHhE2HCU8PBzGLxJADzjZPbaDyq0zJ93yfRTS5skUGiamlRuKReaQBN1Y8tfdKvjxy2ljlRfg7/Yr2yI8q9lSp5FrRGXpUaDdRwfGcZr8kt3v0z8itA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=jEuJl7UU; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YhrN00TK0z9sb6;
	Tue, 28 Jan 2025 04:28:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1738034896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oXIzhlHHXkKuY74ACW2Oy/CgVPwAx6v8C9NK49wsELo=;
	b=jEuJl7UUw+gBw7G+TKpgswrA8hA3g+S8sh8Q5bHfQVJlA1J0FEVHPv6ZKrOGzUMF9MjFmA
	nFRcQAGcIa8vZ3Py3kxJqBs58vs1b8gaL8RzNK2ouF6RJF8CEsXh8eUEGpo2RgZkR6abQF
	UeCQOs5fOtXFfkI+a8nGGsnySelothDafvhL/q+82dhjMDkl9/FQWcWIXj2NSiVoALMfsQ
	6DskjQ6SlHxJ0nMajQWvZe+dD7WrbJGJUq3NSe4aN7fRddYNMEVxwPiYsXiGpX0Smg8epo
	3xYyNiEqB4BAjxyAKJtuYKlZ7beBfJzTdBWSYq2qECVAs1BvVeNQ4tDq7sl+0Q==
Date: Mon, 27 Jan 2025 22:28:12 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: djogorchock@gmail.com
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC/HELP] add support for POWER-A/THQ BDA NSW Nintendo Controller
Message-ID: <fbjhelddqwf6yenezqqndihm7sebehpg4cubdwktxyw2nnirrs@2yz7fahu6nr6>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all,

I have an unofficial USB Nintendo Switch Pro controller that I have had
for a few years and want to try to use on Linux. For reference, the
vendor id and device ids are as follows:

Vendor: 20d6
Device: 0002

I tried adding the device to the hid-nintendo module to add support but
that did not work (see below for code). I recieved a few errors from dmesg

nintendo 0003:20D6:0002.0011: Failed to get joycon info; ret=-110
nintendo 0003:20D6:0002.0011: Failed to retrieve controller info; ret=-110
nintendo 0003:20D6:0002.0011: Failed to initialize controller; ret=-110
nintendo 0003:20D6:0002.0011: probe - fail = -110
nintendo 0003:20D6:0002.0011: probe with driver nintendo failed with error -110

I understand that -110 is a timeout. But I don't understand much else.

And I am not sure where to go from here. Any suggestions?

Thanks,
Ethan

---
 drivers/hid/hid-ids.h      | 1 +
 drivers/hid/hid-nintendo.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c448de53bf91..693e6f584c8a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1289,6 +1289,7 @@
 #define USB_DEVICE_ID_BLINK1		0x01ed
 
 #define USB_VENDOR_ID_THQ		0x20d6
+#define USB_DEVICE_ID_THQ_BDA_NSW	0x0002
 #define USB_DEVICE_ID_THQ_PS3_UDRAW	0xcb17
 
 #define USB_VENDOR_ID_THRUSTMASTER	0x044f
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 11ac246176ae..54f1b49849c0 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2783,6 +2783,8 @@ static const struct hid_device_id nintendo_hid_devices[] = {
 			 USB_DEVICE_ID_NINTENDO_GENCON) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_N64CON) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_THQ,
+			 USB_DEVICE_ID_THQ_BDA_NSW) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, nintendo_hid_devices);
-- 
2.48.0


