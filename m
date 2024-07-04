Return-Path: <linux-input+bounces-4847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9092744A
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 12:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40EBB281D96
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 10:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8AA1AC229;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Me0NPVPp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5FB1ABCDA;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089955; cv=none; b=ESL5yQaQlQxSmvnz8dRG6KVvxKaxqwElJYv5IGi+2+CyHRwiVwu7//gDyMLAXlrxxvaE7MXMiEzTEaDjooJkDFvoLZjarAsMRFXVvNyrn2toX4HzqLX+KJpt4BtxsLWXRwC8dUaDXoHGFkfwHdkT2G42slLsrFqjsi5LCQh0HJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089955; c=relaxed/simple;
	bh=i7wfG9Fdxmkr7nO+NUzpAIJ6uy6NrQsfIPnzHnqXIHY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mConaOoJpYayTFwmjVMJIgSD4ZiMLgkj3hPyjlTOOgxLQpeZ7ihIlgwgky26IpW62YD0TYwzcnwWR2RmYTj61e8Jd4rtkt8XQr+wXLxGHbtZCjhEdxv1Bb5sUObT3+EbL4V22WaJjhAYCtgm4IegKxNcOhyTOxk+lV8AZ4zJGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Me0NPVPp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10E10C32786;
	Thu,  4 Jul 2024 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720089955;
	bh=i7wfG9Fdxmkr7nO+NUzpAIJ6uy6NrQsfIPnzHnqXIHY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Me0NPVPp/wNCMqjiOZuZIeak1MMGchPcHhGOiJm0DcDjwAVS4zmmN7SyS9C5b/OYa
	 H5ZgzsJoVaKFWSiiCLlqhijEawU3PbuYQXjYoblp/kG7E6jzal77QSfGeDsSgRXZki
	 hqYWAiu88LfTtZVp5QKOdDhWIFyqF5zwz2aYUPVdU8oa1LDWmt+4iUj2aB+JIvlTe5
	 kYz9OOXIZSngBwJP19aewb/xUVbcUiS9qqi9GclHZCuV8SWffBonlbXZsJ25DHlPrJ
	 uHu0SkSbElNZFwmW8yemhqWmYOY5Ct1PqIIrcfm+ra+f7sAFLm9tNVTycDLUOMV4jC
	 o97ixew8SJEPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34EAC30653;
	Thu,  4 Jul 2024 10:45:54 +0000 (UTC)
From: Utsav Agarwal via B4 Relay <devnull+utsav.agarwal.analog.com@kernel.org>
Subject: [PATCH v6 0/3] adp5588-keys: Support for dedicated gpio operation
Date: Thu, 04 Jul 2024 11:45:44 +0100
Message-Id: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFh9hmYC/4XN0QqCMBTG8VeRXbc4zs3Uq94jQjZ31EG5sdkox
 HdvehVBdPn/4PzOQgJ6g4E02UI8RhOMnVKUh4x0o5wGpEanJgwYhxPkVGonRFW1gzO2DQ/nrJ9
 pKbRiSrNc1j1Jp85jb547e7mmHk2YrX/tXyLf1j9g5BQo50pJ4FxgDWc5yZsdjp29k02M4lMpf
 ihiU+q+Q6lBF1/Kuq5vOXyeYP8AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720089949; l=2846;
 i=utsav.agarwal@analog.com; s=20240701; h=from:subject:message-id;
 bh=i7wfG9Fdxmkr7nO+NUzpAIJ6uy6NrQsfIPnzHnqXIHY=;
 b=YjwSizdEhP0Kk655mKGPdzeZiVp1QyNld37m6xm/ngIvyJ2WjUs/z/C0Uu0xsAEyvG9FWb2f1
 ljIuiwwunz+D2F8WFJ94orm6EFVRcFe0hKKjWXHsWPTy//vTQQECgC1
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
      iInput: adp5588-keys - use guard notation when acquiring mutexes

Utsav Agarwal (2):
      Input: adp5588-keys - add support for pure gpio
      dt-bindings: input: Update dtbinding for adp5588

 .../devicetree/bindings/input/adi,adp5588.yaml     | 46 +++++++++++--
 drivers/input/keyboard/adp5588-keys.c              | 76 +++++++++++++---------
 2 files changed, 85 insertions(+), 37 deletions(-)
---
base-commit: 1c52cf5e79d30ac996f34b64284f2c317004d641
change-id: 20240701-adp5588_gpio_support-65db2bd21a9f

Best regards,
-- 
Utsav Agarwal <utsav.agarwal@analog.com>



