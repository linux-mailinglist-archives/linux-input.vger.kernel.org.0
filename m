Return-Path: <linux-input+bounces-13579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5407BB084A6
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 08:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23DB63BA727
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 06:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB512063F3;
	Thu, 17 Jul 2025 06:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SziDG8KL"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0D1FCD1F
	for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752732720; cv=none; b=oXuD56VUgbVY97kob0oByqE5lXfHeivF2MA4KbRau264wTZ7r3jpw+W8pIyiC5u87j/fnTmfbyQdwE38BZ0QdchfYP8RxtUNmXV3ttg6C8V9rNqsmK9RFNglXQa0Xe7jPFG2W6+SoS3sz3NPTGoJzVsu/SSwQ58UHBI+RsAqxwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752732720; c=relaxed/simple;
	bh=BQDZLfi3u1xRVoP3Hx6cUdvrG2VGrzF/GFP7tqG//1A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type:
	 References; b=NxtIZt3wGYnR8917T7C/+SP6kMFxw+7DQcIuN+6fF/b1w0Tvk6+l1xDYP7GmN1dYTQEg4SSOQOkZYH6RxQO1X5awK+2Ikq2nIFY/Sj3dofvc/na7eg3oK4nKC8syqwt3qBPWJUN+LYwjYI/c0GFQ7oaRXsFOBm5059o20BW4ibE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SziDG8KL; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250717061155epoutp04d8a2d178700defb21fe6c3de6d813a6c~S9R5hDMj51256412564epoutp04o
	for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 06:11:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250717061155epoutp04d8a2d178700defb21fe6c3de6d813a6c~S9R5hDMj51256412564epoutp04o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752732715;
	bh=upRRZxP/yeEO+FK28kkv21zC4VyQQFr57m8MM6+0nNA=;
	h=From:Date:Subject:To:Cc:References:From;
	b=SziDG8KLc7OKU4vlaj/FOYdTtfAEzs+a4zhjArulW/Ytr1+kSi2njQrdLMDut5L+m
	 EusVt8KHEReaRi5CJvu6qUdaS6i2Gy8GZbftdEFRQGkl6Rr3HtGSKgqPlbOPBQogfe
	 iHbWnJIKcoHJ7CyyuvsIw2sGatRdJ4gspImkhKFw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPS id
	20250717061155epcas1p4871f7653dd2ea98c47a97ed405dce02e~S9R5Dp0rW0281402814epcas1p4d;
	Thu, 17 Jul 2025 06:11:55 +0000 (GMT)
Received: from epcas1p1.samsung.com (unknown [182.195.38.250]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bjMyM1dk4z3hhTC; Thu, 17 Jul
	2025 06:11:55 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20250717061154epcas1p329022ab54ed143d2a8d5b3f8b7554b38~S9R4eig171645416454epcas1p3S;
	Thu, 17 Jul 2025 06:11:54 +0000 (GMT)
Received: from [127.0.1.1] (unknown [10.252.69.135]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250717061154epsmtip1711e6458e37f56c3297a060e8d4ba354~S9R4czhb82748027480epsmtip1W;
	Thu, 17 Jul 2025 06:11:54 +0000 (GMT)
From: Minjong Kim <minbell.kim@samsung.com>
Date: Thu, 17 Jul 2025 15:11:43 +0900
Subject: [PATCH] HID: hid-ntrig: fix unable to handle page fault in
 ntrig_report_version()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-hid-ntrig-page-fault-fix-v1-1-96fa145a137f@samsung.com>
X-B4-Tracking: v=1; b=H4sIAB6UeGgC/x2MUQ5AMBAFryL7bRNVFFcRH0272ERKWkQi7m7jc
	97kzQOJIlOCPnsg0sWJtyCg8gzcYsNMyF4YyqKsC6MMLuwxHJFn3K3YyZ7rgRPf6JV2VefapjI
	a5L5HkvlPD+P7fug3qndqAAAA
X-Change-ID: 20250717-hid-ntrig-page-fault-fix-d13c49c86473
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,  Minjong Kim
	<minbell.kim@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752732714; l=1281;
	i=minbell.kim@samsung.com; s=20250717; h=from:subject:message-id;
	bh=BQDZLfi3u1xRVoP3Hx6cUdvrG2VGrzF/GFP7tqG//1A=;
	b=WBOnxKK6+kVqWWk4s+Zr1sN7EP4fxHvzNJqZIaWOGYGRGNH1lfXfP3RCcub7bFeXgyOK21hx8
	y4zEhCZAwlNBpovGXg23bGxTeYK7f8c0InqSPkOTZTm46zbCcgwVPVE
X-Developer-Key: i=minbell.kim@samsung.com; a=ed25519;
	pk=Uz8SoYyLUgGaB/6pPi6XMhiR2WD14yYYdQ57KyXYtBY=
X-CMS-MailID: 20250717061154epcas1p329022ab54ed143d2a8d5b3f8b7554b38
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250717061154epcas1p329022ab54ed143d2a8d5b3f8b7554b38
References: <CGME20250717061154epcas1p329022ab54ed143d2a8d5b3f8b7554b38@epcas1p3.samsung.com>

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
 drivers/hid/hid-ntrig.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
index 2738ce947434f904f32e9a1979b1681c66972ff9..96d3300655b5aa1621015b8e1fb511e6f616a713 100644
--- a/drivers/hid/hid-ntrig.c
+++ b/drivers/hid/hid-ntrig.c
@@ -139,6 +139,10 @@ static inline void ntrig_set_mode(struct hid_device *hdev, const int mode)
 
 static void ntrig_report_version(struct hid_device *hdev)
 {
+
+	if (!hdev->dev.parent->parent)
+		return;
+
 	int ret;
 	char buf[20];
 	struct usb_device *usb_dev = hid_to_usb_dev(hdev);

---
base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
change-id: 20250717-hid-ntrig-page-fault-fix-d13c49c86473

Best regards,
-- 
Minjong Kim <minbell.kim@samsung.com>


