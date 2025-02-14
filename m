Return-Path: <linux-input+bounces-10030-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BEDA3564C
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 06:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91169188F94B
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 05:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC1918732B;
	Fri, 14 Feb 2025 05:36:09 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from forward203b.mail.yandex.net (forward203b.mail.yandex.net [178.154.239.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6216538DD8;
	Fri, 14 Feb 2025 05:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739511369; cv=none; b=u0nm6p5V+xVXpKY8UA0FwDY4qfKUEuniwFq2dSQ7XEyBLt2hHcGGVQqPAV6kwhGHdK/PqDGHwNl87GiRNqGC4ixNxB6QKpq6+GM1GChPx6laoRVG42XfC/v1Mwu6Qc+gpvvinwm8QogSxg7tKcQcyzwRsh8OwEyvlrjC+WHRVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739511369; c=relaxed/simple;
	bh=WF7uhb8I9k24A6Ug7P71/E89BkMWktvvfObKO86Tpo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gUilSTb88tGQTKTfn74srVdouvrZlh6L0I0pqhnMIhqXIBcoa/XUTpC+EPN6vjwvAL05XpFI97R15raK2beIHh8KulxZ5Vz+Sr/Gh+VCagG1fMK5XfKrtA+PXCfus+rcUU0Dc8C6saICt41Vio8nQHKCXqDuUy/y56YGCn5PLIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d103])
	by forward203b.mail.yandex.net (Yandex) with ESMTPS id 4D31C65545;
	Fri, 14 Feb 2025 08:30:17 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net [IPv6:2a02:6b8:c10:2d9f:0:640:f6ce:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id 1FE6A60911;
	Fri, 14 Feb 2025 08:30:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 5UJF7UBMgqM0-7Fljlxsf;
	Fri, 14 Feb 2025 08:30:07 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH v2 0/2] Add Goodix Berlin-A series support
Date: Fri, 14 Feb 2025 06:29:57 +0100
Message-ID: <20250214052959.222668-1-adrian@travitia.xyz>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Goodix Berlin-A series touch ICs
(gt9897). This was tested on a Xiaomi 11 Lite 5G NE (xiaomi-lisa),
which uses the gt9897 IC connected over SPI. I am not aware of any
device that has gt9897 connected over I2C and therefore could not
test it, so I didn't add a compatible in the I2C driver.

Changes in v2:
- Added Rob's A-b tag (patch no. 1)
- Added Luca's T-b tag (patch no. 2)
- Updated the i2c and spi device id tables with the driver data and
  switched to spi_get_device_match_data where possible (requested by
  Neil)
- Switched to device_get_match_data in goodix_berlin_core.c
- Move all revision specific addresses and other properties into the
  goodix_berlin_ic_data struct (requested by Dmitry)
- Link to v1:
  https://lore.kernel.org/all/20250203174309.21574-1-adrian@travitia.xyz/

To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bastien Nocera <hadess@hadess.net>
To: Hans de Goede <hdegoede@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Cc: linux@mainlining.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
Signed-off-by: Jens Reidel <adrian@travitia.xyz>

Jens Reidel (2):
  dt-bindings: input: goodix,gt9916: Document gt9897 compatible
  Input: goodix_berlin - Add support for Berlin-A series

 .../input/touchscreen/goodix,gt9916.yaml      |  1 +
 drivers/input/touchscreen/goodix_berlin.h     | 13 ++++++
 .../input/touchscreen/goodix_berlin_core.c    | 15 ++++---
 drivers/input/touchscreen/goodix_berlin_i2c.c |  9 +++-
 drivers/input/touchscreen/goodix_berlin_spi.c | 45 ++++++++++++++-----
 5 files changed, 62 insertions(+), 21 deletions(-)

-- 
2.48.1


