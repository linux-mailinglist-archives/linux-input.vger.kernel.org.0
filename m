Return-Path: <linux-input+bounces-12133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 943EEAA7FA0
	for <lists+linux-input@lfdr.de>; Sat,  3 May 2025 11:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C20017EC84
	for <lists+linux-input@lfdr.de>; Sat,  3 May 2025 09:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEA21E47BA;
	Sat,  3 May 2025 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="f61YVFsd"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5442D1E1041;
	Sat,  3 May 2025 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746263341; cv=none; b=FSETU3+Vtb3XQ2qY0LWQ5XRSlItvnjDlABFh1jQPB1R9rfixY8UqYhA+RoEr7j9ws+xpFrF/IqHH2S+oVGCgwRrlr87jHfn/nH8NIwkEOI2ar6iQVMrzSkuQJF5WzuIOFVbcG93h6U1sbwl+x0j965HlgomUmADxmnJNSzdGc/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746263341; c=relaxed/simple;
	bh=5Ehg8aQGjsmQjFGFetFWzPdWaPT+YpJgL6j24A8jE6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZgdbIgL+8/1/s3MdNE8Bx5MVa5qAbsTikrd+mw3wgkW3nd+flXL50ARr4KdTZUTV4PrP2RanHGrq8NSfvOgF62lVNGvxRjS2V+a4QenRkXeSBgsJ3z6F587tDAyUQDhbWR7HMjoPJdtjUX1xVzs4iBfR/7LOrPaKbKXKdk3U6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=f61YVFsd; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1C45425DA3;
	Sat,  3 May 2025 11:08:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-CJBNnZefvM; Sat,  3 May 2025 11:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746263338; bh=5Ehg8aQGjsmQjFGFetFWzPdWaPT+YpJgL6j24A8jE6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f61YVFsdF+CKMaZb2y/knpFU/fkUZvkKAhHxfBo5p6IdU9ndhC7ppsyMWAnO4q+Bw
	 bbsPsMPNgko41UNU2sq5XTJ/PT/L/cISYONIYzeXFgo40Tx7TvIneDOFGFocK67y4l
	 0n61gGcZRkfx+Zsy2GoA/UXx4RONt4VRnAysjq04YnEO/tCEzhzdVLN2SvlJZOXBV4
	 8rX+dYmUS4kGJE6D8sEk4IaV+ZACGr03fNMUHeA0PZ/K36yteuLb5NzXLF6aXh5Lxp
	 qTYVgdwOPc7t3jb0Yp12Of44QzAIYOZWsHrhvuQc3OFACx+yPuUTXFi6yCfdUYGpD7
	 C6qK2Jjg61/JQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 03 May 2025 14:38:30 +0530
Subject: [PATCH RFC 4/4] Input: melfas-mip4 - add support for event formats
 4 and 9
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-mip4-touchkey-v1-4-b483cda29a5b@disroot.org>
References: <20250503-mip4-touchkey-v1-0-b483cda29a5b@disroot.org>
In-Reply-To: <20250503-mip4-touchkey-v1-0-b483cda29a5b@disroot.org>
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746263323; l=1820;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=5Ehg8aQGjsmQjFGFetFWzPdWaPT+YpJgL6j24A8jE6I=;
 b=Sew6ti7sPKMTm/ndloE+nJ0EfetoZLWaI8nmFXFOcUVHBRHbuQ4Qlb87y9FaGhF+EEL7FYpzr
 zbaqhzjMAgsCUwYreLNmJLWGMiSd/etJe58aigFrtkZMKfmFw4rySOL
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Valid event formats in this driver is limited to 0, 1, and 3. These are
event formats for MIP4 touchscreen devices. Add support for event
formats 4 and 9, which belong to touchkey devices.

While at it, simplify the logic in function mip4_query_device where
valid event formats are checked. Use a human-readable switch-case block
instead of an if statement with obscure conditions.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/input/touchscreen/melfas_mip4.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 57b657694a420220be135c2f78d3ddad3ef6f520..95a78c86873355d0a8e0207b1eb4a8408f55cee4 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -360,9 +360,19 @@ static int mip4_query_device(struct mip4_ts *ts)
 		dev_dbg(&ts->client->dev, "event_format: %d, event_size: %d\n",
 			ts->event_format, ts->event_size);
 
-		if (ts->event_format == 2 || ts->event_format > 3)
+		switch (ts->event_format) {
+		/* Touchscreens */
+		case 0:
+		case 1:
+		case 3:
+		/* Touchkeys */
+		case 4:
+		case 9:
+			break;
+		default:
 			dev_warn(&ts->client->dev,
 				 "Unknown event format %d\n", ts->event_format);
+		}
 	}
 
 	return 0;
@@ -440,6 +450,8 @@ static void mip4_report_keys(struct mip4_ts *ts, u8 *packet)
 	switch (ts->event_format) {
 	case 0:
 	case 1:
+	case 4:
+	case 9:
 		key = packet[0] & 0x0F;
 		down = packet[0] & 0x80;
 		break;
@@ -552,6 +564,8 @@ static int mip4_handle_packet(struct mip4_ts *ts, u8 *packet)
 	switch (ts->event_format) {
 	case 0:
 	case 1:
+	case 4:
+	case 9:
 		type = (packet[0] & 0x40) >> 6;
 		break;
 

-- 
2.49.0


