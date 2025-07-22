Return-Path: <linux-input+bounces-13637-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F078B0D8E7
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 14:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 801CC7AAE9A
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC672E2664;
	Tue, 22 Jul 2025 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="bczU5EkT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E522E49B2;
	Tue, 22 Jul 2025 12:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753185904; cv=none; b=gab6NBojE5qDnWw8YF/HME1s/9iH7rBeg61lR/9CPTJDGuzHvs/HplkOoBLMyefsv+/gAWH0rse9NVJl+FVaABme+qa1WlKI4Hj6WhbsekdwpdBf5nUZBTMzic8dCPG0C6KEzi6MqK1bnMF01Id1oX8883jEMc8AUU9D71xlvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753185904; c=relaxed/simple;
	bh=DEzqPOhGJOjWAjwfeVfulm0JvD3oPek31c4R8iJiKyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGLxEpA/y3jUhswDnJHxi949+6GNq6ZofTtBYVXfATLwPiLUHNbBLpbUC0Bo2J5tN5kWiGZNnJpjokdiwVdWucdGHr2vIn4kt5uwTnPvsf/FexvGOlOYcj1t7jIYHTYA9rMBgC15C4Pzr+yzMpKpovJQbAlN0+RccBx+qDekQVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=bczU5EkT; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (p5de459a9.dip0.t-ipconnect.de [93.228.89.169])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id CD9702FC0076;
	Tue, 22 Jul 2025 14:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1753185897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d9rb7eGQ2BzXC0Z6LLqjBGXkKXLN9DeYLrCAK6Co4Q4=;
	b=bczU5EkTagC0ToaG9OEYu90j5Fu94GqMfe9JYf6PRE5H5lJKCY1TxCrkPnQ51CEuDxs+qn
	BP3ua8UlmSxh2otv+bWIV2RVIOz/A/XiRFks8lSiUc8VJ8AhfEwHMqEYb10V8U8Q09kMSB
	GfEy2ArYYWNxDdR83pbkL451P0x7v0c=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hansg@kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] Input: atkbd - Correctly map F13 - F24
Date: Tue, 22 Jul 2025 14:04:35 +0200
Message-ID: <20250722120438.28011-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently only F23 is correctly mapped for PS/2 keyboards.

According to this table:
https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf

- F24 and Zenkaku/Hankaku share the same scancode, but since in real world
Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.

* Qt on Wayland and therefore KDE on Wayland can see the keypress anyway for
some reason and it is actually used in a touchpad toggle shortcut, but this is
currently being fixed in both KDE and xkeyboard-config to make this less weird,
so it could directly be fixed to correctly handle the F24 keypress instead.

- The scancodes for F13-F22 are currently unmapped so there will probably be no
harm in mapping them. This would also fix the issue that some of these keys
can't be mapped as the target from userspace using the `setkeycodes` command.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/input/keyboard/atkbd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index c9e1127578b9e..6c999d89ee4bd 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -84,12 +84,12 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
 #include "hpps2atkbd.h"	/* include the keyboard scancodes */
 
 #else
-	  0, 67, 65, 63, 61, 59, 60, 88,  0, 68, 66, 64, 62, 15, 41,117,
-	  0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
-	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
-	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
-	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
-	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
+	  0, 67, 65, 63, 61, 59, 60, 88,183, 68, 66, 64, 62, 15, 41,117,
+	184, 56, 42, 93, 29, 16,  2,  0,185,  0, 44, 31, 30, 17,  3,  0,
+	186, 46, 45, 32, 18,  5,  4, 95,187, 57, 47, 33, 20, 19,  6,183,
+	188, 49, 48, 35, 34, 21,  7,184,189,  0, 50, 36, 22,  8,  9,185,
+	190, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
+	192, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0,194,
 	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
 	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
 
-- 
2.43.0


