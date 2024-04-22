Return-Path: <linux-input+bounces-3164-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA508AD2A1
	for <lists+linux-input@lfdr.de>; Mon, 22 Apr 2024 18:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A12B91F21A96
	for <lists+linux-input@lfdr.de>; Mon, 22 Apr 2024 16:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BF31552E1;
	Mon, 22 Apr 2024 16:45:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA30154C0E;
	Mon, 22 Apr 2024 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713804322; cv=none; b=W1pIowQQfOn0jeQVnfG4r4B2v9DJckAjcx9gf8JxvwWufTcPvBz7SMEIQQf+QWnNtBDPO/ZLvvd/ykaql4vBjyUA7AALcRktD8jzdcrpxVaYgKN3CF6h21vc2cknBLhzR9wQ3g/2EbZslnUl4kZd5sGqKJBZMhfj3VxVhLu/0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713804322; c=relaxed/simple;
	bh=bDfz8x91zE22UkKEC6UGD7/fU46MiX1k/M7h9i6afrg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hWPUDT51pTXJ9RNd8brFNh6Zj11Y6sfw+/1crakgI9TSy87cJNa6sSCRjAznOl1XqVp9zez25MLaFfp6BDEfG39bXmtSx3wEKNjGEy5BF4zRMMSoTY16paTzVSBVKuEYLLn1g/4COrAHypeJUn4tbKplzBPl47bA5xG0vvf2YAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 246FD339;
	Mon, 22 Apr 2024 09:45:47 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DF253F7BD;
	Mon, 22 Apr 2024 09:45:17 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	James McGregor <jamcgregor@protonmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: H616: Add LRADC
Date: Mon, 22 Apr 2024 17:45:09 +0100
Message-Id: <20240422164511.2488261-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: James McGregor <jamcgregor@protonmail.com>

The Allwinner H616 series of SoCs have a low-rate ADC (LRADC) with
6-bit resolution and one input channel. They're compatible with the
existing drivers, so it only needs to be enabled in the DT.

Add an LRADC node to the H616 .dtsi, so board DTs can use them by
adding 'status = "okay";'.

This was tested on an OrangePi Zero 2W by attaching an expansion board
with two key buttons connected to the LRADC, and adding them to the DT.
/dev/input/event0 then properly reported the button presses. The patches
are based off sunxi/for-next.

James McGregor (2):
  dt-bindings: input: sum4i-lradc-keys: Add H616 compatible
  ARM: dts: sun50i: Add LRADC node

 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml |  4 +++-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi         | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.34.1


