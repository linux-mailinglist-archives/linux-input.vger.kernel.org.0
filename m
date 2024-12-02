Return-Path: <linux-input+bounces-8344-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C19E07AF
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 16:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0CD4173A75
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 15:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E0F4CB5B;
	Mon,  2 Dec 2024 15:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NG6YzGtI"
X-Original-To: linux-input@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391104204B
	for <linux-input@vger.kernel.org>; Mon,  2 Dec 2024 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154418; cv=none; b=a75RXKeWhgvqptPSZMJ89HstoEtkSpuKIkBXevJb7zUk/6M34qv8irtNgk1vRH74RwG4Ler1VZ6YoXqagUSxCO0tJYrM1JlldEcSyJH7rwAIFERZeVumemBYnzuoMsCTxQO6YiB1vpWW0/B0HkjikF78TZYj9+gdZ35khzsydb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154418; c=relaxed/simple;
	bh=Tx+ZLe2ZIJV/zaCLAnlNZO8r+QVu0lMIp/IrqxEUi/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ieor+1p2QRaukZnJqfwNJlE8vCALvXGrUqilkW9sLowkBgKSWILeMO8+fmKpE19VFlXVRNo1Z4azmEoLPGXhbTvUrXUqFd1ZwtJKUumNe9SlvVezPik7VOu5DQ3kc3BSVawVwTM1jYoAcJEReU1AphONHZQn2SXab3X4WwtCsEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NG6YzGtI; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733154413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VEgBfFikoD7MHQLGzfVrQiZrtnF9fKdquPoRWlqKtgM=;
	b=NG6YzGtIjaATUX3/UDc+RJCuQrfzV4IAyw/+RCqCfcmjER1LJpGTGDU6gJ0WOInBCyMHOr
	F/o+ghUL/VJfEPRoHIwxMaAxtttIhIW9UHRs1ekqFVvt5Jf5R+fd6PoGZhOt7cTsViPt/L
	JMV5wcf+H3yNCecdy6jRQn+esQS9BLY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Erick Archer <erick.archer@outlook.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: joystick - use str_off_on() helper in sw_connect()
Date: Mon,  2 Dec 2024 16:46:00 +0100
Message-ID: <20241202154603.1193-2-thorsten.blum@linux.dev>
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
2.47.0


