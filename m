Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A38722946CC
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 05:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411504AbgJUDDB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Oct 2020 23:03:01 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:53548 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406572AbgJUDDA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Oct 2020 23:03:00 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201021030257epoutp02a4ac05020c9a54e38bc18470f74b98c2~-4tCDp-bn0604106041epoutp02O
        for <linux-input@vger.kernel.org>; Wed, 21 Oct 2020 03:02:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201021030257epoutp02a4ac05020c9a54e38bc18470f74b98c2~-4tCDp-bn0604106041epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603249377;
        bh=6UAabylJqz87M04J55ohv4SkzPKemiXY8kaIy1S+zFA=;
        h=Subject:Reply-To:From:To:CC:Date:References:From;
        b=Pp/fXFHWB/btdC2hlq6Sy5OdMLdfMVtL8F9hCwOcLKwvsDe0UFv0wc4ZkLGjGbeZm
         0Rzi2e88PlqZsiJbzc75dfT++25Mm6ohJVu74/nsuEGigMnkLPK/KaFmxiYmrPipJc
         oujfGzcVOexdXzhAB9cdpIrrStvSPOrDmbccGNT4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201021030257epcas1p163cc871391255fba75c3911d758b8c67~-4tBs1rxw0809708097epcas1p1n;
        Wed, 21 Oct 2020 03:02:57 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4CGFfm1kCczMqYlr; Wed, 21 Oct
        2020 03:02:56 +0000 (GMT)
X-AuditID: b6c32a39-bfdff70000002569-99-5f8fa4e00098
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        8B.75.09577.0E4AF8F5; Wed, 21 Oct 2020 12:02:56 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] FROMLIST: input: add 2 kind of switch
Reply-To: hj2.im@samsung.com
Sender: =?UTF-8?B?7J6E7ZiV7KCc?= <hj2.im@samsung.com>
From:   =?UTF-8?B?7J6E7ZiV7KCc?= <hj2.im@samsung.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
CC:     =?UTF-8?B?7J6E7ZiV7KCc?= <hj2.im@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201021030255epcms1p21924b35616dc666b7b6c04c2c5d8a1a2@epcms1p2>
Date:   Wed, 21 Oct 2020 12:02:55 +0900
X-CMS-MailID: 20201021030255epcms1p21924b35616dc666b7b6c04c2c5d8a1a2
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgk+LIzCtJLcpLzFFi42LZdlhTV/fBkv54g0eTOCwOL3rBaNG8eD2b
        xYLpdhY3P31jtbi8aw6bxd2WTlaLE9+mMTmwe3xe9YrVY+esu+wed67tYfPYP3cNu0ffllWM
        Hp83yQWwReXYZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl
        5gCdoqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMDQo0CtOzC0uzUvXS87PtTI0
        MDAyBapMyMn4s2MuU8EbvoqlW7vZGhj38HQxcnJICJhInLo2kwXEFhLYwSjx7GR9FyMHB6+A
        oMTfHcIgYWEBM4k1Kw6xgISFBGQkuvYYQYRNJS5u/ccMYrMJGEvcbdnA1sXIxSEi8IFJ4uby
        1awgCWYBQ4mv73YwQ6zilZjR/pQFwpaW2L58KyOELSpxc/Vbdhj7/bH5UHERidZ7Z6F6BSUe
        /NzNCNO79MpiJpBlEgLtjBIXb/5ihXBaGCUWLD3MBlGlL3GlfyYTiM0r4Cvx+OFXsA0sAqoS
        89achprqIvH01AxmiEvlJba/ncMM8iWzgKbE+l36ECWKEjt/z2WEKOGTePe1hxXmmR3znjBB
        2AoSGxd9glorJjFr3m2oJz0knr/6zAwJ20CJq/POM05glJ+FCN5ZSBbPQli8gJF5FaNYakFx
        bnpqsWGBKXKEbmIEJ0Utyx2M099+0DvEyMTBeIhRgoNZSYR3AmtfvBBvSmJlVWpRfnxRaU5q
        8SFGU6CXJzJLiSbnA9NyXkm8oamRsbGxhYmZuZmpsZI47x/tjnghgfTEktTs1NSC1CKYPiYO
        TqkGJs+svmdbc2u2aE1R3/Xp0mQX7Uv6k6zS5q36toHFnre17YuD6OndVV/XFnTILpNhmjFH
        tVX67tyHVV0fjY9/1GZ/n2qvefCNbfs8/9qdlpxTtL68ftTe18WxVpejlH/qS6/in2ZT338V
        qjM/WR5Z7JohYCN2436VeVhr883dZRZih9SjROZIfvl6PM7wcgrXkUsy0VslDj55V/fbUurl
        paUFvNoPnvCW/p3w+VB9cnNKF3tIrInxNMEPcZI6M2qzNF68lnI6UVtzdd/8x5VLm8MDIo/X
        hi8JY+3bvie4cMIeLWeBDJYa67Td7TPuPgnq/rtq5c0f+zya/v3SMPAQu7iFfbrs7l0prFXJ
        nS5eSizFGYmGWsxFxYkAygtjSxMEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201021030255epcms1p21924b35616dc666b7b6c04c2c5d8a1a2
References: <CGME20201021030255epcms1p21924b35616dc666b7b6c04c2c5d8a1a2@epcms1p2>
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
