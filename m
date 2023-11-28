Return-Path: <linux-input+bounces-295-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555FF7FC6F1
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 22:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84EDE1C211D5
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 21:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B571744379;
	Tue, 28 Nov 2023 21:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6IKjl0i"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9620E44367;
	Tue, 28 Nov 2023 21:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAFFC433CD;
	Tue, 28 Nov 2023 21:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205643;
	bh=QGEMT4Np6QAoVbyDlFJ2089dMrTwLoIgSINXrtMB23M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z6IKjl0iBihsNnk34lpdMTMOBuhDJKbPNyR6UE71P2mpOfDJK8mt5zH4IBs2uQV/F
	 4hiRly04A0tOxtWO6ao7Z8x3xPIbCoPqGJehR2zW+8epdzN/m43sNAf72IrWUQcigr
	 YBw4ozfcMMiGSuPpTpP//pJ/4pqbH0+hmkBdetYgWuHJ2zPhs/MNYLJUAvJG8HdZYt
	 PvjhouKQNbrwHpajH9JDoNKJM8WbkmI+oxebd1hXz7mowcvfw/Cho88AXXf9CPL8do
	 q1fBUgGRs9RwfzAkKfanKz/Kr4yw1eUjLPTRsjyTiLUWjce3ebzFlsmXfRXJscnI8R
	 vxt70LpqQWNHw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Denis Benato <benato.denis96@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Jiri Kosina <jkosina@suse.cz>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 30/40] HID: hid-asus: reset the backlight brightness level on resume
Date: Tue, 28 Nov 2023 16:05:36 -0500
Message-ID: <20231128210615.875085-30-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210615.875085-1-sashal@kernel.org>
References: <20231128210615.875085-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.3
Content-Transfer-Encoding: 8bit

From: Denis Benato <benato.denis96@gmail.com>

[ Upstream commit 546edbd26cff7ae990e480a59150e801a06f77b1 ]

Some devices managed by this driver automatically set brightness to 0
before entering a suspended state and reset it back to a default
brightness level after the resume:
this has the effect of having the kernel report wrong brightness
status after a sleep, and on some devices (like the Asus RC71L) that
brightness is the intensity of LEDs directly facing the user.

Fix the above issue by setting back brightness to the level it had
before entering a sleep state.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-asus.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index fd61dba882338..194a86cf30db4 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1000,6 +1000,24 @@ static int asus_start_multitouch(struct hid_device *hdev)
 	return 0;
 }
 
+static int __maybe_unused asus_resume(struct hid_device *hdev) {
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
+	int ret = 0;
+
+	if (drvdata->kbd_backlight) {
+		const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
+				drvdata->kbd_backlight->cdev.brightness };
+		ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
+		if (ret < 0) {
+			hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
+			goto asus_resume_err;
+		}
+	}
+
+asus_resume_err:
+	return ret;
+}
+
 static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
@@ -1294,6 +1312,7 @@ static struct hid_driver asus_driver = {
 	.input_configured       = asus_input_configured,
 #ifdef CONFIG_PM
 	.reset_resume           = asus_reset_resume,
+	.resume					= asus_resume,
 #endif
 	.event			= asus_event,
 	.raw_event		= asus_raw_event
-- 
2.42.0


