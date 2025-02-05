Return-Path: <linux-input+bounces-9802-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708EA2963E
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 17:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 053A93A2AEE
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FB91DC185;
	Wed,  5 Feb 2025 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDS4cIJK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1C1D7E52;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772857; cv=none; b=CKMiH6n8kmIycff5z+zfcs67jdGFUXIniTueME7Qntln31zptOuW/23+xChl8ICooV/ZA/G7N18i6eBYoX9FElN2Z8RRMrCd0zUVmitxT4k9kttvEAF+5/73aMN97L9nR/putlQU6VsA2kG4E0gv/tYvYsxKN21DNXYYDOks1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772857; c=relaxed/simple;
	bh=pdvJaLK1YetgfWtC/g4XRn1PEiiMbwT/keJUb2ZUpPw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iqJxDdkUDvBD1EeKsEPFzmmwKGJ9ouIg4wi1x0lPee4Uf4U9EPRrlTMXa6QwQT2unMQs8tlloX4H9T4sj58z5gMim5fY1X797+nhXKFoEKsUZw96xS8dL3kHgDeAVgQkVnMXHd20Pjf+rhuO86uZ1TGg02xooUq6o5a+aCkv6TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDS4cIJK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97A1CC4CED1;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738772856;
	bh=pdvJaLK1YetgfWtC/g4XRn1PEiiMbwT/keJUb2ZUpPw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VDS4cIJKgxyjWsbVKccowfP1QCaNRBRW0tUk1nSxyvv/S1pyH0CESzVj8PORjcD3C
	 ih9gh0ld7bwPiigMUXihJ64ZpL7Whqq7hSJhpGs6kiA7VPqfxau80hYBcUPb/MIDUO
	 Yw5G0FEkdT8VBakEdctjvQ4y45KCwAII60cZkxvnKZrosuiAtfYrAr+daGombAol/K
	 LkKu6NnvhFo/oRp5VV2eHL/USWDbIPc/9qdsY5iQxGLlbX7Qcn6iXbexyXXNMPa0/i
	 y8tEpSWEyhQVkebg591LAsAxqt7B2xy+aRu0DaIC4Yi6xIIBzwdop0RuCXIVhjHM7q
	 vq5nlLlzUs97Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807A7C02198;
	Wed,  5 Feb 2025 16:27:36 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v6 0/4] Driver for Apple Z2 touchscreens.
Date: Wed, 05 Feb 2025 17:27:25 +0100
Message-Id: <20250205-z2-v6-0-cc60cbee1d5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6Ro2cC/13OQWrDMBAF0KsEraOiGWlkp6vcI3QhjeREkMTFD
 iZt8N07VgkYL/9n3mdeasxDyaP63L3UkKcylv4uwe93ii/hfs66JMkKDToAdPoXNRvASNjmYJK
 Sw+8hd+VZR05fki9lfPTDT92cYGnf3C98Am00O8uO2aMx6Xi+hXL94P6mFj7hmrSVoJDGM9Mhx
 g6g2RL7JmTEVGKFEJtMRMmmDrbErQlV4oSkxnoIEXwMZktoTf4fIyE+2TYitQj+sCbzPP8B8AS
 Q5mABAAA=
X-Change-ID: 20241124-z2-c012b528ea0d
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738772855; l=2592;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=pdvJaLK1YetgfWtC/g4XRn1PEiiMbwT/keJUb2ZUpPw=;
 b=ohHUwa25UeGvPAIPFl6IHnroVpZ+96B3w9nWrr5pZpCtYgbIWoKI7jjWSOlH+SqAT1T8DJ2nF
 PQKEcVGn36TBUI8dyW9cHuSLrnPvs9yrKG5HAHWmQyUGiGCp6o/F2xe
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

Hi.

This series adds support for Apple touchscreens using the Z2 protocol.
Those are used as the primary touchscreen on mobile Apple devices, and for the
touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
in charge of speaking Z2 to the touchbar).

Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
The changes since then mostly address the review feedback, but also
add another machine that has this specific controller.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v6:
- Went back to build_cal_blob returning an allocated buffer, other fixes.
- Link to v5: https://lore.kernel.org/r/20250118-z2-v5-0-6d38b2582169@gmail.com

Changes in v5:
- Added missing \ns, removed 4kb-ish of wasted ram
- Link to v4: https://lore.kernel.org/r/20250115-z2-v4-0-d7361ab16ba0@gmail.com

Changes in v4:
- Dropped another allocation, other fixes.
- Link to v3: https://lore.kernel.org/r/20250112-z2-v3-0-5c0e555d3df1@gmail.com

Changes in v3:
- Tx/Rx buffers used in interrupt handler are now allocated in probe and reused
- Other various style fixes
- Link to v2: https://lore.kernel.org/r/20241128-z2-v2-0-76cc59bbf117@gmail.com

Changes in v2:
- In a separate patch, fixed an issue that prevented the SPI controller
  from using GPIO CS, and as such, moved the hardware quirk to there
- Went back to uploading the firmware in probe() instad of open()
- Other changes addressing the review feedback
- Link to v1: https://lore.kernel.org/r/20241126-z2-v1-0-c43c4cc6200d@gmail.com

---
Sasha Finkelstein (4):
      dt-bindings: input: touchscreen: Add Z2 controller
      input: apple_z2: Add a driver for Apple Z2 touchscreens
      arm64: dts: apple: Add touchbar digitizer nodes
      MAINTAINERS: Add entries for Apple Z2 touchscreen driver

 .../input/touchscreen/apple,z2-multitouch.yaml     |  70 +++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  27 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  19 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  23 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 473 +++++++++++++++++++++
 9 files changed, 642 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-z2-c012b528ea0d



