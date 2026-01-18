Return-Path: <linux-input+bounces-17187-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F4D399B8
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 21:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14BA330080CD
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 20:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E1C2882D3;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Syip5o5i"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC10D3019D6;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768768203; cv=none; b=aUztw9QSAvgDn7bQQeR65365atrhi8OUw89kar+zmQxagmnI0+G300HJCh9uZz/yXlHb24rMTGmCipBGgJ8HlOuMTTDLZ0QjRgkvd/2xIl/7CHSMrzEa3NeY+QIB0Pw9FvZUy7+El1gHF+QIw96FyyFIKHWRK6+aDlC8HgJw8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768768203; c=relaxed/simple;
	bh=G/9amyEzzmiJq2m54aS8SBqpO+PBlemTSa23Ha0ZoEM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fzjO0FdwhymqaXd6uSchJCT9VBJfZIZxv98eJhu10KIEc1laBpITJvRBlQqOQ9/l5ud2TGZixicJ1pcpU5E3w+R155uBnnyvy23tsVQFIopC4zqh1Vp5pE9OPBYhzS91sHJrfRf5iJIBeuVOkAx/3Miv/6iST7iYvzxNkCNbpa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Syip5o5i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3958CC116D0;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768768203;
	bh=G/9amyEzzmiJq2m54aS8SBqpO+PBlemTSa23Ha0ZoEM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Syip5o5iHTfAIlQvh+0vxdR6fL/+sr6ZBUMu59k23V1WQ9vYiW/IE9EumfA8k9xLF
	 JfhSbSZNlgAnT6mVWtQ7gBI6dmzH1PwLbk3GuHVFsvrMJTJEbAaehf87NJ/wHavX5p
	 CoFYtMd5DTXv+0WD6gmm/qwel+gSWyKjHUBGz7AQ4DPCiEaleP6Y2xqFQWV/j7My8s
	 YOuSab34QouRwkQgKtahHjx0CG10WomsQ5b0bPhNpAYp26VzSMV2WIPkNIoWuir6xW
	 vS/X7DkiTp0A1qo+0mUMo31Ut6WrntP8uXRXSMqeWxZm2VTU+kyOwz906zH6lzo9LD
	 rocl5bDLVsySw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2251AC9832F;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] Support FT3518 touchscreen in xiaomi-laurel
Date: Sun, 18 Jan 2026 22:29:39 +0200
Message-Id: <20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Nyw6CMBCF4VchXVvTDhfBle9hXPQypU2EkhYbD
 eHdLaxYGJf/SeabhUQMDiO5FgsJmFx0fsxRngqirBh7pE7nJsCgYZyXdPYvZaMKiCOdxKwsRip
 RQg2N1LWRJF9OAY177+r9kdu6OPvw2Z8kvq3/vcQpo4Kzrr6YErRub/0g3POs/EA2L8HRqH4bk
 I0KeG26SrVCiqOxrusXfdJoOfoAAAA=
X-Change-ID: 20260113-touchscreen-patches-beb2526bd5fb
To: =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768768201; l=1451;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=G/9amyEzzmiJq2m54aS8SBqpO+PBlemTSa23Ha0ZoEM=;
 b=CzqIUrFiXPJaAbwT5V0zOORFeJKtZ3GOsStPT1L0P/MKQb/u7Qi4P6BtGbGDTCAMz2WkZa10T
 pCG6T0xZZGoBpD7MFTU/IYygZMVfZhnsRR+sBJA4I/PVB2UKnuZ4IrY
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com

Adds support for the touchscreen in the Xiaomi Mi A3 (xiaomi-laurel)
 smartphone, FocalTech FT3518

Original tree was here:
 Link: https://gitlab.postmarketos.org/SzczurekYT/linux/-/commits/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Changes in v3:
- Rename regulator node and reorder nodes
- Add gpio pin configuration for pmx_ts_* in sm6125, and reference in the
  touchscreen configuration as pinctrl-*. Doesn't have configuration for
  the gpio 83 pin since it isn't documented downstream.
- Link to v2: https://lore.kernel.org/r/20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com

Changes in v2:
- Fixed name and email in signoffs
- Link to v1: https://lore.kernel.org/r/20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com

---
Yedaya Katsman (3):
      dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
      drivers: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add Focaltech FT3518 touchscreen

 .../bindings/input/touchscreen/edt-ft5x06.yaml     |   1 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 113 +++++++++++++++++++++
 drivers/input/touchscreen/edt-ft5x06.c             |   6 ++
 3 files changed, 120 insertions(+)
---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260113-touchscreen-patches-beb2526bd5fb

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>



