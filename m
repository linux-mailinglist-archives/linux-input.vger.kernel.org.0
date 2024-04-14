Return-Path: <linux-input+bounces-2981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ACA8A41A1
	for <lists+linux-input@lfdr.de>; Sun, 14 Apr 2024 12:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCC21281923
	for <lists+linux-input@lfdr.de>; Sun, 14 Apr 2024 10:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B71523774;
	Sun, 14 Apr 2024 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YaPgL0LB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6CC1AACB;
	Sun, 14 Apr 2024 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713088797; cv=none; b=hOYb41iAmZtJxoedvEb9NdPFU2dL+2sWEwQXU5cKjhpxJjk6IBN5HDwPu1WsAQKyrtwuAxFU3r6b5IJlvdfaV8s3Pv0xNgVqYtMJAilmQCRVMCZKA/kVhUJHCK9vT/yj6DhnG+BPTckhKdpQTKm3DdrQSNMmEralDESRMtvgP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713088797; c=relaxed/simple;
	bh=lkq1lrzB9HxKNl03Hpci59UA0sfQ1vTlkLoKDGZGgc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jQi27+QM3Ni/5porIh/nbXAnh2rYrtliDjMt0CXRynXQONyk9THfx8FRAq61WsYfxhwkalNweyIGweKWWfR38vNVnFiL4mcWbnP3oIfUZnNGq3yM/uzR9Z8YBsv33GK47X4UwJg+LEV9m0afuG2Y4x44TE9qdqwftcaLniid9tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=YaPgL0LB; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id vwdGrlEDlSoxzvwdGrpuSk; Sun, 14 Apr 2024 11:58:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1713088723;
	bh=vJwVeMXmnUN8m7oxlGG0PhRilSD1pyJWjsrWEGLWca8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YaPgL0LBOAlUN3v3MGzWg5qQRiFtebPEH7cCRm2gGLDPw4G4Oi7+izNrlJtrcJ4pC
	 7Qp7zK/WwUIBc5ZL5LaUXYZr0456fzjGVQdrUiaSLMIlzIUpt/yQksJAnAnhxP/oN2
	 g3UhZitgMeMSkqqEB9Gp/LAxEyzYk64DiFYPo/wt3/xbrV7tn8UoLgvMD29UjuJWq7
	 XI39HBfbLyUq7ynOcSF6AceeoYbpMIlCYZEX39PAQ+TI2KGNPJeFVX+zA2gVZOFSsQ
	 nH4KtopZJOga5ot5z6HUAzpP7WEA6BkVvtRLQmWldGOBnbt86gwDZutJXBHNZ0aJ/m
	 Anc7CIDkHMj7A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Apr 2024 11:58:43 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org
Subject: [PATCH RESEND] HID: sony: Remove usage of the deprecated ida_simple_xx() API
Date: Sun, 14 Apr 2024 11:58:39 +0200
Message-ID: <9b7684381f9d09a7cd5840caa2a160d7764d6403.1713088684.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch has been sent about 3 months ago [1].
A gentle reminder has been sent 1 month later [2].

Neither one got any reply.

So, I'm adding Andrew Morton in To:, in order to help in the merge process.

Context:
=======
All patches to remove the ida_simple API have been sent.
Matthew Wilcox seems happy with the on going work. (see [3])

Based on next-20240412
$git grep ida_simple_get | wc -l
25

Based on next-20240220
$git grep ida_simple_get | wc -l
36

https://elixir.bootlin.com/linux/v6.8-rc3/A/ident/ida_simple_get
50

https://elixir.bootlin.com/linux/v6.7.4/A/ident/ida_simple_get
81

Thanks
CJ

[1]: https://lore.kernel.org/all/9c092dc6db15984d98732510bb052bb00683489b.1705005258.git.christophe.jaillet@wanadoo.fr/https://lore.kernel.org/all/19b538bc05c11747a3dd9fa204fde91942063d52.1698831460.git.christophe.jaillet@wanadoo.fr/
[2]: https://lore.kernel.org/all/a1af20a9-951f-4a5d-8a60-04ded8d6f9a0@wanadoo.fr/
[3]: https://lore.kernel.org/all/ZaqruGVz734zjxrZ@casper.infradead.org/
---
 drivers/hid/hid-sony.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index ebc0aa4e4345..55c0ad61d524 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -1844,8 +1844,7 @@ static int sony_set_device_id(struct sony_sc *sc)
 	 * All others are set to -1.
 	 */
 	if (sc->quirks & SIXAXIS_CONTROLLER) {
-		ret = ida_simple_get(&sony_device_id_allocator, 0, 0,
-					GFP_KERNEL);
+		ret = ida_alloc(&sony_device_id_allocator, GFP_KERNEL);
 		if (ret < 0) {
 			sc->device_id = -1;
 			return ret;
@@ -1861,7 +1860,7 @@ static int sony_set_device_id(struct sony_sc *sc)
 static void sony_release_device_id(struct sony_sc *sc)
 {
 	if (sc->device_id >= 0) {
-		ida_simple_remove(&sony_device_id_allocator, sc->device_id);
+		ida_free(&sony_device_id_allocator, sc->device_id);
 		sc->device_id = -1;
 	}
 }
-- 
2.44.0


