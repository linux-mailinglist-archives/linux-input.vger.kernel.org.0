Return-Path: <linux-input+bounces-10611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E1A5644E
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 10:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27FFE1892D53
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 09:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8959420CCF5;
	Fri,  7 Mar 2025 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lHwrbHYE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A01D20B1F1;
	Fri,  7 Mar 2025 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340917; cv=none; b=C9TNOK5inlJMUpwLlbKi7Tu5Zoz/Epc65AoPtO4AmM+s/mzMVi/xBeseRdKaL8hZeWIMO37W3ThSYHz2e3cWHfX/JhpzZ7K+1FXn0J5YwEuPStumQ8aj3pbbPHUiqTmW/5ukbXXkliSwHWWcldt0V7bP52pqJYPFTWYBG3WRXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340917; c=relaxed/simple;
	bh=fkL6jmFr3d63PEsNWtPGrE+L422cPzBDrwITjTLPbfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dP8HdrBu9mYaBlL+L9kLkoRexb61QDQ41lZhVHYDP3+jQpyEisr3O/bmCZyD0xinGh/8VNcsjgcTbZLZC5OWnEt2S6eB9WJc6xvt/vyKTarUeYdlaoyuFzpUwoos7tG3rqz/IAXqgKodXWDziR+bbfND7/izZz8BfwmTLIF+7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lHwrbHYE; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from karma.space.aachen.ccc.de (xdsl-78-35-222-202.nc.de [78.35.222.202])
	by mail.mainlining.org (Postfix) with ESMTPSA id DB784BBAAE;
	Fri,  7 Mar 2025 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741340905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KjWv8YhyFWBOjGNKwkG6xxoYNxmGePkmbs3b2HdBSqw=;
	b=lHwrbHYEWm46ANmSvvTB4i86GezMUMQTMIZDC9XWplBhIUotGKARzYx6gQ2jI8IwNVWLwP
	OPBdhJSk/m922Ap+96w3V4YH+5x1CRTPDqSdyDHm2KVdxSfLL3Bs038F6LeP+NBOP7vHMG
	aWOn4AebMpzzbZQJtd8eDw8n5q7pZh4P6hILzL2E/vkdgeJEGd7WYu+q99cE88LMIjPGkW
	KAjrZPwCLc3/sZpmXh326qtO5iNQlAHa2rUtWGFPIcpvpU4Mc+DDuUUtN2QQc/6hiYxexx
	hPxMltmqUA10ppjLzHX7NZj8guTvcG6ar9RzOq77AFDq6i462s7LjmjXWnmubA==
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
Subject: [PATCH v3 0/2] Add Goodix Berlin-A series support
Date: Fri,  7 Mar 2025 10:48:21 +0100
Message-ID: <20250307094823.478152-1-adrian@mainlining.org>
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

Changes in v3:
- Store the ic data in the goodix_berlin_core struct and pass it to
  goodix_berlin_probe from the i2c/spi probes (requested by Neil)
- Resent from my now preferred e-mail for kernel work

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


