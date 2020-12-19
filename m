Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA7C2DED12
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 05:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgLSErI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Dec 2020 23:47:08 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36319 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726254AbgLSErI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Dec 2020 23:47:08 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 3FAC85C00CB;
        Fri, 18 Dec 2020 23:46:02 -0500 (EST)
Received: from imap22 ([10.202.2.72])
  by compute2.internal (MEProxy); Fri, 18 Dec 2020 23:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mxxn.io; h=
        mime-version:message-id:date:from:to:subject:content-type
        :content-transfer-encoding; s=fm1; bh=nC0KoqiKl38hyjl3b0YXmDOFpA
        9kO4GqxnDV3PcLu9Y=; b=aqr/PAzP12MrJvTKOGS9rabY0JgqlAsLGNVw0uJWSX
        Gj5YCsHmZzRwExbrmRAS6FJR3UCUWzYQkFt/CaDH1BnSAmYUyeBRT1NVKY7s59I6
        C+bDMjHohEoVJIWUp81mZstZr7WaVnVGxx53QN6HOocksVD4U4C6rhXCHMNigYLQ
        wVb0x/n5mgT8/YrF/P7D7RGljMLzYdfwH2VlGy5xkhjFNWi4Gl9HrJtT58uFx7Pr
        u8zlChAwVXiMPVSTKQ0DmuVoR5lIWlyTciQcJJ8A6UCcw1QyKWqW7p7FiUqJ9gKQ
        tSDnYAiCtSwEfD5N/KDgFQ9gnS79qUbCY+d5CufFkUag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nC0Koq
        iKl38hyjl3b0YXmDOFpA9kO4GqxnDV3PcLu9Y=; b=i3cwHf0EYSwrUNRpW3cKeg
        gLJoxwQ/iYdcO6f3xrXeOTvwXRlcQQTCkds0f5c6kDbEVSeYnqCC5EFTmvrBmcQ8
        v3iWoqRsLd497ijN/qC+H+7BGMY7k5CDUmjBz62p+TcXeyeT5U/I3+DfW5xvNcAn
        KUEAGi2PPOO6SyFJlMtq8lY/dyaPA3Qo1TxB9luHgpHrKmymEkIib2Kmy+h1Eu4s
        Y1Fg/iDxRO63IYzcF6fOm0kmOxF/qrAWohGck367kkGUVXIhnNwrZnHJekg0Lu46
        ayhwBP7eWLoXQoTfw0fMWIPrcoGysMqdEL1Ej88yTkA1B+ExbHo6l3oqRpy6tjOQ
        ==
X-ME-Sender: <xms:iYXdX0_QzoKwkrWZ4nEsB4VoDlrkjKJ2jTD-YAr5cSlUXQl4pKt9Lw>
    <xme:iYXdX8vH_1M5H9h4UYUmjN6M57qL_3OrjUH0Dz5_GM5SJDHHDT66Nkc-ORiweeH2V
    11hXGSqcZAbD4QESQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeljedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvffutgfgsehtqhertderreejnecuhfhrohhmpeeulhgrkkgp
    jfhrrghsthhnihhkuceosghlrgiisehmgiignhdrihhoqeenucggtffrrghtthgvrhhnpe
    dvteekleduieduuddvieejvdehveffhfevjeevkedtfeeiuddufeefveevlefhvdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegslhgriiesmh
    iggihnrdhioh
X-ME-Proxy: <xmx:iYXdX6DL7MGoJj84swKFx_8WmacnMbm7vO-DK8CYNeE0TqPGnVMIpA>
    <xmx:iYXdX0ffJw1UEQtj0kMyNFnJ1SxqutLaqaft6eDjxuLPIjposwDJag>
    <xmx:iYXdX5OfSxAF8W-ncoZXY_3aJ4l0qbEgnQBp3B7qc5EYhU3Jx_UIDw>
    <xmx:ioXdX7W8awhZaxf98o498UOtEuMcz2FbU4yyS918j87zfl1oeJkeBg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5EF8A62A005E; Fri, 18 Dec 2020 23:45:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <2b4c5881-2047-407f-8bb4-623d9bd167c7@www.fastmail.com>
Date:   Sat, 19 Dec 2020 13:47:41 +0900
From:   =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>
To:     "Jiri Kosina" <jikos@kernel.org>,
        "Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: HID: multitouch: Set to high latency mode on suspend.
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Per Windows Precision Touchpad guidelines:

> The latency mode feature report is sent by the host to a Windows
> Precision Touchpad to indicate when high latency is desirable for
> power savings and, conversely, when normal latency is desired for
> operation.
>
> For USB-connected Windows Precision Touchpads, this enables the device=

> to disambiguate between being suspended for inactivity (runtime IDLE)
> and being suspended because the system is entering S3 or Connected
> Standby.

The current implementation would set the latency to normal on device ini=
tialization,
but we didn't set the device to high latency on suspend.

Signed-off-by: Bla=C5=BE Hrastnik <blaz@mxxn.io>
---
 drivers/hid/hid-multitouch.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c=

index d670bcd57..28bac0f39 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1746,6 +1746,13 @@ static int mt_probe(struct hid_device *hdev, cons=
t struct hid_device_id *id)
 }
=20
 #ifdef CONFIG_PM
+static int mt_suspend(struct hid_device *hdev, pm_message_t state)
+{
+	/* High latency is desirable for power savings during S3/S0ix */
+	mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
+	return 0;
+}
+
 static int mt_reset_resume(struct hid_device *hdev)
 {
 	mt_release_contacts(hdev);
@@ -1761,6 +1768,8 @@ static int mt_resume(struct hid_device *hdev)
=20
 	hid_hw_idle(hdev, 0, 0, HID_REQ_SET_IDLE);
=20
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+
 	return 0;
 }
 #endif
@@ -2150,6 +2159,7 @@ static struct hid_driver mt_driver =3D {
 	.event =3D mt_event,
 	.report =3D mt_report,
 #ifdef CONFIG_PM
+	.suspend =3D mt_suspend,
 	.reset_resume =3D mt_reset_resume,
 	.resume =3D mt_resume,
 #endif
--=20
2.29.2

