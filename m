Return-Path: <linux-input+bounces-17124-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C154D2A912
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 04:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1B9D300898D
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 03:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEF23385BE;
	Fri, 16 Jan 2026 03:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="PkiimrGp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C8271450;
	Fri, 16 Jan 2026 03:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768533099; cv=none; b=b+1eIjwUNi/462EVEkk28oCBmfLwBK12PdWnPgu7d63+VTyNYYodRiUuI0sNMCigGMVWZTIkkBZNCHyyd1m1pwc1RIvxta6u0yknVWEw01T6l8FzKaJ5GwH6w3L+EYn0LTskOlq/DKMTXh8q/wpIsK2ThYbN0u7qJXHD92M4WLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768533099; c=relaxed/simple;
	bh=Ut4kdUa22LgvOQlq+r2XMcEKz4YZLqy2szVsOlLpdFE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CUcC7E7URkcNL8dmHMpa5Pdtc0fDAKiXJzB1R2Dbs2CBTStAR8kB8kNpcCcmeAkoRwAO6dc+0D01yHEBYFTtB6XS/gdZtvPkfNy4psxocXvkxUh+1oDHxvZK5cyWZXxWJy//ebHXzlrpSz1FSMqwyLjbvZme5wJRFf4rMYGc14E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=PkiimrGp; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768533090;
	bh=GdVWcuzgyjAUBe6lY9i078vXX48KKLTenr/wPAgIphw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=PkiimrGpFwwJk763TZJAoSvWhL4/MMApAAH5c4HDasJFFaeN6fjpPHiTRN54ltFVP
	 u5ZbAJQgQUU9FhB9jIPJCPW6RGAeJV6XZ/B8AoOPo3UpK2qsEbCVKe1TqDoc6nbq5J
	 hPKgzVCDubf0D8w3cZe/KTmpy3J5jOQRRRzpvvm0=
X-QQ-mid: zesmtpip3t1768533077t5b4916e3
X-QQ-Originating-IP: 4ar+DEJWdKD9B01CzjAdOJ3Lznx09DjyxnYYujPPxDc=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 16 Jan 2026 11:11:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12559895563723960500
EX-QQ-RecipientCnt: 4
From: Haowen Tu <tuhaowen@uniontech.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tuhaowen@uniontech.com
Subject: [PATCH] Input: appletouch - fix use-after-free in work handler during disconnect
Date: Fri, 16 Jan 2026 11:11:13 +0800
Message-Id: <20260116031113.1003940-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OGRTx1KypL8CtYbBKnkYP1RGpwhPl/Yhg7BcoTqgSVN04CKisbg0INvc
	9ar4LRoydEpAJQJIjj7vPvnfMQDVDMpWFNOzQUqKQVOsfAiKwiRVwfyfEnVlSRBQ5NwSkrG
	XbGiLy1J4gUGlapn9IaEz5NGjqooIhaR7W+SYqIY4izzj8iHqb96Q7wkK+5CnczqaNm0Von
	pIoQUE7vUZLltPo2rRhrwYSNKdC+txIYeGRXf3kgBbAADMClBvHcmJzSvoHFSJi/89KkD16
	jt090WjWUyhQVksueNfx6es2uJWyg8PEaq1hia3I5KOKMG16tSydGZCxhGdjh/ojSXa4wo+
	aOaKrlpjbPYIlVPlfaI/ZGdK8JCuzbyjoufIHkfjy0SBdQrJsDRn9m+ZlH/U627tUc9YPVW
	MklnbPlYzbYtVrd313dWHirGg5FvN0IViAzFWP+M3KNWpdJsLEBi/8NXKXmt+jHNNPwROc/
	l8RiBL8S8CUBO8x7dWLVZOSY+9Vk+ZO4aYAXvCfgU91CsGarjtBq9Kl8ZXkHgexEw1lxPfS
	bnCG0o94oSDHogGWCaNyLmKNKwzerVpO4PkPz8HGoBof3BsxwNl54IiXcxcnPEjWG1N1nne
	ljhjMl+JwEvgvlNh1EQuQmKuW4SyDNnB3m0loTrI0yLxYBoJXnrUP0GiCNSefF7stitTnCq
	hK3ruTAl+u44nTeu439ceUNq0EcKf/6Vvc3N93Cef6b86E29OoeWShDiGeOe2WMnip1jbGO
	mvakRKNzfEsz5X91cVGzi3HHP+UAAWO0Wc3uDj91NeFwioLBvygPMmG6s/LgsKfAUgoo7pz
	wy0iGgwg1je3Yr5Yj+urQ2zwW+yyiyabkXryDxKDil8m2rpnRHU3VqzbWxf1CIjfpk/HPtg
	AlRmhpmeaeB6LGB+RtrOnjs2SnJaw1jyZZEOdQ5nLxK6Ey0rZi9meSV/awOoXtrq40+ASCq
	dUktW9ZBhdpRJSpiHBIHCXoNu2oihoUbYXQWMeYcxLGfN+erbi3zxK+b1gr4gR2PbexCHl9
	jHK0yIWEOXRmyo3mkQQzjnHktF848=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

The atp_reinit work item is initialized in atp_probe() and scheduled
from atp_complete() URB callback when the device becomes idle. During
device disconnection, the current implementation calls usb_kill_urb()
in atp_disconnect() but fails to prevent the work from being executed
after the atp structure has been freed.

Although usb_kill_urb() terminates the URB and its callbacks, there is
a critical race window: if schedule_work() is called in atp_complete()
just before usb_kill_urb() takes effect, the work item can still be
queued. Since atp_disconnect() immediately proceeds to free the atp
structure without canceling pending work, this leads to a use-after-free
vulnerability when the work handler executes.

The race condition:

CPU 0 (disconnect path)      | CPU 1 (URB completion)
atp_disconnect()             |
  usb_kill_urb(dev->urb)     | atp_complete()
                             |   schedule_work(&dev->work)
  input_unregister_device()  |
  usb_free_coherent()        |
  usb_free_urb()             |
  kfree(dev);      // FREE   | atp_reinit()
                             |   dev = container_of(...) // USE
                             |   atp_geyser_init(dev) // USE
                             |   dev->urb // USE
                             |   dev->intf // USE

Fix this by adding disable_work_sync() in atp_disconnect() after
usb_kill_urb() to ensure the work is properly canceled and cannot
be rescheduled before the atp structure is freed.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 drivers/input/mouse/appletouch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/appletouch.c b/drivers/input/mouse/appletouch.c
index e669f86f1882..aa2870a87eee 100644
--- a/drivers/input/mouse/appletouch.c
+++ b/drivers/input/mouse/appletouch.c
@@ -946,6 +946,7 @@ static void atp_disconnect(struct usb_interface *iface)
 	usb_set_intfdata(iface, NULL);
 	if (dev) {
 		usb_kill_urb(dev->urb);
+		disable_work_sync(&dev->work);
 		input_unregister_device(dev->input);
 		usb_free_coherent(dev->udev, dev->info->datalen,
 				  dev->data, dev->urb->transfer_dma);
-- 
2.20.1


