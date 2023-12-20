Return-Path: <linux-input+bounces-895-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4A81973A
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 04:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F327E284758
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 03:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1FCC13C;
	Wed, 20 Dec 2023 03:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="RbP3X1Mk"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D26E8F51
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id A7909A42D;
	Tue, 19 Dec 2023 19:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1703043531; bh=1BVG6U844bDtSFQD7eJ/tqwdyFj5F6N7Pc+v7DEzXLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbP3X1MksO46lUEkXbUcYl2cK9W5oL3PPcR4JGBKwCjPLtWs0EGcsylhUtgEnx5h1
	 YugfxkopZ8tb1akDOdBjzrpCbbVdn5SWvT62XTO4Rc1CLu9mHEGh0ksPc/gEe5dq2f
	 6LlZCULyxO4Nu0vYfiQ/Ger9j+hnT6H7wt/nvyGPKFPlqK1FlWfnjQIvJ/co/MGEXx
	 abLkIRqjBL91qNgCp4IP/uglcBYzgwJHPsKwSd+QVApX5bEIJNlozp8w6MN41e9SCd
	 0Kcmd8Nx37bOHvWfEyj+ON3GsmxbVnlG+hT6TchoLBAXVBqIqRoN9Gc5j8xhN4QQnq
	 Pcle/TK4xOdWw==
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 6/7] HID: hid-steam: Better handling of serial number length
Date: Tue, 19 Dec 2023 19:38:36 -0800
Message-ID: <20231220033837.2135194-6-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220033837.2135194-1-vi@endrift.com>
References: <20231220033609.2132033-1-vi@endrift.com>
 <20231220033837.2135194-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second byte of the GET_STRING_ATTRIB report is a length, so we should set
the size of the buffer to be the size we're actually requesting, and only
reject the reply if the length out is nonsensical.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 4f5c647f04dd..a0ed8812e7ea 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -274,7 +274,7 @@ enum {
 };
 
 /* Other random constants */
-#define STEAM_SERIAL_LEN 10
+#define STEAM_SERIAL_LEN 0x15
 
 struct steam_device {
 	struct list_head list;
@@ -421,10 +421,10 @@ static int steam_get_serial(struct steam_device *steam)
 {
 	/*
 	 * Send: 0xae 0x15 0x01
-	 * Recv: 0xae 0x15 0x01 serialnumber (10 chars)
+	 * Recv: 0xae 0x15 0x01 serialnumber
 	 */
 	int ret = 0;
-	u8 cmd[] = {ID_GET_STRING_ATTRIBUTE, 0x15, ATTRIB_STR_UNIT_SERIAL};
+	u8 cmd[] = {ID_GET_STRING_ATTRIBUTE, sizeof(steam->serial_no), ATTRIB_STR_UNIT_SERIAL};
 	u8 reply[3 + STEAM_SERIAL_LEN + 1];
 
 	mutex_lock(&steam->report_mutex);
@@ -434,12 +434,13 @@ static int steam_get_serial(struct steam_device *steam)
 	ret = steam_recv_report(steam, reply, sizeof(reply));
 	if (ret < 0)
 		goto out;
-	if (reply[0] != ID_GET_STRING_ATTRIBUTE || reply[1] != 0x15 || reply[2] != ATTRIB_STR_UNIT_SERIAL) {
+	if (reply[0] != ID_GET_STRING_ATTRIBUTE || reply[1] < 1 ||
+	    reply[1] > sizeof(steam->serial_no) || reply[2] != ATTRIB_STR_UNIT_SERIAL) {
 		ret = -EIO;
 		goto out;
 	}
 	reply[3 + STEAM_SERIAL_LEN] = 0;
-	strscpy(steam->serial_no, reply + 3, sizeof(steam->serial_no));
+	strscpy(steam->serial_no, reply + 3, reply[1]);
 out:
 	mutex_unlock(&steam->report_mutex);
 	return ret;
-- 
2.42.0


