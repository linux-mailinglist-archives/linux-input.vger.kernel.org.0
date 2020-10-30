Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9625D2A0649
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 14:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgJ3NP6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 09:15:58 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:46825 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3NP6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 09:15:58 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201030131555epoutp03ea60ef073e8096cc253ea994606818c0~Cx3ygA1Hp0116201162epoutp03i
        for <linux-input@vger.kernel.org>; Fri, 30 Oct 2020 13:15:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201030131555epoutp03ea60ef073e8096cc253ea994606818c0~Cx3ygA1Hp0116201162epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604063755;
        bh=oXFaU4arpGJFODjHsgMzxQHN9yeh1j4UjTLjwzWIZiI=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=p9KgwYMvja9fbZjjB4yLldZiXqHu6XC3M2s7uq1FFsLT+5ibeo5YQPrcPHVXwvrlv
         9n+coYiY8LDr7ePAo94hJf2gnTUFXjsT4RjewC10ocVDN96/kg4eGB49nuCSgwtzr7
         UCP7RhiJ19+cUIxw0JQnymBeTpM8mV/WCrJsEgDo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201030131555epcas1p27df81941e6f80cd353240286b5540550~Cx3yL5n0X0445804458epcas1p2L;
        Fri, 30 Oct 2020 13:15:55 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4CN2qt3GChzMqYlr; Fri, 30 Oct
        2020 13:15:54 +0000 (GMT)
X-AuditID: b6c32a39-c13ff70000002569-d6-5f9c1209c5ee
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        D5.51.09577.9021C9F5; Fri, 30 Oct 2020 22:15:53 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] Input: add SW_COVER_ATTACHED and SW_EXT_PEN_ATTACHED
Reply-To: jryu.kim@samsung.com
Sender: Jungrae Kim <jryu.kim@samsung.com>
From:   Jungrae Kim <jryu.kim@samsung.com>
To:     Jungrae Kim <jryu.kim@samsung.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     HyungJae Im <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20201030115918epcms1p4aaae97a4549a1b3e505709fed3d91ecb@epcms1p4>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201030131552epcms1p2cfe412ede3d3b2c5286d2fff4260300c@epcms1p2>
Date:   Fri, 30 Oct 2020 22:15:52 +0900
X-CMS-MailID: 20201030131552epcms1p2cfe412ede3d3b2c5286d2fff4260300c
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdljTQJdTaE68wYNvrBbNi9ezWSyYbmdx
        eNsEJoubn4BCl3fNYbO429LJanHi2zQmB3aPz6tesXrcubaHzWP/3DXsHn1bVjF6fN4kF8Aa
        lWOTkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SFkkJZ
        Yk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafA0KBArzgxt7g0L10vOT/XytDAwMgUqDIh
        J6Nnm2XBScGKKWva2RoYP/J2MXJwSAiYSPSf1exi5OIQEtjBKDFt2R52kDivgKDE3x3CXYyc
        HMICrhJT10xiA7GFBOQkFs45xQgR15LYt3cyO4jNJqAh8XXlWRYQW0QgWWLKls1MIDOZBWYx
        SUz9uZQJJCEhwCsxo/0pC4QtLbF9+VZGkF2cAn4Sr5sTIcKiEjdXv2WHsd8fm88IYYtItN47
        ywxhC0o8+LmbEeJ8aYnP03NAVkkI9DNKdHw8xAzh9DBKvGs+wwbRoC9xpX8m2A28Ar4S828s
        AouzCKhKHL55GKrGRaJnw0GwxcwC8hLb385hBlnALKApsX6XPkSJosTO33MZIUr4JN597WGF
        eWvHvCdQLypJbO1aDGVLSDyaegnqFw+Jtc3v2CHhfIVZ4undiewTGBVmIYJ6FpLNsxA2L2Bk
        XsUollpQnJueWmxYYIoct5sYwQlSy3IH4/S3H/QOMTJxMB5ilOBgVhLh/X92drwQb0piZVVq
        UX58UWlOavEhRlOgnycyS4km5wNTdF5JvKGpkbGxsYWJmbmZqbGSOO8f7Y54IYH0xJLU7NTU
        gtQimD4mDk6pBia9Jyx3hA7vu+yj5n9wy7RnAa3J3cu1zU4n96tcZTvjpfVe4L7c84cqnf//
        tEcvn6BpKPFcv/S3nNs0gW+unq6LPmfO7ksq0ZBN2OZTP1/0+tJpR7l3nrMxlHjj1rbB0TO1
        RIH5ne3bNo1V/tN3WXT/fCm/YO3myPfC7zqM/2ofm7HSTv9dsq1Xjp61wkQXVaFNvtPSD7eo
        5Bz4/dZoxYWdT2RsQ+7vzv+1z7/594fd2u9WGT/OnSZ9US2tNr5Islf8T6TGg1Vq7tE/HQUf
        G4VN29LaO1V03ifFL5+kenbL/zi48flBbZ+An8djrRkLQ5QOO+xjMNu1e97TLUFNe1/mZfDe
        3HMrzlamYk3Pi0IlluKMREMt5qLiRACeaFXeGQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf
References: <20201030115918epcms1p4aaae97a4549a1b3e505709fed3d91ecb@epcms1p4>
        <20201030114142.GA2409436@kroah.com> <20201030104628.GB2395528@kroah.com>
        <20201029135715.GB3470996@kroah.com>
        <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
        <20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb@epcms1p3>
        <20201030112812epcms1p7d031bb4949b319135e48dfac9409743b@epcms1p7>
        <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p2>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From 23aed4567e234b7e108c31abadb9f3a3ccccf7d2 Mon Sep 17 00:00:00 2001
From: Jungrae Kim <jryu.kim@samsung.com>
Date: Fri, 30 Oct 2020 21:23:12 +0900
Subject: [PATCH] Input: add SW_COVER_ATTACHED and SW_EXT_PEN_ATTACHED

SW_COVER_ATTACHED represents the connected state of a removable cover
of a device. Value 0 means cover was attached with device, value 1 means
removed it.
SW_EXT_PEN_ATTACHED represents the state of the pen.
Some device have internal pen slot. but other some device have external pen
slot. These two cases has different use case in userspace. So need to
separate a event. Value 0 means pen was detach on external pen slot on
device, value 1 means pen was attached external pen slot on device.

Signed-off-by: Jungrae Kim <jryu.kim@samsung.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5b08a473cdba..897f5a3e7721 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -320,7 +320,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX                0x0f
 #define INPUT_DEVICE_ID_SND_MAX                0x07
 #define INPUT_DEVICE_ID_FF_MAX         0x7f
-#define INPUT_DEVICE_ID_SW_MAX         0x10
+#define INPUT_DEVICE_ID_SW_MAX         0x12
 #define INPUT_DEVICE_ID_PROP_MAX       0x1f

 #define INPUT_DEVICE_ID_MATCH_BUS      1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index ee93428ced9a..a0506369de6d 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -893,7 +893,9 @@
 #define SW_MUTE_DEVICE         0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED                0x0f  /* set = pen inserted */
 #define SW_MACHINE_COVER       0x10  /* set = cover closed */
-#define SW_MAX                 0x10
+#define SW_COVER_ATTACHED      0x11  /* set = cover attached */
+#define SW_EXT_PEN_ATTACHED    0x12  /* set = external pen attached */
+#define SW_MAX                 0x12
 #define SW_CNT                 (SW_MAX+1)

 /*
-- 
2.17.1
