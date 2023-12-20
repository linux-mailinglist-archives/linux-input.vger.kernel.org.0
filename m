Return-Path: <linux-input+bounces-892-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C1819738
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 04:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62041C24C89
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 03:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F606BE5B;
	Wed, 20 Dec 2023 03:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="Xa6KUwrT"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6098BF9
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 03:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id D417EA29D;
	Tue, 19 Dec 2023 19:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1703043531; bh=BWZfCq6ssUrNrzaQBXJB148FNo+Xz6aBeXcLwTvg/LE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xa6KUwrTAzsLvLvv9FLGwY3in86QypyrOZOH33Z9BCue8v3dJ7Rl1H6pXUB2U2YrF
	 njJGHxEVVqdfKEzRvCBJGIZJbye4f8IwW1x6l+KvuUIb0kD4fPNDC22hAZ9ABevv/Y
	 NvgMdFJpeN8t75PNkdKXDBP5MqEbNdjuIK2asZ7jJR21YDBiA4GcRP5UA0ywVJDvOt
	 mxa0wQ71uw20+rAjk2kp7bJ08wuM7McRw9gIfi/sKiX+CPkgA8grRJCMiNG4mYnEZ9
	 MD7YJRu7HDjHyXktQRPyhkdNupOjOOzjzjQ0ezgxZckW1GhdQ3Nye5L25Y2ENeWb3R
	 3A7pIbk24fxBg==
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 4/7] HID: hid-steam: Make client_opened a counter
Date: Tue, 19 Dec 2023 19:38:34 -0800
Message-ID: <20231220033837.2135194-4-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220033837.2135194-1-vi@endrift.com>
References: <20231220033609.2132033-1-vi@endrift.com>
 <20231220033837.2135194-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The client_opened variable was used to track if the hidraw was opened by any
clients to silence keyboard/mouse events while opened. However, there was no
counting of how many clients were opened, so opening two at the same time and
then closing one would fool the driver into thinking it had no remaining opened
clients.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 57cb58941c9f..667b5b09f931 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -125,7 +125,7 @@ struct steam_device {
 	spinlock_t lock;
 	struct hid_device *hdev, *client_hdev;
 	struct mutex report_mutex;
-	bool client_opened;
+	unsigned long client_opened;
 	struct input_dev __rcu *input;
 	unsigned long quirks;
 	struct work_struct work_connect;
@@ -648,7 +648,7 @@ static void steam_battery_unregister(struct steam_device *steam)
 static int steam_register(struct steam_device *steam)
 {
 	int ret;
-	bool client_opened;
+	unsigned long client_opened;
 	unsigned long flags;
 
 	/*
@@ -771,7 +771,7 @@ static int steam_client_ll_open(struct hid_device *hdev)
 	unsigned long flags;
 
 	spin_lock_irqsave(&steam->lock, flags);
-	steam->client_opened = true;
+	steam->client_opened++;
 	spin_unlock_irqrestore(&steam->lock, flags);
 
 	steam_input_unregister(steam);
@@ -787,7 +787,7 @@ static void steam_client_ll_close(struct hid_device *hdev)
 	bool connected;
 
 	spin_lock_irqsave(&steam->lock, flags);
-	steam->client_opened = false;
+	steam->client_opened--;
 	connected = steam->connected && !steam->client_opened;
 	spin_unlock_irqrestore(&steam->lock, flags);
 
@@ -959,7 +959,7 @@ static void steam_remove(struct hid_device *hdev)
 	cancel_work_sync(&steam->work_connect);
 	hid_destroy_device(steam->client_hdev);
 	steam->client_hdev = NULL;
-	steam->client_opened = false;
+	steam->client_opened = 0;
 	if (steam->quirks & STEAM_QUIRK_WIRELESS) {
 		hid_info(hdev, "Steam wireless receiver disconnected");
 	}
-- 
2.42.0


