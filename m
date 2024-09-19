Return-Path: <linux-input+bounces-6611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F94097CAFB
	for <lists+linux-input@lfdr.de>; Thu, 19 Sep 2024 16:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81F6C1C22F87
	for <lists+linux-input@lfdr.de>; Thu, 19 Sep 2024 14:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72B819F13C;
	Thu, 19 Sep 2024 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="ngGKABLq"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7765219B59D;
	Thu, 19 Sep 2024 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726756162; cv=none; b=PzlEi6ZUsAssztw5RX1n+pDdWkMXCJdW2Cfjm3ubIXcNZOCcAEGwvSwI4gSZY9mA8JmZj05SdExpQlQzaztjCCsEqRja+TWit5zYOLhMhgs7CIaiur+swhAxXsKy9l7rMe7rg/2kX7mfAEy5p159QJhI8wrc/XsWqDOfxPfnOLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726756162; c=relaxed/simple;
	bh=dEim+1ctxtagkbl+oGq/0XtscAlXznSuyl1GSgBREzg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pv9SfHf7aETs5+DfJUDMuRB3IouR8GIpUNkJJ7W7RnaXr1B8P5Z9kx8v8p8bTLwnzY5q0mu8xz6d1LNDIDlJbiaValhtPOww7vOkgezVxLZykkxBACd7F684NbY1AuKv228Lkv4hAG73siUwptIThMZCAm2eXw+LkRyeS+jpfHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=ngGKABLq; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1726756155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YA659z4YWAtrDo7+8ziQ0grbGRsnS0px4OMQ2HtoYw0=;
	b=ngGKABLqQia64371BWnSepwRmodugz6xhk7L2BHMr1onzABxAL5KUW5cy4ncIXxI0cOtms
	dQa7GZvZ75SOIAj74DG1fOOxHbq7W3aOrAo8bqRJCo1crIuDwXoCWeP+vLak8Nn4I0tvCB
	Kuvpb4MSsQTh2Js7U6LMehDj85W0/fw=
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5/10] Input: adp5588-keys - added a check key_val
Date: Thu, 19 Sep 2024 17:29:14 +0300
Message-Id: <20240919142914.100609-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No upstream commit exists for this commit.

If the adp5588_read function returns 0, then there will be an
overflow of the kpad->keycode[key_val - 1] buffer.

If the adp5588_read function returns a negative value, then the
logic is broken - the wrong value is used as an index of
the kpad->keycode array.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 69a4af606ed4 ("Input: adp5588-keys - support GPI events for ADP5588 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/input/keyboard/adp5588-keys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 90a59b973d00..19be8054eb5f 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -272,6 +272,8 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 		int key = adp5588_read(kpad->client, Key_EVENTA + i);
 		int key_val = key & KEY_EV_MASK;
 
+		if (key_val <= 0)
+			continue;
 		if (key_val >= GPI_PIN_BASE && key_val <= GPI_PIN_END) {
 			for (j = 0; j < kpad->gpimapsize; j++) {
 				if (key_val == kpad->gpimap[j].pin) {
-- 
2.25.1


