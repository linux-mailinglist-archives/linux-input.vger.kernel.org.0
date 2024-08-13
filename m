Return-Path: <linux-input+bounces-5541-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81099501AB
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 11:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCDB81C21EE2
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 09:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB8519047C;
	Tue, 13 Aug 2024 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxzYeR/n"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51928189533;
	Tue, 13 Aug 2024 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723542764; cv=none; b=CNrzKlOVH2GB4Y0Kv9i75HO7BnXMTiPlZxvtwqh9/1jbSD3FFAA8WhDnqmHqsIR6acWuE3I5KwInDLBUyia/bg5nFvQ84J072tRna21B/R0hE+Fr0iUar9BggMuqvwJxjDph5ee7Nt+e/sUvogV9MDPBuEzlNnWDbvlHbKz9pFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723542764; c=relaxed/simple;
	bh=r3ixwT4ejaY1WXYoTRnXA9O5iIKHCzNV0dZx1F6sTuk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lucask4nK4vKnBO1T1cYzmvGNrZlRkoGzNoHd1/qRQsPAhtWPsnXS74lSyea3kQIqs7fIr53Jbov9rkehrou+akL8BTECTPiIBVgaiuQ6RPZhGJxg8RBVaTdoczsHCzjBo+rOEfxur803KnMDCM9VtDkSkzm448grRwR0NGkt1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxzYeR/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0FACC4AF09;
	Tue, 13 Aug 2024 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723542764;
	bh=r3ixwT4ejaY1WXYoTRnXA9O5iIKHCzNV0dZx1F6sTuk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pxzYeR/ngM/D2uS7FiVCP0gz0rjQjHzjVhXz+unDlgtrwfWVoLh0VPOjX2/aDZN3b
	 h8nHa3IMevseRFq8aDzR63Ko0r1ziBHXecLzjV6W9Tw5xAlh/KscBJrYdPa3dkkwoO
	 H3ThqwnmYztnA+m5ryNtREm+4rNPEmelvFdFOVQ6z599DJC9EjVo9Ad24ha59GWFqS
	 bEVdqPJ435/3qMFsfv/UqosuPSg8zieOmdKLix32V2CYeH4nALXTsPrN07Ex3TYUFk
	 XsWvMeNQQBFipTfrmM3DGPBm706teBQsI8v3mNt1dZsx42uzORMTdt6x4/p+loTk7H
	 i2LIFDcqoesIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2484C52D7B;
	Tue, 13 Aug 2024 09:52:43 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Subject: [PATCH v10 0/3] adp5588-keys: Support for dedicated gpio operation
Date: Tue, 13 Aug 2024 10:51:30 +0100
Message-Id: <20240813-adp5588_gpio_support-v10-0-aab3c52cc8bf@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKIsu2YC/43Q3UrEMBAF4FdZcm0lSWfy45XvIbIkmbQb0Kaka
 1GWvrvp3rhSi3t5Dsx3YC5siiXFiT0dLqzEOU0pDzUI/nBg4eSGPjaJasEkl8A1F42jEdGYYz+
 mfJw+xjGXc6OQvPQkhbMdq6djiV36vLovrzWf0nTO5es6M8Pa/gPO0PAGwHvHATBa/uwG95b7x
 5Df2SrOeKu0Owquiu1CdMSp/UNRtwrsKKoqwStEAaQF+I2i71F0VWIL0evoHbqtYu5RTFUkN6F
 DgiBJbRT7oxiudhS7/oWUEMYrUtj+UpZl+QYz3/k+GAIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723542691; l=4164;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=r3ixwT4ejaY1WXYoTRnXA9O5iIKHCzNV0dZx1F6sTuk=;
 b=IQz9G0SArziByu8tFlo26DBKrKLiIn7itrN727zn/+SoM6P7dQbnddP7DvhqsSzTFWNM8tkNa
 dnopI+gT0pTDAd0c+5NpMZIAXOrO2Bme0Ds/Fu2Ou8/j1DdqQWBBOC/
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

 .../devicetree/bindings/input/adi,adp5588.yaml     | 40 ++++++++--
 drivers/input/keyboard/adp5588-keys.c              | 86 +++++++++++++---------
 2 files changed, 84 insertions(+), 42 deletions(-)
---
base-commit: 1c52cf5e79d30ac996f34b64284f2c317004d641
change-id: 20240701-adp5588_gpio_support-65db2bd21a9f

Best regards,
-- 
Utsav Agarwal <utsav.agarwal@analog.com>



