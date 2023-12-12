Return-Path: <linux-input+bounces-718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB5D80EDA5
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 14:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594B628166E
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 13:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1962561FAF;
	Tue, 12 Dec 2023 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khvoinitsky.org header.i=@khvoinitsky.org header.b="rInq+Ktz"
X-Original-To: linux-input@vger.kernel.org
X-Greylist: delayed 76474 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Dec 2023 05:31:54 PST
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9039311F
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 05:31:54 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=khvoinitsky.org;
	s=key1; t=1702387912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXAhQZ0roT0HhZ8FiISTuzSlJjQHAHO6VIdmzHaVr70=;
	b=rInq+KtzNwrnM3BEJr2zWfuKzXTIftzXOconMaB73TgGqogIhWMZ+CGyzQpcyJn8qgfH9m
	ynGym7jiaCzxfgcN2JlKHp+DGEcjsZjmuM3Uga5gGaQeHCzr2W3cz1GnvSH7J4J5cgUayU
	S3Mx9Qtml32rmhAkkJh+RjruIdxAHJY=
From: Mikhail Khvainitski <me@khvoinitsky.org>
To: jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: me@khvoinitsky.org,
	iam@valdikss.org.ru,
	jekhor@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: lenovo: Restrict detection of patched firmware only to USB cptkbd
Date: Tue, 12 Dec 2023 15:31:48 +0200
Message-ID: <20231212133148.1000761-1-me@khvoinitsky.org>
In-Reply-To: <CAMMabwM2jLvMHvOS151P3M7mQ9mGyAMsMcTS-HoWpeUW_GEFEg@mail.gmail.com>
References: <CAMMabwM2jLvMHvOS151P3M7mQ9mGyAMsMcTS-HoWpeUW_GEFEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Commit 46a0a2c96f0f ("HID: lenovo: Detect quirk-free fw on cptkbd and
stop applying workaround") introduced a regression for ThinkPad
TrackPoint Keyboard II which has similar quirks to cptkbd (so it uses
the same workarounds) but slightly different so that there are
false-positives during detecting well-behaving firmware. This commit
restricts detecting well-behaving firmware to the only model which
known to have one and have stable enough quirks to not cause
false-positives.

Fixes: 46a0a2c96f0f ("HID: lenovo: Detect quirk-free fw on cptkbd and stop applying workaround")
Link: https://lore.kernel.org/linux-input/ZXRiiPsBKNasioqH@jekhomev/
Link: https://bbs.archlinux.org/viewtopic.php?pid=2135468#p2135468
Signed-off-by: Mikhail Khvainitski <me@khvoinitsky.org>
Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 drivers/hid/hid-lenovo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 7c1b33be9d13..149a3c74346b 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -692,7 +692,8 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
 		 * so set middlebutton_state to 3
 		 * to never apply workaround anymore
 		 */
-		if (cptkbd_data->middlebutton_state == 1 &&
+		if (hdev->product == USB_DEVICE_ID_LENOVO_CUSBKBD &&
+				cptkbd_data->middlebutton_state == 1 &&
 				usage->type == EV_REL &&
 				(usage->code == REL_X || usage->code == REL_Y)) {
 			cptkbd_data->middlebutton_state = 3;
-- 
2.43.0


