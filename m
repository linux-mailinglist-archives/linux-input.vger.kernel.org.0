Return-Path: <linux-input+bounces-3304-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF808B666D
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2024 01:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F6DD1F23293
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 23:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE613194C6F;
	Mon, 29 Apr 2024 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="SaNJQ6sI"
X-Original-To: linux-input@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01425194C6E
	for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 23:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714434007; cv=none; b=o45paOo+zERb/XWaXVaCLK6K+3P53h17ZHR9ErryqDyp2a6jV0dS4zhu2m+UVFIN9fOFapbKaRItJIxfJt2mR1pr7LVtKfMM2R517AeGzvG8RH7R/X1WUM/vUHmzcWBAWVmEJ3TL1+nVbGhY2eM00ODpiHrbhF70me5OWtVbOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714434007; c=relaxed/simple;
	bh=rxAEVq+yifZnHDpSwnTFmxkZ/Y0BmsczwpqA4u2RUTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PD9MTDwqOGCnsh06ubapoDwayd43SnnZ83WWTg/aLesA2ehUPk9h9+SgUKCpKaYLl/LfiK2+Lse0+alkIhTphtXUivNjxjMxC41aeCTvzRN077X49iLxuxhX5e4B5tYRs1ERdX8Lt37kfQsGipU9N4UhhQ0TGJ4gQOXbYzW8Qcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=SaNJQ6sI; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1714434004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y0LgG9Ur/gE5LwaFx84ee4SVeTx5Bvd1sdclfM8Q3a4=;
	b=SaNJQ6sI0gOg/Yf8qvx/TsNAUA3kHWmRGUo1ZM8nt3t0OW8V4dz+wYI/XnJQThFXdaZVUv
	H6jhdu3OogLQMponF+tTPT15z3/KSEHoBQ0M9s1y8AnleyFhGo7ijA7SuelualTjPYNrd0
	h/qQbebw+zJMkN/nvO77YAINjsVnVLLiAXtIlzN0PNdFuc1Y7F5hccYPdFI9ov0sMTT3bF
	4exSD40FiaF4X6wCX5yjzIBfQGsVM/m4mlcFSQbJVhWHBFzR+MN9XlfPTKToaEshvT8FE+
	k0YuGjFWT2nMMhIaS7JxNzdKed2WcNAMNYZh845gqUGXYUvEgjgx3oBqURQYbg==
From: Kenny Levinsen <kl@kl.wtf>
To: Jiri Kosina <jikos@kernel.org>,
	Dmitry Torokhov <dtor@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radoslaw Biernacki <rad@chromium.org>,
	Lukasz Majczak <lma@chromium.org>
Cc: Kenny Levinsen <kl@kl.wtf>
Subject: [PATCH 2/2] HID: i2c-hid: Use address probe to wake on resume
Date: Tue, 30 Apr 2024 01:33:15 +0200
Message-ID: <20240429233924.6453-3-kl@kl.wtf>
In-Reply-To: <20240429233924.6453-1-kl@kl.wtf>
References: <20240429233924.6453-1-kl@kl.wtf>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Certain devices, both from STM and Weida Tech, need to be woken up after
having entered a deeper sleep state. The relevant places to wake up such
device is during our initial HID probe, and after resuming.

A retry for power commands was previously added to i2c_hid_set_power to
wake up Weida Tech devices, but lacked sufficient sleep for STM devices.
Replace the power command retry with the same address probe we using
during our initial HID probe.

Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index a40489bb7643..3e3885ae6ce2 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -402,19 +402,6 @@ static int i2c_hid_set_power(struct i2c_hid *ihid, int power_state)
 
 	i2c_hid_dbg(ihid, "%s\n", __func__);
 
-	/*
-	 * Some devices require to send a command to wakeup before power on.
-	 * The call will get a return value (EREMOTEIO) but device will be
-	 * triggered and activated. After that, it goes like a normal device.
-	 */
-	if (power_state == I2C_HID_PWR_ON) {
-		ret = i2c_hid_set_power_command(ihid, I2C_HID_PWR_ON);
-
-		/* Device was already activated */
-		if (!ret)
-			goto set_pwr_exit;
-	}
-
 	ret = i2c_hid_set_power_command(ihid, power_state);
 	if (ret)
 		dev_err(&ihid->client->dev,
@@ -977,6 +964,14 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
 
 	enable_irq(client->irq);
 
+	/* Make sure the device is awake on the bus */
+	ret = i2c_hid_probe_address(ihid);
+	if (ret < 0) {
+		dev_err(&client->dev, "nothing at address after resume: %d\n",
+			ret);
+		return -ENXIO;
+	}
+
 	/* Instead of resetting device, simply powers the device on. This
 	 * solves "incomplete reports" on Raydium devices 2386:3118 and
 	 * 2386:4B33 and fixes various SIS touchscreens no longer sending
-- 
2.44.0


