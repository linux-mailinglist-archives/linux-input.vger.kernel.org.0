Return-Path: <linux-input+bounces-10656-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED1A5811D
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 07:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B0BF16AD2C
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 06:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E60015852E;
	Sun,  9 Mar 2025 06:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lR7IReWJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD43C2FD;
	Sun,  9 Mar 2025 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741501408; cv=none; b=sFRF7sWt3+/4FQlv1MhoXU4J7kMIEOdrnXSCHWIsqk3pWTlcvIFkPOEJnrjZx22gkOjqqhMSr6UsphXRcRMGo8801Rn3jjo1mU1i/UimQPyKmien3dg/+Tzj1pzA1hI9EUbSvL1vQVropdOM+Y6L2E0AkiAUqXHpK0rfboSLcHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741501408; c=relaxed/simple;
	bh=dF3VxYoF+dkfdZ3N/XrJO/aMWFrQcMCJwYA1XTQCm2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7x050J64SrQlIanUmmDOJU6l/ftEL0lw+zWIOTOmxjP8ovuEBnIx8yzVSMumBhZ3hM9X1i01lVqzJIeseaC0ygtKu8u9odkUVyaTgG6Cz+E8Zjv30pJ+wns7jTV83iPd3UaDm6DeMLn4YjOHTGxXJs+EtU5+CpuV6ZguxZmjsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lR7IReWJ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from karma.space.aachen.ccc.de (xdsl-78-35-222-202.nc.de [78.35.222.202])
	by mail.mainlining.org (Postfix) with ESMTPSA id 5ED52BBABE;
	Sun,  9 Mar 2025 06:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741501397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wqHEMGgvsfH4PlxVNe6pU2cYUZvDBjSj3/m0k8x2fi0=;
	b=lR7IReWJZAnu0GH3kJ5TDE2eZxGg3JXwvhz0tVlA8FeU/hytk9K/KeoST0NofACvdUUURR
	5L28G8tDYfuINigvTaYn+Kj7dkTbJ1wyYbXFtzyj2kPyOsNEPUU+NkuFJkB2FsbmYt0hqj
	1wYlRFK1R91NPg6AcaFJqZi9vQQ0RIcO9qWvKLED9v6Da8GPZbkEq/BKNcCvTriXMhsg8H
	0cvTVKTFXUiZiH/OhPle0EowbIVNdD9L55KNJH+Na94Yvme+RJMrGtTgpORgKwaLkOPPYM
	4XEyK0tSKZEjD6DT/q1egQBVauZw2J6kV3bTNGWzET0TXAOCnKwQ6jVTkgt63Q==
From: Jens Reidel <adrian@mainlining.org>
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
	Jens Reidel <adrian@mainlining.org>
Subject: [PATCH v4 0/2] Add Goodix Berlin-A series support
Date: Sun,  9 Mar 2025 07:23:13 +0100
Message-ID: <20250309062315.35720-1-adrian@mainlining.org>
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

Changes in v4:
- Fix the build for the i2c driver
- Add Neil's R-b tag (patch no. 2)
- Link to v3:
  https://lore.kernel.org/all/20250307094823.478152-1-adrian@mainlining.org/

Changes in v3:
- Store the ic data in the goodix_berlin_core struct and pass it to
  goodix_berlin_probe from the i2c/spi probes (requested by Neil)
- Resent from my now preferred e-mail for kernel work
- Link to v2:
  https://lore.kernel.org/all/20250214052959.222668-1-adrian@travitia.xyz/

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
Signed-off-by: Jens Reidel <adrian@mainlining.org>

Jens Reidel (2):
  dt-bindings: input: goodix,gt9916: Document gt9897 compatible
  Input: goodix_berlin - Add support for Berlin-A series

 .../input/touchscreen/goodix,gt9916.yaml      |  1 +
 drivers/input/touchscreen/goodix_berlin.h     | 16 ++++++-
 .../input/touchscreen/goodix_berlin_core.c    | 21 ++++----
 drivers/input/touchscreen/goodix_berlin_i2c.c | 14 ++++--
 drivers/input/touchscreen/goodix_berlin_spi.c | 48 ++++++++++++++-----
 5 files changed, 74 insertions(+), 26 deletions(-)

-- 
2.48.1


