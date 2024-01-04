Return-Path: <linux-input+bounces-1102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9592F82455D
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 16:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DF842824EC
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 15:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEAA249F9;
	Thu,  4 Jan 2024 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="M7vbTFJR"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E6249EA
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4T5WHY6LNwz9svV;
	Thu,  4 Jan 2024 16:49:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1704383385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ocmnRcbuvFQVKD+brebemDUKQhBnerstCOqxF24EiE=;
	b=M7vbTFJRsdfvFdxKLGvVZasCaIxh10fsoTOhxghiQFtcn+2gQMx/gK6nRwBsyaGqXxiJ+d
	JLLg58ypg36ojzRTuRaZwiyNgRLMW+z3TVKL4zi1785Omw2qVUtUyFrYuwhtLqEScmvCJ7
	qtOSXhZ5pC6PI7zGOVmvZ7szYA5ha6tU5KU5B8oXHypajRbIyWwCl+d7J6Iba6QEeF3Bjs
	LFpix2BAnSstk1/QmVBGXVbSp4cAlIJVMaFdo08tDLb1OYPnrw6nMyrf+i8vkNgjXG+yNH
	6DCu2yCFysjd7itQYenLRkPXL9eyuorlbf+kIH87ZBFv2baKx4oCXQ279eta/w==
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jamie Lentin <jm@lentin.co.uk>,
	Bernhard Seibold <mail@bernhard-seibold.de>
Subject: [PATCH 1/3] HID: input - Add microphone mute LED support
Date: Thu,  4 Jan 2024 16:49:39 +0100
Message-ID: <20240104154941.6919-1-mail@bernhard-seibold.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define an input event code for micmute led and enable sending it via HID

Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
---
 drivers/hid/hid-input.c                | 1 +
 include/uapi/linux/input-event-codes.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index c8b20d44b147..96c595bb14ce 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -928,6 +928,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		case 0x03:  map_led (LED_SCROLLL);  break;    /*   "Scroll Lock"              */
 		case 0x04:  map_led (LED_COMPOSE);  break;    /*   "Compose"                  */
 		case 0x05:  map_led (LED_KANA);     break;    /*   "Kana"                     */
+		case 0x21:  map_led (LED_MICMUTE);  break;    /*   "Microphone"               */
 		case 0x27:  map_led (LED_SLEEP);    break;    /*   "Stand-By"                 */
 		case 0x4c:  map_led (LED_SUSPEND);  break;    /*   "System Suspend"           */
 		case 0x09:  map_led (LED_MUTE);     break;    /*   "Mute"                     */
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 022a520e31fc..f9a4f9040c59 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -952,6 +952,7 @@
 #define LED_MISC		0x08
 #define LED_MAIL		0x09
 #define LED_CHARGING		0x0a
+#define LED_MICMUTE		0x0b
 #define LED_MAX			0x0f
 #define LED_CNT			(LED_MAX+1)
 
-- 
2.43.0


