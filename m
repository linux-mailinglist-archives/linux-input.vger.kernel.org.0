Return-Path: <linux-input+bounces-4857-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58F9276BE
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 15:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DFD7B2154C
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 13:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66211AED42;
	Thu,  4 Jul 2024 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoXEjsHk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8F1AE86C;
	Thu,  4 Jul 2024 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098239; cv=none; b=YWOPqcpNLmSY5FdGYWNbiAcpW4+mAIRLimh6ba5CZn9/j59NFn4Zz5H/3wqDnvBhLvTYDw5dOHDsAfIECHZkaWADMtNeQglRSxisTalUyJGsys8T4kh7D8wzK4FDJ9nj1cw3InZEJYw2Gs/mmPp7v4PfwWxCiJ04F1o6WGcUXQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098239; c=relaxed/simple;
	bh=2AmB84rJ+H1phC97QvOBaCPowZ9ESKHEyKQkW8ZWNBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bydmZ34ER/EtVs1CVPXvS5ULIZcRZ6lsH6ZMP3TiO3KdmXn7wtzE5TBXHUfXdsGKkwxubahHH2vpIXTATEIwPC62cLSGjff7jgxqiTQPf9ez8OUoTD74N7LIvqQ/ga130qa5fKDxX4JrIaFWHj46J8NjsKLqytIdM06TptmjCb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoXEjsHk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BD36C3277B;
	Thu,  4 Jul 2024 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720098239;
	bh=2AmB84rJ+H1phC97QvOBaCPowZ9ESKHEyKQkW8ZWNBk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LoXEjsHkHWrhrygI7OphyVHi0ccs6PxUSTv2SojKP1cqM2TdeTv99wx2AD0Xx2LEa
	 E50f/KzfA2zqjSuprTxg5Dg8DvAOMcO6ir2el29J+vKUMvwPRQqP4uvRRbfA40nHR8
	 8mqBLfMG6jd5QSAu40aEda0ajaXnOcqMnrdDEuQ/woi+k87a8QOh75WTD/qf3yZTcA
	 RQggeLMMPFGp8CuOmS4yG2sbWCTRSIdEdIGZYzN77fdkOfN1kmLZjNiQ4DwuG+InQ1
	 gTeIEjfVl+o/prVMKG15YpRewLxjO9I0q7w8R1ZBDzPSbPzs2HYhSf7w5FH/vu5IWF
	 RC/JU8srlM/Ng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23260C3271E;
	Thu,  4 Jul 2024 13:03:59 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Subject: [PATCH v7 0/3] adp5588-keys: Support for dedicated gpio operation
Date: Thu, 04 Jul 2024 14:03:52 +0100
Message-Id: <20240704-adp5588_gpio_support-v7-0-e34eb7eba5ab@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALidhmYC/4XN3wqCMBTH8VeJXbfY9GxqV71HhOyfOig3NpNCf
 PemVwZJl98fnM+ZUDTBmojOhwkFM9poXZ+iOB6Q6kTfGmx1apSRDEhBKBbaM1aWdeutq+PTexc
 GzJmWmdQZFVWD0qkPprGvlb3eUnc2Di681y8jLOsfcARMMICUggAwU5GL6MXdtSflHmgRR7ZV8
 h2FLUrVKCM00fkPhW8V2FF4UpTkjFHQBQX5pczz/AFrAdAWRQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720098233; l=3138;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=2AmB84rJ+H1phC97QvOBaCPowZ9ESKHEyKQkW8ZWNBk=;
 b=8T83b7xxbLlPX3edoVuhyVN43HBD3J5griutdunQuYXldcozJAvGxyjp/kQ8gZSipN1AcXbbq
 a1sOZpB6x/hDkr4uuqxH1k9zsoab6iNQ9PI+2YC8Dx+jHtu9omdztC3
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

 .../devicetree/bindings/input/adi,adp5588.yaml     | 46 ++++++++++--
 drivers/input/keyboard/adp5588-keys.c              | 86 +++++++++++++---------
 2 files changed, 91 insertions(+), 41 deletions(-)
---
base-commit: 1c52cf5e79d30ac996f34b64284f2c317004d641
change-id: 20240701-adp5588_gpio_support-65db2bd21a9f

Best regards,
-- 
Utsav Agarwal <utsav.agarwal@analog.com>



