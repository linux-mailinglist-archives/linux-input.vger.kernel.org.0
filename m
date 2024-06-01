Return-Path: <linux-input+bounces-4008-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D18868D71D3
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 22:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC851C20BD4
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 20:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94245154BEE;
	Sat,  1 Jun 2024 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhM3MrL4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6433018AEA;
	Sat,  1 Jun 2024 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717274686; cv=none; b=c3KvmyzC38s8YVy3DIVUR814/5OkZVcMhcYjDREZVAhZbmnorRT/Dq82pbqeAwHjpYUCTrk8pqOPFmU9T3IfTfEccqmLzCr6S9bSr6DhHQSG1SJPYZWmhyEoE+qyEgaLneUk1PHoGyBDMYU8dksdl1hTiuLhZm/9xAPd+KxwJ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717274686; c=relaxed/simple;
	bh=ucyVFpd6nuxP73wDf/4LvLL/dnRjiWP1Eo2RxRQIs34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wz9cCIFUruqBUBM/q1uaNVePs4m5GPXYg46C9A0bUqz9yaHyiTZRTbVNiyI3aK1+ogMA/lHLyvq4bEPxb+vOkWwympBuQMmDXtAn2ZvkkkEArHhOarjAvb+0raCVbAKPr9BTWxWxudzWBsQuoONsBVWdEbNAQih3KfTwl/g5XJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhM3MrL4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D21D6C116B1;
	Sat,  1 Jun 2024 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717274685;
	bh=ucyVFpd6nuxP73wDf/4LvLL/dnRjiWP1Eo2RxRQIs34=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XhM3MrL4/VdxYM1DsM02+hIeAeLpOS2Cf+N39rPzYyAYXdBbaczhgkKkPZ83GGezH
	 n0GrZY7CWc4sj5EWZ6UwtOVG8ZwBBs8pb1BaErLtIvddFbP0qVcnwXPfX0yFWZg+kf
	 HvjmKbpiIpWZb2y/fPYtmFXomRbVw9rBVAPZfhd6F1x4rb9/eQi9y8ufCfuRzaTY9b
	 TtEozys5JFAP9KeKw7EmEoNcvEWjT1ntv+0B1e9/Ep8lv/18mP5dy7J+TYo6O79c22
	 vZxdexYr5Q1KpNqaUxyqVsAb3jS4o3Qm5/iALSvvO1/dtoVwYkyteKnUHMxlQfUUKG
	 b0qzLRf6m8qJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC642C25B76;
	Sat,  1 Jun 2024 20:44:45 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Subject: [PATCH v5 0/3] novatek-nvt-ts: add support for NT36672A
 touchscreen
Date: Sat, 01 Jun 2024 15:44:42 -0500
Message-Id: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADqIW2YC/43PTW4CMQwF4KugrJsqyZj8sOIeiEVw3CESzIySE
 FGhuXsDqgS0m1k+y/qefWOZUqTMNqsbS1RjjuPQwvpjxfDoh554DC0zJRSItbR8qIWXzEPbRSq
 JiCfqLydfxsTzZZrGVLhHR+AOxnqpWZOmRF/x+mjZ7Vs+xtzWvx+lVd6nv76Si/wqueA2GK1Rd
 y6g3/ZnH0+fOJ7Z3a/q1YRlpmrmwYADIzqLAH/N7tXUy8yumd5bG6RADO7fnfA0tVj4OzSTBAp
 pADTg253zPP8AuTroZdIBAAA=
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717274685; l=2348;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=ucyVFpd6nuxP73wDf/4LvLL/dnRjiWP1Eo2RxRQIs34=;
 b=OM1UQVsBzxv1skZr/cVdzZl9c5R6Wef2ecEp4VLFfMEnYjV9yH7BtV3rE052YLaSSArUGSpk9
 0pTEESVpoBDAR1971CKYG9j0rR7L+UBNwuhPLNb/jKRq7a8H2k7/Ijg
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

Extend the novatek touchscreen driver to support NT36672A chip which
is found in phones like qcom/sdm845-xiaomi-beryllium-tianma.dts.
Added devicetree support for the driver and used i2c chip data to handle
the variation in chip id and wake type. Also added vcc and iovcc
regulators which are used to power the touchscreen hardware.

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
Changes in v5:
- Made the chip data a local variable as it is only used during probe.
- Handle the regulator disable correctly for all exit paths in probe.
- Link to v4: https://lore.kernel.org/r/20240601-nvt-ts-devicetree-regulator-support-v4-0-e0c0174464c4@gmail.com

Changes in v4:
- Use lowercase i2c device id as suggested by Hans de Goede.
- Disable the regulators after nvt_ts_read_data during probe.
- Link to v3: https://lore.kernel.org/r/20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com

Changes in v3:
- Fix indentation in the binding as suggested by Krzysztof Kozlowski.
- Picked up Krzysztof Kozlowski's Reviewed-by tag for the binding.
- Link to v2: https://lore.kernel.org/r/20240524-nvt-ts-devicetree-regulator-support-v2-0-b74947038c44@gmail.com

Changes in v2:
- The generic i2c device id is now replaced with the correct IC variant
  provided by Hans de Goede
- Updated the bindings to reflect the latest changes and also incorporated
  the suggestions provided by Krzysztof Kozlowski
- Link to v1: https://lore.kernel.org/r/20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com

---
Joel Selvaraj (3):
      Input: novatek-nvt-ts: replace generic i2c device id with specific IC variant
      dt-bindings: input: document Novatek NVT touchscreen controller
      Input: novatek-nvt-ts: add support for NT36672A touchscreen

 .../bindings/input/touchscreen/novatek,nvt-ts.yaml | 62 ++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 drivers/input/touchscreen/novatek-nvt-ts.c         | 67 ++++++++++++++++++++--
 drivers/platform/x86/x86-android-tablets/other.c   |  2 +-
 4 files changed, 125 insertions(+), 7 deletions(-)
---
base-commit: 6578aac6a270bd6deb9f9319b991dd430de263dd
change-id: 20240518-nvt-ts-devicetree-regulator-support-ac9e49b78a16

Best regards,
-- 
Joel Selvaraj <joelselvaraj.oss@gmail.com>



