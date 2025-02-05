Return-Path: <linux-input+bounces-9788-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D088DA2833A
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 05:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47EDD3A6170
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 04:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF74A20C034;
	Wed,  5 Feb 2025 04:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="NYTDeIMP"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED8D20B1EC
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 04:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738728318; cv=none; b=jvA05UfHu9Wp2H/AKF3F80PTztG4P6FhlO+s2aRxbW8JXyz+VA2qrZXmAUcbaqo/RH5wZpCsD7jgbfXjJ2skzAdGTqeJyw1nEZTSvX2oCv/Dy6PGtd2mit8WhJ5abi29OyOOUhj2MkXYdI92satQSwgpamafqmewZMyCcu5awsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738728318; c=relaxed/simple;
	bh=PxxpiL/8c3vT0OkJq6Gr+zvkD+mKmTbxi3tOYNWzB/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rbxZfHxRZJP18Ta8FAxH1c0CKJOD1zIcQfIOLtLqnnsiKjjhuYnSUt1HPsshriucoNQWvbNIzlJDb0x4k68VeEdCSPt/TMZD0RDTIPjviOTj3I+Mql8ts7lrm4P3U6cEae/yI2xFbygpsWkZWVFzc1QRxkuAimtBfg6PI/gIg6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=NYTDeIMP; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1738727758; bh=PxxpiL/8c3vT0OkJq6Gr+zvkD+mKmTbxi3tOYNWzB/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=NYTDeIMPhoXVyrSgrko6OycTox6TzzCuHRP5atVwyafdStmu9nxog6RjZkiy46fPZ
	 HxuyoFwX/AkAfKta4TtSk7lu68JPASAySIK4muBdlK491SuZGeDZLuH33PF2hI94GJ
	 TrBG+o/mqTIOrx603uNIGyPwKmdLY041i1/S6yYd4wQPYy6CO4snXfLRNrzk2AZafU
	 NYtixlVdIm+ueQttOT1ggu1vTh8/bScbfrrrPQGoTmuZsZ4YYuwab4tit/bpHvNEWa
	 6mFxbA4v2+kS5GIv80G1P90WBiiWEDFSJKBgCwk/kGm/EKbYAUllngC5RBUJD0FGQX
	 Zo4DuUVJODalQ==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id DDBDF13208A;
	Tue,  4 Feb 2025 19:55:57 -0800 (PST)
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 1/3] hid-steam: Move hidraw input (un)registering to work
Date: Tue,  4 Feb 2025 19:55:27 -0800
Message-ID: <20250205035529.1022143-1-vi@endrift.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to an interplay between locking in the input and hid transport subsystems,
attempting to register or deregister the relevant input devices during the
hidraw open/close events can lead to a lock ordering issue. Though this
shouldn't cause a deadlock, this commit moves the input device manipulation to
deferred work to sidestep the issue.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index af38fc8eb34f..395dbe642f00 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -313,6 +313,7 @@ struct steam_device {
 	u16 rumble_left;
 	u16 rumble_right;
 	unsigned int sensor_timestamp_us;
+	struct work_struct unregister_work;
 };
 
 static int steam_recv_report(struct steam_device *steam,
@@ -1072,6 +1073,31 @@ static void steam_mode_switch_cb(struct work_struct *work)
 	}
 }
 
+static void steam_work_unregister_cb(struct work_struct *work)
+{
+	struct steam_device *steam = container_of(work, struct steam_device,
+							unregister_work);
+	unsigned long flags;
+	bool connected;
+	bool opened;
+
+	spin_lock_irqsave(&steam->lock, flags);
+	opened = steam->client_opened;
+	connected = steam->connected;
+	spin_unlock_irqrestore(&steam->lock, flags);
+
+	if (connected) {
+		if (opened) {
+			steam_sensors_unregister(steam);
+			steam_input_unregister(steam);
+		} else {
+			steam_set_lizard_mode(steam, lizard_mode);
+			steam_input_register(steam);
+			steam_sensors_register(steam);
+		}
+	}
+}
+
 static bool steam_is_valve_interface(struct hid_device *hdev)
 {
 	struct hid_report_enum *rep_enum;
@@ -1117,8 +1143,7 @@ static int steam_client_ll_open(struct hid_device *hdev)
 	steam->client_opened++;
 	spin_unlock_irqrestore(&steam->lock, flags);
 
-	steam_sensors_unregister(steam);
-	steam_input_unregister(steam);
+	schedule_work(&steam->unregister_work);
 
 	return 0;
 }
@@ -1135,11 +1160,7 @@ static void steam_client_ll_close(struct hid_device *hdev)
 	connected = steam->connected && !steam->client_opened;
 	spin_unlock_irqrestore(&steam->lock, flags);
 
-	if (connected) {
-		steam_set_lizard_mode(steam, lizard_mode);
-		steam_input_register(steam);
-		steam_sensors_register(steam);
-	}
+	schedule_work(&steam->unregister_work);
 }
 
 static int steam_client_ll_raw_request(struct hid_device *hdev,
@@ -1231,6 +1252,7 @@ static int steam_probe(struct hid_device *hdev,
 	INIT_LIST_HEAD(&steam->list);
 	INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
 	steam->sensor_timestamp_us = 0;
+	INIT_WORK(&steam->unregister_work, steam_work_unregister_cb);
 
 	/*
 	 * With the real steam controller interface, do not connect hidraw.
@@ -1291,6 +1313,7 @@ static int steam_probe(struct hid_device *hdev,
 	cancel_work_sync(&steam->work_connect);
 	cancel_delayed_work_sync(&steam->mode_switch);
 	cancel_work_sync(&steam->rumble_work);
+	cancel_work_sync(&steam->unregister_work);
 
 	return ret;
 }
@@ -1307,6 +1330,7 @@ static void steam_remove(struct hid_device *hdev)
 	cancel_delayed_work_sync(&steam->mode_switch);
 	cancel_work_sync(&steam->work_connect);
 	cancel_work_sync(&steam->rumble_work);
+	cancel_work_sync(&steam->unregister_work);
 	hid_destroy_device(steam->client_hdev);
 	steam->client_hdev = NULL;
 	steam->client_opened = 0;
-- 
2.48.1


