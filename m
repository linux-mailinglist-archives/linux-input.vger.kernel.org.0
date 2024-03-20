Return-Path: <linux-input+bounces-2434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45954880BFA
	for <lists+linux-input@lfdr.de>; Wed, 20 Mar 2024 08:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C36BB21F2D
	for <lists+linux-input@lfdr.de>; Wed, 20 Mar 2024 07:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76552219E8;
	Wed, 20 Mar 2024 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="x64IPpDa"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B72220DCD
	for <linux-input@vger.kernel.org>; Wed, 20 Mar 2024 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710919572; cv=none; b=REnIX46UaoCawXPQGy44b33uxO+LoDYvDVvsvYQY/T7kQdy2ZeZKJoYyn1lheXXP6PWGwb6Cf5wPHhJpATYxsompZWBT+l5GgUW1IqNEN8/junwd+tY02nblGYUQuJl/Ud15OrH1O0SpMTYwRXv+eL5LO/CjMATtCjtpHl56M0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710919572; c=relaxed/simple;
	bh=XB939VGu0oHObTuJvMeKtt9EtvE3yr+qSv3ocedkmTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X3hXuC7B/exlXd1MRL7JxK2NbvlDBmWBOPX6qUyYrpuohtevdpXMcdR1gqrUKumtU29b3ja66bseLsL7dlcU931UUibYYptSQw4zhnNeTUDlABPHTTnsx8OFwe9tNI4UYeEIH9K+jNsgmkMesCFEfbEPRBQ1O7lVjsgqvmDqI2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=x64IPpDa; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 43378880BF;
	Wed, 20 Mar 2024 08:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710919554;
	bh=ymkO8tq7UCBHHwCgKvgXxsWGSIe+BCnyer9uzp9MOIA=;
	h=From:To:Cc:Subject:Date:From;
	b=x64IPpDaCaYlxBNLJDq9BIG7GrztNihs1RLvx9HlCmSUxBpFJS9yksNI+mBrbQaaL
	 tnE7Yl4j7WqNGg61oJ83l4yEsu4gtt53kXFbqAzI8u+33G+qxURKTeDSoZRATiKsEv
	 XCkmpRMa53S+ezeVjI9FL0nQ5LvRmqDqOcFzjjrMHsMLrVDpIGzTP2Hwj4gijj3D9A
	 dTrK9IP133ebPK6djlaAP6mVG54+/0ha2AnTFACD8b1c3rGyEanq4WXCOFJLIyNujx
	 5p6EJgW1f1k/5FidYE81fY9l9LG7ypiL6cU7tDqWlU38bZoMgDbbwgwEHzjA87pA++
	 E3BUtlYhHh+CQ==
From: Marek Vasut <marex@denx.de>
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	kernel@dh-electronics.com
Subject: [PATCH] Input: ads7846 - add dummy command register clearing cycle
Date: Wed, 20 Mar 2024 08:23:07 +0100
Message-ID: <20240320072533.170029-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On STM32MP135F with XPT2046 touch controller attached to SPI bus, it has
been observed that the touch controller locks up after Linux kernel has
finished booting. Adding a dummy cycle on the SPI bus seems to mitigate
the lock up.

The XPTEK XPT2046 controller seems to be an identical clone of TI TSC2046,
the datasheet seems to be a clone of the TI part as well, text seem to be
word to word identical, except all the pictures have been drawn again.

This touch controller is present e.g. on WaveShare 3.2inch RPi LCD (B)
panel, the DTO provided by WaveShare uses 50 kHz SPI clock for this
touch controller, which is unusually low and possibly might have been
used as some sort of workaround for an issue. The SPI LCD on the same
bus uses 16 MHz clock.

SPI bus DT properties spi-cs-setup-delay-ns, spi-cs-hold-delay-ns,
spi-cs-inactive-delay-ns, spi-rx-delay-us, spi-tx-delay-us set to
range of 500ns..5us seem to have no impact on the behavior of the
touch controller, the lock up always occurs. The STM32MP13xx SPI
controller users GPIO control for the nCS pins.

Since the dummy cycle happens after the controller has been put into
power down mode and both ADC and REF regulators have been disabled,
the cycle should have no impact on the configuration of the controller,
i.e. it should be a NOP.

It is unclear whether this problem is specific to this cloned XPT2046
controller, or whether this is also present on TSC2046. A test on
either TSC2046 or ADS7846 would be very welcome.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@dh-electronics.com
Cc: linux-input@vger.kernel.org
---
 drivers/input/touchscreen/ads7846.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index d2bbb436a77df..90b5251797963 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -404,9 +404,19 @@ static int ads7846_read12_ser(struct device *dev, unsigned command)
 
 	req->xfer[5].rx_buf = &req->scratch;
 	req->xfer[5].len = 2;
-	CS_CHANGE(req->xfer[5]);
 	spi_message_add_tail(&req->xfer[5], &req->msg);
 
+	/* clear the command register */
+	req->scratch = 0;
+	req->xfer[6].tx_buf = &req->scratch;
+	req->xfer[6].len = 1;
+	spi_message_add_tail(&req->xfer[6], &req->msg);
+
+	req->xfer[7].rx_buf = &req->scratch;
+	req->xfer[7].len = 2;
+	CS_CHANGE(req->xfer[7]);
+	spi_message_add_tail(&req->xfer[7], &req->msg);
+
 	mutex_lock(&ts->lock);
 	ads7846_stop(ts);
 	status = spi_sync(spi, &req->msg);
-- 
2.43.0


