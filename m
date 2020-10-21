Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DC92946DB
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 05:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411587AbgJUDMV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Oct 2020 23:12:21 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:42816 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411539AbgJUDMV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Oct 2020 23:12:21 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201021031218epoutp04b314eae354ec93ec9d65198821d3323b~-41MuZQho1374813748epoutp04c
        for <linux-input@vger.kernel.org>; Wed, 21 Oct 2020 03:12:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201021031218epoutp04b314eae354ec93ec9d65198821d3323b~-41MuZQho1374813748epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603249938;
        bh=6UAabylJqz87M04J55ohv4SkzPKemiXY8kaIy1S+zFA=;
        h=Subject:Reply-To:From:To:CC:Date:References:From;
        b=ghk+deIZMO61nOMzS6HWTJIDhMdaUszif1M4585hLUQ6+Wg+KRdyK+oX4BLHerizg
         DWT/2VMTtkxluRaM2BNsvi+cyCHHLeq0eWL8Wn4ZISHLlNqHY6wJjCz7WZ0xDsGzmE
         EuRf2JjOWPDvtuda1xeJsLOWZFde4v5fRIu6s3/I=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20201021031218epcas1p43efec3ce831fc57cfc62133c0b545073~-41Ma3TEZ1675516755epcas1p4Q;
        Wed, 21 Oct 2020 03:12:18 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.165]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4CGFsY3mHVzMqYkb; Wed, 21 Oct
        2020 03:12:17 +0000 (GMT)
X-AuditID: b6c32a37-8afff7000000256e-61-5f8fa710a864
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        D5.2E.09582.017AF8F5; Wed, 21 Oct 2020 12:12:16 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] FROMLIST: input: add 2 kind of switch
Reply-To: hj2.im@samsung.com
Sender: HyungJae Im <hj2.im@samsung.com>
From:   HyungJae Im <hj2.im@samsung.com>
To:     "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     HyungJae Im <hj2.im@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935@epcms1p5>
Date:   Wed, 21 Oct 2020 12:12:16 +0900
X-CMS-MailID: 20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgk+LIzCtJLcpLzFFi42LZdljTQFdgeX+8wZJ34haHF71gtGhevJ7N
        YsF0O4ubn76xWlzeNYfN4m5LJ6vFiW/TmBzYPT6vesXqsXPWXXaPO9f2sHnsn7uG3aNvyypG
        j8+b5ALYonJsMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0y
        c4BOUVIoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUGBoU6BUn5haX5qXrJefnWhka
        GBiZAlUm5GT82TGXqeANX8XSrd1sDYx7eLoYOTgkBEwktmxV6mLk4hAS2MEo8eDaHGaQOK+A
        oMTfHcJdjJwcwgJmEmtWHGIBCQsJyEh07TGCCGtILG35zAhiswmoSfxes4cNZIyIwAcmiQPf
        XoMlmAVUJPo2dYPZEgK8EjPan7JA2NIS25dvhYqLStxc/ZYdxn5/bD5UXESi9d5ZZghbUOLB
        z92MML1LryxmAlkmIdDOKHHx5i9WCKeFUWLB0sNsEFX6Elf6ZzKB2LwCvhIvZv8A62YRUJU4
        uXMWVI2LxOyvf9ggLpWX2P4W4nlmAU2J9bv0IUoUJXb+ngv1DJ/Eu689rDDP7Jj3hAnCVpDY
        uOgT1EgxiVnzbkM96SGx9PRJsBohgUCJky+OMU5glJ+FCN5ZSBbPQli8gJF5FaNYakFxbnpq
        sWGBMXKEbmIEJ0Ut8x2M095+0DvEyMTBeIhRgoNZSYR3AmtfvBBvSmJlVWpRfnxRaU5q8SFG
        U6CXJzJLiSbnA9NyXkm8oamRsbGxhYmZuZmpsZI47x/tjnghgfTEktTs1NSC1CKYPiYOTqkG
        puUObj7MaxlX/V/wPTZ8wsVze7uniue6BXHp3l7854B6d/K0yT3Hv0RNmLQzfMO0pTbzT9tW
        VKxvW6R2eJ9yaXH6s4d3uItVbJ+f+7mT4fuLu8wVy0wt3hqqJNzTjP60pea5zObaE5fDOC8x
        LLQumCz4PWDFDxkh3TaWinlPOZdIyTFETu/WKN3d6FGg/aHihalIyUyV7lcrnV+8lDrGFHKo
        i0X+14IGhvdLpggtn/Wtr/Ds299fv1rGzdzpmbr9XcZGmzd/jqROKov/x777hMirr0fu5usF
        7u0szd2589GFBXfdfl0MFDfOeDprz79WdW2WUwwnHNwOXO6e3Le8vcrSXJP/vuZhxdO6KmVd
        QkuUWIozEg21mIuKEwFb32trEwQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935
References: <CGME20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935@epcms1p5>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From ec9859ee01b7bc0e04255971e0fe97348847dab7 Mon Sep 17 00:00:00 2001
From: "hj2.im" <hj2.im@samsung.com>
Date: Tue, 20 Oct 2020 16:57:04 +0900
Subject: [PATCH] FROMLIST: input: add 2 kind of switch

We need support to various accessories on the device,
some switch does not exist in switch list.
So added switch for the following purpose.

SW_COVER_ATTACHED is for the checking the cover
attached or not on the device. SW_EXT_PEN_ATTACHED is for the
checking the external pen attached or not on the device

Signed-off-by: hj2.im <hj2.im@samsung.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5b08a473cdba..897f5a3e7721 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -320,7 +320,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x10
+#define INPUT_DEVICE_ID_SW_MAX		0x12
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 0c2e27d28e0a..8ca2acee1f92 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -889,7 +889,9 @@
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
 #define SW_MACHINE_COVER	0x10  /* set = cover closed */
-#define SW_MAX			0x10
+#define SW_COVER_ATTACHED	0x11  /* set = cover attached */
+#define SW_EXT_PEN_ATTACHED	0x12  /* set = external pen attached */
+#define SW_MAX			0x12
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
2.11.0
