Return-Path: <linux-input+bounces-10102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ABAA38203
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 12:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D5813B5339
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 11:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2235219A7C;
	Mon, 17 Feb 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLgkTqAj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777C8218ADD;
	Mon, 17 Feb 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739792296; cv=none; b=udMJXlxvINM8NXZ8yEzKW1RHyCfm3FpGb51yropK/kxrFIW8EgpSGgVRqqhkNwCvA4SiGkAnrsWytK5p2978EDXSKSdbQBxYkVqmjGo6Gimy0mcqhZeKYtlblKxSG3lhciPTUbtyk/+VaMxuPmSSxzqzyHijKBIYC6KWIykdapY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739792296; c=relaxed/simple;
	bh=vJ4rRARvHvI+TqMh5YEfuph2abkuxCb70so77AF6Lp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXQenFjnhMigUH4z6rE0w3yqOEVMFH0xEBti8kasmeBu/g2v2T7bvV5VZSl6fWCKSBb7bcmgMfz0l8ubiJMIIS5c5KRpbAqSwcticm/nzYjliWsIln7jun3zawCreLN5sDm41NqdHG9YIc3FYEAIzA/OHCtXP0yqGpuRbiUyA/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLgkTqAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EC47C4CEEB;
	Mon, 17 Feb 2025 11:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739792296;
	bh=vJ4rRARvHvI+TqMh5YEfuph2abkuxCb70so77AF6Lp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aLgkTqAjZvP6rN/OTvl7AfhLcg/jEkj9q1r29l6LwmspKJtdguR1u1WeqG+IyJcgs
	 IQD3Lh8xaGWNdvD4uHWKsRHL3oEKpkhnr1xzRvf/QPe0q9JbdoLX4wlG+6a7wUZtih
	 TDk1GsVEru93sIyGt8zDZbJiwbBLWe+ZiZnNMiDx59huz5KWVPpFyMxOSz3athl4XQ
	 bjnRWu0wsuifYo/CPrFntpcpv3Nc5J8MyHqMtf9CztyNnvdNNrVOOYwikBNZCaZ0lS
	 10O+Pv5MjwSWUGFCHVEODRHdA92Y/SFjc8bVz9mDSE4tg7fxA+ZXG06bQnUe71oqdE
	 owT3QCsheT8JQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10369C021AC;
	Mon, 17 Feb 2025 11:38:16 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Mon, 17 Feb 2025 12:38:04 +0100
Subject: [PATCH RESEND v6 4/4] MAINTAINERS: Add entries for Apple Z2
 touchscreen driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-z2-v6-4-c2115d6e5a8f@gmail.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
In-Reply-To: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739792294; l=1303;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=InMRbHicu7oJRHDFwDtDafdNISTi0qP6MkyrWoUFJQU=;
 b=q/IU4spImyU4lkrTPb1Sg0FrX7UxOiEvj7DS7BBtsryr0q42cLnwkhNA5/D9LZTElpkvjdxf7
 Sf/fJJw00D5DXJdrOZdae6HPsK1n21+QpsFYjh7tgj2I4MP95rCxFKl
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



