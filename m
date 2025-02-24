Return-Path: <linux-input+bounces-10291-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42330A41BE8
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 12:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95C79171EC6
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 11:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5AD2586DD;
	Mon, 24 Feb 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRM6O5VX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB922580FC;
	Mon, 24 Feb 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394877; cv=none; b=pXPDEak+t9udZso996NzR0zkyT0LoeTIEflNgzCQlQbW5XEIPwBG58KsT3RbaFa2oHslFLaSXr/AXDJggC9pxw0p29w2GOnbMdFrqRKS6MAKyPLZBk1ktU/1NpJ/L9W5ZsjQIYgQ2LYiTyViIPs+mNvTvrf/6i4SaYxIlCDCCss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394877; c=relaxed/simple;
	bh=vJ4rRARvHvI+TqMh5YEfuph2abkuxCb70so77AF6Lp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+p8V/dG8VJ+QP/vHYa5aDrPtA11M9/leYAFLS1MmgVchG8H5Y5O21RZvzXetcdWdRAc3lqjtApSd+VwGrI+B5XSfKVZmh08Afy/h2PDgGyZRFrVob7xpdxKwp7G3UT/wZw//34u0QeyjIHr15VoRDWM5mE1MACfu4lvqkVhUac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRM6O5VX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13696C4CEEF;
	Mon, 24 Feb 2025 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740394877;
	bh=vJ4rRARvHvI+TqMh5YEfuph2abkuxCb70so77AF6Lp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mRM6O5VXNxAMRU33unb5BPIIXKNwXflqCxHpDOizSrEr0LIGFmbeCXncHXBWRsa3m
	 jFaEVWy6tK0X2kUat9KnUfRP/atgkQW+TAM3yFOnQvGCwMjbvGiiiG8jEyA7shZUvm
	 9eylcWhF+D4RB+H5josVun0O3hgdnPRmSxWEt49dEvbezTpnjsxdt80ZuszkFtbahM
	 tY+PFAn5Thf4cPU7SWb4pmz1/cTH7uihcpl2RtePqRq7UnFZLVmeEYhKA6/aQC1rEi
	 W9LHQ77BM69xdOk/AEC2XYbU+rcRmcDbe2XSdM/6mYqgVihDTG6xG26cGb8maouVLI
	 YBE5OsfQ07yvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099D6C021A6;
	Mon, 24 Feb 2025 11:01:17 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Mon, 24 Feb 2025 12:01:12 +0100
Subject: [PATCH v7 4/4] MAINTAINERS: Add entries for Apple Z2 touchscreen
 driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-z2-v7-4-2746f2bd07d0@gmail.com>
References: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
In-Reply-To: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740394875; l=1303;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=InMRbHicu7oJRHDFwDtDafdNISTi0qP6MkyrWoUFJQU=;
 b=StrleJYWyCW3mxJijSSbvIVN+zNZiEorwJEgx7XgXLNkkAjajSr8aYL/Kxl5dmpb0XwqYidZt
 KHEp4dA24rDC8CqcnfvMZ2d3VvUfInBfemQ24mt6ivqbwabsF/Q5sCz
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Reviewed-by: Neal Gompa <neal@gompa.dev>
Acked-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..8b3776eb748e128f87c44886b117e0652447fb37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2191,6 +2191,7 @@ F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -2211,6 +2212,7 @@ F:	drivers/dma/apple-admac.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c

-- 
2.48.1



