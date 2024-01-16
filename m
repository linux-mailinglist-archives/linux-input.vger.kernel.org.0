Return-Path: <linux-input+bounces-1285-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CA82FC60
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 23:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29656B25544
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 22:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F94424B36;
	Tue, 16 Jan 2024 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T6CbTkO3"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D444924B4D
	for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 20:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705437816; cv=none; b=Joo0cC763KykCt55ETIlfZQmqkIUIUvLIMo1+eoqxI4iyT9+gtvh/cABscUjh7ElKv7grHOW0Wxdt/wZqoVX/lO4TRHDg0cgPvUy+i2chgZPCXY+9ttIM76C5TpfFmE8moajmoqA2Fbh6TOII1zpds5qKDkf6HRrsAJuU5aaCVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705437816; c=relaxed/simple;
	bh=p+i0FXuxXzZH+zBYjbfUxX6j1AcRg2SAkRBqUYmvsrY=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By; b=dD1L+368PCwkMD9rlpL7IaDlkRg/ee9HBfGPSVaEXJnb2tA05yXauxBQoDr3lYI2249zFiVx4qgju78u/utOOst9RL8Mu6+Pyaq4AlSU+qydZhn/e0QTMRs3qzsB9P7rGQ7BsDMsGE8o/+GmI3WWy0RuO9lTrrVJu4RwNrSLrTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T6CbTkO3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705437812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n4Ld+LwHT2KtaHlX19Lhlf3Zd/e0ctjbol8Ko0BP92k=;
	b=T6CbTkO34uyygGVU0wCGnTuHshzxD0zngcoS0JW3WG8+rNv2h2/DTxR/xOkr3Th0/NXXH5
	fU444U03BPZtkEdD6bX0EhOXOd7i6K4t+4+KO6O9tMGLC+kN6FjFkCf0Y/rpRjj2T9J6Jf
	KN/EFAWH4QwBT6nFSLKegKiKUGeeEtI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-631-YiU3qG3zNTe99xQupm5aBw-1; Tue,
 16 Jan 2024 15:43:30 -0500
X-MC-Unique: YiU3qG3zNTe99xQupm5aBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F6B8380671C;
	Tue, 16 Jan 2024 20:43:29 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62C2F1C060AF;
	Tue, 16 Jan 2024 20:43:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH] Input: atkbd - Use ab83 as id when skipping the getid command
Date: Tue, 16 Jan 2024 21:43:25 +0100
Message-ID: <20240116204325.7719-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Barnabás reported that the change to skip the getid command
when the controller is in translated mode on laptops caused
the Version field of his "AT Translated Set 2 keyboard"
input device to change from ab83 to abba, breaking a custom
hwdb entry for this keyboard.

Use the standard ab83 id for keyboards when getid is skipped
(rather then that getid fails) to avoid reporting a different
Version to userspace then before skipping the getid.

Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
Reported-by: Barnabás Pőcze <pobrn@protonmail.com>
Closes: https://lore.kernel.org/linux-input/W1ydwoG2fYv85Z3C3yfDOJcVpilEvGge6UGa9kZh8zI2-qkHXp7WLnl2hSkFz63j-c7WupUWI5TLL6n7Lt8DjRuU-yJBwLYWrreb1hbnd6A=@protonmail.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/keyboard/atkbd.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 786f00f6b7fd..13ef6284223d 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -791,9 +791,9 @@ static bool atkbd_is_portable_device(void)
  * not work. So in this case simply assume a keyboard is connected to avoid
  * confusing some laptop keyboards.
  *
- * Skipping ATKBD_CMD_GETID ends up using a fake keyboard id. Using a fake id is
- * ok in translated mode, only atkbd_select_set() checks atkbd->id and in
- * translated mode that is a no-op.
+ * Skipping ATKBD_CMD_GETID ends up using a fake keyboard id. Using the standard
+ * 0xab83 id is ok in translated mode, only atkbd_select_set() checks atkbd->id
+ * and in translated mode that is a no-op.
  */
 static bool atkbd_skip_getid(struct atkbd *atkbd)
 {
@@ -811,6 +811,7 @@ static int atkbd_probe(struct atkbd *atkbd)
 {
 	struct ps2dev *ps2dev = &atkbd->ps2dev;
 	unsigned char param[2];
+	bool skip_getid;
 
 /*
  * Some systems, where the bit-twiddling when testing the io-lines of the
@@ -832,7 +833,8 @@ static int atkbd_probe(struct atkbd *atkbd)
  */
 
 	param[0] = param[1] = 0xa5;	/* initialize with invalid values */
-	if (atkbd_skip_getid(atkbd) || ps2_command(ps2dev, param, ATKBD_CMD_GETID)) {
+	skip_getid = atkbd_skip_getid(atkbd);
+	if (skip_getid || ps2_command(ps2dev, param, ATKBD_CMD_GETID)) {
 
 /*
  * If the get ID command was skipped or failed, we check if we can at least set
@@ -842,7 +844,7 @@ static int atkbd_probe(struct atkbd *atkbd)
 		param[0] = 0;
 		if (ps2_command(ps2dev, param, ATKBD_CMD_SETLEDS))
 			return -1;
-		atkbd->id = 0xabba;
+		atkbd->id = skip_getid ? 0xab83 : 0xabba;
 		return 0;
 	}
 
-- 
2.43.0


