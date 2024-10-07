Return-Path: <linux-input+bounces-7107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779A99235D
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 06:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0162282647
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 04:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846BF2261D;
	Mon,  7 Oct 2024 04:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SDrzGfJB"
X-Original-To: linux-input@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1F3C2F;
	Mon,  7 Oct 2024 04:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728274262; cv=none; b=KyKONs/o1nCBnOmXd6RzpIXpAbhshflvLCexRl52QwJRq61xuJ8c6ZX3ytjlK3FwIu7+vBEAKbo17gKIQFYWgLimnwxWp9SnPiwRNGoED89L2Wfcm9SOirteHpjZ8n0mPXdGcIHImAZAUhqQ0n3RXAw3Lx/xJmLQo+zyeuH4WPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728274262; c=relaxed/simple;
	bh=kdLJV4jPMQR0YmUaJahbxYPtDAXEVTC0gnJSvEmyKKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KqvDDUx25fvcVvlCeDKy2L2GhmbIbbIgjYmDrnHD+Jh6sc4+jNPgTk5di2k5iCldHGgGMb+Ru8YmfP/kn/2oRNTWTCDTsHttc963kAkGR1OcudYoUg6BUj7HiVpgEqfZBUCki1/agWCL234unm/OR7i8ZnWIX4gij8jUDqhnp0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SDrzGfJB; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1728274231;
	bh=f0bfXAMgZ1bZqb171JWN9isr0dbCdWyTuujwC2isf/Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SDrzGfJB9a9TteO+0vN6wc1gsq+KwlNuwCquePuLe77DhIKyP1qGi0UlgRpAr4BgH
	 /A2LGY2NvQqkn+FNgG80OweBd9zvn1361vdUEnbhQq9K9yvimfeG3pe1zGZuh0AKS4
	 BnnDhTJcWPnGpcWEHPNqHS5J4dILLdY+WHrEjmLM=
X-QQ-mid: bizesmtp81t1728274088t8y7z34a
X-QQ-Originating-IP: B9rIpp4W0xjv5XTsydH0Wq8+HdW6PE0Ed6KNpJrNxWI=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Oct 2024 12:08:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2877473253527766312
From: WangYuli <wangyuli@uniontech.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	guanwentao@uniontech.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH v2] HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
Date: Mon,  7 Oct 2024 12:08:03 +0800
Message-ID: <43824FB10AAAE5DD+20241007040803.205047-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MBN1Gf7pvZQZL9zHsyFYXqFNrhGVYwdnvxPWyyly9GMD4YbkxWNQpCov
	9CHVLjgNF580+OSs7jloJSWXmQLbi0rd2+2toyMJV1tW/Tr2wed3crhNYoTRd6bSmHlYZx2
	F9uvQOqwma2dnbzhf7GupIsdyeHqfQpH41TUfzzlNCDmLsZ1LV57s+uvcSRM3zaNFJvRaXT
	t+sYYPcII/RkzI/Gz8xFkv3PLG3BjcZBD4LG5BGSJM3prlml7oPh7RcqwX3Pyy/VCv8V9EJ
	tZESMRhlMgCumNgxJp042IZeGstrAzFIfdWHaTOGzsUr8paWqvya85/x5KER29UE8vKvqnv
	PZLyAD6WVnoVtMIunFZjeV52juxN1P0b8rz5TqaTtYdcEi8mWNMa4WgbCBXzO+J0kCuZ6RP
	TrmKVhji7RXus+v5CTS7UwSazNoq35EHD3QIJfcwE+mwVxf74exrywi3dU+fjqsGJNG2q90
	gdPY27/65kHBKWIP3UH8wmdE6nQd00o7CT+siansZ4JnoqM9VM29H5RRk3G3Jqza0bB7hvA
	DWFeFDi8yjVIBOXgV1IfQXya/AxV44wHyz4IoG2oY38G9K7aZ0k91y0NSkW6W9slKY/FUzS
	aqoKWu17x/pN3VxBU+dCVNtXUdaFKb/dp64Y6O8mYJow4gosBFqV/+vPZaM1je6Dk4cI1Le
	c4FLy+qi7RFUNNHiBebKBvAd1jYO49MYUI4yRdZpgBjFACSCJe+txofhCsqJx1KtQcDFC2o
	d9WdeYpA6vkxRzXom+mrDwNZQv16jfmLj9wpkYzwK+u68ieqWD1oJWFv00HxbNb564FqsHq
	Pq8n+fQMHLqMcHNL8bCF2wnsN2NQ5DbVtErexwQ3eOs+68l1nsYe8q8Ne1fSDvPXuYiWfWC
	ZZFxMxwdUHpXTOBPuCHk2nMiMveP5KNVyjOECRaQ2aJXlOwZpTQVrzjCB/bUTBj1BFLqPPF
	DhuuVaB4lqfu63zPK9eStwA0/TjqdUc0UnI+U5xPPF1qicgmO8oKFGL95
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

It sometimes after reboot change output from Touchpad to Mouse,
evtest show it output from "TOPS0102:00 35CC:0104 Touchpad"
to "TOPS0102:00 35CC:0104 Mouse",and it works as A mouse.

Like GLO-GXXX, as a workaround, it is possible to call
MT_QUIRK_FORCE_GET_FEATURE to force set feature in mt_set_input_mode
for such special touchpad device.

Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1040
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/hid-multitouch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 99812c0f830b..a1e0c3db3d4c 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2082,6 +2082,11 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			0x347d, 0x7853) },
 
+	/* HONOR MagicBook Art 14 touchpad */
+	{ .driver_data = MT_CLS_VTL,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			0x35cc, 0x0104) },
+
 	/* Ilitek dual touch panel */
 	{  .driver_data = MT_CLS_NSMU,
 		MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,
-- 
2.45.2


