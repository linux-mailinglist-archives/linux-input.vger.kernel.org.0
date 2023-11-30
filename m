Return-Path: <linux-input+bounces-357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A337FFBD6
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 20:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB130281995
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 19:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A073537ED;
	Thu, 30 Nov 2023 19:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pyc5AnrN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D760DD
	for <linux-input@vger.kernel.org>; Thu, 30 Nov 2023 11:56:36 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-da3b4b7c6bdso1262909276.2
        for <linux-input@vger.kernel.org>; Thu, 30 Nov 2023 11:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701374195; x=1701978995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ylcdNyt/KgUOR07ZWWJkcl4KatMQeoh7FaMP2m7i8c=;
        b=Pyc5AnrNfKBSmzjlMHMk6HGki80P0UphIlXxWoSQ7dKgwdElDeE40x82eryEHct3JZ
         qPWtB7g+HlWeY6q2zVZ0qkeiyHrzZExYReGMu3aKEqxOyflrkBTTLIl8ohYBovnJyI7N
         cGupptA7UTgerChxc495dD0abjr12IN5F6m6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701374195; x=1701978995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ylcdNyt/KgUOR07ZWWJkcl4KatMQeoh7FaMP2m7i8c=;
        b=dr/JiqW2q3QByA/YZmkaQm5emXcKpVQ/fpRNCAfJZqE7JibFGfotr+WW9WJbOzIRpg
         wpFKgmeC+dMdNF0yFv+JShtqvrtLp8DViFDA0vb8HJ0MPs9uI9KlNMpsx/wWp0egt8mI
         uyOAvwSmB/6kc97Juzt2HYSUQDiWO1QaAlXvPr20LtBBHEiFUn/djPFu5RpNNHRmfC8V
         YFXmlG81IiizSx9ejxadGsUnXmlzshfPLhT3PDsZPyMpMM46Z42aJ92pGljO6XIs8xXX
         6nBttdBKKzJLsqzqaa1fudwWnVub2rL2t3ixEy95vGJemNt2blgoRb/81AfeWZT6y52l
         6Ewg==
X-Gm-Message-State: AOJu0YzyGPwMrk0YUsCLIXSvTUTzNxHhBzAHhjzt7em+Zy/zj+DVy3oP
	CcaFk5Ucw7Bvi3HH3AHZbn4i8w==
X-Google-Smtp-Source: AGHT+IEkuCKfvEd40usAvYx3mzY4LjwGa+9w3CAhq7hGzQiQ4JddG3l9cvrLwAGDY9oCbg8YNLpnRg==
X-Received: by 2002:a5b:a52:0:b0:db5:d88:d463 with SMTP id z18-20020a5b0a52000000b00db50d88d463mr8689641ybq.51.1701374195338;
        Thu, 30 Nov 2023 11:56:35 -0800 (PST)
Received: from localhost (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with UTF8SMTPSA id c15-20020a0ce14f000000b0067a39a44ca5sm769778qvl.77.2023.11.30.11.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 11:56:34 -0800 (PST)
From: Esther Shimanovich <eshimanovich@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-input@vger.kernel.org,
	Esther Shimanovich <eshimanovich@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Denose <jdenose@chromium.org>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v2] Input: i8042 - add nomux quirk for Acer P459-G2-M
Date: Thu, 30 Nov 2023 19:56:19 +0000
Message-ID: <20231130195615.v2.1.Ibe78a9df97ecd18dc227a5cff67d3029631d9c11@changeid>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the laptop lid is opened, and the device resumes from S3 deep
sleep, if the user presses a keyboard key while the screen is still black,
the mouse and keyboard become unusable.

Enabling this quirk prevents this behavior from occurring.

Signed-off-by: Esther Shimanovich <eshimanovich@chromium.org>
---
Hello! Thanks for the prompt response. I had previously tried the
i8042.nomux=1 quirk which didn't seem to work. But I was trying it
together with other quirks, which may have changed the behavior.
When I applied the nomux quirk to the driver, that did fix the bug
on my device. Submitting the new patch!

Changes in v2:
- change noloop to nomux

 drivers/input/serio/i8042-acpipnpio.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 028e45bd050bf..612c4e3427cef 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -360,6 +360,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		},
 		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
+	{
+		/* Acer TravelMate P459-G2-M */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate P459-G2-M"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
+	},
 	{
 		/* Amoi M636/A737 */
 		.matches = {
-- 
2.43.0.rc2.451.g8631bc7472-goog


