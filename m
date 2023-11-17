Return-Path: <linux-input+bounces-87-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5D7EEAA2
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 02:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0A4F1F25C60
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 01:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3193D1398;
	Fri, 17 Nov 2023 01:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="CmfGtmGu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jzb6JGxZ"
X-Original-To: linux-input@vger.kernel.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDA9182;
	Thu, 16 Nov 2023 17:16:24 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9EAC45C01D0;
	Thu, 16 Nov 2023 20:16:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 16 Nov 2023 20:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1700183783; x=
	1700270183; bh=eW7/wu+ICidmfZHSNxKv48b4TD+SrR9ios0hX/9qiic=; b=C
	mfGtmGuSaYypQGBqeXOqsgU84svGsmxsKEI6B1P7Up6LKAMVV4memvlhpkkpvSmu
	NbUpUijlEN5j+nHGZAc41KnIN2lFjlWVKkWxnfQG+LpVEhlyMHbv9/FJbxF9XvTm
	GK8PcciRWt5dSntKZw+Yn8GumCwPDGy3Tzwx3M6PFwbo+SzzsKox1mTATb0BVPmz
	y9yHl/CH8n6Vw1/IiILvCjT5D7Pg9R6t6n25ks6pa8lhTpGPdt+u0j2gAj+I9tKe
	sGnZ36pZN0Fxe7gfgC8vnjhCKtSAmzjwHJZ/106YHvNB9KVk78hbYw3VsqmdhcBi
	TPdREbF0UnXZc0T/+fAPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700183783; x=
	1700270183; bh=eW7/wu+ICidmfZHSNxKv48b4TD+SrR9ios0hX/9qiic=; b=j
	zb6JGxZ5/h3mYwvyarhtE20qVT9ZQZcRtxt/hLoF71iKmwdBcQDGwx7uza6O5KXN
	gyp9FKKDeyA8B4U04jhXWIcgy4M6PP5qTD+U4YMvy8vIhA3tBa/sS1DOYHIHqFzN
	QSh/bPDxrY7ztw6xouoFRm1z1pBLLHOsJCB3akgFd53xPYVx/U2f4F3qvh0rSfli
	rEIh/FkqbBMGe0NLClXiKLKGAQUm1EX4wnur8HVgwuv7zc+EGZhqD03OTQSrBcIO
	PYjwqjDtXen/ynFbWP03uBPKJ1cevJIRt2MWrndItRwMeuZeD7Ru/IRFxGxPOJjb
	KSWodEkqKycqzJCQUnbaw==
X-ME-Sender: <xms:575WZdqmRNoWh0wdaiEx75GCMCyj_7B51QYsgd73h0-TQbHDhXy2zw>
    <xme:575WZfoCEcLPijY4Y9_zZT56J9vXWcbixQBf77SxmVTTCaP6ltHIzvUP6Qv16cuJc
    aMYTkQFJ4J4cK-SxBg>
X-ME-Received: <xmr:575WZaM4w2tfNzCs_O9IADh1kf8PLApFT54gO9RLalFlkVsF3Hy-FiCGHl5M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudefledgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehl
    jhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfedugfetudeuheetjefhue
    fggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:575WZY77KBxh-bL85znFipiE-ggUKTJ2tDIDTvTm9YF0kJarn0AkQA>
    <xmx:575WZc5zoBYeJvYPSo1lIUmVXBPbdx227RtLugZedyX_ACQs4jPdBQ>
    <xmx:575WZQj_KrFlWDt48A8oN1-mT__TYIKuv7g6oiImr1BNemELhZUkxg>
    <xmx:575WZcHsLP6IeIta4DTX1y66Yx02mgxpKuYqDaML9NNskFO4QUZEfQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Nov 2023 20:16:20 -0500 (EST)
From: "Luke D. Jones" <luke@ljones.dev>
To: jikos@kernel.org
Cc: benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benato.denis96@gmail.com
Subject: [PATCH 2/2] hid-asus: reset the backlight brightness level on resume
Date: Fri, 17 Nov 2023 14:15:56 +1300
Message-ID: <20231117011556.13067-3-luke@ljones.dev>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231117011556.13067-1-luke@ljones.dev>
References: <20231117011556.13067-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Benato <benato.denis96@gmail.com>

Some devices managed by this driver automatically set brightness to 0
before entering a suspended state and reset it back to a default
brightness level after the resume:
this has the effect of having the kernel report wrong brightness
status after a sleep, and on some devices (like the Asus RC71L) that
brightness is the intensity of LEDs directly facing the user.

Fix the above issue by setting back brightness to the level it had
before entering a sleep state.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 drivers/hid/hid-asus.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index b70673a929a1..78cdfb8b9a7a 100644
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
2.42.1


