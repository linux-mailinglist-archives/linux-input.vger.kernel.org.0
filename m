Return-Path: <linux-input+bounces-3188-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBF8AE601
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 14:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25251B22214
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 12:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B3712C524;
	Tue, 23 Apr 2024 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="pB68De/h"
X-Original-To: linux-input@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E54985274
	for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 12:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713875172; cv=none; b=ifbuOSGOcEpA89r6bHCRcePpDbDjIBKwkuDtN/JWFJJhkO94qpytzld1bPIYEUw2ANe1pd7r+RcVJjCiqDNo+h5MGH554wF11XxDmI3OnvLUCF9+PyFGol0NepFlKffwJwEN8fAimwARfXSSIPXKK0fhwVe5afYHxKPgYHdVh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713875172; c=relaxed/simple;
	bh=dqEhvtsQA/KnqwaWloiCB5LQGWxBUcBJsyA+qcy7+RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YprnzwYTcpbykRG4N/7/BnIEr6pArieMh99yLqzFZOig9bvCWiRzCjU+QepD+vnc+vJbtLGl+xwanVpSsQfkzOHkxI5pvk7ascYVlbfgn9pKbjJgKrXegFMNo/chcP0A4SdzuvvNqNlo/32XoAWJTV9yOZe037GD8L/jSZqzINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=pB68De/h; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1713875167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYMVR/H/8GVmViImqt+rKjHX+PeAvfbdfXWhlI89GyM=;
	b=pB68De/hJ8iiLC1/E0Uq7rEtsYEuIKtvB9J2TzUbzCeorsSo7n5wmAG7HzHjfBT4xCk95C
	2aJv32U/52tynBxdhVwddI5alPtJmh7J3leiDsRX0t7bRgV3R80JFmUyRIaWzkU7vGqNNi
	b3w8KIn0yKyCl+1YCItZVGREIjWJer96lfulP4xHCsBd89r45LdXtzdGgxCJF+vD4NCpJr
	iXhL+9F8uCpOzCMeIfF7Rr782gu4WTv1G3So6Cjc9VXpmHhHvnUzMCSI7qvjIvC5Rnm7tu
	fF7bdKQhq64nU2aVVKiHlrVA7dJeICiFTCYOnkQu+PVF7oWpCIRgV5bGnxst4Q==
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
Subject: [PATCH v2 3/3] HID: i2c-hid: Align i2c_hid_set_power() retry with HID descriptor read
Date: Tue, 23 Apr 2024 14:07:55 +0200
Message-ID: <20240423122518.34811-4-kl@kl.wtf>
In-Reply-To: <20240423122518.34811-1-kl@kl.wtf>
References: <20240423122518.34811-1-kl@kl.wtf>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The retry for HID descriptor and for power commands deals with the same
device quirk, so align the two.

Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 252ccb3b71d1..749c0c036adb 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -391,25 +391,21 @@ static int i2c_hid_set_power(struct i2c_hid *ihid, int power_state)
 	i2c_hid_dbg(ihid, "%s\n", __func__);
 
 	/*
-	 * Some devices require to send a command to wakeup before power on.
-	 * The call will get a return value (EREMOTEIO) but device will be
-	 * triggered and activated. After that, it goes like a normal device.
+	 * Some STM-based devices need 400µs after a rising clock edge to wake
+	 * from deep sleep, which in turn means that our first command will
+	 * fail EREMOTEIO. Certain Weida Tech devices also need this wake-up.
+	 * Retry the command in this case.
 	 */
-	if (power_state == I2C_HID_PWR_ON) {
+	ret = i2c_hid_set_power_command(ihid, power_state);
+	if (ret == -EREMOTEIO && power_state == I2C_HID_PWR_ON) {
+		usleep_range(400, 500);
 		ret = i2c_hid_set_power_command(ihid, I2C_HID_PWR_ON);
-
-		/* Device was already activated */
-		if (!ret)
-			goto set_pwr_exit;
 	}
 
-	ret = i2c_hid_set_power_command(ihid, power_state);
 	if (ret)
 		dev_err(&ihid->client->dev,
 			"failed to change power setting.\n");
 
-set_pwr_exit:
-
 	/*
 	 * The HID over I2C specification states that if a DEVICE needs time
 	 * after the PWR_ON request, it should utilise CLOCK stretching.
-- 
2.44.0


