Return-Path: <linux-input+bounces-7377-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FAD99B7F5
	for <lists+linux-input@lfdr.de>; Sun, 13 Oct 2024 04:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9925282020
	for <lists+linux-input@lfdr.de>; Sun, 13 Oct 2024 02:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B8F17FE;
	Sun, 13 Oct 2024 02:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="CC7XrcKv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D017C9;
	Sun, 13 Oct 2024 02:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728786236; cv=none; b=L9P2uZm6CgWRlGq3OC/nZbgY8GOFBc6OUFVsfCi9Ayi2BfTrTAYX67/aT4HQ/n6lLMnUAcGTKmqKBvYFZbb/Olg9GRLC9dxI2LsxDjAKp4OAgmdsu2eLHTFwfu9AgmXX0bCxq8Q9YtlLbAflVZrjwUwD5Y7X5NV6/pPTh993G4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728786236; c=relaxed/simple;
	bh=Id3b4OChEeEWEa/SlZuDWsSVwqlKveSdPvqc+lK/CZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SYQpGtjw2EZmIveufaG9YvXe6ReYI1E87Ak/7vi7QbY0v9n07TMl5J9nejtfjm9rHILIlLFuyn1Ve0hapARlo0C8wSzsQ1YStqXQNVU3ZTDcUqf9g9bI2cgylHP+Qx0ugyDJvpAIeYN55ThYVV/DERvIGXQRghl/AVyK2y1pr+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=CC7XrcKv; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1728786124;
	bh=6i+CZeniLVHL//OkWrbBnihzv00EfEX/9KZ4U14pjhE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=CC7XrcKvCg1M09+lyWFtX4rhd0ZwWhMd7yjM1j63AcCBQnA5AlZNGZgLFioBa3nDx
	 ya9cqSkcnt4UYhTpjdvtm7DR7vRLTPZ/cvxQtuXdQ0IHpl4RePz7jTs+rha0Fh25xT
	 asSC+xvJINXC4t+ThD1rU/KhLc34z8pSqQ8Kvx6Y=
X-QQ-mid: bizesmtpip4t1728786101to0n30e
X-QQ-Originating-IP: kFr3Gnjj9upqWNurIfWhLUarrIlikvQORTMvas81gZ8=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 13 Oct 2024 10:21:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5663206268251501140
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	stable@vger.kernel.org
Cc: helugang@uniontech.com,
	jkosina@suse.com,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH 6.1+] HID: multitouch: Add support for lenovo Y9000P Touchpad
Date: Sun, 13 Oct 2024 10:21:26 +0800
Message-ID: <219F185A4FC20A60+20241013022126.44197-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NpWR2/YALQX3DXJLAfdsrsrxj3ckTgaFD+YLrdKtdkbQMKCFgQetw+Y2
	ZcdvKt5QfRSUnD6Cs14H1wep1hiwbZzwRclWIl6+N/ec9ohGPnrW+/tQI11EnTJ8/+lQEEL
	//MSxOvVA61WBAbfJ2HezA3YbI7cioQtJEL5GlZONl/w53Tmv3EgxTVWzTapDIB61lNxcMO
	OOnGJjNl5lgX3RdPxhGfJureI9/MHh7S5ysvEPDlVOoWknZVbm7/vq5usPDxwKfTNlaatwg
	DqqbVpNxdCYKCMQBw6L490i8/0VI7YD9RvkNjSsV6h+ZlMP1BUP95T7jbN5izmqBs8B/1IT
	FzTgnWvVfkdczcfR+btogKVeSqomptUd1n3UJn3CCSdBTP6ec452ulLNC2DG1BgqXy4bxZY
	zr8enJb5AGtey37wQgQN+v8HNtbPctTT2DEZd8B6iKXkY8iDWdmdpw/BFB4D0VSDyX7VKqy
	GMrl2I7emNIpgPSH0YcRNCL5jo/F/+OHuTGfew98QRtvXr8pRAMMXgjPqeuAiNuIkjdkXj+
	Z2QDgJ+Yz9dpypa1w6Z4yl96Ll4ys++AGcVkbXR3DsI6m5wf+jiURc7STLA4372eRSYMkDS
	gtW18cFBta6PrksgZX8o3j7cO/qbIE6hEs/lx0PHG5VEVaV0xMkK1p24PU0xnsL7rbL7vb8
	ZNW+Tt+uQN+f/sOYD9TjO4cR6YSE6AQuVoTORRo/IS5aWLExXeMrBMOlCVuYi7PDlZx+sR0
	A0r7kWrIqr7p+f2EshvLg1G1VUHxIgqoVjHfRdS0K4uxX5fwPGe87xYKWD32ZQa8cnbHGOZ
	AlTxHSEZsMV1TnpfjuEqMr6CZ7JLhkGIZFK1vuuzieHnaKuT+9ikla+GG3HcrUDNcOND/mW
	vADdQdt7ylaG/v3LT+HkRfjJQzmwHPh2bcXXUTOOgxr8D+iQzrr3ToEdVV+medExVmNVhl6
	Huc0LXu/YJJpBeUtwQSb9yLTi+wp6Nxx9gqU=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

From: He Lugang <helugang@uniontech.com>

[ Upstream commit 251efae73bd46b097deec4f9986d926813aed744 ]

The 2024 Lenovo Y9000P which use GT7868Q chip also needs a fixup.
The information of the chip is as follows:
I2C HID v1.00 Mouse [GXTP5100:00 27C6:01E0]

Signed-off-by: He Lugang <helugang@uniontech.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 06104a4e0fdc..86820a3d9766 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -505,6 +505,7 @@
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
 
 #define I2C_VENDOR_ID_GOODIX		0x27c6
+#define I2C_DEVICE_ID_GOODIX_01E0	0x01e0
 #define I2C_DEVICE_ID_GOODIX_01E8	0x01e8
 #define I2C_DEVICE_ID_GOODIX_01E9	0x01e9
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index c4a6908bbe54..847462650549 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1446,7 +1446,8 @@ static __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 {
 	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
 	    (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
-	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
+	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9 ||
+		 hdev->product == I2C_DEVICE_ID_GOODIX_01E0)) {
 		if (rdesc[607] == 0x15) {
 			rdesc[607] = 0x25;
 			dev_info(
@@ -2065,7 +2066,10 @@ static const struct hid_device_id mt_devices[] = {
 		     I2C_DEVICE_ID_GOODIX_01E8) },
 	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
 	  HID_DEVICE(BUS_I2C, HID_GROUP_ANY, I2C_VENDOR_ID_GOODIX,
-		     I2C_DEVICE_ID_GOODIX_01E8) },
+		     I2C_DEVICE_ID_GOODIX_01E9) },
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+	  HID_DEVICE(BUS_I2C, HID_GROUP_ANY, I2C_VENDOR_ID_GOODIX,
+		     I2C_DEVICE_ID_GOODIX_01E0) },
 
 	/* GoodTouch panels */
 	{ .driver_data = MT_CLS_NSMU,
-- 
2.45.2


