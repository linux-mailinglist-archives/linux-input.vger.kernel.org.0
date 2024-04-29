Return-Path: <linux-input+bounces-3303-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7698B666B
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2024 01:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EEB61F22474
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 23:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255F3194C92;
	Mon, 29 Apr 2024 23:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="amN4irZ5"
X-Original-To: linux-input@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543E0194C7C
	for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 23:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714433997; cv=none; b=btF/huvzVv4O0mrof/WCu+m9bHR2o4aKIlcjNGQlVZTZIojtTNS4XgJvnHPJ2D5iOzgnnVhsf19HM50t1MtsqnxoJbMM5rcS5yvBoZoTk13UTIuZHEWdU+0HfCaouw1zOdIHcpMqYbGWnA8oXZBCCxNn/PWHb7nODy0IB1n4j0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714433997; c=relaxed/simple;
	bh=BClq4mDPmyZgU0qr+f9VFy4skql2e7wKlGAmZ6Hi+vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJ33fczyH2V1LltbBCos95BqoDzVSZ363XnNecrhylwfbYcu+UVDZqXLyH9QWrbR3Wv2Rl4HUWnUcs24j9JCz3MRPbC01IoQrVRAo5wvngMG8juHKJdeicsdlFHaFQarAtkNh9M7Uo5lb0VUpdTSRDU5umzuFsigPEEQhqpSmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=amN4irZ5; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1714433993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EdRWlVXmvhwr8N4NqwgJPMuCGKujk/MjJK4ya7Ikf4o=;
	b=amN4irZ5KoJZ4oYNiAEWeoFyQIpPEI1EZZmc7YV3B/GlLFGaGJtA69PVBuK75gyXYfBxf1
	1Ji2OEfQ5ibuSgZD0EcFvdbgWtxB1hEHkhs96WTxljxfppvZoSVVcVZp6F3NaMYTKQ9CDD
	a0cKUbYUb3PNQ6NHoLdYB+XNqdCMGejiY6c1YVw/HgbKNDgKxH7y5xiv6iQTxzS2cDYlWi
	UJO0vy+tC3AbP5IGlG3ekTE+2xOX4J0HW9ou26M7w0NzmS+V9HZ1sXSBJfWuxZ4SrO0HW/
	6gip3x8ESAYpLsvTHm7fcopziXTjfbvcs+wxMffWP+wFUX3UnwpERX02nGbCdg==
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
Subject: [PATCH 1/2] HID: i2c-hid: Retry address probe after delay
Date: Tue, 30 Apr 2024 01:33:14 +0200
Message-ID: <20240429233924.6453-2-kl@kl.wtf>
In-Reply-To: <20240429233924.6453-1-kl@kl.wtf>
References: <20240429233924.6453-1-kl@kl.wtf>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Some STM microcontrollers need 400µs after rising clock edge in order to
come out of their deep sleep state. This in turn means that our address
probe will fail as the device is not ready to service it.

Retry the probe once after a delay to see if the device came alive,
otherwise treat the device as missing.

Link: https://lore.kernel.org/all/20240405102436.3479210-1-lma@chromium.org/#t
Co-developed-by: Radoslaw Biernacki <rad@chromium.org>
Co-developed-by: Lukasz Majczak <lma@chromium.org>
Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index d965382196c6..a40489bb7643 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -163,6 +163,24 @@ static u32 i2c_hid_lookup_quirk(const u16 idVendor, const u16 idProduct)
 	return quirks;
 }
 
+static int i2c_hid_probe_address(struct i2c_hid *ihid)
+{
+	int ret;
+
+	/*
+	 * Some STM-based devices need 400µs after a rising clock edge to wake
+	 * from deep sleep, in which case the first read will fail. Try after a
+	 * short sleep to see if the device came alive on the bus. Certain
+	 * Weida Tech devices also need this.
+	 */
+	ret = i2c_smbus_read_byte(ihid->client);
+	if (ret < 0) {
+		usleep_range(400, 500);
+		ret = i2c_smbus_read_byte(ihid->client);
+	}
+	return ret < 0 ? ret : 0;
+}
+
 static int i2c_hid_xfer(struct i2c_hid *ihid,
 			u8 *send_buf, int send_len, u8 *recv_buf, int recv_len)
 {
@@ -992,8 +1010,7 @@ static int __i2c_hid_core_probe(struct i2c_hid *ihid)
 	struct hid_device *hid = ihid->hid;
 	int ret;
 
-	/* Make sure there is something at this address */
-	ret = i2c_smbus_read_byte(client);
+	ret = i2c_hid_probe_address(ihid);
 	if (ret < 0) {
 		i2c_hid_dbg(ihid, "nothing at this address: %d\n", ret);
 		return -ENXIO;
-- 
2.44.0


