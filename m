Return-Path: <linux-input+bounces-10793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48AA6026B
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 21:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E874916DA14
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 20:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165D61F4603;
	Thu, 13 Mar 2025 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GZtqBCoi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756BD157E88;
	Thu, 13 Mar 2025 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741897262; cv=none; b=uLB0nU2FYizlOXKrCQHHubIJL2a0gYoUX7+mck8glmeVYiBSUVfixEVTbBN0GYSAALhwNqn9NkOaXFEGXmtApHEPsCeJiK9QtNlPLBRQ2B8JoSr73IET+j0FOdXUZ66lsc7fAW5I4Oi95qsztBq9hqNfnhiProbhssosyYKO/xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741897262; c=relaxed/simple;
	bh=0hfKKWZv/FcHZqqPDnqa14jFsuwm6n1QhnUQWChMX1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gep8M/W+/ONghXoiENAXR1H7tdk7jdc/P4nI6awqkxcQ+VON+eXNdnh3rtpjIls5+8B8JSIPsb86w8iOY4RmwhVS7nNyS5U+XoEYN6fcnLcDc5IQH5Ri5BSkpaZRkCo27HlUGwnRCPdePYwDMXHBnhwpv0AZReqSC4ti3Ipv9/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GZtqBCoi; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from karma.space.aachen.ccc.de (xdsl-78-35-81-182.nc.de [78.35.81.182])
	by mail.mainlining.org (Postfix) with ESMTPSA id 84443BBAF1;
	Thu, 13 Mar 2025 20:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741897252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=14lXViSyZsu+UJhIhBFy9/ZtBirlVhv1t4LI5ewActs=;
	b=GZtqBCoiEChhMX7Yhqjbrcty26U9NU8jJlnhnW4Y29TPtVgFo7fSL4+aTFzJSZ9NNJh5S8
	JSzdsFjEyQ1nDJV4oZRGkTxVtir/74S5mzDX+WYcBtNMNz6YQtshUW/0a0iNlaJnSAZ1UI
	85eiTwvPexkg7WDOcKbWdMMBdUAqWEzxJabl03gXGiH2iYFUf8HxxcUtYXNV+a6Nu6iriA
	Yy7ZptsIaywH5USng+UwwowDxerZ0I+/Kd3Hv8KeSomygvMAqEwjRn/dc2rP3O4kVuv9N+
	Kh/dAe8hggMTbf2MTXRjFITrWWi7l7E9p2DoQCCL/KMKSvj3oFhL7aLYXuGv6w==
From: Jens Reidel <adrian@mainlining.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Felix Kaechele <felix@kaechele.ca>,
	Andreas Kemnade <andreas@kemnade.info>,
	Fabio Estevam <festevam@denx.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: [PATCH 2/2] Input: edt-ft5x06 - add support for FocalTech FT8716
Date: Thu, 13 Mar 2025 21:20:17 +0100
Message-ID: <20250313202017.19621-3-adrian@mainlining.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313202017.19621-1-adrian@mainlining.org>
References: <20250313202017.19621-1-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver is compatible with the FocalTech FT8716 touchscreen, which
supports up to 10 concurrent touch points. Add a compatible for it.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 0d7bf18e2508..c72ae6535114 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1495,6 +1495,10 @@ static const struct edt_i2c_chip_data edt_ft8201_data = {
 	.max_support_points = 10,
 };
 
+static const struct edt_i2c_chip_data edt_ft8716_data = {
+	.max_support_points = 10,
+};
+
 static const struct edt_i2c_chip_data edt_ft8719_data = {
 	.max_support_points = 10,
 };
@@ -1507,6 +1511,7 @@ static const struct i2c_device_id edt_ft5x06_ts_id[] = {
 	/* Note no edt- prefix for compatibility with the ft6236.c driver */
 	{ .name = "ft6236", .driver_data = (long)&edt_ft6236_data },
 	{ .name = "ft8201", .driver_data = (long)&edt_ft8201_data },
+	{ .name = "ft8716", .driver_data = (long)&edt_ft8716_data },
 	{ .name = "ft8719", .driver_data = (long)&edt_ft8719_data },
 	{ /* sentinel */ }
 };
@@ -1523,6 +1528,7 @@ static const struct of_device_id edt_ft5x06_of_match[] = {
 	/* Note focaltech vendor prefix for compatibility with ft6236.c */
 	{ .compatible = "focaltech,ft6236", .data = &edt_ft6236_data },
 	{ .compatible = "focaltech,ft8201", .data = &edt_ft8201_data },
+	{ .compatible = "focaltech,ft8716", .data = &edt_ft8716_data },
 	{ .compatible = "focaltech,ft8719", .data = &edt_ft8719_data },
 	{ /* sentinel */ }
 };
-- 
2.48.1


