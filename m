Return-Path: <linux-input+bounces-2836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32A899AA7
	for <lists+linux-input@lfdr.de>; Fri,  5 Apr 2024 12:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B86292837F8
	for <lists+linux-input@lfdr.de>; Fri,  5 Apr 2024 10:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C777161B52;
	Fri,  5 Apr 2024 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DgKdCtEU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF72142E73
	for <linux-input@vger.kernel.org>; Fri,  5 Apr 2024 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712312685; cv=none; b=LEfDDdgxstswiERtRNd7yQl7DfRJWQfBdlgFosSaAgpgyQAWGSCxvsZrxJdYANtqgrie6zp8JQ524H25AG0BovVhekJJ7kR48YQStkyFaToRr7zgB9vY/Hwp/daAg+qoqepzbY2V9tkgnsY6Kki4kYvIQDL91SUBXFX3AGjvPcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712312685; c=relaxed/simple;
	bh=6Mi4Zda2IuWgiJbpiUJXrXSDCHZL4LlhA8jwn4Ctd5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pS7jA5hDtOGMIDfVYioIvk2eqPWpU8VqhcygY0I95RlJqioYjpRrW3P1PHsRm/3wM5ps/7DgvzkuNT0mTlJn5JdklOgWAN0atRKYED5PJFEaTIDdWFGRPft7nS1Im7zAvktBZG1EHs+I989IFaNekV5/KbcOrRi0hHAt+knH3Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DgKdCtEU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d536f6f2so452281e87.2
        for <linux-input@vger.kernel.org>; Fri, 05 Apr 2024 03:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712312682; x=1712917482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+jGD2roC6tLvXGlYWlxdfcM3omcd6USfzccfZFKlAA=;
        b=DgKdCtEUplxWkhHaYXhU5udqXfInO543S6NzOqTm5wwGifZb8rPF/EByrjl1fktucF
         6EYOuokRz4XLDhxq2mvHq4oh3tybbxPXD88gVAQ9xKyrczxzwzZxmbIU2ssH4dc1cpXL
         J+2gkqV4CdJmEOic5b9aWSGCZc1++JEN45Qog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712312682; x=1712917482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+jGD2roC6tLvXGlYWlxdfcM3omcd6USfzccfZFKlAA=;
        b=irQPP5tS1vXM524PF7giScjHjZbz9csUd8N5MjIZz70UHoz4IpOWkDpAF6z9U8hkGy
         OaPCmFqHfZMA4DK1AQVJoAPCh3DZg/BWlXYqb3+4fVNFGdg0ZNgT9Rb9MboQ6mBAFBdN
         B3ix9eOKQhjVDCb9XfbhAWKp2wNm3LSkKGz91+N8xQ1ybom1QlPRf8jrXn/w2lnwD30l
         pYPFKhWfDUGq09y5kjTmXe1gSnxnO3iJZ2B+hbGb0A9HZFzSzFFfRb2l83Y3EsfchQMT
         9dzhz0GN7kEIEFG0KrLqHiXilOj7jZEuWF9AQQuU/FLt2079b5bjuLrAwGRYaEzLfZSy
         vY/A==
X-Forwarded-Encrypted: i=1; AJvYcCWgB5eu2dpVW091x4fxiRoqFdNlQxbCOyHzU4R01/CBP35M3RXqBy4exx1QkqohrVlzkfeN0qmm13lj1Q6Jch0DczMaU6CBxCGPIIU=
X-Gm-Message-State: AOJu0YwUPM3U74six5FyDC5ugUYo4BgYGyGgB2rCKqi6ooW71K2OaAwv
	Is2kgnwJJ2f1SU+zBBQ5SsLB+9iudEyybw7KzqMAR7jFrSBcNyoUlEFYpCoQNg==
X-Google-Smtp-Source: AGHT+IFKkDJOlqsFEj1rkRkbKC8Rp5ml67XFyluPvhmnsDmEuWRFiQoVZn9kN+bO5p/6U4fcyQNZQQ==
X-Received: by 2002:ac2:4346:0:b0:513:ed0f:36c9 with SMTP id o6-20020ac24346000000b00513ed0f36c9mr847086lfl.45.1712312681776;
        Fri, 05 Apr 2024 03:24:41 -0700 (PDT)
Received: from cracow.c.googlers.com.com (38.165.88.34.bc.googleusercontent.com. [34.88.165.38])
        by smtp.gmail.com with ESMTPSA id o14-20020a198c0e000000b005159fe09ff5sm153692lfd.129.2024.04.05.03.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 03:24:41 -0700 (PDT)
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
Subject: [PATCH v2] HID: i2c-hid: wait for i2c touchpad deep-sleep to power-up transition
Date: Fri,  5 Apr 2024 10:24:36 +0000
Message-ID: <20240405102436.3479210-1-lma@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch extends the early bailout for probing procedure introduced in
commit b3a81b6c4fc6 ("HID: i2c-hid: check if device is there before
really probing"), in order to cover devices
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

v1->v2:
* Updated commit message with short sha of a base commit and proper tags
* Rearranged while loop to perform check only once
* Loosened sleeping range

Co-developed-by: Radoslaw Biernacki <rad@chromium.org>
Signed-off-by: Radoslaw Biernacki <rad@chromium.org>
Signed-off-by: Lukasz Majczak <lma@chromium.org>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2df1ab3c31cc..ece1a5815e0b 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1013,9 +1013,17 @@ static int __i2c_hid_core_probe(struct i2c_hid *ihid)
 	struct i2c_client *client = ihid->client;
 	struct hid_device *hid = ihid->hid;
 	int ret;
+	int tries = 2;
+
+	while (true) {
+		/* Make sure there is something at this address */
+		ret = i2c_smbus_read_byte(client);
+		tries--;
+		if (tries == 0 || ret >= 0)
+			break;
+		usleep_range(400, 500);
+	}
 
-	/* Make sure there is something at this address */
-	ret = i2c_smbus_read_byte(client);
 	if (ret < 0) {
 		i2c_hid_dbg(ihid, "nothing at this address: %d\n", ret);
 		return -ENXIO;
-- 
2.44.0.478.gd926399ef9-goog


