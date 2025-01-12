Return-Path: <linux-input+bounces-9155-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BB1A0A8D9
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 12:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E6E33A63D2
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 11:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C421ACEAC;
	Sun, 12 Jan 2025 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="Atqjg4Lj"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1431F1AA1C0;
	Sun, 12 Jan 2025 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736682953; cv=none; b=avf0oeVPo+ZwZeB+dLdvDQXSXj18+rbTHWMduCjxafqcPHMQWV46nHfu2be4oDoBEKqzNOPH9Kv7Aei4fALHINcRUjgqRsjM3N2yzWKpgmAwTSxwp55Isf5KG+6aMdyb83VSZVG9jc2nBimzVW1ITqpGsDOEatc7WaEkYO2dVUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736682953; c=relaxed/simple;
	bh=c2Qg2W4Am2s9tSAVlOTM0t3lcWgTk5K8kLoKH6k09mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5OYMA38NDgsEF4guQZ2OtcabZlPQZMTNh4HcP/XPry3Txp+W8dsvkVLfUG/fwaPJmHcQGORNI7Z/MAeTknnOQvqKCYf8pcZu/+2CidmTngfhj8vCFwxBh7sKgs2STR4t2z5gRvVs1n7i4tvt8Uy7GnShANgJYcOVz5II+isUUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=Atqjg4Lj; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4YWD9M4Npvz635j;
	Sun, 12 Jan 2025 12:45:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736682343; bh=c2Qg2W4Am2s9tSAVlOTM0t3lcWgTk5K8kLoKH6k09mE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Atqjg4LjmHRLYLzSWTwZhK/pCP6TnhMO9x1zIYfN+7WKS7WvYyQIfQqc2nTsdPQe6
	 ahwXQ0LtW+ED1ki32rbnrMWtWM8iO69dDNzml7ig8N0kQIyd62zn9w7mB71v66JIrm
	 lppkWhIc20Cqe6EhNQUbPAGaTBB1Rr8uVbZE5/LqkrgPF64WiPZRvo+Mb6UUxYpiEA
	 G+LDFbI3S+GfgEqH9EKBUff3mz+DL/QgEP3VoUwpX9s8U2K480q5h7LoFhk65r6MBu
	 VuPzaYF0lldRpklR27iEMWQ6v60aokavpdpgiQMjon2UyRYkoQJRafijrn1j+OvgtM
	 XQC2mSnCNXlvA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4YWD9M3gSFz4xpN;
	Sun, 12 Jan 2025 12:45:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4YWD9L749Sz8tXV;
	Sun, 12 Jan 2025 12:45:42 +0100 (CET)
Received: from localhost.localdomain (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id 65D521C0241;
	Sun, 12 Jan 2025 12:45:38 +0100 (CET)
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
Subject: [PATCH v2 1/5] HID: steelseries: preparation for adding SteelSeries
 Arctis 9 support
Date: Sun, 12 Jan 2025 11:44:02 +0000
Message-ID: <20250112114438.2196-2-git@mayer-bgk.de>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250112114438.2196-1-git@mayer-bgk.de>
References: <20250112114438.2196-1-git@mayer-bgk.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173668233876.12485.7873896203491597199@mxe85d.netcup.net>
X-Rspamd-Queue-Id: 65D521C0241
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: SmvnBteQws+En2bXzbvavnvXrkXHiCL+CnCnDsAI4rY5auiYX7c=

Refactor code and add calls to hid_hw_open/hid_hw_closed in preparation
for adding support for the SteelSeries Arctis 9 headset.

Signed-off-by: Christian Mayer <git@mayer-bgk.de>
---
 drivers/hid/hid-steelseries.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index f9ff5be94309..dc4ab55d7c22 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -377,20 +377,21 @@ static void steelseries_srws1_remove(struct hid_device *hdev)
 #define ARCTIS_1_BATTERY_RESPONSE_LEN		8
 static const char arctis_1_battery_request[] = { 0x06, 0x12 };
 
-static int steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
+static int steelseries_headset_request_battery(struct hid_device *hdev,
+	const char *request, size_t len)
 {
 	u8 *write_buf;
 	int ret;
 
 	/* Request battery information */
-	write_buf = kmemdup(arctis_1_battery_request, sizeof(arctis_1_battery_request), GFP_KERNEL);
+	write_buf = kmemdup(request, len, GFP_KERNEL);
 	if (!write_buf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
-				 write_buf, sizeof(arctis_1_battery_request),
+	hid_dbg(hdev, "Sending battery request report");
+	ret = hid_hw_raw_request(hdev, request[0], write_buf, len,
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret < (int)sizeof(arctis_1_battery_request)) {
+	if (ret < (int)len) {
 		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
 		ret = -ENODATA;
 	}
@@ -404,7 +405,8 @@ static void steelseries_headset_fetch_battery(struct hid_device *hdev)
 	int ret = 0;
 
 	if (sd->quirks & STEELSERIES_ARCTIS_1)
-		ret = steelseries_headset_arctis_1_fetch_battery(hdev);
+		ret = steelseries_headset_request_battery(hdev,
+			arctis_1_battery_request, sizeof(arctis_1_battery_request));
 
 	if (ret < 0)
 		hid_dbg(hdev,
@@ -554,6 +556,10 @@ static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id
 	if (ret)
 		return ret;
 
+	ret = hid_hw_open(hdev);
+	if (ret)
+		return ret;
+
 	if (steelseries_headset_battery_register(sd) < 0)
 		hid_err(sd->hdev,
 			"Failed to register battery for headset\n");
@@ -580,6 +586,7 @@ static void steelseries_remove(struct hid_device *hdev)
 
 	cancel_delayed_work_sync(&sd->battery_work);
 
+	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
 
-- 
2.47.1


