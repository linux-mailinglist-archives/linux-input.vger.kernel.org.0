Return-Path: <linux-input+bounces-9786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF81A2833B
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 05:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D07397A1DD6
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 04:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C45825A650;
	Wed,  5 Feb 2025 04:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="YOvIYYmA"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED31134AB
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 04:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738728317; cv=none; b=V+Xe6iBt1dMfgIZRJiJ1QFCphZwpllliM6+WjwMt1EGoxH956Kad9/07G2F3NQ45vqB7klCEKQ1/6SWNyCu/52okQ+sJIwopyH67JlIRBEkE5xKHkVd1EPVp+EtDD+wmAgeAlQoyGMBDxQu8nq7WsE/XOIgZEN02ZRYXPY3rwZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738728317; c=relaxed/simple;
	bh=GpRtRX52C9sbH1/3xqxenzSFq/8m9v2WYvp/slEwp7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBVsxIl1IZJ+/rLWzvsMueUkgAhu0SgqKzpLvCijegyb9KnG059C3J0FkX7Tfa09k/RVgDC79DROIwpHEGp/dlfsnFJhaJs694zvdH3X0GTLgehf2TeTvkjHBILxKUoVUjUOoz3hk6LkbAUgbwQI3LwvuF4+s+h1eO3/DnWV7iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=YOvIYYmA; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1738727758; bh=GpRtRX52C9sbH1/3xqxenzSFq/8m9v2WYvp/slEwp7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOvIYYmAfkpSMNzsFgrQhZtx0172v2acvUR3xWMB7Dn8mKgbCv0IrD7cU93uxCkqb
	 X7w4h8IFWRve8kXQomqfhLHQh8yS6Hhzo9nzGPLe7IUBFoFdjKgNO33xC9ACo3bMjL
	 HrY0NnSUn+1jZmmPHj3HrofFY+9PGCszp7oJHCyeE0m8BdVR1fBxEpoAoAmBfttfdO
	 MFa6y9hmdA5dtPKpbxsOyiXvdr2mGgEtRIsv5MY8SW9BIFVlrxmQRGOOGVZ5JAMFip
	 zSP1yytdWkreJsif7Fqd5u+f5qe/U6Bcr9u5OOBKKDFOPbZUsfjszDJ0oTtdfU6IaB
	 s81SByS9qU07Q==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id A936013208C;
	Tue,  4 Feb 2025 19:55:58 -0800 (PST)
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 3/3] hid-steam: Don't use cancel_delayed_work_sync in IRQ context
Date: Tue,  4 Feb 2025 19:55:29 -0800
Message-ID: <20250205035529.1022143-3-vi@endrift.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205035529.1022143-1-vi@endrift.com>
References: <20250205035529.1022143-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep reported that, as steam_do_deck_input_event is called from
steam_raw_event inside of an IRQ context, it can lead to issues if that IRQ
occurs while the work to be cancelled is running. By using cancel_delayed_work,
this issue can be avoided. The exact ordering of the work and the event
processing is not super important, so this is safe.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index d6be0deea330..0f4d55f82423 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -1614,7 +1614,7 @@ static void steam_do_deck_input_event(struct steam_device *steam,
 
 	if (!(b9 & BIT(6)) && steam->did_mode_switch) {
 		steam->did_mode_switch = false;
-		cancel_delayed_work_sync(&steam->mode_switch);
+		cancel_delayed_work(&steam->mode_switch);
 	} else if (!steam->client_opened && (b9 & BIT(6)) && !steam->did_mode_switch) {
 		steam->did_mode_switch = true;
 		schedule_delayed_work(&steam->mode_switch, 45 * HZ / 100);
-- 
2.48.1


