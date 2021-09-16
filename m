Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6E640EAEB
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 21:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbhIPTkq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 15:40:46 -0400
Received: from pb-smtp1.pobox.com ([64.147.108.70]:60752 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbhIPTkq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 15:40:46 -0400
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 048BAEF753;
        Thu, 16 Sep 2021 15:39:25 -0400 (EDT)
        (envelope-from lx@xanderlent.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:mime-version:content-transfer-encoding;
         s=sasl; bh=c5W4QIsNAKmSpivCnVo5Ssl6myMuY3RF9nWOJtcLgqs=; b=wFBi
        rG8zziUY5kn8y2wsZAafRy6l0WUvvVldNdhVUK7dSF18NXeroi3I9cVSNSXehxNS
        MHln26WFvjhP3W3Hp6unhkX4+CZKWE/JK7t3ondYNjPMJY3Uv3LC3JI7DQ87eqUl
        FpCMA6E55R4HKne1KhQ0jHo3t2esJwgHZkeJxBQ=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id EFAEEEF752;
        Thu, 16 Sep 2021 15:39:24 -0400 (EDT)
        (envelope-from lx@xanderlent.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=xanderlent.com;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2021-09.pbsmtp; bh=YsNuNLCnhIZ6sV/nzsqkIdgpAB+t5NtF5i9FC+4hBL4=;
 b=uMy++lYr0PqJctl/OTcPeeGh07sozhmk4Ub3foaMdyjNiWXLQ3wOyWflg/bsKIvNhoy2/s94j8mMP66bKV2V96U6iJSVexl1MCwlFpKX0q5yQljq8xl6o6dpY+jNkewltYt5DdUkwGSklnDYiXZPpBn4unwaIwri3r9bi01LSRQ=
Received: from localhost.localdomain (unknown [172.58.224.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 1C107EF751;
        Thu, 16 Sep 2021 15:39:24 -0400 (EDT)
        (envelope-from lx@xanderlent.com)
From:   "Alexander F. Lent" <lx@xanderlent.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        "Alexander F. Lent" <lx@xanderlent.com>
Subject: [PATCH] HID: apple: Eliminate obsolete IR receiver quirks
Date:   Thu, 16 Sep 2021 15:38:40 -0400
Message-Id: <20210916193840.419682-1-lx@xanderlent.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Pobox-Relay-ID: CBD82EF8-1725-11EC-9394-62A2C8D8090B-45904678!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This code has been dead since 2013, when the appleir driver was added by
commit 9a4a5574ce42 ("HID: appleir: add support for Apple ir devices"),
removing Apple IR receivers from this driver.

No other Apple devices use these quirks, so drop them.

Signed-off-by: Alexander F. Lent <lx@xanderlent.com>
---
 drivers/hid/hid-apple.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 833fcf07ff35..1cb15f880c41 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -24,11 +24,11 @@
 #define APPLE_RDESC_JIS		0x0001
 #define APPLE_IGNORE_MOUSE	0x0002
 #define APPLE_HAS_FN		0x0004
-#define APPLE_HIDDEV		0x0008
+/* 0x0008 reserved, was: APPLE_HIDDEV */
 /* 0x0010 reserved, was: APPLE_ISO_KEYBOARD */
 #define APPLE_MIGHTYMOUSE	0x0020
 #define APPLE_INVERT_HWHEEL	0x0040
-#define APPLE_IGNORE_HIDINPUT	0x0080
+/* 0x0080 reserved, was: APPLE_IGNORE_HIDINPUT */
 #define APPLE_NUMLOCK_EMULATION	0x0100
=20
 #define APPLE_FLAG_FKEY		0x01
@@ -433,7 +433,6 @@ static int apple_probe(struct hid_device *hdev,
 {
 	unsigned long quirks =3D id->driver_data;
 	struct apple_sc *asc;
-	unsigned int connect_mask =3D HID_CONNECT_DEFAULT;
 	int ret;
=20
 	asc =3D devm_kzalloc(&hdev->dev, sizeof(*asc), GFP_KERNEL);
@@ -452,12 +451,7 @@ static int apple_probe(struct hid_device *hdev,
 		return ret;
 	}
=20
-	if (quirks & APPLE_HIDDEV)
-		connect_mask |=3D HID_CONNECT_HIDDEV_FORCE;
-	if (quirks & APPLE_IGNORE_HIDINPUT)
-		connect_mask &=3D ~HID_CONNECT_HIDINPUT;
-
-	ret =3D hid_hw_start(hdev, connect_mask);
+	ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
 		return ret;
--=20
2.31.1

