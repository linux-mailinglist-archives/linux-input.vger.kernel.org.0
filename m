Return-Path: <linux-input+bounces-1226-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C2582CBE6
	for <lists+linux-input@lfdr.de>; Sat, 13 Jan 2024 11:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD3328461D
	for <lists+linux-input@lfdr.de>; Sat, 13 Jan 2024 10:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD0020B31;
	Sat, 13 Jan 2024 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="errw/3pV"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E257FF
	for <linux-input@vger.kernel.org>; Sat, 13 Jan 2024 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4TBvxY1m85z9smX;
	Sat, 13 Jan 2024 11:37:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1705142273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+plblxpTapy0W7iNYUG8ra6k9Oo4vafWB94LMsj+YI8=;
	b=errw/3pVCKyHVD40+b2o/s8PNIVVhtJVP0M7+maIy2GDYvXE0UmZNAzdtAwyF6OK4u1jF2
	aEKD4BlcO38NWOVTyBpRhfiOqqjwRktOdFROyKySNkjpU6kJLZ1C6MVtPoo7xDA/cp+OtX
	CFDoOZ4+5Q9PFnrpTZ90JgqWmFu6W2SmgFbKoLia57J26BB5iqywJYLnc4C3OzVQQeodey
	BDtEUrEQSK2gWPgCT9ih8JCnO4vxrDty3W87uNvB+NJzERDqX9HamLJxT5Vaj6PBwBSwQp
	BLycuYKulRyCsj0HDORM8Ihh5YUrAKdYf2obmTrLybLilwLkQFPsSReKT/I2uw==
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jamie Lentin <jm@lentin.co.uk>,
	Bernhard Seibold <mail@bernhard-seibold.de>
Subject: [PATCH v2 1/2] Input: leds - set default-trigger for mute
Date: Sat, 13 Jan 2024 11:37:42 +0100
Message-ID: <20240113103743.97205-1-mail@bernhard-seibold.de>
In-Reply-To: <ZZbxHpibdyNY_zUt@google.com>
References: <ZZbxHpibdyNY_zUt@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the default-trigger for the mute led to audio-mute.

Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
---
 drivers/input/input-leds.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
index 0e935914bc3a..b16fc81940f5 100644
--- a/drivers/input/input-leds.c
+++ b/drivers/input/input-leds.c
@@ -18,6 +18,12 @@
 #define VT_TRIGGER(_name)	.trigger = NULL
 #endif
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
+#define AUDIO_TRIGGER(_name)	.trigger = _name
+#else
+#define AUDIO_TRIGGER(_name)	.trigger = NULL
+#endif
+
 static const struct {
 	const char *name;
 	const char *trigger;
@@ -29,7 +35,7 @@ static const struct {
 	[LED_KANA]	= { "kana", VT_TRIGGER("kbd-kanalock") },
 	[LED_SLEEP]	= { "sleep" } ,
 	[LED_SUSPEND]	= { "suspend" },
-	[LED_MUTE]	= { "mute" },
+	[LED_MUTE]	= { "mute", AUDIO_TRIGGER("audio-mute") },
 	[LED_MISC]	= { "misc" },
 	[LED_MAIL]	= { "mail" },
 	[LED_CHARGING]	= { "charging" },
-- 
2.43.0


