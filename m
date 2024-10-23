Return-Path: <linux-input+bounces-7642-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB99AC8E5
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 13:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA01B28404C
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 11:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865F71AAE00;
	Wed, 23 Oct 2024 11:28:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9A01AA785;
	Wed, 23 Oct 2024 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729682913; cv=none; b=n+jo+8A1fQLgyLFs5cLOZ4O5dOjJ2EZfNZ9Yr4DnAUYV3rtcdGvvUnvU+ZhYBKRi/PwovxDeqROzBnp3GADwKHJpuQOnkcKXZpQKGbFdeexP9qu7y+CAaKkWBWU3IDjZEY2/Q+UUbCYXMqJaj/eAPTlLXY85rYygVPSM2I/Gx5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729682913; c=relaxed/simple;
	bh=YuALfZjDu5Eg0RrCHLqSkglk4U+sAtMqa52Q9dE/aII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rzz3TKiBcZWsoOAAc1aphLV4a6earmRqjfPKUj5fV776Fb1Ekl1yrtNdoYKc9AGoIsHoKCdYwPbMOqnPb+Olf42MN2YEIKTxCp/kFBfDEkfFwFAWIrG3dGVkDTBa1CT8USlzfjjBQMTtWfw6j3OrLkhsmOpw0Nn2pfXVnuf8iIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76277C0008;
	Wed, 23 Oct 2024 11:28:29 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 1/2] HID: steelseries: Fix battery requests stopping after some time
Date: Wed, 23 Oct 2024 13:24:37 +0200
Message-ID: <20241023112828.320157-2-hadess@hadess.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023112828.320157-1-hadess@hadess.net>
References: <20241023112828.320157-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

In some cases, the headset receiver will answer one of our requests with
garbage, or not at all. This is a problem when we only request battery
information once we've received a battery response, as we might never
get to request battery information again.

If the data from the receiver could not be parsed, and there's no
pending battery requests, schedule a new request.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-steelseries.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 7e83fee1ffa0..16138f7dae17 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -603,8 +603,11 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 		hid_dbg(sd->hdev,
 			"Parsing raw event for Arctis 1 headset (%*ph)\n", size, read_buf);
 		if (size < ARCTIS_1_BATTERY_RESPONSE_LEN ||
-		    memcmp (read_buf, arctis_1_battery_request, sizeof(arctis_1_battery_request)))
+		    memcmp(read_buf, arctis_1_battery_request, sizeof(arctis_1_battery_request))) {
+			if (!delayed_work_pending(&sd->battery_work))
+				goto request_battery;
 			return 0;
+		}
 		if (read_buf[2] == 0x01) {
 			connected = false;
 			capacity = 100;
@@ -631,6 +634,7 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 		power_supply_changed(sd->battery);
 	}
 
+request_battery:
 	spin_lock_irqsave(&sd->lock, flags);
 	if (!sd->removed)
 		schedule_delayed_work(&sd->battery_work,
-- 
2.47.0


