Return-Path: <linux-input+bounces-7374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E1199AD42
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 22:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 321251F288B0
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 20:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFD21D1744;
	Fri, 11 Oct 2024 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijgsEahc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7C1D172F
	for <linux-input@vger.kernel.org>; Fri, 11 Oct 2024 19:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676698; cv=none; b=eplCFlZ46gshVXTNKztwW67TegRuTXPYelVORJjLMj2hKzeINyu038jpdJnweoKYTcHGy5HOg16C2CTrj6/CRUO31BjjyKdsIezjfmuaHKlR/Jkf+XDJYEybHHJoC897WxJKsC2EqGoHXaO7xg60XLgjTghqSrM6YIgFg2VIsC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676698; c=relaxed/simple;
	bh=6EgnRIfd56IMIfKQGmTJds9nVCkg0lPxZZ2bIzpGnsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=joF6TVd2F0KcVJUHmolf8W24Pbs9cAXZ9Qsjlvsgz9rln+LyhY2eYF67WZ9WV6nAcVzG4Y/Z3uX5yMYkrwDuguleB+KofkjtoN1VN1a/Y+E/cREzHq4Ckyk48A46UbLihPU7eZZDEaNKpGbzNx2bFATUiEVNsTaEDeZnldqmjto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijgsEahc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9977360f9fso323857766b.0
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2024 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676695; x=1729281495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFxuqNSxQdwW5W7Gvd+CP4opmQRkWKW3RInMZWjxcJ0=;
        b=ijgsEahcGkzzkSWa5YeoDIWReSlpmtGgGZJJ9IJdzXs1YfUp5L00NV1PUfnP/7rb0m
         YDTBY3I5HTGHhbhuGBSgb1fvFfOfpoU7xoz2MvBD8RLI0nuQBN7ORiGGDH262znJ6tei
         Bskk54t8AaCM34mFTFZ6lCbvRXOfZgu4+06gEH7gcXbdaXlVL8MHion0GLSyJ9PmysI3
         4R1n4GiD8gVMLVS4tDz326JW+ZFoPAk+qxMlMH4kvTwmEl6mh2r7RUsMom8OCAOH9r/1
         hZdwl5XnchH8+NoTD8OqJshD3Z6bDABqBmpuIscDKlDWUiFNrD4oALDR4E8Se/G9l8Er
         WuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676695; x=1729281495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFxuqNSxQdwW5W7Gvd+CP4opmQRkWKW3RInMZWjxcJ0=;
        b=HUXxjoTdwRx1evtpejkXeTuzLzQiHH9bQTCuXccIixztD5QnCvpxOUqaKJCJEfTrvd
         9M+jU0cOz+9kKn4IM14TIX2FpanU+K5DkvwWDkXxibCLr/aO6T4r87vc18kYOZPfPU/+
         mUscu9ticC48IqZzXBzaYAwECFOJv6a0Rucvkngmh9zHjpWE/nzVBuLnniYFrkQOtfNg
         VewPeTnoNZ/wYpD3FlC9QhROduTzDAhfpplcW7olhIvYh1w27T1+42HIUOrG80acuLqf
         jNb6VLmwbIHHFn9yNyg5utact713R0wGZxJFu7ZqN423FbOks3N3sfuW71sXg8eKeeKc
         S26A==
X-Forwarded-Encrypted: i=1; AJvYcCV3uVEdv+sT7jQCMZHBcqeh28CZWnqcAJBz/+2cAK+GinZbHY/lnKCYZHiOlk/hrw0jfvouMgk+dyFGuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVAVVujyp5aVdTI1fQDhze41ui5ViuUzFib13D5itd9nxiGPsG
	rGmCl3jT7WiQaPmGKEcN4RcybbWEAWaF0EerC553k56lOU+jGh1p8grfqWOc46E=
X-Google-Smtp-Source: AGHT+IHeqwHkB7bO7JKRvDuVUTxnmkMro2SH3cRMVM2rdaXwhw3QJuvWcHwH6i9KXvT3Oz0XuJy2oA==
X-Received: by 2002:a17:907:72c9:b0:a99:4ebb:a400 with SMTP id a640c23a62f3a-a99b942b5dfmr337521866b.26.1728676694856;
        Fri, 11 Oct 2024 12:58:14 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-169014-cust557.vm26.cable.virginm.net. [82.47.146.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f27bfasm245315966b.73.2024.10.11.12.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:58:14 -0700 (PDT)
From: Terry Tritton <terry.tritton@linaro.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Aseda Aboagye <aaboagye@chromium.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Terry Tritton <ttritton@google.com>,
	Terry Tritton <terry.tritton@linaro.org>
Subject: [PATCH 1/1] input: fix generic desktop D-Pad controls
Date: Fri, 11 Oct 2024 20:58:08 +0100
Message-Id: <20241011195808.2201-2-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241011195808.2201-1-terry.tritton@linaro.org>
References: <20241011195808.2201-1-terry.tritton@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of the "System Do Not Disturb" event code caused the Generic
Desktop D-Pad configuration to be skipped. This commit allows both to be
configured without conflicting with each other.

Fixes: 22d6d060ac77 ("input: Add support for "Do Not Disturb"")
Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
---
 drivers/hid/hid-input.c | 37 +++++++++++++++++--------------------
 include/linux/hid.h     |  1 +
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index fda9dce3da99..9d80635a91eb 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -810,10 +810,23 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			break;
 		}
 
-		if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
-			switch (usage->hid & 0xf) {
-			case 0xb: map_key_clear(KEY_DO_NOT_DISTURB); break;
-			default: goto ignore;
+		if ((usage->hid & 0xf0) == 0x90) { /* SystemControl & D-pad */
+			switch (usage->hid) {
+			case HID_GD_UP:	   usage->hat_dir = 1; break;
+			case HID_GD_DOWN:  usage->hat_dir = 5; break;
+			case HID_GD_RIGHT: usage->hat_dir = 3; break;
+			case HID_GD_LEFT:  usage->hat_dir = 7; break;
+			case HID_GD_DO_NOT_DISTURB:
+				map_key_clear(KEY_DO_NOT_DISTURB); break;
+			default: goto unknown;
+			}
+
+			if (usage->hid <= HID_GD_LEFT) {
+				if (field->dpad) {
+					map_abs(field->dpad);
+					goto ignore;
+				}
+				map_abs(ABS_HAT0X);
 			}
 			break;
 		}
@@ -844,22 +857,6 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		if (field->application == HID_GD_SYSTEM_CONTROL)
 			goto ignore;
 
-		if ((usage->hid & 0xf0) == 0x90) {	/* D-pad */
-			switch (usage->hid) {
-			case HID_GD_UP:	   usage->hat_dir = 1; break;
-			case HID_GD_DOWN:  usage->hat_dir = 5; break;
-			case HID_GD_RIGHT: usage->hat_dir = 3; break;
-			case HID_GD_LEFT:  usage->hat_dir = 7; break;
-			default: goto unknown;
-			}
-			if (field->dpad) {
-				map_abs(field->dpad);
-				goto ignore;
-			}
-			map_abs(ABS_HAT0X);
-			break;
-		}
-
 		switch (usage->hid) {
 		/* These usage IDs map directly to the usage codes. */
 		case HID_GD_X: case HID_GD_Y: case HID_GD_Z:
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 121d5b8bc867..80433ee3e5ae 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -218,6 +218,7 @@ struct hid_item {
 #define HID_GD_DOWN		0x00010091
 #define HID_GD_RIGHT		0x00010092
 #define HID_GD_LEFT		0x00010093
+#define HID_GD_DO_NOT_DISTURB	0x0001009b
 /* Microsoft Win8 Wireless Radio Controls CA usage codes */
 #define HID_GD_RFKILL_BTN	0x000100c6
 #define HID_GD_RFKILL_LED	0x000100c7
-- 
2.39.5


