Return-Path: <linux-input+bounces-5311-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973C946C0A
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 05:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88F0F1C20D92
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 03:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C59A953;
	Sun,  4 Aug 2024 03:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="QDorUNt1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E46FB6;
	Sun,  4 Aug 2024 03:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722741527; cv=none; b=BIzMRUhovZzwgLaY58LNirUcdJYUb2JW8LxeVchRIc+UGkka1A9IFXiR/9jRtgehR+AfBpkMvPrqYKGH2E7ivAZgXocUnI8PoT6tZP+EbkRHqIp3niklqaUZrvB2JWdz4vsptuyX4QpXzhyLQqhpP0kspIFAu5q+bnM41xDw/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722741527; c=relaxed/simple;
	bh=45pty/eZpML1yb7K8GkXSNck+koagf3u91ssApd9WkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8FuOfoJBzuY90bKEpX9Sc8JO2I5AD9Iua34fYbuqIlDMVbz5oMnX0LuCCqJ2mhBLyqniENcNBAvvppOgWHCVZLzL9bVqy7ntmoFtE5+5JCpykkjI2Mi6m/BdcgfP4Jm/JCYsKySsDt5W1pMC8kHsrzp0sT9N1imFR5GdNoOBik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=QDorUNt1; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67E94C006E;
	Sat,  3 Aug 2024 23:13:39 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1722741219; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jIKDti4xNGbVdw8WRRwvN4RS6nL1CFIRo0ElCLglETU=;
	b=QDorUNt1+9FSinJAN+Nf9y9sg4bfnsbI+T8mEAFNA3PBT85N/zdWeKOcMAAhJSnZnFvhv8
	nnsXhDuulEJ3iSd3T7VLbW19yrTgqlLn7zDSNGVl9QwxcG2C6JcUOMoxAj1KP1pLW8+j2f
	Pq9iitS78UMrrc1SF2D4nnN640mFrkk=
From: Felix Kaechele <felix@kaechele.ca>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: edt-ft5x06 - add support for FocalTech FT8201
Date: Sat,  3 Aug 2024 23:13:10 -0400
Message-ID: <20240804031310.331871-3-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240804031310.331871-1-felix@kaechele.ca>
References: <20240804031310.331871-1-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The driver supports the FT8201 chip as well. It registers up to 10 touch
points.

Tested on: Lenovo ThinkSmart View (CD-18781Y), LCM: BOE TV080WXM-LL4

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
---
 drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 42f99e57fbb7..e70415f189a5 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1474,6 +1474,10 @@ static const struct edt_i2c_chip_data edt_ft6236_data = {
 	.max_support_points = 2,
 };
 
+static const struct edt_i2c_chip_data edt_ft8201_data = {
+	.max_support_points = 10,
+};
+
 static const struct edt_i2c_chip_data edt_ft8719_data = {
 	.max_support_points = 10,
 };
@@ -1485,6 +1489,7 @@ static const struct i2c_device_id edt_ft5x06_ts_id[] = {
 	{ .name = "ft5452", .driver_data = (long)&edt_ft5452_data },
 	/* Note no edt- prefix for compatibility with the ft6236.c driver */
 	{ .name = "ft6236", .driver_data = (long)&edt_ft6236_data },
+	{ .name = "ft8201", .driver_data = (long)&edt_ft8201_data },
 	{ .name = "ft8719", .driver_data = (long)&edt_ft8719_data },
 	{ /* sentinel */ }
 };
@@ -1500,6 +1505,7 @@ static const struct of_device_id edt_ft5x06_of_match[] = {
 	{ .compatible = "focaltech,ft5452", .data = &edt_ft5452_data },
 	/* Note focaltech vendor prefix for compatibility with ft6236.c */
 	{ .compatible = "focaltech,ft6236", .data = &edt_ft6236_data },
+	{ .compatible = "focaltech,ft8201", .data = &edt_ft8201_data },
 	{ .compatible = "focaltech,ft8719", .data = &edt_ft8719_data },
 	{ /* sentinel */ }
 };
-- 
2.45.2


