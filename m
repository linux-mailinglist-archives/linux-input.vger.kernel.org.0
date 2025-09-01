Return-Path: <linux-input+bounces-14407-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB3B3DFF7
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 12:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB10B3AFBB4
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 10:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAD73002B1;
	Mon,  1 Sep 2025 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="TIDXfaM2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iQNOygej"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64868305068;
	Mon,  1 Sep 2025 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722015; cv=none; b=MhfKSfw0Za0YTfMrJ79qmo7yAnRUbM7ANemgG1XeU1uOs2Hoy2fHYIuNfSy39XHmkeXFkB3ueHwahpNeGQgomsk19wHC4VVIJ+jf4540up+c7SOhyC53rBaqUX+2CxDZi5ucWP0zeAZ/sJk9UUqeh7Sop1oEsOjEFJhvVaKxUDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722015; c=relaxed/simple;
	bh=Y8Tb+m/HScr5qE9ER9dJ8sPMOqgFCRTapvm6JyzihTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OGlQ92JiQ7Vaj0SLnePHPegC4VYRwwB3tottjI5eWVv1llK7SWQv5s8eItQ3836x711PUjfLzX/JMpFZKMQNoudLNrILfBqLReOtQrUqOEIvM+XbldgR7XB8eH9VsGJDIDieWbBaa0OP0X1YKLINPxxhaTVisWdCWkOzVKbhp9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=TIDXfaM2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iQNOygej; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 668421D00238;
	Mon,  1 Sep 2025 06:20:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 01 Sep 2025 06:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1756722012; x=1756808412; bh=j9
	opy8fANg8wAVYAeXir3BkxPG3tSAJ23TA9BHXHU5w=; b=TIDXfaM269Jcsbckd0
	sy/SweI5yhufpKsZXiAmjjjedw9LzJVogSA0AnBsuzvR2UlKZAHAOfwzZRKgzaMi
	1Pjv1zY1wffW2w10nx3fymKlvgJtxS2esLLAqQYBrQuf210tLO8ppBjr3RT23xke
	KvnssNfURzLEmhaH9XlzE8jp0ZSHObMPycjyIf+fSliip6ZSdSjiMks+3pDunoUT
	5rcPGUkJjkfZHoUcuyW16RPkN4VW1zcCY22jJ1uwUbv1od8OjvPWLGgRFIdi1z5z
	PdbIExJ/TT8Rs8hTVnv5LVVH/yIjb+afPRW6ZQP5Do++aTgDE8zhhCHtE1TnGGs3
	9mjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1756722012; x=1756808412; bh=j9opy8fANg8wAVYAeXir3BkxPG3t
	SAJ23TA9BHXHU5w=; b=iQNOygejlW4FIxfPDPiQumCLiwlHAImmG1HoFxVgtWDS
	ipYjydA9wG2X3jll6pUYtwtRbFvpmQZkQNk4TOf9/AH82Di66/PuDzpruazkTMmy
	UxYEa175MvtapmmhJeVBghu2Fdul6i9nbuyNdyNGAfG/xJ5WsobEuzHVledGhynz
	xJh4ZBz4vRkH2AaM6F1ff/Sxi+CdyDGvXGNfv8Mvmz1Dk9HXb0DNRNwaC13MmzrU
	+cuRufc7e1MEQtsWoLh4vGX8nUKIx0rdBOpaYKbLzp6We3rDUV4Hy7CZuWdFZUKK
	Nz8k1XCAWN0b4xsH7P43ygDyuoGlT08LWWuIZodc8w==
X-ME-Sender: <xms:W3O1aKQmvHfJ6xldhmw4ectEwmgqFhjHpqYI6SGxYw68yZPSin2Qyg>
    <xme:W3O1aMqgIWQD4CLo5ItHg-a6L0L9pIoBE9pQL9p3aPGoS-1xAUMeEq8aZLklHfwsS
    hj6mc4kkx2P_ZdL9Vo>
X-ME-Received: <xmr:W3O1aHmni0yU1gb9VLpaWvkjcV8oTsSHsXcNsb8wmNjyArevWHQOBpDa8y1tDQbMuBCn6tdqGGNU1G9wzCoTdGFZJiYEJwxjgB32Aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleduledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfeehle
    dtheefteejfedvheetuedttdetleegudeuteejveetieefuedvfeffvdeinecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepkedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhish
    htshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprh
    gtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikh
    hosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhishhhnhhuohgtvhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:W3O1aFc0-eIKH-oi_W_NM5S9AGVtkVh5cNE5nk4bmLORSG0_ITbytA>
    <xmx:XHO1aDop90wgW4yLZN9cdpsL_AQOGYQvEZAtdeI4i1AozwaRDYoXzQ>
    <xmx:XHO1aPOlxeon_JhzC9c3-J6QhV_I_ToP9qzlSEKMN8cJOzGUXlVynQ>
    <xmx:XHO1aGjhD7dqgE0rXqjj9utAPF8P4-t1c3hCnmDAu_BqpWsZTfowJw>
    <xmx:XHO1aHbZv2CO5wUd6PBXUtA6IWAw6YNY4PpLduPYwiHTg5Z1aIs70fHq>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Sep 2025 06:20:11 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 01 Sep 2025 12:20:07 +0200
Subject: [PATCH] HID: lenovo: Use KEY_PERFORMANCE instead of ACPI's
 platform_profile
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-hid-lenovo-drop-platform_profile-v1-1-e2e9c68483ab@jannau.net>
X-B4-Tracking: v=1; b=H4sIAFZztWgC/x2N0QqDMAwAf0XyvEBVinS/MmSUNdVAbUoqMhD/3
 eLjwXF3QiVlqvDuTlA6uLLkBv2rg9/q80LIoTEMZrDGmR5XDpgoyyEYVAqW5Pcoun2LSuREGGz
 Txjg5bx20TFGK/H8Wn/m6bkUm0uxyAAAA
X-Change-ID: 20250901-hid-lenovo-drop-platform_profile-d59013f79a59
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>
Cc: linux-input@vger.kernel.org, regressions@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=Y8Tb+m/HScr5qE9ER9dJ8sPMOqgFCRTapvm6JyzihTs=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoytxZFhacmLxDviJ/mo5X07ciH7jM0fm1+6c821rztEM
 0zf8tizo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwETSHBn+u9mrLuCO0Jlw8eje
 pjMc7spiX/yS13b/N+I5pfmVo9c9kZHhCXeJ83K55zaHP+XrM7bER3vXty8/of9L+k5Lzsqg6Z8
 4AA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Commit 84c9d2a968c82 ("HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd
Fn keys") added a dependency on ACPI's platform_profile. This should not
be done for generic USB devices as this prevents using the devices on
non ACPI devices like Apple silicon Macs and other non-ACPI arm64
systems. An attempt to allow using platform_profile on non-ACPI systems
was rejected in [1] and instead platform_profile was made to fail during
init in commit dd133162c9cf ("ACPI: platform_profile: Avoid initializing
on non-ACPI platforms").
So remove the broken dependency and instead let's user space handle this
keycode by sending the new KEY_PERFORMANCE. Stable backport depends on
commit 89c5214639294 ("Input: add keycode for performance mode key").

[1]: https://lore.kernel.org/linux-acpi/CAJZ5v0icRdTSToaKbdf=MdRin4NyB2MstUVaQo8VR6-n7DkVMQ@mail.gmail.com/

Cc: regressions@lists.linux.dev
Cc: stable@vger.kernel.org
Fixes: 84c9d2a968c82 ("HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 #regzbot introduced: 84c9d2a968c82
---
 drivers/hid/Kconfig      | 2 --
 drivers/hid/hid-lenovo.c | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a57901203aeb284acd23be727d2fad0c137c101c..8ae63f8257cd582448e9683ca7fc654c8e465c0f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -597,8 +597,6 @@ config HID_LED
 
 config HID_LENOVO
 	tristate "Lenovo / Thinkpad devices"
-	depends on ACPI
-	select ACPI_PLATFORM_PROFILE
 	select NEW_LEDS
 	select LEDS_CLASS
 	help
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index b3121fa7a72d73f2b9ac12f36bc3d87c2649c69b..654879814f97aaf876ac16c00bf9efca22d116f3 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -32,8 +32,6 @@
 #include <linux/leds.h>
 #include <linux/workqueue.h>
 
-#include <linux/platform_profile.h>
-
 #include "hid-ids.h"
 
 /* Userspace expects F20 for mic-mute KEY_MICMUTE does not work */
@@ -734,7 +732,7 @@ static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
 				report_key_event(input, KEY_RFKILL);
 				return 1;
 			}
-			platform_profile_cycle();
+			report_key_event(input, KEY_PERFORMANCE);
 			return 1;
 		case TP_X12_RAW_HOTKEY_FN_F10:
 			/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250901-hid-lenovo-drop-platform_profile-d59013f79a59

Best regards,
-- 
Janne Grunau <j@jannau.net>


