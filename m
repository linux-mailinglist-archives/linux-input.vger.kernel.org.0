Return-Path: <linux-input+bounces-16651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F044CD364F
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 20:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3B25300E014
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 19:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2547223F424;
	Sat, 20 Dec 2025 19:49:52 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765521FF48;
	Sat, 20 Dec 2025 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766260192; cv=none; b=Oik+4czCkIpsE85uhG197lzs1kobAKMaJTGjbNDsW55drP/QNJwLJjUfajshMClOxGl457QVT0DA5SSVVuTY7md1FG7FSi++/TyEiuW3+yiTAG9P7LJxZHmYHHk+lk4dau/6mJcXtDtfeRN64TXA+k4jEXQH4j/IzD9Gc3j83Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766260192; c=relaxed/simple;
	bh=8e9OojA1FEDWGI4AarfsK5f9LyalvxJC+XpEWoD4/eY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nfv7FTB/MUQLek/1mLfLURsts4gscHckJh+JFFxBBbt+4RXum9eLdayFc7PEzK9MIlA6MvX3DNNH/1oQLizpK5HM9FWRlT1osEnU55Oc1t6a3zAc+pZ0y1tYf6dzjNHsCDFtYjVa8XQFgoi6CKq04hLUjlZjSOwdQGsJ9vgvdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info; spf=pass smtp.mailfrom=altimeter.info; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altimeter.info
Received: from altimeter-info (unknown [45.55.225.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: linux-kernel@altimeter.info)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 5617E463984;
	Sat, 20 Dec 2025 19:41:02 +0000 (UTC)
Date: Sat, 20 Dec 2025 19:41:00 +0000
From: Ivan Gorinov <linux-kernel@altimeter.info>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: input: Increase maximum number of joystick buttons
Message-ID: <20251220194100.GA12646@altimeter-info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

This patch increases the limit from 80 to 112 key codes.

If a joystick has 80 or fewer buttons, mapping stays the same.

If a joystick has more than 80 buttons:

  Map buttons [  0 ..  15 ] to key codes starting with BTN_JOYSTICK;
  Map buttons [ 16 ..  47 ] to key codes starting with KEY_MACRO1;
  Map buttons [ 48 .. 111 ] to key codes starting with BTN_TRIGGER_HAPPY.

Signed-off-by: Ivan Gorinov <linux-kernel@altimeter.info>
---
 drivers/hid/hid-input.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 2633fcd8f910..c6159f96de04 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -763,7 +763,13 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 				if (code <= 0xf)
 					code += BTN_JOYSTICK;
 				else
-					code += BTN_TRIGGER_HAPPY - 0x10;
+					if (field->maxusage <= 80)
+						code += BTN_TRIGGER_HAPPY - 0x10;
+					else
+						if (code <= 0x2f)
+							code += KEY_MACRO1 - 0x10;
+						else
+							code += BTN_TRIGGER_HAPPY - 0x30;
 				break;
 		case HID_GD_GAMEPAD:
 				if (code <= 0xf)
-- 
2.43.0


