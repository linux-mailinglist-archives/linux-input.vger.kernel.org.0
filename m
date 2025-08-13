Return-Path: <linux-input+bounces-13966-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 628D0B24759
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 12:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABF742A00E6
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 10:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FF42F3C11;
	Wed, 13 Aug 2025 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FEk74iKb"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6062F4A03
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081058; cv=none; b=UbPXK5US2X2JJoHv+/XzFZkr7fnxdhoM8XbCOb0ywxEnNYQZL53LKM0Ic1ST9VGaPcpJjlpImhLZtvPTfvRaQCW674EmGSIGFL3FZTCEhxPL1gYES0biCKjvsaOlOcmep5z41g1caEubOtL2WGy0lRivtNDDPC53H2LfiWLdUxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081058; c=relaxed/simple;
	bh=88L1CJbf9J5QYs1PCbsDjO/XEPjvFmRO+j6a788D7XM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type:
	 References; b=Cr7tZEFjRcabek7E/ZlUZ9Zo1qiEUPDZLfivvkKtvHxsg7UHM7j6pWhJyVo6pc7oiL81iZptF8KpwEQpgyCk4gikctQnC6Ic1OcnMfPcHoc5sxDp2ZmreqD88w90F5n/zco5ayOAeoucdK11IMTCo7k+0k95HPhR4++av6At648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FEk74iKb; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250813103053epoutp04dc70c943be62aa3b14c040d4c58cef29~bTOth2SKQ2576625766epoutp04q
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 10:30:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250813103053epoutp04dc70c943be62aa3b14c040d4c58cef29~bTOth2SKQ2576625766epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755081053;
	bh=0ByLM1B2U+T0XpDIvRDmM2xeFlGFmAEMmQAwzKw/9jM=;
	h=From:Date:Subject:To:Cc:References:From;
	b=FEk74iKbm08dHapnSWxIJAQQrrrhulG+ICWe9VtczXKFv1cbiY1T43r2ZI+EuKHM6
	 Uy1fazOs69miPGrN2a+OpFKQbWj9XXWMDH7gKLXnpqMyhZwPF/u8JrHOkp2WeK84b5
	 3es/nWXt0AVDrBq0Uwax48TDjcR5kOElDoF7XVfc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPS id
	20250813103052epcas1p481e94a2a01ca32381def3ed0153e7fdd~bTOsaOnNZ1233412334epcas1p4I;
	Wed, 13 Aug 2025 10:30:52 +0000 (GMT)
Received: from epcas1p4.samsung.com (unknown [182.195.38.250]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c24Qh2SGZz2SSKZ; Wed, 13 Aug
	2025 10:30:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20250813103051epcas1p39a9dacf48770020ca234e0c648bb01d2~bTOrtCpbi0772707727epcas1p3G;
	Wed, 13 Aug 2025 10:30:51 +0000 (GMT)
Received: from [127.0.1.1] (unknown [10.252.69.135]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250813103051epsmtip1aa51be842b3d4948e368acd5c3ba3905~bTOrq-PID2477424774epsmtip1N;
	Wed, 13 Aug 2025 10:30:51 +0000 (GMT)
From: Minjong Kim <minbell.kim@samsung.com>
Date: Wed, 13 Aug 2025 19:30:22 +0900
Subject: [PATCH v2] HID: hid-ntrig: fix unable to handle page fault in
 ntrig_report_version()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-hid-ntrig-page-fault-fix-v2-1-f98581f35106@samsung.com>
X-B4-Tracking: v=1; b=H4sIAD1pnGgC/42NTQ6CMBCFr0Jm7RimFCquvIdh0fQHJpFCWiAaw
	t2tnMDl972893ZILrJLcC92iG7jxFPIIC4FmEGH3iHbzCBKUZeKFA5sMSyRe5x1Tr1eXwt6fqO
	lysjW3BqpKsj1Obqsz+lnl3ngtEzxcz5t9LN/jG6EhG3jNclaU6X8I+kxraG/mmmE7jiOL4DLy
	h/CAAAA
X-Change-ID: 20250717-hid-ntrig-page-fault-fix-d13c49c86473
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,  Minjong Kim
	<minbell.kim@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755081051; l=1243;
	i=minbell.kim@samsung.com; s=20250717; h=from:subject:message-id;
	bh=88L1CJbf9J5QYs1PCbsDjO/XEPjvFmRO+j6a788D7XM=;
	b=jMHjWJxU86Xc94TU6HK6OHNbaxiZxZs6SE7jElNqp6dKdYJMLMocwviTFht8i3xWF6XzJGX5r
	6+TKp264I7nDk1mexrwlaMiE46ci/urpbwETiPS0/XjFVfe4++M6ow3
X-Developer-Key: i=minbell.kim@samsung.com; a=ed25519;
	pk=Uz8SoYyLUgGaB/6pPi6XMhiR2WD14yYYdQ57KyXYtBY=
X-CMS-MailID: 20250813103051epcas1p39a9dacf48770020ca234e0c648bb01d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250813103051epcas1p39a9dacf48770020ca234e0c648bb01d2
References: <CGME20250813103051epcas1p39a9dacf48770020ca234e0c648bb01d2@epcas1p3.samsung.com>

in ntrig_report_version(), hdev parameter passed from hid_probe().
sending descriptor to /dev/uhid can make hdev->dev.parent->parent to null
if hdev->dev.parent->parent is null, usb_dev has
invalid address(0xffffffffffffff58) that hid_to_usb_dev(hdev) returned
when usb_rcvctrlpipe() use usb_dev,it trigger
page fault error for address(0xffffffffffffff58)

add null check logic to ntrig_report_version()
before calling hid_to_usb_dev()

Signed-off-by: Minjong Kim <minbell.kim@samsung.com>
---
 drivers/hid/hid-ntrig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
index 2738ce947434f904f32e9a1979b1681c66972ff9..0f76e241e0afb4adb38885a008a05edb24169ea9 100644
--- a/drivers/hid/hid-ntrig.c
+++ b/drivers/hid/hid-ntrig.c
@@ -144,6 +144,9 @@ static void ntrig_report_version(struct hid_device *hdev)
 	struct usb_device *usb_dev = hid_to_usb_dev(hdev);
 	unsigned char *data = kmalloc(8, GFP_KERNEL);
 
+	if (!hid_is_usb(hdev))
+		return;
+
 	if (!data)
 		goto err_free;
 

---
base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
change-id: 20250717-hid-ntrig-page-fault-fix-d13c49c86473

Best regards,
-- 
Minjong Kim <minbell.kim@samsung.com>


