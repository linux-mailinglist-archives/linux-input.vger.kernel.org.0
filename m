Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44BDA63EAA
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2019 02:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfGJAl7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jul 2019 20:41:59 -0400
Received: from mout.gmx.net ([212.227.17.22]:51309 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726916AbfGJAl7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Jul 2019 20:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562719316;
        bh=xqX39sOAa8Kdovml34Xgj6YH04mvtzBf5WT7UCnjdoU=;
        h=X-UI-Sender-Class:Date:To:cc:Subject:From:In-Reply-To:References;
        b=FW2TfhQzxn4nysdsaDeb/xG0TFsrNf8Pb5VU+6ABR6VeY/Ua591g2YImtuTwe3yxQ
         Jj8uV734NGORHuGeNpfRUaTv47vwRgqk/OsUaKsmwuN7XTmJT7sIs69xCzsqJ/Z7In
         TVhitXWTrZXqiVrjzque30AuFtPZc+r9BkArfVSk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([153.215.138.11]) by mail.gmx.com (mrgmx103
 [212.227.17.174]) with ESMTPSA (Nemesis) id 0McUnM-1i2g3X2Sem-00Hhf8; Wed, 10
 Jul 2019 02:41:56 +0200
Date:   Wed, 10 Jul 2019 09:41:46 +0900 (JST)
Message-Id: <20190710.094146.313628215486043831.teika@gmx.com>
To:     tim@usrpro.com
cc:     linux-input@vger.kernel.org
Subject: [PATCH v0 1/1] Input: synaptics - enable SMBus for Clevo N350DW
 based  device (SYN1218).
From:   Teika Kazura <teika@gmx.com>
In-Reply-To: <e925e3b4-f2de-7408-779c-cccdc4d41cbd@usrpro.com>
References: <7CDB47F5-65C2-4B09-8C02-EE72D4EAE1BE@usrpro.com>
        <20190615.082110.1448671611220266574.teika@gmx.com>
        <e925e3b4-f2de-7408-779c-cccdc4d41cbd@usrpro.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SyVyH+IqcKh4hf1V4L/nEAGYDOz6HA7xdRm47rId07negxsdHPH
 /yjWLEbQw6sIk1GXsA4eqRA6k7ErOXbP6OYn1wLpg80DUQrqhpvs42p6tk3TIuvdSE5MwTK
 E/TiG1HRb0coGaco54HqzgwdGFSPWRXGw0Dc4Og4Us6MXeXXPn1b1v1mdXeXspOVQkLlBEC
 5egy/ksj/pbcvBnHhH9+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gp+aygfGTp8=:fq2125JjeMYttg22KLtaRM
 z7P4CV1ZHmyJl+kMe8u6fBiwk6lZz5EPp499mNsZfzsOAX/9ME8bvLzAa37zJxWSLyoRAfcry
 5MWaX+sqw2324es1x+rxINiSPz4icROQM+2JCYxFgsVRCvvGTI2soujwvnIvgrBJJj48ND69g
 bxkFRIezq4uObpB/frqT6rqa7q80Ld6D9MVF21ififIEpnocILMFhZ2s+/FLGhM1E6PVtuMPU
 1Fo6NILD0OUsHd1ZeaZmazpFqHga+Jv0MeI+wEpoLfyjI8/4JmdScwavW4zRdv+ABkTdYcY3S
 BLlQzSp3OaaUV1h+XL8V0ZBp68X3E1HYWuWyXNcuynlqtQ7J7NWmwXHXcXyX6h22EHd+V0Z9s
 XjFxNvkUDV0o90oXuN8Tno9i97RteomNt4m0+M/7yLUpaUQYBmBW2WAIOM9M1VOTYwFFoCChp
 kTWwz6n+1EiYLMEPh7vDZcBoRFVXK4s0Z2tNH0UDcjYzLwhwYBifIIq49aiCKt/CAWNzCRJEm
 n1pjRNaE5XLviSYtBM86hOEwiumqsIajptBL275UdcaG+1eWJLQt1cCQMMRBH1PhXC9T6Zxkb
 rVIMzQR1T367PRkXJbBLTLm67QaoXkPMCSUSYYLiD65hUzD/j+a7EqS7dNL9RJzJCSmvR4GVj
 fFKv6vBcdJQ+wWthCcZgc2JrLgVpGpNV9jVUTojrilKAuRJ/C8eceq6v/12bssbiB1uMsLGtl
 wpBLiqU8ObpOvX0/s4w7MHVD2vHy0Y6PqJh9JcVCwl0mggc8shCsnrkP7teAIYPO8bexMQgf5
 SQVj6E43qgp/rg2HJnIw2eF/E+IkOu9PLdwh8DczWoxEc2VWzcRFKQHEqWib1mxtzFYm7yg+p
 uBt2BQCXWjICSoR08TMixYv299TKNE44U4UuoSJKiivkv93A8xWiBqidSc/lSpRaPNomKPVPy
 pzhybCXe6qw59PyaxGjhQQJ/HvuWfFjAQXGEGJJfmNvLhstX/QmmOktmzqS0Tr/JuV1ews7Zc
 gh7qN5oLzP7qU5k7X7RZe3nkgaAUT2CI0HfZcvyL7EFyHhPxJUs1oTILghl7mC9iZbNMAweQ0
 jDqfBPTmsek5HU=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This "v0" patch is yet to be tested. (cc: linux-input@vger.kernel.org)

From: Tim Mohlmann <tim@usrpro.com>
Subject: Re: Synaptics i2c and rmi: dmesg requested to send report
Date: Sat, 15 Jun 2019 09:11:13 +0300

> Yes, I can apply a patch and compile. Just tell me which kernel version.

Thanks. Can you test the following patch for linux-5.2? If it's ok, say, f=
or a week without "psmouse.synaptics_intertouch=3D1", reply so to linux-in=
put@vger.kernel.org. Then I'll manage rest necessary works.

Regards,
Teika

=2D-----------------------------------------------------------------------
Touchpad works better with SMBus for Clevo N350DW-based PC that has SYN121=
8. See: https://www.spinics.net/lists/linux-input/msg61681.html

Reported-by: Tim Mohlmann <tim@usrpro.com>
Signed-off-by: Teika Kazura <teika@gmx.com>
=2D--
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synapti=
cs.c
index b8ec301025b..3c3676246d6 100644
=2D-- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -178,6 +178,7 @@ static const char * const smbus_pnp_ids[] =3D {
 	"LEN200f", /* T450s */
 	"LEN2054", /* E480 */
 	"LEN2055", /* E580 */
+	"SYN1218", /* Clevo N350DW */
 	"SYN3052", /* HP EliteBook 840 G4 */
 	"SYN3221", /* HP 15-ay000 */
 	NULL
=2D-
2.21.0
