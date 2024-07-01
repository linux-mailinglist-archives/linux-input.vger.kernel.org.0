Return-Path: <linux-input+bounces-4769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC28891E35E
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 17:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A78E4282421
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 15:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1ED16C86E;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqcfcZrb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A984DE9;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846303; cv=none; b=GeYMCqOjAbHBDmRfQXs/t7XPbDDHIH3tWVVn9R8PIyCVnYFMPwoHUAALFUeaOaR9pV4flAha7tp1LwLX5+4vElkHnsL9o4+Ky32Yg0C4U3zaXBZlrSZpNCITynDvJTgbXNKDLxGjwcu+1ykJCul5erZ+lvL7pHpGiCHOkIeE54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846303; c=relaxed/simple;
	bh=looVJtFQZcec+jXHJMoRnWIFRehDK3wbXLGpJmuScKU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LTP/bE1RD9B8v8YHD0UzL+xKC7kCRlYF0rcxGeVbyOEdLLY0PiFPwDQnoiiOGp8D3k4whfDG0OTFMAZXOlAwT4G3FOwQC9AT3pPrJUFT/H/5sLs6be+Lc6FKy7FGFuAwDAqx5GLYZFZEmHG6iTwRK+TO/MQ5ecLerswUHcBoKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqcfcZrb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31FA9C116B1;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719846303;
	bh=looVJtFQZcec+jXHJMoRnWIFRehDK3wbXLGpJmuScKU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UqcfcZrbPw1oan2NJpUaBEklGp+k/qH1KmTjYMtf5YhgY71WnghXtsqY5A+LA4HuX
	 UhX77bCjIuAoBbkAsZTwygPM8RYy2712PPN7zfUwBKTxFo/97+sEbMYvJ8+9wct+7w
	 n71ffo/1mGC2626R9yiE2/T3jomAsHhyteaOmSr0VUlNnoenOlDaNPLmz5tKle/LL5
	 EzyE5KEAZxHgO0+5387kXdKb04KySFqI1rYE+iIqwNQiT1OufgKz0AI4yMNqOCTQbx
	 Gic1Jg1o0SqCqZCdpAB0xPSlv/nO2S7IeAAhcw6pOB8AytfPUSQsK5xVYzw7e8NmjV
	 4Lt0C1h2gbrSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCFAC3065B;
	Mon,  1 Jul 2024 15:05:03 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Subject: [PATCH v4 0/2] adp5588-keys: Support for dedicated gpio operation
Date: Mon, 01 Jul 2024 16:04:49 +0100
Message-Id: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHFgmYC/x3MTQqAIBBA4avErBNMsr+rRITmWLPJQSuC6O5Jy
 2/x3gMJI2GCoXgg4kWJwp5RlwUsm9lXFOSyQUlVy1ZWwjjWuuvmlSnM6WQO8RCNdlZZpyrTe8g
 pR/R0/9txet8Pb4Bme2YAAAA=
To: Utsav Agarwal <utsav.agarwal@analog.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, 
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>, 
 Oliver Gaskell <oliver.gaskell@analog.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719846302; l=1741;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=looVJtFQZcec+jXHJMoRnWIFRehDK3wbXLGpJmuScKU=;
 b=cWNWYh5i4IA/s9OTtCFegD8Y7IPG9TExKPDAInMmjMa8tAX0BzwvV3Ls8eq3o6mp2vn8kRDOd
 LooKZhMUTajDt2kVEMp/BIaHeUqq+t00LcsvjeFOBG+LUyOB0NOO/lP
X-Developer-Key: i=utsav.agarwal@analog.com; a=ed25519;
 pk=mIG5Dmd3TO5rcICwTsixl2MoUcf/i2u+jYqifd7+fmI=
X-Endpoint-Received: by B4 Relay for utsav.agarwal@analog.com/20240701 with
 auth_id=178
X-Original-From: Utsav Agarwal <utsav.agarwal@analog.com>
Reply-To: utsav.agarwal@analog.com

Current state of the driver for the ADP5588/87 only allows partial
I/O to be used as GPIO. This support was previously present as a
separate gpio driver, which was dropped with the commit
5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
functionality was deemed to have been merged with adp5588-keys.

This series of patches re-enables this support by introducing a new
property names "gpio-only", which allows the driver to relax the
requirement for registering a keymap and enable pure GPIO operation. 

Changelog
==========

V2: 
	-  Changed gpio_only from a local variable to a member of struct
	adp5588_kpad
	-  Removed condition from adp5588_probe() to skip adp5588_fw_parse() if 
	gpio-only specified. adp558_fw_parse() now handles and returns
	0 if gpio-only has been specified.
	-  Added a check in adp5588_fw_parse() to make sure keypad 
	properties(keypad,num-columns and keypad,num-rows) were not defined when 
	gpio-only specified

V3:
	-  Moved device_property_present() for reading "gpio-only" into 
	adp558_fw_parse()
	-  Added print statements in case of error

V4:
	- Added dt-bindings patch

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
Utsav Agarwal (2):
      Input: adp5588-keys - add support for pure gpio
      dt-bindings: input: Update dtbinding for adp5588

 .../devicetree/bindings/input/adi,adp5588.yaml     | 28 ++++++++++++++++---
 drivers/input/keyboard/adp5588-keys.c              | 32 ++++++++++++++++++++++
 2 files changed, 56 insertions(+), 4 deletions(-)
---
base-commit: 1c52cf5e79d30ac996f34b64284f2c317004d641
change-id: 20240701-adp5588_gpio_support-65db2bd21a9f

Best regards,
-- 
Utsav Agarwal <utsav.agarwal@analog.com>



