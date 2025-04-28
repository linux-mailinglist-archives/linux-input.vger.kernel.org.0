Return-Path: <linux-input+bounces-12049-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E536A9F961
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 21:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65A2E1A81AAE
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 19:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA562951DD;
	Mon, 28 Apr 2025 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="AbTbbDYR"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D66293B6A;
	Mon, 28 Apr 2025 19:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868249; cv=none; b=mR4R9yEElxL6ilXCNfQkkqEtnfkOpdid01DaeZMmta2b8DV7wx0GTBGbhVVJXhf53Bd9MwYLdmHqXQOGCX9JF+sNAn9YFh9GFjQxJId60GNh6z/oa6byxnFOBQ0bSGzsG2J6KJ1y9JEnlURTQsR+EvXcsj4s+y/16DpPXvOjs+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868249; c=relaxed/simple;
	bh=ukZGbYHvylISOm2wikgcSrTFayBuY5PwwwA5MqvAmRM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=IvvxDPaOomstd/T790zbA0FXEMueFAtrnUPNlz0Dcy9Xo1Vmo6xXam55LmrA1iGgQiJZoav+ugskheKlCN0nTRrydlHfdCFuDr9OXGl2Wbh3vLTdl6FrPLa+aSXiaN4udBah6SHqavGtUw/e7LA23fh/1m7zNVcFB04qQun1xt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=AbTbbDYR; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745868244; x=1746473044; i=markus.elfring@web.de;
	bh=WxND/54K1k9Lc6QWwai2eS+JTZ03ZFV5RKUVe8NbtAo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AbTbbDYR3ZCaoM6ytCAqCJWzeAOUvBVFPo7AzCFwNluTbbInXiNtS7pLdwiElUQQ
	 DxCaxd4Xiz4B73U78rVbmnRqJ1A+9JUp2B9vdSKAsr9dl40HXQqdjniCKEPsQ2zgh
	 EiFBxjXmCsDDWJOhQ7hcmBBIFQRXOijzapxWJUyL2ubQ6SObTlJuFbZOoux8t+M4/
	 a7/voPBxQo8IkpzUdrXrUlP0LVCF3bzjvs2MVMjczGevz+5UvgOQEIC4+JpsWMPvJ
	 pGQzzeu0QasW1gl8IqQNrSs/DaOdgqQNo2OPcGo3uQkn3rjbj2e46TP5bDwkgvDAM
	 sUt14sNToKg7SQsv8w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.68]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvsq5-1uy95v2Ipr-00ywz5; Mon, 28
 Apr 2025 21:24:04 +0200
Message-ID: <d431f727-894a-48e3-bca6-3f2aa971d7be@web.de>
Date: Mon, 28 Apr 2025 21:23:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Qasim Ijaz <qasdev00@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] HID: thrustmaster: Use scope-based resource management in
 thrustmaster_interrupts()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UoUgiAshSxeLZHSday19ijFln7vTlDcjGC++EyjCoB2Lbt1emJU
 mkgR9m8BYYfADwdPPw6/hk0u3i1NaZpJISWLJ5Qr8WulKpxIlGLW/DgWRCPbviKP36P7xqF
 Yp1bVqqriqPkyOpX7gDO8oXRvMQmrQo/JJjgSG/mTUU1RaOuxsFJ1lpiIMZBIQWNmzAGJiI
 HPmoQLdcPNV817X6U9zsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XSFitPko9qY=;nv2ERlI4XC8GYye4i4o7gpCT9zh
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Apr 2025 21:12:14 +0200

Scope-based resource management became supported for some
programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
Introduce __cleanup() based infrastructure").

* Thus use the attribute =E2=80=9C__free(kfree)=E2=80=9D.

* Omit four kfree() calls accordingly.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/hid/hid-thrustmaster.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster=
.c
index 0bf70664c35e..c4d74c1d5ddd 100644
=2D-- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -150,7 +150,7 @@ static const struct usb_ctrlrequest change_request =3D=
 {
 static void thrustmaster_interrupts(struct hid_device *hdev)
 {
 	int ret, trans, i, b_ep;
-	u8 *send_buf =3D kmalloc(256, GFP_KERNEL);
+	u8 *send_buf __free(kfree) =3D kmalloc(256, GFP_KERNEL);
 	struct usb_host_endpoint *ep;
 	struct device *dev =3D &hdev->dev;
 	struct usb_interface *usbif =3D to_usb_interface(dev->parent);
@@ -162,7 +162,6 @@ static void thrustmaster_interrupts(struct hid_device =
*hdev)
 	}
=20
 	if (usbif->cur_altsetting->desc.bNumEndpoints < 2) {
-		kfree(send_buf);
 		hid_err(hdev, "Wrong number of endpoints?\n");
 		return;
 	}
@@ -174,7 +173,6 @@ static void thrustmaster_interrupts(struct hid_device =
*hdev)
 	u8 ep_addr[2] =3D {b_ep, 0};
=20
 	if (!usb_check_int_endpoints(usbif, ep_addr)) {
-		kfree(send_buf);
 		hid_err(hdev, "Unexpected non-int endpoint\n");
 		return;
 	}
@@ -191,12 +189,9 @@ static void thrustmaster_interrupts(struct hid_device=
 *hdev)
=20
 		if (ret) {
 			hid_err(hdev, "setup data couldn't be sent\n");
-			kfree(send_buf);
 			return;
 		}
 	}
-
-	kfree(send_buf);
 }
=20
 static void thrustmaster_change_handler(struct urb *urb)
=2D-=20
2.49.0


