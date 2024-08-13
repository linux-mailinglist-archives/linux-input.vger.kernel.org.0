Return-Path: <linux-input+bounces-5556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81062950D99
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 22:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 393882836E9
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 20:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4A51A4F23;
	Tue, 13 Aug 2024 20:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="at2a1ZgW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8544C61;
	Tue, 13 Aug 2024 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579722; cv=none; b=hoSwiNwAPa+dMWTkzSCt08ZwW4E2YeXD49kCQA7NKASPgCq9Z/d/lk3ip1rT0FC2NCDN8lQuWMhGhtlyL19OVXxZugF9INAl1yHpZGRJonNw/AATlzUbp5jMi3RQxJhXJSb3nrnFTgTEz7IvqQ57HlwP26FYQnyEqLoaZS47EtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579722; c=relaxed/simple;
	bh=IHVCkzfRVwRcrgQI0uynjD8r+bXwAWdk1AbhMeu7VsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rPIvB0siUg/wDYJGuHi1t6rEO5ncxXoHtO/ZZ91aaoIV+rzVOIXC0DP+eRPI9T80VJbBmhNF9jQ4IFGiHRN8zJvipceCLXOPxaaI4c4/tZT5dVMxAAsZ7lxdfRwOHswGqb51oC40fo7Q4JW6N8Pb9UyjhdwQm5bZ9b56E4Xbx0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=at2a1ZgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9282BC32782;
	Tue, 13 Aug 2024 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723579721;
	bh=IHVCkzfRVwRcrgQI0uynjD8r+bXwAWdk1AbhMeu7VsY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=at2a1ZgW5s+f/kB6aEi+Q6Ukh0O9e7jJKyWBFcCq7eP7OELvRIqDr5IFIrbq+HtWE
	 GQxCHx7OtjWOxq87/BWd6t0v+HJCD4GcpRFeI4fJXrNAp3vC468yroD6XBZklwrqVI
	 cX4A7fEL8+gUAD2Nd2UGIZa8KYFxDzncmtBTIU1W83A/l3+qB8kjcoMU/cGV2z+g2w
	 9DxSGVRfdXhRxDYSjczfqrhC1xetADoaN2I5g9ao9VSWju2dpEzLSktGp0uRFdZngE
	 3kcU30BpVNGo3cp1yOzx90Asdysy9M3FFTKl++7czcRCAyNClTMkeASr+F8PTThMcA
	 D9q6Z/nOBmEMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB6BC52D7C;
	Tue, 13 Aug 2024 20:08:41 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Subject: [PATCH v11 0/3] adp5588-keys: Support for dedicated gpio operation
Date: Tue, 13 Aug 2024 21:07:16 +0100
Message-Id: <20240813-adp5588_gpio_support-v11-0-9ea490d6c41d@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPS8u2YC/43QQWrDMBAF0KsEreuikWdkuaveo4SgkWRH0FrGT
 k1K8N0rZ1MX1zTL/2HewL+JMQwxjOLlcBNDmOIYU5cDwNNBuLPt2lBEnwuhpEJZSSis74mMObV
 9TKfxs+/TcCk0eVbsFdi6Efm0H0ITr3f37ZjzOY6XNHzd30y4tP+AExayQGS2EpFCLV9tZ99T+
 +zSh1jEidZKuaPQotSNC9ZLX/6h6LWCO4rOimNNBOgrQN4o1SNKlZVQYuAqsCW7VcwjismKksY
 15NEprzdK/aMYqXeUetnFawDD2msqNwrIFQN784LMjrVcOlLOGW5+OfM8fwMxfQbZYAIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723579648; l=4364;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=IHVCkzfRVwRcrgQI0uynjD8r+bXwAWdk1AbhMeu7VsY=;
 b=XclfHEzU5JHAwyGfDjOjhwxwNPjbuVDLqk3ZcZVnUE9tc+vsGUOHEE6OuL2tPkfADU03z+BRJ
 m6gMpKFtzkqCeIk/wsVZ2tSXuMaIpwJHfFN0zytrVr6JCR7noS3l+Tb
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



