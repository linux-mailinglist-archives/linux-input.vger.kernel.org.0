Return-Path: <linux-input+bounces-12430-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ACCABBAAD
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5B191891F0A
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 10:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA4D1373;
	Mon, 19 May 2025 10:09:45 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-01-1.mymagenta.at (mail-01-1.mymagenta.at [80.109.253.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE39D515
	for <linux-input@vger.kernel.org>; Mon, 19 May 2025 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.109.253.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649385; cv=none; b=BylxQKtK3zYf/PkTMwH3rNd2mJKT+8BkqMAkSv5qn+u1YqaKaUJI5nS6nCOBiMokZY37xwW4SPgQM2q4kQnoLe0ByfTFzVRCBmmPrv6hx4luSdfeX6TpokqULjsMyeugW1fyglGliBGBpAlBmrnbvGSNz2xLuBrZZPm7qphMTb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649385; c=relaxed/simple;
	bh=tT6agNi7xxg5K2wITU0NU7gd+7WeQNHkcL2VsgqlysI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OjlxZfROF0jRDS1y12K0f4qsT5s9WTNooXTFcvA0RbQf/tvUYb7ho6kFW05WTdYmWBJkAIktmRQNKjpLxKZT7+dtT0q5iWcK1AowcRD/YFzRP8m72SQKIV/RTZwHwVDFuviarTrOQFudTQiwiYfdvlWBmuZg9DbUwBQXu/nPgW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ze-it.at; spf=none smtp.mailfrom=ze-it.at; arc=none smtp.client-ip=80.109.253.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ze-it.at
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ze-it.at
Received: from [192.168.232.75] (helo=ren-mail-psmtp-mg11.mx.mymagenta.at)
	by mail-01.mymagenta.at with esmtp (Exim 4.98.1)
	(envelope-from <thomas.zeitlhofer+lkml@ze-it.at>)
	id 1uGwGm-0000000E2cj-2xt3
	for linux-input@vger.kernel.org;
	Mon, 19 May 2025 10:54:48 +0200
Received: from mr1 ([80.108.110.13])
	by ren-mail-psmtp-mg11.mx.mymagenta.at with ESMTPS
	id GwGmu6ErbjYL1GwGmuL30c; Mon, 19 May 2025 10:54:48 +0200
X-Env-Mailfrom: thomas.zeitlhofer+lkml@ze-it.at
X-Env-Rcptto: linux-input@vger.kernel.org
X-SourceIP: 80.108.110.13
X-CNFS-Analysis: v=2.4 cv=RIOzH5i+ c=1 sm=1 tr=0 ts=682af1d8
 a=M3c6w4RM9ieumcaO06RGLA==:117 a=M3c6w4RM9ieumcaO06RGLA==:17
 a=kj9zAlcOel0A:10 a=FwmdilmEVaCSPuVMSy4A:9 a=CjuIK1q_8ugA:10
Date: Mon, 19 May 2025 10:54:46 +0200
From: Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>
To: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Josh Dickens <joshua.dickens@wacom.com>,
	Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>,
	Aaron Skomra <aaron.skomra@wacom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: wacom: fix crash in wacom_aes_battery_handler()
Message-ID: <aCrx1iRQ-9tXiyJp@x1.ze-it.at>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4xfLWz0mEbM2txYtcRX/bze9DB3ero9MIH93S699XN6Dk5CFcQx6PhLlLgV+ZQcsq0K+hX0U/zEhV3L4F3wP3G9Jqj+gKPhHyy/A3sX6VNTmF3f8UCSo7o
 iALZ3GDNRPJJoCd7snwz+mwGXVjg00mb7FIEb8gL82fbZrj0REpjNzXKO6SfpDlUUOh5ApjahS95u0db5cKap+LByIQLUZ2U6+WFMGBN0uwkWJdixxkXxmny
 st8LIrX97+PdGQjjwqyC5JoB4hyDzCyToDgajcBkcxNiwXG2YoS7favwF6PnSfiFLMs3uGDGKF3Uoznz4jA3z3o7Yyqn0FNpHnwMuqZ9QOTKksO72mpV7pYs
 /0fl/WaUhCR0AyREKq1r6aIeUvB26gyRYJtIMIkBUWyxArsorTS6yC9kyx0wwYL/r9zy36k2/LYBltz0SszL4Ck9+d1vXTjxl6E92U30FdZHLWKOEeEmm0hK
 5/jV45L+9aYk2yL1

Commit fd2a9b29dc9c ("HID: wacom: Remove AES power_supply after extended
inactivity") introduced wacom_aes_battery_handler() which is scheduled
as a delayed work (aes_battery_work).

In wacom_remove(), aes_battery_work is not canceled. Consequently, if
the device is removed while aes_battery_work is still pending, then hard
crashes or "Oops: general protection fault..." are experienced when
wacom_aes_battery_handler() is finally called. E.g., this happens with
built-in USB devices after resume from hibernate when aes_battery_work
was still pending at the time of hibernation.

So, take care to cancel aes_battery_work in wacom_remove().

Fixes: fd2a9b29dc9c ("HID: wacom: Remove AES power_supply after extended inactivity")
Signed-off-by: Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>
---
 drivers/hid/wacom_sys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index eaf099b2efdb..e74c1a4c5b61 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2901,6 +2901,7 @@ static void wacom_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 
 	cancel_delayed_work_sync(&wacom->init_work);
+	cancel_delayed_work_sync(&wacom->aes_battery_work);
 	cancel_work_sync(&wacom->wireless_work);
 	cancel_work_sync(&wacom->battery_work);
 	cancel_work_sync(&wacom->remote_work);
-- 
2.39.5


