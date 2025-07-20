Return-Path: <linux-input+bounces-13607-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABFFB0B78E
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 20:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A1057AACE3
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 18:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33756221267;
	Sun, 20 Jul 2025 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="U9V91+8q"
X-Original-To: linux-input@vger.kernel.org
Received: from 5.mo576.mail-out.ovh.net (5.mo576.mail-out.ovh.net [46.105.43.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A422127A
	for <linux-input@vger.kernel.org>; Sun, 20 Jul 2025 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.43.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753034862; cv=none; b=K7bNZZxAu+97YDOM9bvwAyhm6MCKc4fyIt/OhLBSzZA7BLXDmjiB0i7IPVlUXPOhB7Mg0oU3uClLF5vunSh/S2JvKppO+7Z8FySmucvygX+xvwqbscpgUF6cn942+XWdH3lVP3ND/PM8zOr8qbridBGs2vejleQe1Q9mADx2NYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753034862; c=relaxed/simple;
	bh=Gt/bNZUIp1qEITWgD5OLYqz7PTG1DeM8HXfgqRKyMG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M/O03piG8ANDbmFNNSMpAOstfEmTfbi4W5LvU0AkrZBGcMDDA06XCZFSAWjGZGlMWhDSgpjOu7cSmvPJnS47QiEcoSxAcM+aSSZMx3Szeq7V8vH+xoHjFZbXGRJmreW26ORBLC/4xShYfwkn3n7Rkq4scHTAwTmowFxQkUJaY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=U9V91+8q; arc=none smtp.client-ip=46.105.43.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.54.143])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4blQwT2f6tz5ym5
	for <linux-input@vger.kernel.org>; Sun, 20 Jul 2025 14:32:25 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hlgtm (unknown [10.108.54.44])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E5D00C2B4E;
	Sun, 20 Jul 2025 14:32:24 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
	by ghost-submission-5b5ff79f4f-hlgtm with ESMTPSA
	id CejGJ/j9fGgqbwAAl/M/CQ
	(envelope-from <michal.kopec@3mdeb.com>); Sun, 20 Jul 2025 14:32:24 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-103G0053ffc7b80-10dd-45a6-a197-5506ce778d25,
                    B67B8815168DC5A7CB7EFFF73AC76C1CF3BF1D40) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:87.205.21.59
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: djogorchock@gmail.com
Cc: linux-input@vger.kernel.org
Subject: [PATCH] hid: nintendo: Skip setting baudrate on 8BitDo USB devices in Switch mode
Date: Sun, 20 Jul 2025 16:31:56 +0200
Message-ID: <20250720143156.2563816-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18300658562846887273
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeileeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehveduvdehhfehhfefuedtvdeuteevgeetudettdegudevgefhhffgheeiffevfeenucfkphepuddvjedrtddrtddruddpkeejrddvtdehrddvuddrheelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeimgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=xOMb6SAQ6+L27AR1F9K/pL7+GmU9OY2pIETph4EqD/8=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1753021945; v=1;
 b=U9V91+8qh5oWplpMQg8kyZnSG4JWkxThvikxk1dtDKWxX2Lam/JXC1dvER/tEWramzz+VStK
 Uwp4A+VqtXlS5JdmhA09lJQ1kj/SS4BB+zJO/qa7uT1Hg9bho8LOtcWhWUccY9XeMF0xMq1zeu7
 7JXe9ZJqaW9GMff2+br8P+hG0GAWmYEjUMyqyGS1EItfssFfenmosE5Bbe7f3CLg1S3liVzhftH
 jgHBMWSWt0BNYpPs4hKIMWwbGgN7pFVW91Ywte+DftBT3HT6lRDbjeLLtmGUZJ1ykUK9uWlQaQh
 MuMS9sTxk4ysoBG6B5Zn/DhaHpkCN35RzCWeqZDouu1rA==

8BitDo Wireless Adapter in Switch mode does not support the baudrate command,
and if it receives it, it goes into an error state and resets constantly. So,
skip the command on devices made by 8BitDo.

Identification has to be done by MAC address, since the USB VID:PID are set to
match the Switch Pro Controller. Hence, the call to joycon_read_info before has
to be moved earlier, to make sure the MAC is populated before setting the
baudrate.
---
 drivers/hid/hid-nintendo.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index fb4985988615..26a53c78be8f 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -670,6 +670,11 @@ static inline bool joycon_device_is_chrggrip(struct joycon_ctlr *ctlr)
 	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_CHRGGRIP;
 }
 
+static inline bool joycon_device_is_8bitdo(struct joycon_ctlr *ctlr)
+{
+	return !strncmp(ctlr->mac_addr_str, "E4:17:D8", 8);
+}
+
 /*
  * Controller type helpers
  *
@@ -2467,6 +2472,21 @@ static int joycon_init(struct hid_device *hdev)
 	/* if handshake command fails, assume ble pro controller */
 	if (joycon_using_usb(ctlr) && !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
 		hid_dbg(hdev, "detected USB controller\n");
+	} else if (jc_type_is_chrggrip(ctlr)) {
+		hid_err(hdev, "Failed charging grip handshake\n");
+		ret = -ETIMEDOUT;
+		goto out_unlock;
+	}
+
+	/* needed to retrieve the controller type */
+	ret = joycon_read_info(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to retrieve controller info; ret=%d\n",
+			ret);
+		goto out_unlock;
+	}
+
+	if (joycon_using_usb(ctlr) && !joycon_device_is_8bitdo(ctlr)) {
 		/* set baudrate for improved latency */
 		ret = joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ);
 		if (ret) {
@@ -2487,18 +2507,6 @@ static int joycon_init(struct hid_device *hdev)
 		 * This doesn't send a response, so ignore the timeout.
 		 */
 		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
-	} else if (jc_type_is_chrggrip(ctlr)) {
-		hid_err(hdev, "Failed charging grip handshake\n");
-		ret = -ETIMEDOUT;
-		goto out_unlock;
-	}
-
-	/* needed to retrieve the controller type */
-	ret = joycon_read_info(ctlr);
-	if (ret) {
-		hid_err(hdev, "Failed to retrieve controller info; ret=%d\n",
-			ret);
-		goto out_unlock;
 	}
 
 	if (joycon_has_joysticks(ctlr)) {
-- 
2.50.0


