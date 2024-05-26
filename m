Return-Path: <linux-input+bounces-3843-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6D18CF4B3
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 17:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63792811EC
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 15:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033901757D;
	Sun, 26 May 2024 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ChgXW3MW"
X-Original-To: linux-input@vger.kernel.org
Received: from out.smtpout.orange.fr (out-11.smtpout.orange.fr [193.252.22.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EBB16419;
	Sun, 26 May 2024 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716736503; cv=none; b=j2Sbs7i5PK3lvpTssp87ZHK8mUpPBlzVNyVkdz7wxbEyLMn4uUinQW2IFkfIrtXTCKhiFVRdSKbEg+gJYk/AnGZJf3MXmMOmRkUMQCsFk+1GW80dyPbcbWCekdyO7YgxFy2AOzpIPLmjQru+n4MlQbvFTNDRMD9ekvFcPQSSENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716736503; c=relaxed/simple;
	bh=822gvYtmBeemtVRfxcdDwbuGCyxKXkYXfh+pxyxNg8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R17Ffrombuu2/NaMPUdkeVvmpC4ANpS4gjlyp6Y79iXIoDLm8gE40Vg8j2k6vOLcId+KlcbpFK+iEKOmxwbkxGNPb1cjTSQkIBtesTOkgVTfUudrES8S56kAE0oIFy+Dr3qVVNCgwmCu7Vu+XHMKCV8ZRw9yQld5TNWF4G2hsQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ChgXW3MW; arc=none smtp.client-ip=193.252.22.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id BFRfs8cSO0yxaBFRfsnWcD; Sun, 26 May 2024 17:06:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1716735960;
	bh=Sh9l9eVaJ94Zs7+8NcAUJ+VzJkwFBMWU1cGTzdrHWZk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ChgXW3MWuTrHZYLgYL6uiwlxJGUAOT+VMG6t1w4IPseu9cVnOtAahA3N8YMm9ebaK
	 fhFMx7sN92ITLAz0FuFVwz/AdVTuC93/FZnYNKCec26JE7m01C9UtBJ0PYxQoLUDpP
	 7qZ3zDf2wNV+nwYnu4fx4SF+VmItvMJIErhTftK02JmURd3WBpZ4+VTKF1N+XhB/q2
	 9OUTtkTANLBGmdt4IKFVBCJxf5uLBCx0bsKRFGgdSsq8z+hgsYj3/vDoNntqtcA7Xp
	 HJG3xHvziusmuMoMa5/nEL5n8zzjZZPc+fVTXwuDDiPezZxnDaj+SVriPsJu7fzsLE
	 k8QyRxf/e5XXg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 May 2024 17:06:00 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "Daniel J. Ogorchock" <djogorchock@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Martino Fontana <tinozzo123@gmail.com>,
	Ryan McClelland <rymcclel@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: nintendo: Fix an error handling path in nintendo_hid_probe()
Date: Sun, 26 May 2024 17:05:59 +0200
Message-ID: <9e599978852f9a2f30f9523edfd220dd1e25aa63.1716735907.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

joycon_leds_create() has a ida_alloc() call. So if an error occurs after
it, a corresponding ida_free() call is needed, as already done in the
.remove function.

This is not 100% perfect, because if ida_alloc() fails, then
'ctlr->player_id' will forced to be U32_MAX, and an error will be logged
when ida_free() is called.

Considering that this can't happen in real life, no special handling is
done to handle it.

Fixes: 5307de63d71d ("HID: nintendo: use ida for LED player id")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-nintendo.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index b4a97803eca3..3062daf68d31 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2725,13 +2725,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	ret = joycon_power_supply_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create power_supply; ret=%d\n", ret);
-		goto err_close;
+		goto err_ida;
 	}
 
 	ret = joycon_input_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create input device; ret=%d\n", ret);
-		goto err_close;
+		goto err_ida;
 	}
 
 	ctlr->ctlr_state = JOYCON_CTLR_STATE_READ;
@@ -2739,6 +2739,8 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	hid_dbg(hdev, "probe - success\n");
 	return 0;
 
+err_ida:
+	ida_free(&nintendo_player_id_allocator, ctlr->player_id);
 err_close:
 	hid_hw_close(hdev);
 err_stop:
-- 
2.45.1


