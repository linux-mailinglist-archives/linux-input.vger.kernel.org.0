Return-Path: <linux-input+bounces-9375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7BA15F13
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 23:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1179A18868CB
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 22:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19521B040E;
	Sat, 18 Jan 2025 22:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sf1/Q24y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD21D8A16;
	Sat, 18 Jan 2025 22:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737240233; cv=none; b=Pg8zx+ybf9ym4CU3IUp7RokG1TpSu4iTJhytO4Oo8m4nJykHHK6KC3h5c96PKW6yzipxC3cHcICgS0xRaE2lijTLjxFhTEsQc13dEEwQdOjC9Dzr1l5bdUY2Qd/2zJjs/caSWO863fI4Gtq3YgG5lT07r1tpuG++TqgbeLuFlq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737240233; c=relaxed/simple;
	bh=g+nNM1CQpEBfji6ZdtcCqKnlC4NQhcF+T4MvH7ajkro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsN5XZBc4mlRyLg5JJixu90txmsx5Ga/qP6ZJsC/cujClh5dMkLGFN79CJP/NGsg+xnQIUIyDa76H4L+SZefkL6qNCiD+7L75DRcOo1iwHqPKZIH9gkvTylUVM1MiUrrAw6Fa7P/uvTegO9sBVU8s+0DrYCE+Or+ZpWR174/4cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sf1/Q24y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1B25C4CEE9;
	Sat, 18 Jan 2025 22:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737240233;
	bh=g+nNM1CQpEBfji6ZdtcCqKnlC4NQhcF+T4MvH7ajkro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sf1/Q24y/K/PZNv8C0DwZIg9Qp5WSPq0U+SFSJh+x5vbUEZuV++S7A8VW1SPzHkGR
	 a6aJcSWhg0j9w3OsRZ+jCl/Ydo+vReatzJqqpjIj6Z7w/U9roQc79WdH70NALOc3Ut
	 nutnvQGyjKgxefLPszljyYu5t5lvAj7lgybgzX1ExzOrGdSNzLEBzgWS0UZoFxfcCW
	 X54uF2ztjkj1ptqvQF9OCtUW/i52kbacCIp9waN+t0PvqflBfOM6csH1VIKTiYDgAo
	 //cMLh6N+vk/WJZmCKamo7D7XTfZ8Y6zQXs0o9sHeavY/FDlDbNoD7rbO6jIkyDgWB
	 RUYvScUvoq/UQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC32C02187;
	Sat, 18 Jan 2025 22:43:52 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sat, 18 Jan 2025 23:42:25 +0100
Subject: [PATCH v5 4/4] MAINTAINERS: Add entries for Apple Z2 touchscreen
 driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-z2-v5-4-6d38b2582169@gmail.com>
References: <20250118-z2-v5-0-6d38b2582169@gmail.com>
In-Reply-To: <20250118-z2-v5-0-6d38b2582169@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737240231; l=1303;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=ldnhN4cLWZdaSAnK+nFhxc/agLls9azNZ2cuvQL5DLw=;
 b=7oTK1inJvgaKlZiB3z0DYljz4VXOOpM6tbf2NMMV3SQ9BBiKcq9sPdl8a0bkZPYBVhxZKl3mD
 Qhu+CuXSWU/BNK7eaS7rJWmztCoRJ0BZxci2CMo+DsqsXqVLTxRTAQc
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
2.48.0



