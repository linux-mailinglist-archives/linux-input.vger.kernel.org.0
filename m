Return-Path: <linux-input+bounces-1103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344482455F
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 16:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE730B24B2C
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 15:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960F3249F2;
	Thu,  4 Jan 2024 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="QmPL964c"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C63249F5
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4T5WHb117bz9ssn;
	Thu,  4 Jan 2024 16:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1704383387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OHPVlduRZzGfAUVMYF/x2qKCVMjH8lFztVJTg382NcI=;
	b=QmPL964cn4auvpOHzfy4y3o/HxUasYTeVzSCVDfo7e7rxW2g7xKeskgmdm0r/WoUvXEiuh
	/7eweqB/dviLkxCHOv6DIg2s8PpxOl9IZHpPk+5BV85JLVu1T2UjURDFxQuno1bgO9qtwB
	trYZZeUW46Ea+5NxTU1ZzZlKp6iQDdgnNHQnQHELcR71YaVYaU/qpCu3bJgAbkUu+moPiq
	OSg5OIA5HEnvr3Of1pZ0D7GsdPXnfhfeRO5cCcWIxoeVJa2jw6isl/qc3iO8IYsixpC5xz
	WQrhmjHWRofspN1ertbBUz5hv9vJ7IV3qrXBuGMj/9PB14fB5hFmPGqT/nMi6w==
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jamie Lentin <jm@lentin.co.uk>,
	Bernhard Seibold <mail@bernhard-seibold.de>
Subject: [PATCH 2/3] Input: leds - add micmute and triggers
Date: Thu,  4 Jan 2024 16:49:40 +0100
Message-ID: <20240104154941.6919-2-mail@bernhard-seibold.de>
In-Reply-To: <20240104154941.6919-1-mail@bernhard-seibold.de>
References: <20240104154941.6919-1-mail@bernhard-seibold.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4T5WHb117bz9ssn

Add microphone mute and add default triggers for mute and micmute

Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
---
 drivers/input/input-leds.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
index 0e935914bc3a..327a7aea4f26 100644
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
@@ -29,7 +35,8 @@ static const struct {
 	[LED_KANA]	= { "kana", VT_TRIGGER("kbd-kanalock") },
 	[LED_SLEEP]	= { "sleep" } ,
 	[LED_SUSPEND]	= { "suspend" },
-	[LED_MUTE]	= { "mute" },
+	[LED_MUTE]	= { "mute", AUDIO_TRIGGER("audio-mute") },
+	[LED_MICMUTE]	= { "micmute", AUDIO_TRIGGER("audio-micmute") },
 	[LED_MISC]	= { "misc" },
 	[LED_MAIL]	= { "mail" },
 	[LED_CHARGING]	= { "charging" },
-- 
2.43.0


