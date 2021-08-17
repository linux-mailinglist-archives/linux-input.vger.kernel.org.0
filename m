Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C453EEF89
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 17:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240396AbhHQPxP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Aug 2021 11:53:15 -0400
Received: from mout.gmx.net ([212.227.15.18]:46987 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240271AbhHQPtC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Aug 2021 11:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1629215282;
        bh=9NtNBAzbovJ6oChii23fCVCShJxs0EWaS5IHENt5Bu4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=kHgb5Wh2YOeKAf335CGvtrAAKPA8I6y+e6qFMQ+Huf/cWKpaxn2Q6cXD1aU9UwAc8
         6KBKEetyCvQoEGG+sOMV9jSiOw+iJEO/5AgilniF/aC8vBahDqjj40ICPWgZoybMqU
         m+V2oc4S1shCb6eK0V9AMr9lpXmVLmXen6xHvce4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N8XPn-1nAkpE32bB-014UpR; Tue, 17 Aug 2021 17:48:01 +0200
From:   Len Baker <len.baker@gmx.com>
To:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Len Baker <len.baker@gmx.com>, linux-parisc@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH] input/gscps2: Prefer strscpy over strlcpy
Date:   Tue, 17 Aug 2021 17:47:28 +0200
Message-Id: <20210817154728.3964-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SqWuKpv+L/u02yV3UejNX5E2A0SVXdG4VgTJSZ6Xq4Qvjvx2kSj
 uC1K1cVTzi3fvESTvFQmJfFustHJKSOFmpUmJKRMPMvbh+2XBDVrSarX74zy3rvtvEKyvEm
 +g2pW7jQnElStruQRJubmg3ol3J5pcvspB1xbdaER2Em8Qqmas1YhfyI26QoHrcAz0jyD/Q
 tgFk6h5lKGCvouaDJ9PtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p7+Z05u49Ok=:enr38GetFC858aqm9GCWB9
 le7W32OtXsbQjhJLgMCE9HgqrKEo5xPe1/fHDz4rP6YP4WwZKnBBUKU6duabG1kf+0BNaymKQ
 6uDKWvtyRiErbDKEh9Ko4zVAEbzVM99lAnEXHjX49R1enIAYALbkCU/vlXwAzgLjDNv6Hq+ef
 iApbHMa4ArmKPsVyE6r3W8vKdXaNtbzSZ4BukpKDzLAGVDFUFtcfAi+KUkTfu0/kGUECrHNvK
 UoWi5F45iYCApfnK+MZnUyxBHsIi9jIXcPmiN25AcpAeTNlcLIlBeorp87yK1abDpSEdqYTnY
 qAWM8wZmwEtNUlVJQaWZZh6D8qEsNBsPzzGShzWpcdv3d6149XEdje7cTyA3zmqmkYY3w5NSN
 rhCp5ywh1TVO1Rqur60WiYKOWdfjlJag5UPlqBT1GH7MlqTzTPeDLmUzfoKQMtfIRmHr+sZ8N
 r+aijTQJHwEFZSKA5ae6jeOU3V6LaISHXliKB956xcnnWK/SPFEvqZ+SxCadFO0zDvAsYzSCb
 jQWS7bCsTdHgpnGS/mKuHg0YITQ0akNtE7bZXGvnJwQcjVzQQ0QAa4Q7LjpDOOrfvX9CTSMVf
 zI+rMUgojvcn2bYReekrt6TQ+kQ1gxoY4LJ/U11e6SXXgjh486trddBhj9F7YllHiLbufyj7C
 aWRREh9jgAJZj6jiyBmJHDpspjWamrf4umlk5/OeyZU96N4MIAiWDmMEdA3sseZyJX5fJ9IF9
 qJ+AXJpkm7ZGduLm3q+oDgTctJf77HctShYHImEu4yr4wHOV7A83n3eYvt3+/leDtCuG56RoF
 +wYnL5ZnOJPXfZmtkFxR22OEqnc7XYORxsDUaa3QLVzCkbEfdbji1XfL1Wi155uZTDE+NOlQG
 ukFHWI86UhMnMvUbYyCUMPpvFnQ3AxME9MRVhccXsk2pYi9v8XDvdXr0pixKDIba/PBmZOOfM
 vXxa+ZrMtzAOuR8tZKrHRyzoPEu8I6VkIaL3g91kaAPDBxDa8GzaTD3sPJqemZGKT8vYIiTEP
 joe4z06MvHl3Ni1lGXFOwOKYVb+E+k6PQKt2nUR4PMZy3pLBtjj60B3glk0T0Exb94i/71vgK
 k1Whs3GErnCyY+0+Kr93GZFsQDoH4N9zdq5jVEliMJKceDMzO5M2NEEiA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

strlcpy() reads the entire source buffer first. This read may exceed the
destination size limit. This is both inefficient and can lead to linear
read overflows if a source string is not NUL-terminated. The safe
replacement is strscpy().

This is a previous step in the path to remove the strlcpy() function
entirely from the kernel [1].

[1] https://github.com/KSPP/linux/issues/89

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/input/serio/gscps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index 2f9775de3c5b..cae74d0edb09 100644
=2D-- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -357,7 +357,7 @@ static int __init gscps2_probe(struct parisc_device *d=
ev)

 	snprintf(serio->name, sizeof(serio->name), "gsc-ps2-%s",
 		 (ps2port->id =3D=3D GSC_ID_KEYBOARD) ? "keyboard" : "mouse");
-	strlcpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
+	strscpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
 	serio->id.type		=3D SERIO_8042;
 	serio->write		=3D gscps2_write;
 	serio->open		=3D gscps2_open;
=2D-
2.25.1

