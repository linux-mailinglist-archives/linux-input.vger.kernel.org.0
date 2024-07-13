Return-Path: <linux-input+bounces-5022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5D930623
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 17:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C633F1C20C81
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 15:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688A113959B;
	Sat, 13 Jul 2024 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="G5IhIY+h"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B8F21A0C;
	Sat, 13 Jul 2024 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720884515; cv=none; b=JlqI2AmrMPV3VUx+iMUycY9k35catixBNh/RtGAlb2pdBeZoYd6L3b6PTZtHfq7KvNPMKVMtPeh6Ovj7az9KsblKpTHSvHSTVysuD7/MBO2lqCaXcM6bC/gCm8XGDnG7ei+n1O/5j50iIoNNuH52Ud3ZYlz/Z0VlgF/d/wnXmWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720884515; c=relaxed/simple;
	bh=uMTAAyeF3I0QRs1D9Thykfo5n67qdtlh32dyUvRJIoo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TdkS5f5a6f1S4FACllYJTJgVNHs9KGUDDRuBhQCHhMq0i/b378n1t2s+kugZjBSwh+ZM6MSHl4lBK0NMBVsYQDeo0h6m7MXwTp3pi1uAnmV9GoIN85flYItb4Lrj212JfP5Zdk/52ouH7lHd8zsbp6g/NxBttTGW8URzrwCIIOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=G5IhIY+h; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id B866041C8F;
	Sat, 13 Jul 2024 20:28:29 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1720884510; bh=uMTAAyeF3I0QRs1D9Thykfo5n67qdtlh32dyUvRJIoo=;
	h=From:Subject:Date:To:Cc:From;
	b=G5IhIY+hzLUgB2+zZERB6VH7mZHf6LYKbsS1yTvy5+TOQCMHrsm22m9irtp2j5DaO
	 5uDtlFNZKE1FipkRqOWwazjxPnPfLHrF+VL2ybJOGiDFZBzEmxsN1VwQP8+xBlcavT
	 uqaDAhtpnQc4Ln0NGw7qd6hAYG40XGJgz/m6yptMgc06Ev1nVFgV6VO92gmKvbzG5a
	 2NI3ngG1X6fV/ck0590J8Vw41HqaPVfpj+UA3WczTgWIjbFHl/rP9iogEj5XabQiw3
	 SUE4/TygUdF5wxT9et14Z6HFhlimUJ3kJ85bJNhuW6Vcl+lTM/A1kplXAkCR0St3Bg
	 VWPH7wADSAkyg==
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH RESEND v4 0/2] Add touch-keys support to the Zinitix touch
 driver
Date: Sat, 13 Jul 2024 20:28:07 +0500
Message-Id: <20240713-zinitix-tkey-v4-0-14b7e2d5ace3@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>, 
 ~postmarketos/upstreaming@lists.sr.ht, Rob Herring <robh@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=uMTAAyeF3I0QRs1D9Thykfo5n67qdtlh32dyUvRJIoo=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmkp0Zc2nj0SsIZOwWjGazismdji9qaqfTRSH6w
 3D//V9GTnSJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZpKdGQAKCRBDHOzuKBm/
 dYSkEACHYHVmvgzOctNOVoOUf7LrEd8yvYB2Y+qyH5992SeG/fS+MBl+o7scaimlMf+E7kWJWNa
 dZjFvfuKgePllnn19GLKU45cxzqaFXOc8Rz0raHCw1rKr9mmXjOjEG8AHG1DKTy4SD3y/XK0sIk
 +dmZCBA72qzF5Zn5nvNEy1Qrz1OGw2X7mwD3x8xFVzjlrdrvpmzuPZnI6/TySMLOB4EnRgpS2rj
 PECmNzisFWR4EX7cueDGbymM0yITHbkqcut3SYCrA0Okd4BtLH0diIf3yWCjePa43Bwp1H1RxZa
 uIVl6B+1ilR5PBhcv9p5SgIXskNTxi22UyLvElzMEnULaDEKTQ02a/LOOnw+4MUPB3iLI4zHAgJ
 IKlypNf0WXRrNXsGsYh8C4e1B7P03aAXEEnEX1HxVCptvzjDl+tjkWzYH2GpOlWXp5g15Mt7XeK
 HIluFh3avJzwdY52Km/l6JtUS37drfxoIa90QBo1xk286V+KGz0XtjoWqSh2Nw1XCPot1l8QDgn
 wgn7BffUwkBQdg1pa39H/K5hnJhx3Wg54MshbitRawXcH7277tv2dtfmRoLYmpe9QXJSVheYLwd
 9v66dM+0CkTlzfYrNFOldXjpunL0KJU+uNRiu41RUWwcHb+flZNzhWdvpQewxV9xyl9PIIQrYGg
 WnoaGHCDPZ+FhqQ==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

This series adds support for the touch-keys that can be present on some
touchscreen configurations.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Changes in v4:
- The series was partially applied, these patches dropped.
- Link to v3: https://lore.kernel.org/r/20220106072840.36851-1-nikita@trvn.ru

---
Nikita Travkin (2):
      dt-bindings: input: zinitix: Document touch-keys support
      input: zinitix: Add touchkey support

 .../bindings/input/touchscreen/zinitix,bt400.yaml  | 10 ++++
 drivers/input/touchscreen/zinitix.c                | 61 ++++++++++++++++++++--
 2 files changed, 68 insertions(+), 3 deletions(-)
---
base-commit: a734662572708cf062e974f659ae50c24fc1ad17
change-id: 20230801-zinitix-tkey-5a3023bc304c

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


