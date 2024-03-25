Return-Path: <linux-input+bounces-2506-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443188A4EA
	for <lists+linux-input@lfdr.de>; Mon, 25 Mar 2024 15:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1A92E46A8
	for <lists+linux-input@lfdr.de>; Mon, 25 Mar 2024 14:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4118312DD8F;
	Mon, 25 Mar 2024 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CLzj6vyl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5E119F52E
	for <linux-input@vger.kernel.org>; Mon, 25 Mar 2024 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711364100; cv=none; b=RJIfnubBA+hV2n5lMy1jfUSFg2ROcWTEaTX57lfGw7JeT5eR4M1Pxz4OO18HjHfjD90R4YwNpocmhpqxSMX2kQzy/0liPYsCw2uFJRldt/mKtAREv2B/b9UJc2JniUaqEj8J7KZGUdEKAcVEog8UKAU2RoNBt8kC2BU3iOCFRgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711364100; c=relaxed/simple;
	bh=UzyidwSIDUNATQV9Wm0Ut6BdNvIpkTtmBKV1epvsvH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JLcFUpkGguNIqmcN5n8oyrexDNxZhMnYQrV3GuEwfRSfMhq14fCf8uA/zKaNyUYN0jd1EjqOo5OBaPaYUWaaBiqqmet18zJAMBscqZm7B0AoeFRVaJeQH2wu06g6/kBMihHOgHKYrzfwZHtff9+bbdAqPX5z9WOeppRLBEdJHGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CLzj6vyl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5159f9de7fbso2261490e87.1
        for <linux-input@vger.kernel.org>; Mon, 25 Mar 2024 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711364097; x=1711968897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTAS3N78+eEvzc9y/KOpFGYpe/3uK9ebe/5f/RJ6Ot8=;
        b=CLzj6vyloG1wzskVblbWnm3ddVKrzzEfekNOkbnHvQ0+wq54cCVysq1glE35VPbjcF
         Bevhgl/e7ZYRm5avjTkUPoUDF6EnhC7jhOM66xqiNXV6JDMHSSOpcyzIi5a1HerqNkN/
         OZw6bdwhflAYASQ6McGlT5so2faD4jDG5D79E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364097; x=1711968897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTAS3N78+eEvzc9y/KOpFGYpe/3uK9ebe/5f/RJ6Ot8=;
        b=OqY2YL8F1A25qTMC91/DfND/sT6oelWV8QDWlvwM6YIipyYN8V1Kmb+7twmW8HxrAO
         UT8FDuMpOL6njrYbhGg8EV/ZbMW2EGpWKodtyDpS4efQsMga4A654OkmSnKN7GlFeO54
         sRoO8pMN3d/zUxu0hw7ho5Gfv/bM1Ys8RETAqq1YhYMFqpgHZHWN+O3fSZINl6lmLVK7
         rlhPfhYZ5LjxD0jlJSwlQiVBwPDv0yL4qfCc1nHIwqOKyGFlocB8zyL4P/dXDuLLFtE5
         4PYyNAgRgfpE9hCrg1DuR8H2ltpaslgt60y0HBpvn7nPLvljC3ZzHbv+Hg7gzoCe5fZw
         f7OA==
X-Forwarded-Encrypted: i=1; AJvYcCU1NtV0QzDPDn5HuR/EyPqKcoKqEHv/MWPK8+WXdt4iNwi+TDDROmKD3st09zxui4bwNomdYT1Io1uY+xGGrhsvpY4/n7Ebf/lq6is=
X-Gm-Message-State: AOJu0YwntljIcAXhgOW2BWuJva9ObI26yd9vXRLmmIuCEslCyhjjQTgf
	c+47v25XDQOCKLZo/PrLaZdVYEdfiRfaDppu3obKJ2zwez2JuWGk9RAJQUnBUw==
X-Google-Smtp-Source: AGHT+IHVwSUZiFYY4NBhuItMUBGjJl/jpX/5a9saFTj0ty03NNDiNEz6BwkZcnHA9EP2utUK7LjgQw==
X-Received: by 2002:a19:4312:0:b0:513:cb74:9ffe with SMTP id q18-20020a194312000000b00513cb749ffemr4230298lfa.50.1711364096852;
        Mon, 25 Mar 2024 03:54:56 -0700 (PDT)
Received: from cracow.c.googlers.com.com (38.165.88.34.bc.googleusercontent.com. [34.88.165.38])
        by smtp.gmail.com with ESMTPSA id f20-20020a05651232d400b00515b08c7397sm93489lfg.67.2024.03.25.03.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:54:56 -0700 (PDT)
From: Lukasz Majczak <lma@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
	Dmitry Torokhov <dtor@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lukasz Majczak <lma@chromium.org>,
	Radoslaw Biernacki <rad@chromium.org>
Subject: [PATCH] HID: i2c-hid: wait for i2c touchpad deep-sleep to power-up transition
Date: Mon, 25 Mar 2024 10:54:52 +0000
Message-ID: <20240325105452.529921-1-lma@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch extends the early bailout for probing procedure introduced in
commit: b3a81b6c4fc6730ac49e20d789a93c0faabafc98, in order to cover devices
based on STM microcontrollers. For touchpads based on STM uC,
the probe sequence needs to take into account the increased response time
for i2c transaction if the device already entered a deep power state.
STM specify the wakeup time as 400us between positive strobe of
the clock line. Deep sleep is controlled by Touchpad FW,
though some devices enter it pretty early to conserve power
in case of lack of activity on the i2c bus.
Failing to follow this requirement will result in touchpad device not being
detected due initial transaction being dropped by STM i2c slave controller.
By adding additional try, first transaction will wake up the touchpad
STM controller, and the second will produce proper detection response.

Signed-off-by: Lukasz Majczak <lma@chromium.org>
Signed-off-by: Radoslaw Biernacki <rad@chromium.org>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2df1ab3c31cc..69af0fad4f41 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1013,9 +1013,15 @@ static int __i2c_hid_core_probe(struct i2c_hid *ihid)
 	struct i2c_client *client = ihid->client;
 	struct hid_device *hid = ihid->hid;
 	int ret;
+	int tries = 2;
+
+	do {
+		/* Make sure there is something at this address */
+		ret = i2c_smbus_read_byte(client);
+		if (tries > 0 && ret < 0)
+			usleep_range(400, 400);
+	} while (tries-- > 0 && ret < 0);
 
-	/* Make sure there is something at this address */
-	ret = i2c_smbus_read_byte(client);
 	if (ret < 0) {
 		i2c_hid_dbg(ihid, "nothing at this address: %d\n", ret);
 		return -ENXIO;
-- 
2.44.0.396.g6e790dbe36-goog


