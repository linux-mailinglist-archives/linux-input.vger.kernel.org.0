Return-Path: <linux-input+bounces-7376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C299B2E4
	for <lists+linux-input@lfdr.de>; Sat, 12 Oct 2024 12:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9047B284603
	for <lists+linux-input@lfdr.de>; Sat, 12 Oct 2024 10:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE24145A19;
	Sat, 12 Oct 2024 10:16:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtp237.sjtu.edu.cn (smtp237.sjtu.edu.cn [202.120.2.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A622334;
	Sat, 12 Oct 2024 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.120.2.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728728196; cv=none; b=b5NGtFqJx9s4yJ/S+xT/T4RXaDAlIPhR8796Ct1keCypMVuSG0InJDUHhuv5sDrHlDod6xqOtH8D3jEJKHryVSxEA+VC4O2U6hFWth+2YcJe2R9bSpbnX2PVNWhpS13QWeNmkFIb/5JSGhmaXiQplM14O3VS3v1afPBRNr8wAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728728196; c=relaxed/simple;
	bh=HS2XVm5xH/qdo18SIB6Au1GbPGHbvzB/O4WxlfNwA+E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IJrAXh0oQdewGGumo73R9f2Lu2A1Gyrti20lqI1S7r+KTnp7zp6TcVKeyfL/5aIngU/wW9CjaZvwtOgxqnkdBp1my8CRY5z9FnWPUUuaRSyXLSL13uZreU0kHDIVahzCrD1s41XwzzyGlrFywPyje8PrGN8bNLPXc9mC23QAnIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sjtu.edu.cn; spf=pass smtp.mailfrom=sjtu.edu.cn; arc=none smtp.client-ip=202.120.2.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sjtu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sjtu.edu.cn
Received: from proxy189.sjtu.edu.cn (smtp189.sjtu.edu.cn [202.120.2.189])
	by smtp237.sjtu.edu.cn (Postfix) with ESMTPS id F073B7FC92;
	Sat, 12 Oct 2024 18:08:10 +0800 (CST)
Received: from localhost.localdomain (unknown [58.247.120.90])
	by proxy189.sjtu.edu.cn (Postfix) with ESMTPSA id 1E3603FC4B2;
	Sat, 12 Oct 2024 18:08:05 +0800 (CST)
From: itewqq <shipeiqu@sjtu.edu.cn>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	itewqq <shipeiqu@sjtu.edu.cn>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input/mouse: cyapa - fix stack overflow bug in cyapa_gen3_get_query_data
Date: Sat, 12 Oct 2024 18:07:56 +0800
Message-Id: <20241012100801.1774302-1-shipeiqu@sjtu.edu.cn>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c_smbus_read_block_data function receives up to I2C_SMBUS_BLOCK_MAX
bytes. which is typically 32. This exceeds the size of the local variable
(u8 query_data[QUERY_DATA_SIZE]) in cyapa_gen3_get_query_data, which is
provided to cyapa_read_block and finally reach i2c_smbus_read_block_data.
When the cyapa module is enabled (CONFIG_MOUSE_CYAPA=m), this bug could
cause denial-of-service (or potentially code execution). For example, by a
physical attacker who can hijack I2C communications or plant malicious
firmware in the Cyapa peripheral. To fix this bug, this patch change the
size of query_data from QUERY_DATA_SIZE to I2C_SMBUS_BLOCK_MAX.

Signed-off-by: itewqq <shipeiqu@sjtu.edu.cn>
---
 drivers/input/mouse/cyapa_gen3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/cyapa_gen3.c b/drivers/input/mouse/cyapa_gen3.c
index fc3fb954523b..6a5ffff51922 100644
--- a/drivers/input/mouse/cyapa_gen3.c
+++ b/drivers/input/mouse/cyapa_gen3.c
@@ -980,7 +980,7 @@ static int cyapa_gen3_set_proximity(struct cyapa *cyapa, bool enable)
 
 static int cyapa_gen3_get_query_data(struct cyapa *cyapa)
 {
-	u8 query_data[QUERY_DATA_SIZE];
+	u8 query_data[I2C_SMBUS_BLOCK_MAX];
 	int ret;
 
 	if (cyapa->state != CYAPA_STATE_OP)
-- 
2.30.2


