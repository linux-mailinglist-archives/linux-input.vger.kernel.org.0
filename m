Return-Path: <linux-input+bounces-17063-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6495D1AF9A
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 20:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5600C300161F
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 19:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC2235F8AD;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T93KIe1o"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5FF35EDDE;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768331574; cv=none; b=Jvr/RKHZcKngw1DBYN87FZO0Ro/J4sLIZWEy+p9fjGLoyppFKwTr7G2awKRR/JqWofU2YQT8E9dumOYBy1Qw3Zkl5Ibooti4uoYVUY8kkjSsDKqcnD3BPiPDRlNTLlea/CVSBMHbX57bb13rJuv1MsbsuzXCHzv2xsrzFOnou/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768331574; c=relaxed/simple;
	bh=+4fd9yQ9/KUUlc1kbAxqg83L2EiSBV6K7m69iKVHkyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJTxyDE9ZrQ5Wy5e3GgV0oovLeXBBJofA6Si538p5qtExzC1CDsC08ktMfndXFpsTs4pgF7DJ0tVcaXGkdj+NrXYUB/aJ0f5vmQlcaoXGFGQ8KDIw+QYduaOBQuxkaiA4uHJZeg+37i4owcCNccwREVXmIAbENDi0zFSOMqFRH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T93KIe1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4072DC19424;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768331574;
	bh=+4fd9yQ9/KUUlc1kbAxqg83L2EiSBV6K7m69iKVHkyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T93KIe1o9uIypNBKcgj/GLsLUjeQ6aR5NgjizvNM2vMGhWJalAoKO2hWTrB/93pPp
	 h2JaS9DQzfwa0O66eGe6+c+EMRM1Ep00U9uFfVt0bqwgSZNZdiDtJjcjIRkF3eWh3Q
	 GJkXtoP7J/9a4KkY6eI3c4pVVAXC8FMUPTv+rJ5uIwrDBDJksVyHQcN/2f6S/F1F8Y
	 GkknAOOJXMXKE+uj055lF6Q+CveqBSBtScnJqBXBnKVjDHvJOgzrwyIZO3N2FtZya8
	 cDKhZ6320PazBClw+ClaGS9wqNGB0zQl3Jp+3BPQMrH14JTUvqwWJu0MiX+PveaZsd
	 9crmygsn7zMXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317CCD2F35E;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Date: Tue, 13 Jan 2026 21:12:36 +0200
Subject: [PATCH 2/3] drivers: input: touchscreen: edt-ft5x06: Add FocalTech
 FT3518
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-touchscreen-patches-v1-2-a10957f32dd8@gmail.com>
References: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
In-Reply-To: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
To: SzczurekYT <szczurek@szczurek.yt>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768331572; l=2061;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=JnmTIk3Utyw1IEV6j9HoQE20ccGFIPQTbMPlc8S8rg0=;
 b=VefCILwUwN1yAOrpDgYDyZ004CW6l+cWN/xDEauZkH7eyqyWpwJ4YuU2xhvJKW9WvNwCmBBUt
 zdCsnhzEbsrBVwKTApZ+KAAxqjb+CT43foJ7bme5z82RiLw9CE1irVQ
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com

From: Yedaya Katsman <yedaya.ka@gmail.com>

The driver also works with FT3518, which supports up to 10 touch points.
 Add compatible data for it.

Co-developed-by: SzczurekYT <szczurek@szczurek.yt>
Signed-off-by: SzczurekYT <szczurek@szczurek.yt>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bf498bd4dea9651ac939fe137b1c0f05e8557962..d0ab644be0069b5ab29ed037fa090a4279870193 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1475,6 +1475,10 @@ static const struct edt_i2c_chip_data edt_ft5x06_data = {
 	.max_support_points = 5,
 };
 
+static const struct edt_i2c_chip_data edt_ft3518_data = {
+	.max_support_points = 10,
+};
+
 static const struct edt_i2c_chip_data edt_ft5452_data = {
 	.max_support_points = 5,
 };
@@ -1503,6 +1507,7 @@ static const struct i2c_device_id edt_ft5x06_ts_id[] = {
 	{ .name = "edt-ft5x06", .driver_data = (long)&edt_ft5x06_data },
 	{ .name = "edt-ft5506", .driver_data = (long)&edt_ft5506_data },
 	{ .name = "ev-ft5726", .driver_data = (long)&edt_ft5506_data },
+	{ .name = "ft3518", .driver_data = (long)&edt_ft3518_data },
 	{ .name = "ft5452", .driver_data = (long)&edt_ft5452_data },
 	/* Note no edt- prefix for compatibility with the ft6236.c driver */
 	{ .name = "ft6236", .driver_data = (long)&edt_ft6236_data },
@@ -1519,6 +1524,7 @@ static const struct of_device_id edt_ft5x06_of_match[] = {
 	{ .compatible = "edt,edt-ft5406", .data = &edt_ft5x06_data },
 	{ .compatible = "edt,edt-ft5506", .data = &edt_ft5506_data },
 	{ .compatible = "evervision,ev-ft5726", .data = &edt_ft5506_data },
+	{ .compatible = "focaltech,ft3518", .data = &edt_ft3518_data },
 	{ .compatible = "focaltech,ft5426", .data = &edt_ft5506_data },
 	{ .compatible = "focaltech,ft5452", .data = &edt_ft5452_data },
 	/* Note focaltech vendor prefix for compatibility with ft6236.c */

-- 
2.52.0



