Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179EA273EF9
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 11:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgIVJyW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 05:54:22 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:47164 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIVJyW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 05:54:22 -0400
X-Greylist: delayed 915 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 05:54:21 EDT
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1600767544; x=1603359544;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gBdQ4nNU4LkVwgCAoPqPWR+JZVeyyiWG4BrFHfAS0SQ=;
        b=BiycNBTrW1uKR/TUyxJXEkO1sKjodzuyxmEFOu/aGWNLOH5WAroQO7a73kPgbq1P
        HTEIhZfxN2GPQXRGuaUkU6J4GpARd832eZMCX5bS15rJXfWl4aPU4kwvrX8vGvCy
        HzZd4Qvyx/T7O+HyXq55I45OR94E33v3CPMSB7zBQRM=;
X-AuditID: c39127d2-253ff70000001c25-d1-5f69c638ed81
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id AD.07.07205.836C96F5; Tue, 22 Sep 2020 11:39:04 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020092211390466-474099 ;
          Tue, 22 Sep 2020 11:39:04 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH] Input: stmpe: Add axis inversion and swapping capability
Date:   Tue, 22 Sep 2020 11:39:03 +0200
Message-Id: <20200922093903.157232-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 22.09.2020 11:39:04,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 22.09.2020 11:39:04
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOLMWRmVeSWpSXmKPExsWyRoCBS9fiWGa8wc2/+haHF71gtLj/9Sij
        xabH11gtbn76xmpxedccNgdWj52z7rJ73Lm2h81j85J6j8+b5AJYorhsUlJzMstSi/TtErgy
        jszYxl6wg7/i2OcW9gbGmbxdjBwcEgImEj3dPl2MXBxCAtsYJSa/XcYO4VxjlDjT/5epi5GT
        g03ASGLBtEYwW0RAX2L77F+MIEXMApsZJX60vWAGSQgLeEps/bKWFcRmEVCV+Nu3jw1kA6+A
        rcTWNhOQsISAvMTMS9/ZQWxeAUGJkzOfsIDMkRC4wijR/2AdI0SRkMTpxWfBZjILaEssW/ia
        eQIj3ywkPbOQpBYwMq1iFMrNTM5OLcrM1ivIqCxJTdZLSd3ECAy8wxPVL+1g7JvjcYiRiYPx
        EKMEB7OSCK+aUXq8EG9KYmVValF+fFFpTmrxIUZpDhYlcd4NvCVhQgLpiSWp2ampBalFMFkm
        Dk6pBsalK5of7D129nTXT37HC9mXFxrHZ9611ZZ5kp7t+ESI08zH75fQi0j5+VkXaza7aecf
        vXNXX2TJq7b3aR0qBVPqPa4tOKHSo8CZ6sgdbCrHdFgwMSNWVSFrNddL81LDzOtLVp8WZ5W/
        /+rK+yQzxz2KvZoLi+7WN6+N3KkZsv9msGfalrtH/iqxFGckGmoxFxUnAgDQlXCtKgIAAA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make use of generic touchscreen=5Fproperties structure to add axis
inversion and swapping capabilities. It's configurable via devicetree
properties:
  touchscreen-inverted-x
  touchscreen-inverted-y
  touchscreen-swapped-x-y

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/input/touchscreen/stmpe-ts.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscre=
en/stmpe-ts.c
index 7e16fcfe3b95..cd747725589b 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/platform=5Fdevice.h>
 #include <linux/input.h>
+#include <linux/input/touchscreen.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -72,6 +73,7 @@ struct stmpe=5Ftouch {
 	struct input=5Fdev *idev;
 	struct delayed=5Fwork work;
 	struct device *dev;
+	struct touchscreen=5Fproperties prop;
 	u8 ave=5Fctrl;
 	u8 touch=5Fdet=5Fdelay;
 	u8 settling;
@@ -150,8 +152,7 @@ static irqreturn=5Ft stmpe=5Fts=5Fhandler(int irq, void=
 *data)
 	y =3D ((data=5Fset[1] & 0xf) << 8) | data=5Fset[2];
 	z =3D data=5Fset[3];
=20
-	input=5Freport=5Fabs(ts->idev, ABS=5FX, x);
-	input=5Freport=5Fabs(ts->idev, ABS=5FY, y);
+	touchscreen=5Freport=5Fpos(ts->idev, &ts->prop, x, y, false);
 	input=5Freport=5Fabs(ts->idev, ABS=5FPRESSURE, z);
 	input=5Freport=5Fkey(ts->idev, BTN=5FTOUCH, 1);
 	input=5Fsync(ts->idev);
@@ -337,6 +338,8 @@ static int stmpe=5Finput=5Fprobe(struct platform=5Fdevi=
ce *pdev)
 	input=5Fset=5Fabs=5Fparams(idev, ABS=5FY, 0, XY=5FMASK, 0, 0);
 	input=5Fset=5Fabs=5Fparams(idev, ABS=5FPRESSURE, 0x0, 0xff, 0, 0);
=20
+	touchscreen=5Fparse=5Fproperties(idev, false, &ts->prop);
+
 	error =3D input=5Fregister=5Fdevice(idev);
 	if (error) {
 		dev=5Ferr(&pdev->dev, "Could not register input device\n");
--=20
2.25.1

