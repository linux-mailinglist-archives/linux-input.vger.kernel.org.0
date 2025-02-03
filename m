Return-Path: <linux-input+bounces-9730-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606DA261BC
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 18:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE11D1630C2
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 17:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CC720CCD7;
	Mon,  3 Feb 2025 17:51:20 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from forward204d.mail.yandex.net (forward204d.mail.yandex.net [178.154.239.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C183A8CB;
	Mon,  3 Feb 2025 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605080; cv=none; b=SVSeCUM4syvy/vPJCukP2Iw1j2XGh588cxXM2x5nMN/A1bu6z66YRWoIVOcLNxKUohe68CUjhBzXmAJ6T1J4k11mhQGnP19slAU7VZF1IMIEthk9lhg/LSCfW5pl1yBfowlP2EFSBj3MJM6nFOgVD5o4j0Oo1wjYSK/3yd+D0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605080; c=relaxed/simple;
	bh=yQhfC/yggsxzdwf3kw2jCq81VaVX9MTlNmUkAKdj9fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=plbQ6Jxq3icCZTDum2GR+1XX64Pwp5G36zjY4y3y55Gp3wYd79YsXC8dEWu9n0+tge0+1asff16icwHi2lmKhx4QcPqUMUm4EES9DnJtbQVHM3kNCWF6P0eJd2iddtYlkI2BknRI0bH4/ezGyRZwxEf4OFneyjpM/Qnlfp8HW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d103])
	by forward204d.mail.yandex.net (Yandex) with ESMTPS id 1859A64406;
	Mon,  3 Feb 2025 20:43:40 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:3ba4:0:640:5b85:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id 31E2060069;
	Mon,  3 Feb 2025 20:43:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id PhnTWxOOeeA0-EYz3Kaa5;
	Mon, 03 Feb 2025 20:43:27 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net; dkim=pass
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
Subject: [PATCH 0/2] Add Goodix Berlin-A series support
Date: Mon,  3 Feb 2025 18:43:07 +0100
Message-ID: <20250203174309.21574-1-adrian@travitia.xyz>
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
 drivers/input/touchscreen/goodix_berlin.h     |  9 ++++
 .../input/touchscreen/goodix_berlin_core.c    | 27 +++++++++---
 drivers/input/touchscreen/goodix_berlin_i2c.c |  6 ++-
 drivers/input/touchscreen/goodix_berlin_spi.c | 44 +++++++++++++++----
 5 files changed, 73 insertions(+), 14 deletions(-)

-- 
2.48.1


