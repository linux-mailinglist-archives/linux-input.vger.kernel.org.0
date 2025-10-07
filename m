Return-Path: <linux-input+bounces-15278-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EB9BC1056
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 12:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E32293ADB6A
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 10:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258D51FAC4B;
	Tue,  7 Oct 2025 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RITgyV6F"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB33C17;
	Tue,  7 Oct 2025 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759833110; cv=none; b=LmtYFobEMf8KJACD4JtQAi+ccFLM0W1zcRUWJFtxBGOQSe/4HpU2HAagJ+4MNCHypRJ1HYp3TnTFbB4KBbOQQLqP+/6oYLEsATn5UviiZwXcRakqKDL+CWcECK3mE1VDB7ii5WKXVmN5oaqd+SXagy3KzlLgaRJF8BssDWQe7KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759833110; c=relaxed/simple;
	bh=kTsNWkhrY3zXeGA6RbFGAE2kGwCNe4vQnT6IaUFot5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cn8svg6gTWdgNAWBnueiAmgOdrSI3sw4cxckW/RKMPQpwjYZ/hqiZ7Adbe1nARkhpFjXhxYIMjQEmq0kz2go5jYQz+qa0jKxZZ1rlOCmCqj1GY07Agrfc+x4niLQqFYM8keptQDfcuN7E9oxwGLqdwRR6HCiETjV8ck6H2tQiz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RITgyV6F; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759833105;
	bh=kTsNWkhrY3zXeGA6RbFGAE2kGwCNe4vQnT6IaUFot5U=;
	h=From:To:Cc:Subject:Date:From;
	b=RITgyV6FWYDKbtg2VXbNZwpQGekbex2OP4MZ5vHnaTgEkL1bsPDTsE8RpSSIPzzNq
	 RHnTChzUx3ZBfvmjUWAAUM6aL6TeKX+QwwSfxOoCpmKJMs4l40MsoTJbQOFr1ryHRR
	 hMwzWfdH5kgkbtDzGV1sypG3YhuBwNLUGEj/Z16Y7An1Z95yTbWAAYflZU0RGLCYdv
	 l+kz8ceAMkSQi2F3ZyqUO5LWlLxsXr0ir5vZ6NWF0rGSkAh3R5/atO8BZlYtGWbzBh
	 UuEbBMCem/3/7Pg02NUbQySI2OUSajr4c5niY3jREUkCqVP09KTc7JmxTSXHaX2mSE
	 Se3HxV8L0wbPw==
Received: from pan.localdomain (unknown [IPv6:2a00:23c6:c338:be00:61ad:9488:9583:2010])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E38B917E12C6;
	Tue,  7 Oct 2025 12:31:44 +0200 (CEST)
From: Martyn Welch <martyn.welch@collabora.com>
To: Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel@collabora.com,
	Martyn Welch <martyn.welch@collabora.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] input: goodix: Remove setting of RST pin to input
Date: Tue,  7 Oct 2025 11:23:04 +0100
Message-ID: <20251007102305.445515-1-martyn.welch@collabora.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset line is being set to input on non-ACPI devices apparently to
save power. This isn't being done on ACPI devices as it's been found
that some ACPI devices don't have a pull-up resistor fitted. This can
also be the case for non-ACPI devices, resulting in:

[  941.672207] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
[  942.696168] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
[  945.832208] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110

This behaviour appears to have been initially introduced in ec6e1b4082d9.
This doesn't seem to be based on information in either the GT911 or GT9271
datasheets cited as sources of information for this change. Thus it seems
likely that it is based on functionality in the Android driver which it
also lists. This behaviour may be viable in very specific instances where
the hardware is known to have a pull-up fitted, but seems unwise in the
upstream kernel where such hardware requirements can't be guaranteed.

Remove this over optimisation to improve reliability on non-ACPI
devices.

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>

---
 drivers/input/touchscreen/goodix.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 252dcae039f8..e7ef744011ad 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -796,17 +796,6 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
 
 	usleep_range(6000, 10000);		/* T4: > 5ms */
 
-	/*
-	 * Put the reset pin back in to input / high-impedance mode to save
-	 * power. Only do this in the non ACPI case since some ACPI boards
-	 * don't have a pull-up, so there the reset pin must stay active-high.
-	 */
-	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
-		error = gpiod_direction_input(ts->gpiod_rst);
-		if (error)
-			goto error;
-	}
-
 	return 0;
 
 error:
-- 
2.39.5


