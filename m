Return-Path: <linux-input+bounces-4924-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4A92C02A
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 18:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A19928A9C4
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 16:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D84D19E7C6;
	Tue,  9 Jul 2024 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKf9rPmc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FB519DFA7;
	Tue,  9 Jul 2024 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542146; cv=none; b=Sm5tFUOqFFgvF0ZgQWvRmwKrF/Cg2D6wi/UVoEKtlVLxBZRqTVaOkC5b+iX4KhPhDxnUyHcKaJ2G1y5PnBvTo3Y1rE+GiUbsqtTks8xICeVUowO27UCp7brtuxBsb4OZi4O2gs6gawGeLcUP7XNN/xBF8JwQirgs2KfJNWOwk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542146; c=relaxed/simple;
	bh=RLPBOy9bO4BWCJVE0yOsG/T3YzQ5OxEOb79y7bhWjVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m87ELd5iP9a7sc4QtPnEJxAM02Q3Od/ZPSuu2FBYan0DrKjN/tS7zP0HZvWtQAxOPYmDFnu5cqKq9UoAVm8XC/korG6EaUComN0FOnBhfWeKUa+Pv8VUW4HzNvixCOz1fzEDcM9UZyUtmw5XQMlXTSvgK0llbxdWzeVkuIbRCEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKf9rPmc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CB8C3277B;
	Tue,  9 Jul 2024 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542146;
	bh=RLPBOy9bO4BWCJVE0yOsG/T3YzQ5OxEOb79y7bhWjVM=;
	h=From:To:Cc:Subject:Date:From;
	b=TKf9rPmcNTEPkTMLF06O5PP24oA1hJhbYznrE8NQSrZdguT4oR8j3h1w86y96Zf1e
	 5uWGds3mCqqDWznbUa5AgDjs7C5+Y8Q1jRrpQgj8d1MuxrwnalQBdmOV/Uc5nn5HdZ
	 BRR+/FFkRT0LFdG22sd+K0hr3K3uBFOQMRTUnO9G3r31f/j4KYyGuHdI8cNt6IxaLc
	 DMh3n4CdS9O7LB5+lQa+VSWI9H2lmE+OkRHbGQh4u8ATcVynlIC+UDXBHn+41dtOUT
	 /WewZlgcD83alaRLeQGSzn8s6ugvKJUnpE3mHmtNKtcCnGT/Lggge67wb41BlyU3BP
	 aoZtqJDvtE5VA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jonathan Denose <jdenose@google.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	jefferymiller@google.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 01/33] Input: elantech - fix touchpad state on resume for Lenovo N24
Date: Tue,  9 Jul 2024 12:21:27 -0400
Message-ID: <20240709162224.31148-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.38
Content-Transfer-Encoding: 8bit

From: Jonathan Denose <jdenose@google.com>

[ Upstream commit a69ce592cbe0417664bc5a075205aa75c2ec1273 ]

The Lenovo N24 on resume becomes stuck in a state where it
sends incorrect packets, causing elantech_packet_check_v4 to fail.
The only way for the device to resume sending the correct packets is for
it to be disabled and then re-enabled.

This change adds a dmi check to trigger this behavior on resume.

Signed-off-by: Jonathan Denose <jdenose@google.com>
Link: https://lore.kernel.org/r/20240503155020.v2.1.Ifa0e25ebf968d8f307f58d678036944141ab17e6@changeid
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/mouse/elantech.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 4e38229404b4b..b4723ea395eb9 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1476,16 +1476,47 @@ static void elantech_disconnect(struct psmouse *psmouse)
 	psmouse->private = NULL;
 }
 
+/*
+ * Some hw_version 4 models fail to properly activate absolute mode on
+ * resume without going through disable/enable cycle.
+ */
+static const struct dmi_system_id elantech_needs_reenable[] = {
+#if defined(CONFIG_DMI) && defined(CONFIG_X86)
+	{
+		/* Lenovo N24 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "81AF"),
+		},
+	},
+#endif
+	{ }
+};
+
 /*
  * Put the touchpad back into absolute mode when reconnecting
  */
 static int elantech_reconnect(struct psmouse *psmouse)
 {
+	int err;
+
 	psmouse_reset(psmouse);
 
 	if (elantech_detect(psmouse, 0))
 		return -1;
 
+	if (dmi_check_system(elantech_needs_reenable)) {
+		err = ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_DISABLE);
+		if (err)
+			psmouse_warn(psmouse, "failed to deactivate mouse on %s: %d\n",
+				     psmouse->ps2dev.serio->phys, err);
+
+		err = ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_ENABLE);
+		if (err)
+			psmouse_warn(psmouse, "failed to reactivate mouse on %s: %d\n",
+				     psmouse->ps2dev.serio->phys, err);
+	}
+
 	if (elantech_set_absolute_mode(psmouse)) {
 		psmouse_err(psmouse,
 			    "failed to put touchpad back into absolute mode.\n");
-- 
2.43.0


