Return-Path: <linux-input+bounces-3759-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AC78CAFEC
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 16:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 720B5285677
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 14:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD407F7FD;
	Tue, 21 May 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlJTbJjh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616E77F7E9;
	Tue, 21 May 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716300187; cv=none; b=gI/tyed1jgpLFAErk/p2ft9gbVdty4d/ksqFug2WCkDlg1l6rP3vHy1CdC62KTz8F4L0A21EO1OvK07MCCI9wg3VW43/XAHVc31I4roaUFboIShMQStNLA8vYUub2QKdMjSQMXWYtay1QV+hiBKUtJWz576aZmGPDjVfZ+qH40Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716300187; c=relaxed/simple;
	bh=Fs042i5wAoiHYsxDdEMef/tN7MxYwiclxHYK18SBFg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hsG4dy4C840GnFqJt+8uFzXsN2VEiSXJj5poilcO0ajf3eB4CD+T8/gr6vwh+/GBxmZjuB136Nimp1fri362ZEH+k2IV0gogk+HfAO7T/EYl+1422xPGveObWboAFv9Puq5HXHwH9ffuIjrZatXkLXWP/D54sjP1leVVYOS5KXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlJTbJjh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FC65C4AF09;
	Tue, 21 May 2024 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716300187;
	bh=Fs042i5wAoiHYsxDdEMef/tN7MxYwiclxHYK18SBFg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VlJTbJjhnCQCb4LIzPz2HVWUEVGj9Sz8EYn6oWKSrLpLaonGqVZ8hQc+p3LpLKgRH
	 E5/33hXgAY6T1hJFklqv8UL6B1ZC/NiDvqz4mHS4vTNqWk9cMSN0fIQVMELpPlxtWt
	 reLsIzf7zrLS+K+r5ww8szIgBSemRlC7gGNA4nDWCovNvy7A7a1Q/OcGZycoCHWftu
	 mNy4v5+f43v3eRv/VLBGgjFEKV4f1V+S8V/LJymfNWfTflwj72Dn4cdoKctfiB8xMM
	 tIi9bjVsG/qTe7UHSbYUwn6YfPqWaRPlr+bihvmqtOzwRdOBoO1barYxzq3wTvIhhR
	 imz23/FwFLfKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07016C25B7D;
	Tue, 21 May 2024 14:03:07 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Tue, 21 May 2024 09:02:58 -0500
Subject: [PATCH 2/2] Input: edt-ft5x06 - add support for FocalTech FT5452
 and FT8719
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-2-2a648ac7176b@gmail.com>
References: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-0-2a648ac7176b@gmail.com>
In-Reply-To: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-0-2a648ac7176b@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716300186; l=2353;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=nQ1HQkXEqDosRHt1dsb4w1mHu9DuJ+dY0jyixkP33Sg=;
 b=LHJ7zHKBvISv0qDMgtXQbhmmXEHNomIwmkjkw7JBM9rzrCbY9vOch4bBlQXVuDcL8WYJAm5Mi
 oCm9etvk9BPDPIMxoWd71ZEci7+JHmUPDpUweg8BcI3D1LHWp3LaxsG
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

The driver is compatible with FocalTech FT5452 and FT8719 touchscreens
too. FT5452 supports up to 5 touch points. FT8719 supports up to 10 touch
points. Add compatible data for both of them.

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 2a1db11344766..06ec0f2e18ae3 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1462,6 +1462,10 @@ static const struct edt_i2c_chip_data edt_ft5x06_data = {
 	.max_support_points = 5,
 };
 
+static const struct edt_i2c_chip_data edt_ft5452_data = {
+	.max_support_points = 5,
+};
+
 static const struct edt_i2c_chip_data edt_ft5506_data = {
 	.max_support_points = 10,
 };
@@ -1470,12 +1474,18 @@ static const struct edt_i2c_chip_data edt_ft6236_data = {
 	.max_support_points = 2,
 };
 
+static const struct edt_i2c_chip_data edt_ft8719_data = {
+	.max_support_points = 10,
+};
+
 static const struct i2c_device_id edt_ft5x06_ts_id[] = {
 	{ .name = "edt-ft5x06", .driver_data = (long)&edt_ft5x06_data },
 	{ .name = "edt-ft5506", .driver_data = (long)&edt_ft5506_data },
 	{ .name = "ev-ft5726", .driver_data = (long)&edt_ft5506_data },
+	{ .name = "ft5452", .driver_data = (long)&edt_ft5452_data },
 	/* Note no edt- prefix for compatibility with the ft6236.c driver */
 	{ .name = "ft6236", .driver_data = (long)&edt_ft6236_data },
+	{ .name = "ft8719", .driver_data = (long)&edt_ft8719_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, edt_ft5x06_ts_id);
@@ -1486,8 +1496,10 @@ static const struct of_device_id edt_ft5x06_of_match[] = {
 	{ .compatible = "edt,edt-ft5406", .data = &edt_ft5x06_data },
 	{ .compatible = "edt,edt-ft5506", .data = &edt_ft5506_data },
 	{ .compatible = "evervision,ev-ft5726", .data = &edt_ft5506_data },
+	{ .compatible = "focaltech,ft5452", .data = &edt_ft5452_data },
 	/* Note focaltech vendor prefix for compatibility with ft6236.c */
 	{ .compatible = "focaltech,ft6236", .data = &edt_ft6236_data },
+	{ .compatible = "focaltech,ft8719", .data = &edt_ft8719_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, edt_ft5x06_of_match);

-- 
2.45.1



