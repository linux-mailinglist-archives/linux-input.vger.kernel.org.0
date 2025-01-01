Return-Path: <linux-input+bounces-8834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A67F09FF447
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2025 16:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C55DC1882347
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2025 15:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3551E1C3A;
	Wed,  1 Jan 2025 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="g2vpCcCz"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941711773A;
	Wed,  1 Jan 2025 15:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735744848; cv=none; b=X0VGLueSHz/ERWp688AaQVL7RiOoCY9w9R63K2U/A3MqESZJAunDejVx1t7SLlTU8BtY7aCpwM2xPnWk/t9NQbOx//ae+yiaBrYd7uOn36IpyDBnjRAS7Q725Ko90JVGm1d2KaHoveajqBKGJmYh3u2J2SvhTDGckXr/+yCWMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735744848; c=relaxed/simple;
	bh=Mo4dguvSlYbOPscrEKHFq1Jdv2N4VyiIK6l9zrGvRpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8mQPXZpEE/FQmiMoBXoySXfVQei5kwoo0Bt8SCPgRGhQnZMJcGKdHY0OAp1R9rgHFnhwXAJXEsb21WtrU0K49QizEwMbA6tL7eeJq2SapgPNV8Vl3f9rQltdOMyi1Fc882JtJHdbMA3bujajC7VE67XAcP52Q7xWM5KByt/jp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=g2vpCcCz; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4YNYJ64RtLz62sS;
	Wed,  1 Jan 2025 16:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1735744406; bh=Mo4dguvSlYbOPscrEKHFq1Jdv2N4VyiIK6l9zrGvRpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g2vpCcCzAMYznZt4uFo/694mkGUxik6rKUv78EekyVj41lqkuvHhXZxcqde1Iwq8n
	 coTgktM4itYDMe4omEf8r9tZlaKvi/xaU8fRzVkvQq4mw80CgiAJFxP6QDhPyOWhvp
	 i+ziTFHP+kp9UQjgqlT8zL+CKMcit7XoQ6ZeimZ2az34PMUZhlrmDPX38Y6RiXFB1Z
	 GvOrTVXrLgDxRyKuKleHEjVHVEX/DTqHoNCfLpWJIpFFHZOeBYZPAGwpjalHdpajFl
	 ZcaJqbUy4za71EbTgPKAOsHyRmOi9xT+cSxx/26V6weVCXv13ghzkTy66TxiSRQpo1
	 XfF150GjI/L2g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4YNYJ63htyz4xjH;
	Wed,  1 Jan 2025 16:13:26 +0100 (CET)
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4YNYJ6214sz8svJ;
	Wed,  1 Jan 2025 16:13:26 +0100 (CET)
Received: from localhost.localdomain (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id B2EC51C01F0;
	Wed,  1 Jan 2025 16:13:21 +0100 (CET)
Authentication-Results: mxe85d;
	spf=pass (sender IP is 188.193.235.100) smtp.mailfrom=git@mayer-bgk.de smtp.helo=localhost.localdomain
Received-SPF: pass (mxe85d: connection is authenticated)
From: Christian Mayer <git@mayer-bgk.de>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>,
	Christian Mayer <git@mayer-bgk.de>
Subject: [PATCH 3/3] HID: steelseries: export model and manufacturer
Date: Wed,  1 Jan 2025 15:11:34 +0000
Message-ID: <20250101151209.100072-4-git@mayer-bgk.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250101151209.100072-1-git@mayer-bgk.de>
References: <20250101151209.100072-1-git@mayer-bgk.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173574440207.16941.16026812623260743882@mxe85d.netcup.net>
X-Rspamd-Queue-Id: B2EC51C01F0
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: 83N3//kkwUUNDdEVVHNN9QnwvXdDtGGx0TcP4LDOieGY98ZYofw=

Export model and manufacturer with the power supply properties.
This helps identifing the device in the battery overview.
In the case of the Arctis 9 headset, the manufacturer is prefixed twice in
the device name.

Signed-off-by: Christian Mayer <git@mayer-bgk.de>
---
 drivers/hid/hid-steelseries.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index d11296bc0e1e..32e559376be4 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -447,6 +447,14 @@ static int steelseries_headset_battery_get_property(struct power_supply *psy,
 	int ret = 0;
 
 	switch (psp) {
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		val->strval = sd->hdev->name;
+		while (!strncmp(val->strval, "SteelSeries ", 12))
+			val->strval += 12;
+		break;
+	case POWER_SUPPLY_PROP_MANUFACTURER:
+		val->strval = "SteelSeries";
+		break;
 	case POWER_SUPPLY_PROP_PRESENT:
 		val->intval = 1;
 		break;
@@ -490,6 +498,8 @@ steelseries_headset_set_wireless_status(struct hid_device *hdev,
 }
 
 static enum power_supply_property steelseries_headset_battery_props[] = {
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_MANUFACTURER,
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_SCOPE,
-- 
2.47.1


