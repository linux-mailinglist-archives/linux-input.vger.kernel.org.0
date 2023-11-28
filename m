Return-Path: <linux-input+bounces-319-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AE47FC8D7
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 22:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C10B41C20E20
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 21:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39DF44C9B;
	Tue, 28 Nov 2023 21:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="auHt8sq8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAA618E
	for <linux-input@vger.kernel.org>; Tue, 28 Nov 2023 13:53:33 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-77d895c298eso205406385a.3
        for <linux-input@vger.kernel.org>; Tue, 28 Nov 2023 13:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701208413; x=1701813213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TajWNb6t94eI72grT/BNIlEfldBslVEJjpPP4Fw+5CE=;
        b=auHt8sq8z/bV5pf2W0Ywsg+2BV3Z49M5WRcJgbGFv9ijj57mPyJCEWzvjzepTtrVk4
         AGRqKaOJy+VdyNRQJTfBAU8WTTHPuibONfotDXUPbP5/eFI2Y31v7a8jRkv9CZjjChy4
         OvHRy6UL5m7T4a+rnD2B8F1zrSzkYsR4pW4RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701208413; x=1701813213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TajWNb6t94eI72grT/BNIlEfldBslVEJjpPP4Fw+5CE=;
        b=W9Fhf0TXMLCaCp/iaoZsh5OTgk0E2lYRv5KOxgED0Ko8TAFgXZQqxtF02Shipn0HvQ
         BbMmXHBYzd81ufC1oSEVTEfKjuLfzYQZ3aKGtsWohNCVZfZpVJHJZtHbqF6GHrOhqZHf
         22HDw2Gm24712QRf259o9pxkGm6u3cQpirwsCXjyjgicblYRysEkogdYPMgUSZ68+Sfy
         KkfxY4JbOx4uT7/t7tfv/ZnqBiGL7FsTs25b+5xuc/EW2UdlJ7XSqJPP+hUQJOLMGRwH
         TaobjOlVEGDfKu2lr7MSioxadnDd/xvMgq3OuOz0BmWtSEonEPKN1jJ1Jq9aFH7RNay+
         koGg==
X-Gm-Message-State: AOJu0YwVhOHLWFK6VrH+mtcHb0tjpjOu47+o6fkfZqzGt9mFhT6hO7/R
	TvXJOY0dYcUEfbjHpxl6CPysmSho/JiVDpgt6QaUAw==
X-Google-Smtp-Source: AGHT+IF+BiZT25SBF1s07utqoXa/9+AfTrzu2F1UN/e7OZ2tZTGEDW9QrPkA3aRgkFwpu/5wm4X9Sw==
X-Received: by 2002:a05:620a:8390:b0:774:35da:75ac with SMTP id pb16-20020a05620a839000b0077435da75acmr19458381qkn.55.1701208413129;
        Tue, 28 Nov 2023 13:53:33 -0800 (PST)
Received: from localhost (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with UTF8SMTPSA id i16-20020a05620a405000b0077da4bc07afsm2261753qko.121.2023.11.28.13.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 13:53:32 -0800 (PST)
From: Esther Shimanovich <eshimanovich@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-input@vger.kernel.org,
	Esther Shimanovich <eshimanovich@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Denose <jdenose@chromium.org>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH] Input: i8042 - add noloop quirk for Acer P459-G2-M
Date: Tue, 28 Nov 2023 21:48:54 +0000
Message-ID: <20231128214851.1.Ibc66f1742765467808fb28a394f8f35af920aa49@changeid>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Acer P450-G2-M, after the user opens the laptop lid and the device
resumes from S3 deep sleep, the screen remains dark for a few seconds.
If the user presses a keyboard key while the screen is still dark, the
mouse and keyboard stop functioning.

To fix this bug, enable the noloop quirk.

Signed-off-by: Esther Shimanovich <eshimanovich@chromium.org>
---

 drivers/input/serio/i8042-acpipnpio.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 028e45bd050bf..b81539bacb931 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -941,6 +941,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		},
 		.driver_data = (void *)(SERIO_QUIRK_NOPNP)
 	},
+	{
+		/* Acer TravelMate P459-G2-M */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate P459-G2-M"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
+	},
 	{
 		/* ULI EV4873 - AUX LOOP does not work properly */
 		.matches = {
-- 
2.43.0.rc1.413.gea7ed67945-goog


