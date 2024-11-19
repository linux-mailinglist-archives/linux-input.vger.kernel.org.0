Return-Path: <linux-input+bounces-8156-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41E9D311C
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 00:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97462B214D5
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 23:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414121C4A3F;
	Tue, 19 Nov 2024 23:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="vpQWnLX4"
X-Original-To: linux-input@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30501C3319
	for <linux-input@vger.kernel.org>; Tue, 19 Nov 2024 23:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060621; cv=none; b=ERCuYUBzLLCMvWSJqnuJZFYBQf1p/bdGvcQQtVucJ2KC7UYW8cejoaug19LoudW+JRamuhu4zmKT3Rd4Kyc5HDDvsn9sbiQfWCvTVcNfwOxQD4iKFeC25wqNmJI2M8x27JVfkDfHe9+GLsp+grAgvxEL0AzYOVkaz8xvIPN33sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060621; c=relaxed/simple;
	bh=vBnKlFHjs5SU9Z+Y7uiqGo24Tn/zkjDCaqoyJ5QJaqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R8B1xT0ej4pja+8DvcCghBPqNRcmhBj95ynOzL1BsIq4YepZPW2KleNe+M1C6bBmrNFbhwq3SoK+drQMLn2rGNVIpz+H7FhZxNXTuNyasa8mq6WHH4Fu4gz8qprd/ZsDtPP3m9cQR07O2s7erYoTCTFR6bBg346PmkQSO6GLfx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=vpQWnLX4; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1732060615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ofl2P82c4J+ZyEBgKOq9cX1y8XBaMerDjpKr2ttubwY=;
	b=vpQWnLX4TIqBDweIKdQbakO7UnNPV8Cx5c9oF7nDWG4MAWx5Yub6SKsA188wLkciOMoKMD
	jgELavqJtJjst2xVxA7EJUVjFy5t0+5AIACxYLYyKoVGSgkGQvc4mtC21unGwjuWvm+cXl
	ZpZMpArzA8S06gCnNGsGsPl/bbgQG+t0m+CWnSRHKQfFpzT6KJKpqxM775dQZWfqtMGWPO
	FkFSijI9ZiZPmlXDzv9gwjNNWAkIDe2B/t3uCFcP4cB3m1yu5Gc9Zm15JyEfsjRAHStszg
	ssop4Dv1gNWgjdf1n7Ut8L/HtPk75nd5gYBxE9vaABNo+gLPjTpXogRMFNzeKg==
From: Kenny Levinsen <kl@kl.wtf>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael <auslands-kv@gmx.de>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Kenny Levinsen <kl@kl.wtf>,
	stable@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: Revert to using power commands to wake on resume
Date: Wed, 20 Nov 2024 00:53:17 +0100
Message-ID: <20241119235615.23902-1-kl@kl.wtf>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

7d6f065de37c ("HID: i2c-hid: Use address probe to wake on resume")
replaced the retry of power commands with the dummy read "bus probe" we
use on boot which accounts for a necessary delay before retry.

This made at least one Weida device (2575:0910 in an ASUS Vivobook S14)
very unhappy, as the bus probe despite being successful somehow lead to
the following power command failing so hard that the device never lets
go of the bus. This means that even retries of the power command would
fail on a timeout as the bus remains busy.

Remove the bus probe on resume and instead reintroduce retry of the
power command for wake-up purposes while respecting the newly
established wake-up retry timings.

Fixes: 7d6f065de37c ("HID: i2c-hid: Use address probe to wake on resume")
Cc: stable@vger.kernel.org
Reported-by: Michael <auslands-kv@gmx.de>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219440
Link: https://lore.kernel.org/r/d5acb485-7377-4139-826d-4df04d21b5ed@leemhuis.info/
Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---

As I don't have access to the hardware in question, a test by the
reporter (Michael) would be preferred to confirm the final patch.

 drivers/hid/i2c-hid/i2c-hid-core.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 43664a24176f..4e87380d3edd 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -414,7 +414,19 @@ static int i2c_hid_set_power(struct i2c_hid *ihid, int power_state)
 
 	i2c_hid_dbg(ihid, "%s\n", __func__);
 
+	/*
+	 * Some STM-based devices need 400µs after a rising clock edge to wake
+	 * from deep sleep, in which case the first request will fail due to
+	 * the address not being acknowledged. Try after a short sleep to see
+	 * if the device came alive on the bus. Certain Weida Tech devices also
+	 * need this.
+	 */
 	ret = i2c_hid_set_power_command(ihid, power_state);
+	if (ret && power_state == I2C_HID_PWR_ON) {
+		usleep_range(400, 500);
+		ret = i2c_hid_set_power_command(ihid, I2C_HID_PWR_ON);
+	}
+
 	if (ret)
 		dev_err(&ihid->client->dev,
 			"failed to change power setting.\n");
@@ -976,14 +988,6 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
 
 	enable_irq(client->irq);
 
-	/* Make sure the device is awake on the bus */
-	ret = i2c_hid_probe_address(ihid);
-	if (ret < 0) {
-		dev_err(&client->dev, "nothing at address after resume: %d\n",
-			ret);
-		return -ENXIO;
-	}
-
 	/* On Goodix 27c6:0d42 wait extra time before device wakeup.
 	 * It's not clear why but if we send wakeup too early, the device will
 	 * never trigger input interrupts.
-- 
2.47.0


