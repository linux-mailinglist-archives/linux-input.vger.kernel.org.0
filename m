Return-Path: <linux-input+bounces-5882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA795F7DE
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 19:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFC901F232EF
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 17:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D74198E69;
	Mon, 26 Aug 2024 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiN5Tn69"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3428198A19;
	Mon, 26 Aug 2024 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724692941; cv=none; b=O1NI89r5jgoXOXBN/EHMHv2my4SRlD2n5Yb7GojgDmD6rLTqGhsG4UNO41oD02GK5kPZ5DYHziH+ueX0lJKw9CReaIz32M4bmEAMdQbQXW5eMGR+4tlGBvCC32xZPo3SRh2OLFaq9EodOWdKxpwaNQZ+kDLijrkGJ/rZzIJpjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724692941; c=relaxed/simple;
	bh=r7CTBJC94GF41X3EGpfbcB1QcmiTldVOdP3btIrIfZk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UDa4h5YZWq2YopeONMfea4Y88mG+5zz6BnICVbQ/BF4qREypLWOZLCnynwabm1hVcZUQu7W0RUefGA2TgspS+ecvNHxrTkMoiHpOVpwrkAgif3NKKQ8PuLOygRByGyJE82kuWrjvq+KsVUDc2GccoUkDGlw1hjzv9nzjBXSiqtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiN5Tn69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3852BC4CA4E;
	Mon, 26 Aug 2024 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724692941;
	bh=r7CTBJC94GF41X3EGpfbcB1QcmiTldVOdP3btIrIfZk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jiN5Tn69nUvOzAztOAhI9mayJt6EFM5VpueF6Hb8/uQBwqLAAnxbxtqZNcqeLXjrJ
	 3jwwK3hbEMfmxMLMr1iKuLKLKMYb3AyYyuGZJq5kXwHqkXDM+rN3hZGuhHrlx8pdQl
	 EhQLvAXEOr5wB0ZpskYOxXXGjgI3PRKn2n1AXBKshmL3/7LJeUVDnU6pGIjqzMOWjW
	 kRdDD+006mrs9i5/t6NKJoS5/KFH4IgkKRJYLNcoOGnHhn7kgmSljyfdrl0qwmdd3E
	 aIBWGV/a0pKTPri6P7YkfN+c0g2QlRJV4Fl5HZmqioocyG2DPKKZ8crWItgH23X00+
	 eKp/BTJ6rw2xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4A8C5321D;
	Mon, 26 Aug 2024 17:22:21 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Subject: [PATCH RESEND v11 0/3] adp5588-keys: Support for dedicated gpio
 operation
Date: Mon, 26 Aug 2024 18:22:00 +0100
Message-Id: <20240826-adp5588_gpio_support-v11-0-3e5ac2bd31b7@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
 Oliver Gaskell <oliver.gaskell@analog.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724692968; l=4352;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=r7CTBJC94GF41X3EGpfbcB1QcmiTldVOdP3btIrIfZk=;
 b=SccEhCfVeiOu4QHT8sS6lktUL5mmILhj6ZMT/K+PqI8HLW2fRYeDbg9RBN8YyTUQHo8kAnGkn
 YcjWjJEJpajCrzPgkuaIy7zEoLiHE0HpCmBtgQwYsqbGw9x5yS2gHSo
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

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
Changelog
==========

Changes in v11:
	- dtbinding: Restored accidently deleted characters in previous
	  revision
- Link to v10: https://lore.kernel.org/r/20240813-adp5588_gpio_support-v10-0-aab3c52cc8bf@analog.com

Changes in v10:
	- Corrected changelog ordering
	- Changed dtbinding commit to clarify all changes are made in
	  software. The commit message now also expands on what
	  the desired pure gpio mode is
	- Added acquired tags to commits
	- dt-binding:
		Removed multiple blank lines before the dependecies block
	  	Removed excess headers included in dtbinding example
	  	Removed constraint being repeated in free form text
	  	Merged outlying dependency into a single block
- Link to v9: https://lore.kernel.org/r/20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com

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

V4:
	- Added dt-bindings patch

V3:
	-  Moved device_property_present() for reading "gpio-only" into
	adp558_fw_parse()
	-  Added print statements in case of error

V2:
	-  Changed gpio_only from a local variable to a member of struct
	adp5588_kpad
	-  Removed condition from adp5588_probe() to skip adp5588_fw_parse() if
	gpio-only specified. adp558_fw_parse() now handles and returns
	0 if gpio-only has been specified.
	-  Added a check in adp5588_fw_parse() to make sure keypad
	properties(keypad,num-columns and keypad,num-rows) were not defined when
	gpio-only specified

---

---
Dmitry Torokhov (1):
      Input: adp5588-keys - use guard notation when acquiring mutexes

Utsav Agarwal (2):
      Input: adp5588-keys - add support for pure gpio
      dt-bindings: input: pure gpio support for adp5588

 .../devicetree/bindings/input/adi,adp5588.yaml     | 38 ++++++++--
 drivers/input/keyboard/adp5588-keys.c              | 86 +++++++++++++---------
 2 files changed, 83 insertions(+), 41 deletions(-)
---
base-commit: 1c52cf5e79d30ac996f34b64284f2c317004d641
change-id: 20240701-adp5588_gpio_support-65db2bd21a9f

Best regards,
-- 
Utsav Agarwal <utsav.agarwal@analog.com>



