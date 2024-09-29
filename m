Return-Path: <linux-input+bounces-6854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F48989322
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 07:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0DD1B22F5F
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 05:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BD529CEB;
	Sun, 29 Sep 2024 05:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fQVEmKsX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E97225A8;
	Sun, 29 Sep 2024 05:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727587182; cv=none; b=N2sRCk3VrbuqJAiicIprg9W4hhd9wF66CplpQmo11GjDF3Y8YtK6WSHvGu9e7WzsXuhnt9yeg3+p9IHsBVcAe62AQgXnzCNuUFXDe4TArJFYWSHdmDdk3A7ZAPbkmsHXPHwMA7y7iuPDVNywAozEP9D1ZEom5GgurtA3QpDfiVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727587182; c=relaxed/simple;
	bh=M8Y4q9KqH8ynxCMxOjXWrgx59MwZDuSBaCxSv18wS24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZM6JG6hNWBk5nvqVFxQrpmc+A7fcge6Pz/rUqcGV6Zp9Ne40OIbnDuqKFZKrFAsngRGc2P6v4iar7H/V0bmhD/gIrz3cQ7vNSbQyNgorma/2c7VFfDEGv/VVW1k7riZd0xBDsBor8kMwM6HNdI7m4CAV+OOtXM7UoH7bSfhgXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fQVEmKsX; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1727587154;
	bh=/EWWFZsUKKFI1kZ/I3oRmkSVcmx9Zzb8RUBnibFGZa4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fQVEmKsXCOG2ETnYRZndloovk0mGG2IoAHLve1xdVhzeYNZDWVOwiV5xgKjpr+ypf
	 n0plPVQ+ofY5lUJ/3CKcattnPwu22FdelvGCGFNKipLyAkqsEWyVEmyhmM4nvIwR5k
	 8FRO0gBNRv+A723Nu6QKk2V8vc4NbKotvgRARqpQ=
X-QQ-mid: bizesmtp90t1727587124tn0iekvg
X-QQ-Originating-IP: qUnavW/MdKiQQ97GShvSuZbUAcpkgGf2oSlnELyWzjU=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 29 Sep 2024 13:18:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12449184197820123976
From: WangYuli <wangyuli@uniontech.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	guanwentao@uniontech.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
Date: Sun, 29 Sep 2024 13:18:32 +0800
Message-ID: <293F58F16AA131CA+20240929051832.869861-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: ONNbXhDT8KJ/G1sua7Cjgnw3kvGXRlfuuVGel6n7ZWgept6C/faJIqJG
	QEh405Ao11kK5zLvzco9MWtAl2aH5eFv/xJChMMV17rjmGnzYRoOb/R/UVV/vlI4kYZuNyr
	HDI1M5P6x1Eyb2IkWtzTGG8a/8tMavvMfqVtNcDFbVbaXMdiCX8fpUHviFwkk+xdjWFMqny
	blqiNfiI+XSxjtJ28Dy87N6DJmaRoDtIHJ8tEEqP3y0oREAtnR47BMgVq/wdCLv7diUPdJp
	JhVZVTVHsz8mFioR170t7Z+cTwAKNn9FFua7DIQj5UWU6e5jcylA7QsAdrA7huEvvIG+fj5
	UoKAHS5HDKxE+BWO5tH860HK7Je4Bmkz70xlomGbVB9o2gFWIzok0ibiPOgYXGtb0B7h2u7
	ilAWT/+IHxtdoen/4MkduG3Xwcjl3BJkZB+/70T+Dah/f9pNmHrDJNs8zooBdFirKW0oI2h
	KCau7IRfhERTDZc2bUMCGo7lH5eX5g7XaKVWdWqd6C1rrwDVAGpA5F2kleSIagpiQZn0BS8
	vyjdcLLRlUHv0SqtZ9XmQe0jsPKowN/Oip7r8Oa/Xwmca2I5gvZFq+vhgiLpuvwm2H4af1L
	z0iiz2g+AnvwZYlQpY6vph6UFreogVOq4efJLoiUJ88WQV83GuMwi90+wkfNK/SKxmXG9SA
	Sv+UhgJ+1RsTHLwwQnNGft76GR6Eped+mjCPfOjl+Cx0Z7aElIAOlZgrr/QRQ3TLIBxTPn0
	uSR8WkATCk6VzXKAEWWMS4QL7CtCL5H91CmSh2/kar2Bq3vY1ttAsUGtXTsiy5xC2L/1JHI
	ISyjd/5iw8EHFh1+IRMLACAQd6cklw6bfdKv6D5kdbkL9kCdwEZaPbw8ZazdVYcwIXPSyek
	9EVJxpQKx74hQbHeTkpLyAyluXUJ7/8qzdg6p8uD5oWFL/Xdcg8hwoWH3tYvm7nsmDE9U5W
	HcreKepzvsE2FJuJ9gMIiNQT0/N7kDbr0ADPzYo4eKJWuXqPU1hX+MoQ89WKuIS6wNfYYJ3
	LkIzQ4Hw0eViZzh1nm
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

[Problem]
It sometimes after reboot change output from Touchpad to Mouse,
evtest show it output from "TOPS0102:00 35CC:0104 Touchpad"
to "TOPS0102:00 35CC:0104 Mouse",and it works as A mouse.

[Solution]
Like GLO-GXXX,As a workaround, it is possible to call
MT_QUIRK_FORCE_GET_FEATURE to force set feature in mt_set_input_mode
for such special touchpad device.

Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1040
Link: https://gitlab.freedesktop.org/guanwentao/libinput/-/commit/8624bc6d7539ba01e996fefb58ce393e6f129db8
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
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


