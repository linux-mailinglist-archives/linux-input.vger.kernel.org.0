Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C372A0A74
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 16:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgJ3Pyh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 11:54:37 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:58951 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3Pyf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 11:54:35 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201030155432epoutp02ff2e67f3af7c42ac2b38e9fa4fb79a9d~C0CR4hBxB2838228382epoutp028
        for <linux-input@vger.kernel.org>; Fri, 30 Oct 2020 15:54:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201030155432epoutp02ff2e67f3af7c42ac2b38e9fa4fb79a9d~C0CR4hBxB2838228382epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604073272;
        bh=oxRleJibUvvcFLp2nIYkMSCqYD/fctdcVA8rJUE5yhw=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=LsczV1UbbgSjd1jOcT1mSEaRNFwYGZEf5/gwQVSBNEA4gyOvlfZryeoU4jOtZGgmp
         jsO4YHJRAnbL9zoKIm9HheuofRLKPBg7gvfUoCMGGEOTPInGQ8BaxiKruoiy3Qm3qt
         fhEgHIRRb3wAoz6eL/XsrNMF+XiaimBiKza12l5o=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20201030155431epcas1p3478927eed43b4c8958ccdc48a1c2f852~C0CRg78LT1970019700epcas1p38;
        Fri, 30 Oct 2020 15:54:31 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.164]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4CN6Lv0K44zMqYkW; Fri, 30 Oct
        2020 15:54:31 +0000 (GMT)
X-AuditID: b6c32a37-8afff7000000256e-a9-5f9c3736ebfd
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        7A.20.09582.6373C9F5; Sat, 31 Oct 2020 00:54:30 +0900 (KST)
Mime-Version: 1.0
Subject: Re:(2) [PATCH] Input: add SW_COVER_ATTACHED and SW_EXT_PEN_ATTACHED
Reply-To: jryu.kim@samsung.com
Sender: Jungrae Kim <jryu.kim@samsung.com>
From:   Jungrae Kim <jryu.kim@samsung.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Jungrae Kim <jryu.kim@samsung.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        HyungJae Im <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20201030154113.6moks2gr57ztmujk@earth.universe>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201030155430epcms1p3d7f91681f7a6f1f59927a574db9b6b75@epcms1p3>
Date:   Sat, 31 Oct 2020 00:54:30 +0900
X-CMS-MailID: 20201030155430epcms1p3d7f91681f7a6f1f59927a574db9b6b75
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmga6Z+Zx4g/33TC2aF69ns1gw3c7i
        8LYJTBY3P31jtbi8aw6bxd2WTlaLE9+mMVmc3l3iwOHxedUrVo9NqzrZPO5c28PmsX/uGnaP
        vi2rGD0+b5ILYIvKsclITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLx
        CdB1y8wBOkdJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BoUKBXnJhbXJqXrpec
        n2tlaGBgZApUmZCTsWHtU/aCuZIVa8+eZ2pgXCjUxcjJISFgIvHxwF7WLkYuDiGBHYwSP45t
        Zexi5ODgFRCU+LtDGKRGWMBH4sbXfUwgtpCAnMTCOacYIeJaEvv2TmYHsdkENCS+rjzLAmKL
        CHhJzOp/zAIyk1ngOpPExx3/2CGW8UrMaH/KAmFLS2xfvhVsEKeArcT9p5+h4qISN1e/ZYex
        3x+bzwhhi0i03jvLDGELSjz4uRvsTpA5n6fngOySEOhnlOj4eIgZwulhlHjXfIYNokFf4kr/
        TCaIx3wlth7RAAmzCKhK/Di8ggVijovE1q9lIGFmAXmJ7W/nMIOEmQU0Jdbv0ocYoiix8/dc
        RogSPol3X3tYYb7aMe8JE4StJLG1azGULSHxaOolqE88JNY2v2OHBPNpFomZT88zTmBUmIUI
        6VlINs9C2LyAkXkVo1hqQXFuemqxYYExcuRuYgQnTS3zHYzT3n7QO8TIxMF4iFGCg1lJhPf/
        2dnxQrwpiZVVqUX58UWlOanFhxhNgV6eyCwlmpwPTNt5JfGGpkbGxsYWJmbmZqbGSuK8f7Q7
        4oUE0hNLUrNTUwtSi2D6mDg4pRqYFkusLV948ITReRZ7/kNitncu+ZqxvqrJ2ib3l8f71h7J
        jprJ+vuvxS3M3MSp0SDbs0lKLyXl9p+H/FEsM54aHgnf84D3eMbPvDc7ePQWMeWF+86zZBJ9
        yl3buOftN7ULH0zfnjN6JeDJmzaH7a+09bEri3+dfTdfayVfXsifhoedb0+fmvl+3ra82+eK
        lBzl1bqYxLdN1C1f9mv/ul+8DL8/Hb01balq8XfZqS2iCW/s5qiGPbzR15tp/OOA4dRIsQfT
        qrZMZvvZHHbg0+EStgNsLq49m6YJH9r3fNpcgazb15LTs5asVpz4I6W6ZIJk26UFU2YcaJHI
        eXB91eyU+/4zsle8vndDUsh7fdrTdh4lluKMREMt5qLiRAA8vF31IwQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf
References: <20201030154113.6moks2gr57ztmujk@earth.universe>
        <20201030115918epcms1p4aaae97a4549a1b3e505709fed3d91ecb@epcms1p4>
        <20201030114142.GA2409436@kroah.com> <20201030104628.GB2395528@kroah.com>
        <20201029135715.GB3470996@kroah.com>
        <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
        <20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb@epcms1p3>
        <20201030112812epcms1p7d031bb4949b319135e48dfac9409743b@epcms1p7>
        <20201030131552epcms1p2cfe412ede3d3b2c5286d2fff4260300c@epcms1p2>
        <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p3>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> Hi,
> 
> On Fri, Oct 30, 2020 at 10:15:52PM +0900, Jungrae Kim wrote:
> > From 23aed4567e234b7e108c31abadb9f3a3ccccf7d2 Mon Sep 17 00:00:00 2001
> > From: Jungrae Kim <jryu.kim@samsung.com>
> > Date: Fri, 30 Oct 2020 21:23:12 +0900
> > Subject: [PATCH] Input: add SW_COVER_ATTACHED and SW_EXT_PEN_ATTACHED
> > 
> > SW_COVER_ATTACHED represents the connected state of a removable cover
> > of a device. Value 0 means cover was attached with device, value 1 means
> > removed it.
> 
> Any reason against using SW_MACHINE_COVER? That was introduced for Nokia
> N900, where you actually remove the cover to access battery/SD card/
> SIM card (so there is state 0 = cover removed/open and state 1 = cover
> attached/closed).
> 
> -- Sebastian
> 
> > SW_EXT_PEN_ATTACHED represents the state of the pen.
> > Some device have internal pen slot. but other some device have external pen
> > slot. These two cases has different use case in userspace. So need to
> > separate a event. Value 0 means pen was detach on external pen slot on
> > device, value 1 means pen was attached external pen slot on device.
> > 
> > Signed-off-by: Jungrae Kim <jryu.kim@samsung.com>
> > ---
> >  include/linux/mod_devicetable.h        | 2 +-
> >  include/uapi/linux/input-event-codes.h | 4 +++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> > index 5b08a473cdba..897f5a3e7721 100644
> > --- a/include/linux/mod_devicetable.h
> > +++ b/include/linux/mod_devicetable.h
> > @@ -320,7 +320,7 @@ struct pcmcia_device_id {
> >  #define INPUT_DEVICE_ID_LED_MAX                0x0f
> >  #define INPUT_DEVICE_ID_SND_MAX                0x07
> >  #define INPUT_DEVICE_ID_FF_MAX         0x7f
> > -#define INPUT_DEVICE_ID_SW_MAX         0x10
> > +#define INPUT_DEVICE_ID_SW_MAX         0x12
> >  #define INPUT_DEVICE_ID_PROP_MAX       0x1f
> > 
> >  #define INPUT_DEVICE_ID_MATCH_BUS      1
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> > index ee93428ced9a..a0506369de6d 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -893,7 +893,9 @@
> >  #define SW_MUTE_DEVICE         0x0e  /* set = device disabled */
> >  #define SW_PEN_INSERTED                0x0f  /* set = pen inserted */
> >  #define SW_MACHINE_COVER       0x10  /* set = cover closed */
> > -#define SW_MAX                 0x10
> > +#define SW_COVER_ATTACHED      0x11  /* set = cover attached */
> > +#define SW_EXT_PEN_ATTACHED    0x12  /* set = external pen attached */
> > +#define SW_MAX                 0x12
> >  #define SW_CNT                 (SW_MAX+1)
> > 
> >  /*
> > -- 
> > 2.17.1

We need 2 kind of event, cover open/close and cover attach/detach.
The open/close of the cover must work only if the cover is attached.
So we will check cover open/close status using SW_MACHINE_COVER.

Thanks
Jungrae Kim
                                                                                                                                                                                          68,1          Bot
