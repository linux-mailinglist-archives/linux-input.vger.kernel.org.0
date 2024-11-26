Return-Path: <linux-input+bounces-8251-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E69D9E84
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 21:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 690BE283EEA
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 20:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906691DF98A;
	Tue, 26 Nov 2024 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQlEL2RN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E75C1DF74F;
	Tue, 26 Nov 2024 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732654094; cv=none; b=MfhyBm7W4k6crWGLOpBatUDrzTvsPA8HITz83gW/6kxtIfApwoWj/jmDcLnDP7uMNlvCwjc44u8ZKjUH6X5hobG5ZNFnYaVJPQFZDL0ok+XcAM9TcQwcvk41tsKahESWMDt372e9f52Lg0XG5T5jswR0RZDZ2ymkDRVn/0KeZSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732654094; c=relaxed/simple;
	bh=4El0kQkrRlr/CEy5dm9S79SsYdqflPKE+Y43lCIJcaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdUPE/gZzIsqSK7KO/KJnIzZac6nIKd/BjBXdrh3oWXyNR1SdsFGaljcXcB1jZOIhA2kKj0iX6cyfnvaiarLXqECBCDMu0fsJogMzpJWWDvKKTnK5yuIzSTvlk2KcyuSLzd2MsuTRUU+vias/W1pOPQXbPOUXCPEZUfB5sJwmMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQlEL2RN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5EDCC4CEDB;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732654094;
	bh=4El0kQkrRlr/CEy5dm9S79SsYdqflPKE+Y43lCIJcaQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UQlEL2RNBHDHMuwoN3QCs0DnB98E6jQ/0NwC8lNh/CXmmPF9CDQjJ7yuVaGp8okjY
	 EpG/qZaYI79Ip7ucaltMasSH1iqdouLfMu0XvFIhMc0CB0opcu5Gy1RBWzkF2h/rS1
	 QFAqGp6PJaFnVuZfWctgi7H6q+IwO81nUl2Ia7Oy6QiOrD/FxrLowQTvTy45mC4iJ9
	 h+AMaxDTVrZOqcW0uwBPOzJPWtJ5Vjeks+sMG/7vfvRVitHaOFw8FnswyVExZl3m2t
	 7bdInh/ZPymcQgOwPM/95BSOTZWWtJvrtrGq6HVkfVlahgnj13QjSnKQrhBH0W+Uj+
	 AsqzTLJsXoReQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA82ED65555;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 26 Nov 2024 21:48:02 +0100
Subject: [PATCH 4/4] MAINTAINERS: Add entries for Apple Z2 touchscreen
 driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-z2-v1-4-c43c4cc6200d@gmail.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
In-Reply-To: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732654092; l=1218;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=5VgCgIUSJDHHHfv8AULS59dx+V2ZROTDT6FjcyDo/sU=;
 b=Ir5WYIz0L4uxDNqP4Iy7InHtKEJmKl90BhcHI3EpOmGhvc+koHFn6UlkCO9LEZdWpqqMjrxn0
 bgIC/fxwW36CBu2f+H+IjVj9O1oIm9ZeDSEOaIOg5bBm1onJ8WeFmfB
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7f0170977013889ca7c39b17727ba36d32e92dc..9f75fff12fa1912b70251cade845d6b3d5e28c48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2166,6 +2166,7 @@ F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -2186,6 +2187,7 @@ F:	drivers/dma/apple-admac.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c

-- 
2.47.1



