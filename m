Return-Path: <linux-input+bounces-10709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AFDA5CB89
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 18:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356F63B356F
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 17:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AA826139C;
	Tue, 11 Mar 2025 17:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ZJ+WVzv0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0C825FA28;
	Tue, 11 Mar 2025 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741712708; cv=none; b=QVZQX8VqwKm0xPnGVamOGPD2KAae5Kv+rdEIlfgEGGyd0xFVASpEjwpzTgUt+ftQSR15Bo8+Ey/mqSOfNbSrd7qyzL/qUeNciaKlfXx+X+e2kvT5VVD6cy5BhZoQx1YRyKUBEkbdY4olHWpCQImMB18svqYbwzA+8tKSKt4vY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741712708; c=relaxed/simple;
	bh=BHav3oKa2uFyPTW/UrA35WATkduan0OqaEQuXBZpk98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZXUGIDsoO/mFpDePDt/22OUUHTMZasF1HWlKhL5FIGTPtLFTeNgk/jXYJP1JewUWexqOFZB0Ca8yrbTRmMMhRvnD9rq1erFS9RJFT4GFbm2bXilOUGJSkWpXbJFUSW7hUJ2218sbdPfINy/oSCpB8JcuqhWJQGbuShFEs+YpA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ZJ+WVzv0; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 8EB302FC018A;
	Tue, 11 Mar 2025 18:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741712696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6R6tm4ns8Um0TDPIr9+P3P4IbmZhumCp0uw8ROTCc4=;
	b=ZJ+WVzv0g6G5OWKGe7kYYrw7TF6+Bm3gYgM4H/YuoC3A+pzJwBhr4cE1Gyvos0ozBB2KoA
	I3SppHsDvavbtnz+Jc1G/x9JuXO/+EnmHPVHQdcx25GBqykQC+BhynKap5FToc2UJ6G7nA
	FYonZWQYeyaCUjrASLHx04fh4HZI+Qg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: hdegoede@redhat.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: atkbd - Correctly map F13 - F24
Date: Tue, 11 Mar 2025 18:04:23 +0100
Message-ID: <20250311170429.1091067-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311170429.1091067-1-wse@tuxedocomputers.com>
References: <20250311170429.1091067-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently only F23 is correctly mapped for PS/2 keyboards.

Following to this table:
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

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/input/keyboard/atkbd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 3598a21d9d014..4bd6e6ef0715e 100644
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


