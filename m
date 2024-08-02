Return-Path: <linux-input+bounces-5280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 510E1945B24
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 11:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B597281896
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 09:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF8D1C2312;
	Fri,  2 Aug 2024 09:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fzYNV5bX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168C21BF304;
	Fri,  2 Aug 2024 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722591436; cv=none; b=Rxr4TlHa0XvSlPfTFHk96rLmbYJ8NRdlM8odf5gdmlrD0uGn/6EJef5cI09/J1qs5l1DKG3AhUPNF0PXHvahIU28eEHgQl4JBCZN8UBJz4b7zf31Y+z9x7GiLPkAOspTaDeLKr+jTmONCA5GEpPG92DdrezsM5aOWGHGNXKyNIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722591436; c=relaxed/simple;
	bh=mBo/Gq6QDk9/Dr3lyo0qOe2wNbZqWQDFEKOJSXo4x6I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l8nDs+diJpVUooqh0XBLWJoJcFzUe/grAyhQ7p1kNd4XWp/b2mH+S+CyvOc8QKQYV4PzetFJxKDXpydJLsF9EFj+XTtpwQE62Tsp8JRTXSGU4ab1g5CDNkfKjv/cdwoQSSeCKr+mSD2OSNUUaVtn57Ci6cqZWwHidU1u+O59qzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fzYNV5bX; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1722591397;
	bh=NsIKkB/pr2FlhtN9deyA9A/er15GQbDfKsbBwFdHhqA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=fzYNV5bXU2BJoIumVQ3/zQh8WhYz0z4QCLXVtN9RZkv5eLQIKWbxbirn5AdvJ3/eD
	 DQz6RIE/Q/fK3hHRNxyly843faK6fjot9fUwyWWgcpbgGMpnzx763cc4QVtnLa9koO
	 03BVcbr4GQHtYW2R8GFD2vl95f1DeVrKU/6r+RSY=
X-QQ-mid: bizesmtp84t1722591393t29jd6vp
X-QQ-Originating-IP: Zm1SS9v5f3kvreoF8JKqgz+MhrTtNXlL8iPlq6ibJxU=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 02 Aug 2024 17:36:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14219945242816507166
From: Qiang Ma <maqianga@uniontech.com>
To: dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH V2] Input: atkbd - fix LED state at suspend/resume
Date: Fri,  2 Aug 2024 17:36:00 +0800
Message-Id: <20240802093600.6807-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0

After we turn on the keyboard CAPSL LED and let the system suspend,
the keyboard LED is not off, and the kernel log is as follows:

[  185.987574] i8042: [44060] ed -> i8042 (kbd-data)
[  185.988057] i8042: [44061] ** <- i8042 (interrupt, 0, 1)
[  185.988067] i8042: [44061] 04 -> i8042 (kbd-data)
[  185.988248] i8042: [44061] ** <- i8042 (interrupt, 0, 1)

The log shows that after the command 0xed is sent, the data
sent is 0x04 instead of 0x00.

Solution:
Add a bitmap variable ledon in the atkbd structure, and then set ledon
according to code-value in the event, in the atkbd_set_leds() function,
first look at the value of ledon, if it is 0, there is no need to
look at the value of dev->led, otherwise, need to look at dev->led
to determine the keyboard LED on/off.

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
V2:
 - Fixed formatting and spelling errors
 - Optimized some code

 drivers/input/keyboard/atkbd.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 7f67f9f2946b..fb479bc78134 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -237,6 +237,8 @@ struct atkbd {
 	struct mutex mutex;
 
 	struct vivaldi_data vdata;
+
+	DECLARE_BITMAP(ledon, LED_CNT);
 };
 
 /*
@@ -604,24 +606,32 @@ static int atkbd_set_repeat_rate(struct atkbd *atkbd)
 	return ps2_command(&atkbd->ps2dev, &param, ATKBD_CMD_SETREP);
 }
 
+#define ATKBD_DO_LED_TOGGLE(dev, atkbd, type, v, bits, on)		\
+({									\
+	unsigned char __tmp = 0;					\
+	if (test_bit(LED_##type, atkbd->on))				\
+		__tmp = test_bit(LED_##type, dev->bits) ? v : 0;	\
+	__tmp;								\
+})
+
 static int atkbd_set_leds(struct atkbd *atkbd)
 {
 	struct input_dev *dev = atkbd->dev;
 	unsigned char param[2];
 
-	param[0] = (test_bit(LED_SCROLLL, dev->led) ? 1 : 0)
-		 | (test_bit(LED_NUML,    dev->led) ? 2 : 0)
-		 | (test_bit(LED_CAPSL,   dev->led) ? 4 : 0);
+	param[0] = ATKBD_DO_LED_TOGGLE(dev, atkbd, SCROLLL, 1, led, ledon)
+		 | ATKBD_DO_LED_TOGGLE(dev, atkbd, NUML,    2, led, ledon)
+		 | ATKBD_DO_LED_TOGGLE(dev, atkbd, CAPSL,   4, led, ledon);
 	if (ps2_command(&atkbd->ps2dev, param, ATKBD_CMD_SETLEDS))
 		return -1;
 
 	if (atkbd->extra) {
 		param[0] = 0;
-		param[1] = (test_bit(LED_COMPOSE, dev->led) ? 0x01 : 0)
-			 | (test_bit(LED_SLEEP,   dev->led) ? 0x02 : 0)
-			 | (test_bit(LED_SUSPEND, dev->led) ? 0x04 : 0)
-			 | (test_bit(LED_MISC,    dev->led) ? 0x10 : 0)
-			 | (test_bit(LED_MUTE,    dev->led) ? 0x20 : 0);
+		param[1] = ATKBD_DO_LED_TOGGLE(dev, atkbd, COMPOSE, 0x01, led, ledon)
+			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, SLEEP,   0x02, led, ledon)
+			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, SUSPEND, 0x04, led, ledon)
+			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, MISC,    0x10, led, ledon)
+			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, MUTE,    0x20, led, ledon);
 		if (ps2_command(&atkbd->ps2dev, param, ATKBD_CMD_EX_SETLEDS))
 			return -1;
 	}
@@ -695,6 +705,11 @@ static int atkbd_event(struct input_dev *dev,
 	switch (type) {
 
 	case EV_LED:
+		if (value)
+			__set_bit(code, atkbd->ledon);
+		else
+			__clear_bit(code, atkbd->ledon);
+
 		atkbd_schedule_event_work(atkbd, ATKBD_LED_EVENT_BIT);
 		return 0;
 
-- 
2.20.1


