Return-Path: <linux-input+bounces-7504-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9399A1C49
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 10:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C2EEB23F66
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 08:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B791C1ABD;
	Thu, 17 Oct 2024 08:01:50 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtp237.sjtu.edu.cn (smtp237.sjtu.edu.cn [202.120.2.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381AD1D2B0E;
	Thu, 17 Oct 2024 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.120.2.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152110; cv=none; b=PrWUWTXxHosqlhoalSGGYoqjog3+L1sVD9sZuzefFIozuTrHDApMpxqc1AiitNrsS9namFCdRy3l1b7rmr3RtejV1KiarIM9X2Qhl/pjtH7SXav9x1ZVfeTuaxwY1JzUsdP0td8NvnitpGu23dKGuzwzvlB0nZjBZcRtAYasMB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152110; c=relaxed/simple;
	bh=HWZUAZqDMbT3PA3BFAf/Z2391nEHNSaP2ul4+iiXDdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iCj9IOwDd83xzDCjlFBny+GTpduaW5kZj02Ur8kb+oNECpfbhAx31OqJ4hL2cT5QOrwXJ9Cs8L73SswbC+upvl1DmiRYegBpBIPxTfuqIQ5OCTuyVsov1hBRESMNPk0MKWFqf4Ojp1E8M1x3r0HvFZYDyx+XtVdhwZoP2Ja3WgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sjtu.edu.cn; spf=pass smtp.mailfrom=sjtu.edu.cn; arc=none smtp.client-ip=202.120.2.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sjtu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sjtu.edu.cn
Received: from proxy189.sjtu.edu.cn (smtp189.sjtu.edu.cn [202.120.2.189])
	by smtp237.sjtu.edu.cn (Postfix) with ESMTPS id 902C27FFC2;
	Thu, 17 Oct 2024 16:01:37 +0800 (CST)
Received: from localhost.localdomain (unknown [58.247.120.90])
	by proxy189.sjtu.edu.cn (Postfix) with ESMTPSA id 7B5913FC4F6;
	Thu, 17 Oct 2024 16:01:31 +0800 (CST)
From: itewqq <shipeiqu@sjtu.edu.cn>
To: shipeiqu@sjtu.edu.cn
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	ye.xingchen@zte.com.cn
Subject: [PATCH v2] Input/mouse: cyapa - fix potential buffer overflow in cyapa_gen3.c
Date: Thu, 17 Oct 2024 16:01:04 +0800
Message-Id: <20241017080104.1817636-1-shipeiqu@sjtu.edu.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241012100801.1774302-1-shipeiqu@sjtu.edu.cn>
References: <20241012100801.1774302-1-shipeiqu@sjtu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c_smbus_read_block_data function receives up to I2C_SMBUS_BLOCK_MAX
bytes, which is defined as 32. This exceeds the size of the struct
cyapa_reg_data, which will be provided to cyapa_read_block as an input
buffer and finally reach i2c_smbus_read_block_data. When the cyapa module
is enabled (CONFIG_MOUSE_CYAPA=m), this bug could result in potential
denial-of-service for invalid or malicious I2C data. Pad the size of the
cyapa_reg_data structure from 27 to I2C_SMBUS_BLOCK_MAX=32 bytes to
address this issue.

Signed-off-by: itewqq <shipeiqu@sjtu.edu.cn>
---
 drivers/input/mouse/cyapa_gen3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/cyapa_gen3.c b/drivers/input/mouse/cyapa_gen3.c
index fc3fb954523b..6297d1376bbe 100644
--- a/drivers/input/mouse/cyapa_gen3.c
+++ b/drivers/input/mouse/cyapa_gen3.c
@@ -31,7 +31,7 @@
 
 /* Macro for register map group offset. */
 #define PRODUCT_ID_SIZE  16
-#define QUERY_DATA_SIZE  27
+#define QUERY_DATA_SIZE  32
 #define REG_PROTOCOL_GEN_QUERY_OFFSET  20
 
 #define REG_OFFSET_DATA_BASE     0x0000
@@ -114,6 +114,8 @@ struct cyapa_reg_data {
 	u8 finger_btn;
 	/* CYAPA reports up to 5 touches per packet. */
 	struct cyapa_touch touches[5];
+	/* padding up to size I2C_SMBUS_BLOCK_MAX. */
+	u8 padding[5];
 } __packed;
 
 struct gen3_write_block_cmd {
-- 
2.30.2


