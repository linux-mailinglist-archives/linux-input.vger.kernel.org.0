Return-Path: <linux-input+bounces-8767-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 720E69FC532
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 13:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59F2A1883696
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 12:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEA1196D8F;
	Wed, 25 Dec 2024 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AoVkuvQl"
X-Original-To: linux-input@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C956B2747B
	for <linux-input@vger.kernel.org>; Wed, 25 Dec 2024 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735129965; cv=none; b=A2nbgc6U+1rywAyzdJ19bvJt2Cs1DcYBwTf7wFFoeuhRsUNfkJi1TxpeZyXWXJj/itYhzK1cDYewxKNovUVpauyTDaosL1pCXxPXLeFOCQns0p7gYoDEACYi+83tMHiEO0yOdGvi9CvVdeNhchBNQjsrEnQbdrBM6Smpy+/g+jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735129965; c=relaxed/simple;
	bh=/TaVQwFpFo3ABmlQiTt6vV2ESB9Exoo0aKDmsl9o5lw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmWigD/FxUTXAy9oE47dVkacIz0uWu7oiFDqBM6QPZkAGqREtAOosMm2MXEBHBb/1JulJsYE0CGIQxgfPCumtwqC+C95C7XuTS+eBjzvOH95jBtSxD2ofGT61eLM1Vm/oJs1BsjDLNG77/MG7p++a895I0iNHDzsuggH6f0sRoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AoVkuvQl; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735129961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+V10d4NcItRZyhNPWlOlIqa+P8ywQYrLnDmkdUkZnAc=;
	b=AoVkuvQl80VVivZ4Q8oIRzdkEYGKqKgOLNQZaY1poYEz1vQkTmG92KCT7qHYPz0g0NSN10
	xkSCFjNtkCyKz7LTQlrP2aXy+YNlU00U5zTV23xIdYVZeSh87fOw6eag36HaFzI3w8cljy
	afQFWi/JXw22WQThBOKyru4fSDpZ+eI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Erick Archer <erick.archer@outlook.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] Input: joystick - use str_off_on() helper in sw_connect()
Date: Wed, 25 Dec 2024 13:32:20 +0100
Message-ID: <20241225123222.444891-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_off_on() helper.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/input/joystick/sidewinder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index f6e92db4d789..3a5873e5fcb3 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -14,6 +14,7 @@
 #include <linux/input.h>
 #include <linux/gameport.h>
 #include <linux/jiffies.h>
+#include <linux/string_choices.h>
 
 #define DRIVER_DESC	"Microsoft SideWinder joystick family driver"
 
@@ -677,7 +678,7 @@ static int sw_connect(struct gameport *gameport, struct gameport_driver *drv)
 				case 48:				/* Ambiguous */
 					if (j == 14) {			/* ID length 14*3 -> FFP */
 						sw->type = SW_ID_FFP;
-						sprintf(comment, " [AC %s]", sw_get_bits(idbuf,38,1,3) ? "off" : "on");
+						sprintf(comment, " [AC %s]", str_off_on(sw_get_bits(idbuf,38,1,3)));
 					} else
 						sw->type = SW_ID_PP;
 					break;
-- 
2.47.1


