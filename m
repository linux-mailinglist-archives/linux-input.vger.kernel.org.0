Return-Path: <linux-input+bounces-4930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C401F92C0E1
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 18:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C4D0284193
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 16:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEAE18B039;
	Tue,  9 Jul 2024 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAdFi3Lx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FF418B031;
	Tue,  9 Jul 2024 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542320; cv=none; b=QTN0HcYwPM2q6dIs5rkgAlVMa1gI2rlZkOhoUHiOUAjvY9VASjPFKdIn1h5S+1SXmwO83ayJNiBodL1KN/EFOjE+4q+8c6/HkOsaiVMUPipxvpC+uLe7TxnCwvqr42R7jTmkna/0ZH35HCua81hwNDMDyxfKYEOmn5g+YcXaJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542320; c=relaxed/simple;
	bh=RLPBOy9bO4BWCJVE0yOsG/T3YzQ5OxEOb79y7bhWjVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/wPBPeX3PbUEWy6ZP5ISqiOwNgmTz2EE+0Fe/RHiTTT54N7KAU/mPbHAS0E4XkGFFihgIn+Wf/PMmYrKYYK8U59Ux4RSEodQtgEF+h2BbFrY00v6qLM5AcLfEHRBDuLXTdjjZxhjH7XxaFh/KQ8VgrMdkcUnkoFTJRpndC3GLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAdFi3Lx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26972C3277B;
	Tue,  9 Jul 2024 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542320;
	bh=RLPBOy9bO4BWCJVE0yOsG/T3YzQ5OxEOb79y7bhWjVM=;
	h=From:To:Cc:Subject:Date:From;
	b=WAdFi3LxCD5sGdV7e3nWJrLPrwtiNO/2EgyeLLpf5vjWTvyn3xbolpbFQJjm65UOl
	 pq3amL/cD9ayOsuPOjYhxE/TZeU3BcGFvG0MVhATYgWxRZ5/tntrKIIFpalgAAyqFw
	 6C81lR3jMMt7pFzFUaoixaKorH9vtDLe9iqYxLoyZh4zxXhIwLXSXloIU/+Jmtkqrw
	 4zGODqb07LFPCmn9PhJe/UKZfPfm7t/IIomlC6WAPQfNeNJk2BNMwA1xEl0JRrUf/4
	 piilBILFzUnecu70wU/iaNb3SQRMF/+QtvX4+ZzzfaoH0SXEK6rNIUX5q/jI212bGw
	 WIqqhWOkuZ6aQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jonathan Denose <jdenose@google.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	jefferymiller@google.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 01/17] Input: elantech - fix touchpad state on resume for Lenovo N24
Date: Tue,  9 Jul 2024 12:24:45 -0400
Message-ID: <20240709162517.32584-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.162
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


