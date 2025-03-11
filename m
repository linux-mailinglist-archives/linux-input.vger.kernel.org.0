Return-Path: <linux-input+bounces-10708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9CFA5CB87
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 18:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA42B16B11E
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 17:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B97725FA1C;
	Tue, 11 Mar 2025 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="OZvPjIDH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2B725C6FF;
	Tue, 11 Mar 2025 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741712707; cv=none; b=eG5xxLufWYNiljWCoxPNbpTVijYCTxPZco7uO4JHWc74lwvWtFFrmTO8RabHgSY/iC83ZJwiXZ/DH4ul26Ip5s71uV08kcJIGjnunloVz9f2zm5uzd5m0SiU5AXHTr79LERkib+GLewBGDBslxsxFuLt2XwxETKZ+MGhyLCnsRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741712707; c=relaxed/simple;
	bh=tPgnU+rJhHBiowGyT3sROXA/KCzcSc7LZwfiexOaLEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhy6U+pRx5XaQuQgI41zpyuTeBLdm40T13Cf8bEOTANS+J0rnuFvlSDFGpkHrqhoMZqFO70bLzcN6wOT/ljnEvGVTr730vkG/OI7iO2NhhfWVUadSlfsu0epkTwwgxS8HKANmnea7uHAU6IHbk0P3wrLYJSknj43cYH1nE9k0i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=OZvPjIDH; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id CBB512FC0187;
	Tue, 11 Mar 2025 18:04:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741712694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0zuTJhP/TAHW2pWcx32Xiq2E7JP9tUTogWrJlqIJkLs=;
	b=OZvPjIDHMeopZiMEC2VUPX/SgP3lBnQg8LI1cSP+IiLX1ulXhal0B3bKKQHmp8GI32Qd1v
	SSj5OU8u2mxnGTrUIn0SvYvSe0WqnZAj+nYkLkLfrG4PERR2Wte/dTZFmcX9hZZfR8gf5u
	K78WvGOzAz/OlwrPmrRqzBK6GuUAhYU=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: hdegoede@redhat.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: atkbd - Map FN-key for TongFang barebones
Date: Tue, 11 Mar 2025 18:04:22 +0100
Message-ID: <20250311170429.1091067-1-wse@tuxedocomputers.com>
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
and to enable userspace to use they key in other shortcuts then the firmware
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


