Return-Path: <linux-input+bounces-4945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F69692CF43
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 12:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 299CC1C23C0B
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 10:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79C119149C;
	Wed, 10 Jul 2024 10:28:46 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E31922DA
	for <linux-input@vger.kernel.org>; Wed, 10 Jul 2024 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607326; cv=none; b=PUHGx+khvjHdXxKQprpcOXVudz4FktK1bg6nt0rgZNPG/iOn6dMbwhAKrJZidCCFYN3dosryb2iB6LuZnOmx2R8Z7t2HOfWj1r5DuZbugps/O4o7NsBj5l6ee3AaK7vdnFJjDu7cg3vEE7ChCDgYgEoKHF7hBnOeNPEnI7RXVP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607326; c=relaxed/simple;
	bh=L/pgUwpgSrw/v5EABz0F3z0MFWWRAZFBSZNzpj8MzUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDqVw8M4a4r94s6Fj7VaFJ8+cYF7+ApR4MgspIBwV8N0pz1xDwUcdBVhz/v7AsZ8tyaSjNN30J4nby8cTzpIM8wsA3cNZr5i2S3kZLfgjq/h9SyDkmaNCgV8adcKRf+DqvUOsH5JyrMMRbryZw+5nXHUWRU78X2C1XG6Cn4fTuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sRUYt-0001Y8-0f; Wed, 10 Jul 2024 12:28:35 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 10 Jul 2024 12:28:32 +0200
Subject: [PATCH v3 2/2] Input: exc3000 - add EXC81W32 support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-input-exc3000-exc81w32-v3-2-4272183628b4@pengutronix.de>
References: <20240710-input-exc3000-exc81w32-v3-0-4272183628b4@pengutronix.de>
In-Reply-To: <20240710-input-exc3000-exc81w32-v3-0-4272183628b4@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15-dev-13183
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

Add support for EXC81W32 controllers.

Tested with firmware reported as type "PCAP81X32 Series",
model "Orion_0183_1019", fw_version "8001280G".

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v2: split device tree binding compatible update out of this patch
---
 drivers/input/touchscreen/exc3000.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index a4030cc9ff60..2e77cfb63f32 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -53,6 +53,7 @@ enum eeti_dev_id {
 	EETI_EXC3000,
 	EETI_EXC80H60,
 	EETI_EXC80H84,
+	EETI_EXC81W32,
 };
 
 static struct eeti_dev_info exc3000_info[] = {
@@ -68,6 +69,10 @@ static struct eeti_dev_info exc3000_info[] = {
 		.name = "EETI EXC80H84 Touch Screen",
 		.max_xy = SZ_16K - 1,
 	},
+	[EETI_EXC81W32] = {
+		.name = "EETI EXC81W32 Touch Screen",
+		.max_xy = SZ_16K - 1,
+	},
 };
 
 struct exc3000_data {
@@ -441,6 +446,7 @@ static const struct i2c_device_id exc3000_id[] = {
 	{ "exc3000", EETI_EXC3000 },
 	{ "exc80h60", EETI_EXC80H60 },
 	{ "exc80h84", EETI_EXC80H84 },
+	{ "exc81w32", EETI_EXC81W32 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, exc3000_id);
@@ -450,6 +456,7 @@ static const struct of_device_id exc3000_of_match[] = {
 	{ .compatible = "eeti,exc3000", .data = &exc3000_info[EETI_EXC3000] },
 	{ .compatible = "eeti,exc80h60", .data = &exc3000_info[EETI_EXC80H60] },
 	{ .compatible = "eeti,exc80h84", .data = &exc3000_info[EETI_EXC80H84] },
+	{ .compatible = "eeti,exc81w32", .data = &exc3000_info[EETI_EXC81W32] },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, exc3000_of_match);

-- 
2.39.2


