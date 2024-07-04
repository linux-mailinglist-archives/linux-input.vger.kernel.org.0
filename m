Return-Path: <linux-input+bounces-4862-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB1927848
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 16:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AEEB28B2E8
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 14:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B12D1B010F;
	Thu,  4 Jul 2024 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpRBuEq1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956C1AEFF9;
	Thu,  4 Jul 2024 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103199; cv=none; b=lgLfa0HuMV2usxCpS8x7v/uddAZ8uT2lwZgFEkvoQGMUXSwzGSou1ibx0V4Lqbv5JPEuv1EWCgzRoux8aRYpKqrMzDflYywye++fpqaWgC6ul3khIia/wQlY+BsqDwt267qrhFmGgfgOW+HXL/87TVlTGIk+Vdz9hQROyY+ddgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103199; c=relaxed/simple;
	bh=IIERsF64c/WJrUYOJ4diDo3qtmD4lFTeKkEBt7Ts4v8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LfMDNszO+70yem45NPDUwAjOKZbmPMTOmxcFrz4k3hl1sHKqIM2xObE5oqzGUG2MJPnYw+qIrcpR3s0/gBC3VNGBVOSraYOr4NLP11yaVZ6sbgk8P/suKKr/TylWziqwmeO7ebRFc8SNbSeZUOdyeNMGGhS0L8ovQ1uBMpC52a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpRBuEq1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CAF4C3277B;
	Thu,  4 Jul 2024 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103198;
	bh=IIERsF64c/WJrUYOJ4diDo3qtmD4lFTeKkEBt7Ts4v8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BpRBuEq1Wxme1d1AK1EW17nT3jlM84S+3jKEZLmH85DTZV1VnLIYKqnwO4lcKwoQQ
	 AwTKmksnxDPOslb4zkkgk7D/nr1AJS1Zm0D5BmatmKt9y3Ifp1QWqEOvB6FYzpoC7S
	 hQAS1rEN9+Vxl0sIYj8kdshocRd2JtXf05PRpdUfLLZfAZpDk0y7VGj9g6lvOh9FfN
	 s1fJ07t3lNBB4ywaLgo2ZN3pQFgbVMcNoMsZQZBvHTzmwajZYnq3ZurFcSuNlSegDG
	 MrZN4B4O9Q+qUUx0cDHtvDcPy5lSbijpTLyAhVyJpeeyzyd0hknWsABU+kjxyrspNH
	 J6pazESNOTuug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F5FC30653;
	Thu,  4 Jul 2024 14:26:38 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Subject: [PATCH v8 0/3] adp5588-keys: Support for dedicated gpio operation
Date: Thu, 04 Jul 2024 15:26:29 +0100
Message-Id: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWxhmYC/43NwYrCMBDG8VeRnM2StjNN62nfYxGZNNMa0CYkt
 ewiffdNPbmsosf/B/Obq0gcHSex21xF5Nkl58cczXYjuiONA0tnc4tSlaC0KiTZgNg0hyE4f0i
 XEHycZI3WlMaWBbW9yKchcu++b+zXPvfRpcnHn9uXGdb1BTiDVBLAGFIAyK36pJFOfvjo/Fms4
 oz3SvVEwVVp+47JKls9UOp7BZ4odVY6UyMWYHUB5p+i31F0VrgCNpoNIf1VlmX5Bbq7DJGLAQA
 A
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720103192; l=3320;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=IIERsF64c/WJrUYOJ4diDo3qtmD4lFTeKkEBt7Ts4v8=;
 b=z4MOCfGayCuk90djoSzYVTfI7HW1CgloVcwWxVvjelg3PIhwsseAY6zetjayZ7WTsxHql8NCY
 uYUrtYNq6jgBoAWlrED6ELf7iH4yFZj+TUx7jof4rtz8pBpdMdJpvWF
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

 .../devicetree/bindings/input/adi,adp5588.yaml     | 45 +++++++++--
 drivers/input/keyboard/adp5588-keys.c              | 86 +++++++++++++---------
 2 files changed, 90 insertions(+), 41 deletions(-)
---
base-commit: 1c52cf5e79d30ac996f34b64284f2c317004d641
change-id: 20240701-adp5588_gpio_support-65db2bd21a9f

Best regards,
-- 
Utsav Agarwal <utsav.agarwal@analog.com>



