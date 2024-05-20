Return-Path: <linux-input+bounces-3742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5008C9788
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 02:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DD801C2060E
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 00:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0A6A48;
	Mon, 20 May 2024 00:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="OHk1t6TJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784B3632
	for <linux-input@vger.kernel.org>; Mon, 20 May 2024 00:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716163967; cv=none; b=W/Wxl/YdEdDHcEql0xOfgTwDLaCCenI6I5C/St9xphlWND5cmKnTIw09g3FZKVboF4pVNv+MlbRN1DTd7SSOAp9CNaDA3r7E5vbWTnlBDO0iw7Srq7fQPlrWWOsHeEWKWYSPibihCWhr0ausTH7oeqYhUSnCWgXXPmnG5U/UvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716163967; c=relaxed/simple;
	bh=ehDVXXonOZw/+mRnYyv6TOe0sNgcVhJSq+qcEaMBhlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHY3fEtWGK5wUmC54oSp8bGfqXg+qe1Y3twIx1Iuu/qFuLjVx1G0D88p9AOLv8WVRttVS+9Ee34KPiAl2EqBXi4zrveTZs65EkjBC3xbJgcxDfQHmCjkox1DwTnKsUleTeFRxtr4bidgBP16LjarXY018gviE37PEC7wvfaxxk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=OHk1t6TJ; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15BF5133CD6E;
	Mon, 20 May 2024 03:05:47 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1716163550; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ymoQsJRssD0jg95xQz3BbonjP4LcKKd35xFfSQ8OKno=;
	b=OHk1t6TJZunPyIcw8MbtEnrHmt53yTbYIQY6EVUlSHtqwkpU5QOmI4O7lmIYMkC9uQSjUY
	hZpSeILS+kdJa2T2U6QwnOj+FxlhcebMSSZ4G+R8DcBPlkbqBAAFv3yVjEc+ou8TisEwJ8
	jZ0Uo+xOgoEBNkjzzptxZ7X24aiFF8nvPrs102ZR7fPHw85c0KlY8Yv8TA4P+BM1TrXldC
	frt9XoJr6qXzmpg1SacNkZtkmoJ3b6lM7Y0lKU/iLZhCBm6TC+cyZQdPE8Cht2O3Nwdg35
	1ukzfKnH784JXy4eG9+02VgYupdtp0poT6IpEyT96+3n0B84GwPUZzlAQRmnPA==
From: ValdikSS <iam@valdikss.org.ru>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Rodrigo Aguilera <rodrigoaguileraparraga@gmail.com>
Subject: [PATCH] HID: lenovo: fix Fn-Lock on Lenovo TrackPoint Keyboard II in USB mode
Date: Mon, 20 May 2024 03:05:27 +0300
Message-ID: <20240520000527.203644-1-iam@valdikss.org.ru>
X-Mailer: git-send-email 2.45.1
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
index f86c1ea..a84fc55 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -758,6 +758,13 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
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
2.45.1


