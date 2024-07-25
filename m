Return-Path: <linux-input+bounces-5146-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1409593B9F2
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 02:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A9C21C2173D
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 00:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8B7181;
	Thu, 25 Jul 2024 00:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="kGJcWtPc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188544690
	for <linux-input@vger.kernel.org>; Thu, 25 Jul 2024 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721868601; cv=none; b=ZA7hTTdIoUZ9TkBvaOynKwR7wZq37Sg/mZjwqEObV1Ke2J7AfM+CPU15OiV7F+Jx/N3vMM1dCDL4rCQoHyzT+xshWs3x4mrep6az10eZ/FNJzAZkieyl5Jnj54H9zZCT0e5tkEMsbBzzb5tMGzdy+Cfzd9zjNJEs5fuJXuekGz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721868601; c=relaxed/simple;
	bh=Liw2mfkz+66XFldKXxhBkp7Op7WL6zjALQ1yObA1WkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQCwJJ8CxVbl7gA7IegYlQr1/BTcOaNA2ARH2yZpZZWNG8hGjwXcSt5L+ARcGuq1WfcSe9ccPgbpkCg7P5Wts7ETR9rHN9zUvwJ4n3W6otvoBSCWvxGKM38k/T1oDFYAwe9lHdyWwtqrAWdLdRDegB8UIwAwtvbGu7w9ncin750=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=kGJcWtPc; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49DE614597AD;
	Thu, 25 Jul 2024 03:49:47 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1721868590; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=lxnt5s7WEuNwWqj56J65qR6nzb/GOPTX+fiBoBTcCpk=;
	b=kGJcWtPcBKdfzegMFd2cL9FHNsTxx1fcS1Sq/8L/vsr/3yR0AHrUe9A2y2cEyH71a5mXQO
	FTlrombp24IB2VbTxCXBdE8upWRgFtHp4kT0n0tHaft4ITnqMbXwNOqYnyjAg2DfhUHezm
	GtGdNC4Q+nee0idJ35LXweZaasvLXyRnVjFT3olpetq3HzR/xyN2KGAtulDra4k6DBoMkC
	WNqvP5bVREOliwpoTNbuQSI57QKPm0f2YTBi4gcPvNoTBj1Y5kwK4kIvwkIiobOBFM79qi
	qNXFZfU0A5FJ4X/7qo+liXpxvrHuNKxqPe700D06ZHZq5F1fxfyZeH1srm6YBw==
From: ValdikSS <iam@valdikss.org.ru>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Rodrigo Aguilera <rodrigoaguileraparraga@gmail.com>
Subject: [PATCH RESEND] HID: lenovo: fix Fn-Lock on Lenovo TrackPoint Keyboard II in USB mode
Date: Thu, 25 Jul 2024 03:49:17 +0300
Message-ID: <20240725004934.301342-1-iam@valdikss.org.ru>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

When Fn-Lock is pressed on Lenovo TrackPoint Keyboard II in USB mode,
the keyboard only sends the scancode to the host and does not toggle
the mode by itself, contrary to Bluetooth mode.

This results in non-working Fn-Lock switching.

Fix this issue by sending switching command upon receiving Fn-Lock
scancode.

Signed-off-by: ValdikSS <iam@valdikss.org.ru>
Reported-by: Rodrigo Aguilera <rodrigoaguileraparraga@gmail.com>
Tested-by: Rodrigo Aguilera <rodrigoaguileraparraga@gmail.com>
Cc: stable@vger.kernel.org # 6.x
---
 drivers/hid/hid-lenovo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index e5e72aa52..6b315310a 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -757,6 +757,13 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
 		 * ensure things are in sync (the syncing should be a no-op).
 		 */
 		cptkbd_data->fn_lock = !cptkbd_data->fn_lock;
+		if (hdev->product == USB_DEVICE_ID_LENOVO_TPIIUSBKBD) {
+			/*
+			 * ThinkPad TrackPoint keyboard II in USB mode needs
+			 * host to toggle Fn-lock
+			 */
+			lenovo_send_cmd_cptkbd(hdev, 0x05, cptkbd_data->fn_lock);
+		}
 	}
 
 	return 0;
-- 
2.45.2


