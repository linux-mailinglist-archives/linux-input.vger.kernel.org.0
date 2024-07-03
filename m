Return-Path: <linux-input+bounces-4807-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F00925E2B
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 13:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F40FB3614B
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 11:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074D219D8AD;
	Wed,  3 Jul 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+cyatzg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C960E1891B6;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004302; cv=none; b=uv/6DfvW6elaP3vRfbR9RrvfHFTFyxHt03lkQaxml08GBLrHSFykGvntjUYf70Jp856b9XiC7AQa6T0DlkQggnDbxd4UA7JnE4QNpAYBq63VYSfYXadJibuuXZF38HyVGAkV0SK5M1mZSJ96+pdjMj29/tbry/cc3VBzxag1SqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004302; c=relaxed/simple;
	bh=ZKBZXqTb3GYcej9sBFGWNtjDUyV0Rn3CMeoWjdQoMDA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HDZztUYC2Lya2+G0UwdxpltO2/TVuSRCl7XuxGTWBX0sh4jK5cskLLvBtYJsa67xIymxz7nJtkGGKCXLAz4ZG4mORW42/eqL05YYRuWD+N5iRWz2w6ZwNFpNIbvUxlmPLafbkYinn61akp3E5qQf1dbmR6uF2TDKjBnCcc0xaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+cyatzg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 907E1C32781;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720004302;
	bh=ZKBZXqTb3GYcej9sBFGWNtjDUyV0Rn3CMeoWjdQoMDA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=I+cyatzgwZSzFZqgft1lCda9R3boMN5wwvPMQl0eLu0p0JyFqixrZ2wRNjopEmK0k
	 lMA1bTcgG0eoiR5QQMHOlWN3oykSPpCHKujOIMWWwgDCrD1K5nTIRBnkQO9gd0OJsx
	 0d7jxY/7ToA6rHZdoGHqn0iVMxDmuoTqTOV7ddfwHmXhYw6KTULh54Uj43np3GN8IL
	 hnAtcIA5efKhKhRUGnkpCqihGX9X3jhptYk7IAACPNLPAYuiNXNx1DObUwVnw6JHZC
	 XPago3eB5gQBYHb+hr/UIwLhrJRUlWQQELxFjzH07/TdEptwGXlzQWa2X8HYIwRHmU
	 Tjl46bQeytIMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FBBC31D97;
	Wed,  3 Jul 2024 10:58:22 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Subject: [PATCH v5 0/3] adp5588-keys: Support for dedicated gpio operation
Date: Wed, 03 Jul 2024 11:58:13 +0100
Message-Id: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMUuhWYC/4WNQQ6DIBBFr2JmXRokQ6tdeY/GGBDUSVogYEkb4
 91LvUCX7yX//Q2SjWQT3KoNos2UyLsC8lTBuCg3W0amMAgukF95zZQJUjbNMAfyQ3qF4OPKLtJ
 ooY2oVTtBmYZoJ3of2XtfeKG0+vg5XjL+7J9gRsYZotaKI0rb8k459fDzefRP6Pd9/wJQTla4u
 QAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004298; l=2339;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=ZKBZXqTb3GYcej9sBFGWNtjDUyV0Rn3CMeoWjdQoMDA=;
 b=F5tQpXuKWFwC+womE91xcSEaMlAf2+LITtvgdoV2FfCwSH+UNmP1DrAbVZZpGx9lHkr8+ioKN
 HZ+kRE5RfHnAIUoFTjct16dDojVUrrAb5whPZduEy9pRdP1N7DJe+M2
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
Dmitry Torokhov (1):
      iInput: adp5588-keys - use guard notation when acquiring mutexes

Utsav Agarwal (2):
      Input: adp5588-keys - add support for pure gpio
      dt-bindings: input: Update dtbinding for adp5588

 .../devicetree/bindings/input/adi,adp5588.yaml     | 33 ++++++++--
 drivers/input/keyboard/adp5588-keys.c              | 70 ++++++++++++----------
 2 files changed, 66 insertions(+), 37 deletions(-)
---
base-commit: 1c52cf5e79d30ac996f34b64284f2c317004d641
change-id: 20240701-adp5588_gpio_support-65db2bd21a9f

Best regards,
-- 
Utsav Agarwal <utsav.agarwal@analog.com>



