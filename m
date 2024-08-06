Return-Path: <linux-input+bounces-5376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB7948B9A
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 10:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DD9C1F2161B
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 08:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34C31BD4F1;
	Tue,  6 Aug 2024 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tt+hbk+A"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5F31BD016;
	Tue,  6 Aug 2024 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722934168; cv=none; b=nD/fsQOS8Lt0wu51D7S+DkeozDKu9oy69KswfeReQhtl2IpcPJF2hhTofjYD7dqPPTzfUu9k0Mh+BcY7anqeoJeVo9ww/CND7yDyIb3itfwtuzxRvdVXH4kdS5jyFZss+f1LP3rD2zLAZttN+/fw4HqZU/Hyu9lnydiynnJ7NL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722934168; c=relaxed/simple;
	bh=z6BNIWQvDIFzDFRaPnzzCuPXrZTJJc4qFGwxFyDJgYc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=grPz8YnEcj12N2wsa4mbmZBsE93Ecw2wOSOXOSvULOInJMPYysWGLeogYkvsbifGZZLyhZEbstTjjZmWUxY/8wTPtVS1LCDpcs4FAEzO8kBYqCC72ounXxzVRjIGDtOhQ2PABUl7XJo70ad53lTB8wWBu6u7W9ZAr+XLiOt8bNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tt+hbk+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F18D1C32786;
	Tue,  6 Aug 2024 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722934168;
	bh=z6BNIWQvDIFzDFRaPnzzCuPXrZTJJc4qFGwxFyDJgYc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tt+hbk+APODZ+79aGebmSb3xZ0eE5TmPG/RGh/EO4X71g4plRbuSAZ6mGf81pbfF3
	 1gYEZ1VPfitrsVi1E/tz5kJ7oJeG3fzUmD4jkhXqGuaNPoad9cgwu84BiKt/WsekyK
	 qdFvskMwW0oZvVAH+1BRW66f/Zp+dUv3fuiIdN0OQ+Vx0++mKVbc84buMi3gJsZ52U
	 bT4oXax/TwPzrOdIykjzcSdIP0CQNBQVuHfYwzF4Xsa4bfbfKDVvV6nRpAuBW2BNet
	 IgUvEVIiad6wiP6Hfh6nYWMB6F1NHriu1VTw6JCoj7izvY4GnwZxH0Dr3ZSsJUJk/v
	 tWH4JbSg/N8+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A48C3DA64;
	Tue,  6 Aug 2024 08:49:27 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Subject: [PATCH v9 0/3] adp5588-keys: Support for dedicated gpio operation
Date: Tue, 06 Aug 2024 09:48:01 +0100
Message-Id: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEHjsWYC/43NTWrDMBCG4asErasiyzOSnFXvUUrQz9gRtJaQU
 tMSfPfKWaWkoVm+H8wzZ1apRKpsvzuzQkusMc0thqcd80c7T8RjaM2kkCC06LgNGdGYw5RjOtT
 PnFM5cYXBSRdkZ4eRtdNcaIxfF/b1rfUx1lMq35cvC2zrP+ACXHAA56wAQBrEi53te5qeffpgm
 7jgtdLfUXBThtGTDSL0fyjqWoE7imqKdwqxg6A7cDeKfkTRTaEeyGlyFu2tYh5RTFOkMH7EAF4
 G9UtZ1/UH6IBqtdEBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722934106; l=3577;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=z6BNIWQvDIFzDFRaPnzzCuPXrZTJJc4qFGwxFyDJgYc=;
 b=/ifpxzrm/VKkH30SmFcTiMGHhueyyNmb9b62CQ2n+z0olhvOUiEGaDbJr/BVye4sUGEvdFQzi
 CUX9tX4Rbz1C838FBv1DHk2FsQMTeZcRNm8ehjxf1pgLXjBwLMM886o
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

This series of patches re-enables this support by allowing the driver to 
relax the requirement for registering a keymap and enable pure GPIO 
operation. 

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
V5:
	- Removed extra property "gpio-only", now pure gpio mode is
	  detected via the adbsence of keypad specific properties.
	- Added dependencies for keypad properties to preserve
	  the original requirements in case a pure gpio mode is not
	  being used.
	- Added additional description for why the "interrupts" property
	  was made optional
	- Rebased current work based on https://lore.kernel.org/linux-input/ZoLt_qBCQS-tG8Ar@google.com/
- Link to v4: https://lore.kernel.org/r/20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com

---
Changes in v9:
	- Added dt-binding dependency for interrupt-controller. Now if
	  interrupt-controller is specified, interrupts must be
	  provided.
- Link to v8: https://lore.kernel.org/r/20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com

Changes in v8:
	- Fixed indentation in document example (removed extra spaces)
- Link to v7: https://lore.kernel.org/r/20240704-adp5588_gpio_support-v7-0-e34eb7eba5ab@analog.com

Changes in v7:
	- Fixed commit subject for transported patch 
	- Driver now does not setup gpio_irq_chip if 
	  interrupt has not been provided
	- Fixed indentation for dtbinding example
- Link to v6: https://lore.kernel.org/r/20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com

Changes in v6:
	- Restored functionality to register interrupts in GPIO
	  mode(i.e, these are optional but not exclusive to keypad mode
	  since even in pure gpio mode, they can be used as inputs via 
	  gpio-keys)
	- Updated dt-bindings such that each keypad property depends on
	  the others. Interrupts, although optional are now required by 
	  keypad mode but are not limited to it.
- Link to v5: https://lore.kernel.org/r/20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com

---
Dmitry Torokhov (1):
      Input: adp5588-keys - use guard notation when acquiring mutexes

Utsav Agarwal (2):
      Input: adp5588-keys - add support for pure gpio
      dt-bindings: input: Update dtbinding for adp5588

 .../devicetree/bindings/input/adi,adp5588.yaml     | 51 +++++++++++--
 drivers/input/keyboard/adp5588-keys.c              | 86 +++++++++++++---------
 2 files changed, 95 insertions(+), 42 deletions(-)
---
base-commit: 1c52cf5e79d30ac996f34b64284f2c317004d641
change-id: 20240701-adp5588_gpio_support-65db2bd21a9f

Best regards,
-- 
Utsav Agarwal <utsav.agarwal@analog.com>



