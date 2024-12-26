Return-Path: <linux-input+bounces-8777-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7E99FC7B6
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 03:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C4D97A0F41
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 02:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8996CEED8;
	Thu, 26 Dec 2024 02:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="CpC38f00"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C8E17E0
	for <linux-input@vger.kernel.org>; Thu, 26 Dec 2024 02:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735180486; cv=none; b=Zz+XJ3e4U8TECVD6LhXJRuq4/BT9zvroes1DJ6hO1KdMIcPYwFD4fB95hLPKTdHnDQbDiOPb5rBP4OZ/KiedVHZhczPO5DnThAq2Rj3OczFDnfMWjZVjw5khEwr20RPbEad5OQjstAKBeThsbzwHafr8id6ryM23MRjv9or3+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735180486; c=relaxed/simple;
	bh=AjaIMK/hf2RsV71xLkYbF6tRN3hxbnWh8mGR/0HbtgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egp8JyPpQeaz+YcGO2u3bhtd3tHaFIxuSoD8CVRF2J9Pd+56j4/o01J2sk+J/9tq4BDW/XiBJvyBY/Vg2fED9MjPGUT8oVP9X/TRdofiVueBgjAPzeHvlZ/80IIaeqmWVGvccwa8+ArEdgtgEG1uxk7saZ90i3iClWZeJRfw4yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=CpC38f00; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id B4F5DA3B9;
	Wed, 25 Dec 2024 18:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1735180481; bh=AjaIMK/hf2RsV71xLkYbF6tRN3hxbnWh8mGR/0HbtgI=;
	h=From:To:Cc:Subject:Date:From;
	b=CpC38f000YbdyqPtt2c7/xAHdnHVnapOFZJvQraeS2tT1K9w4czTQHTB/OjBRQmw1
	 QA4eElnbdDqdY1c5xoT8pdwYlCKXm4BaEpuZGmivYo2mKJLBJF4rm/5lSjRjXSwNIP
	 so2ZI3breF7pRMlnVCcpQ43QUV89+blN3UtXArg0wVxLY+cPR+giBIjdaKhFy4ogca
	 9s7kcl5crwivqM7za2Y+8VpuRiNwEEIgxrvS66tYtLJ0leL6azpfKyLULNh1ExlBbf
	 qOo4hpyuInYNpYq2tN2Jl/f2NAdI5z/lkMvXVWfd8g1ByrUHSJFntGozUMrRlDtfiB
	 ds9Gybd26IJIA==
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH] HID: hid-steam: Make sure rumble work is canceled on removal
Date: Wed, 25 Dec 2024 18:34:24 -0800
Message-ID: <20241226023424.653914-1-vi@endrift.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a force feedback command is sent from userspace, work is scheduled to pass
this data to the controller without blocking userspace itself. However, in
theory, this work might not be properly canceled if the controller is removed
at the exact right time. This patch ensures the work is properly canceled when
the device is removed.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 6439913372a8..af38fc8eb34f 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -1306,6 +1306,7 @@ static void steam_remove(struct hid_device *hdev)
 
 	cancel_delayed_work_sync(&steam->mode_switch);
 	cancel_work_sync(&steam->work_connect);
+	cancel_work_sync(&steam->rumble_work);
 	hid_destroy_device(steam->client_hdev);
 	steam->client_hdev = NULL;
 	steam->client_opened = 0;
-- 
2.47.1


