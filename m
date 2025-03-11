Return-Path: <linux-input+bounces-10711-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A7A5CD31
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 19:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2896189CD32
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 18:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B58D262D21;
	Tue, 11 Mar 2025 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="WWdzzWs5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2A262D0D;
	Tue, 11 Mar 2025 18:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716411; cv=none; b=ByPaF9RElo1f3hnCa65/xM1SZHqNuwJ+XDiaQiXKsfM4W4i2VGTy9ZXJIad9oGFAcDCMDKZCod2KJMxTHM3r9GabTEgjq/QAWohGzDtRv9pVArVyufjaRKZ6FvuKfBsAqPyuDJTcP7nZ4lmi9Kt7w/9w7dEkLCq/Yks7MvDWWjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716411; c=relaxed/simple;
	bh=XC3XlkziQO1Wl6P1RY85pKtUM4AO04hn0K7ztXOgPj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCyJF7PhQd1ud/K8wAlKs6i28Smqgoje+13scSNZKWRjo3nEECTcmOgLOs6WsR3KQmyQmjRFGEnjZssDQ7gj9gHu9AlbxKVbBs/joGRFwskiuMVQl5E7Bj4Ih7CHg0kGwfmLfMyP4UHT9GwzYe6sXZNVIEnvGEXoQ0+NTx/N7Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=WWdzzWs5; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 35A2F2FC0187;
	Tue, 11 Mar 2025 19:06:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741716405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rj71V9cX/09jpVUCtVRITKGWUzt6/3pszBTJ+XqhBw4=;
	b=WWdzzWs5wb842qZa9YzJPyaDtS6qpFscdOj+lgDV040b5o6LscKiKdmouNkF4RoK4ckjrC
	IOaHb+LJraF1r1mzwIfAMnjMyAREvYnpkVN2Dw3kU9kYveTad0RypTlRxGikqy2SG9uDXY
	+rsyqTWPJ5bIUhnh1vCfbsP5Smmf8PM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: hdegoede@redhat.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] Input: atkbd - Map FN-key for TongFang barebones
Date: Tue, 11 Mar 2025 19:06:23 +0100
Message-ID: <20250311180643.1107430-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TongFangs firmware sends scancode 0xe0 0x78 upon pressing the FN key.

This patch maps this scancode to avoid a dmesg warning printed every FN-keypress
and to enable userspace to use they key in other shortcuts than the firmware
builtin ones.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/input/keyboard/atkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index adf0f311996c9..3598a21d9d014 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -98,7 +98,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
 	173,114,  0,113,  0,  0,  0,126,128,  0,  0,140,  0,  0,  0,127,
 	159,  0,115,  0,164,  0,  0,116,158,  0,172,166,  0,  0,  0,142,
 	157,  0,  0,  0,  0,  0,  0,  0,155,  0, 98,  0,  0,163,  0,  0,
-	226,  0,  0,  0,  0,  0,  0,  0,  0,255, 96,  0,  0,  0,143,  0,
+	226,  0,  0,464,  0,  0,  0,  0,  0,255, 96,  0,  0,  0,143,  0,
 	  0,  0,  0,  0,  0,  0,  0,  0,  0,107,  0,105,102,  0,  0,112,
 	110,111,108,112,106,103,  0,119,  0,118,109,  0, 99,104,119,  0,
 
-- 
2.43.0


