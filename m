Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0AA85B7FA
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 11:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbfGAJ0b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 05:26:31 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46839 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbfGAJ0a (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 05:26:30 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190701092629euoutp02e18e2489b2d2f313961ee0a72b9aa517~tPlb_bBy91504215042euoutp02p
        for <linux-input@vger.kernel.org>; Mon,  1 Jul 2019 09:26:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190701092629euoutp02e18e2489b2d2f313961ee0a72b9aa517~tPlb_bBy91504215042euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561973189;
        bh=bbuHUVPOwiuUpoBROT6LArd3Pa2i2I3orwf6k/+JiqU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=U73ox6N5luo+qrayfNz0hn1fnxVLDucxbXczGxLMYfOUmnPcCnCiG14X+eJg5/AUN
         Vpj8R3vEaRiRYE9OYiDnThx4yHYy2Q3WC1k7EMJnUZbTbk6caXSFK+D8hJjSzFHHgD
         UNVZvZUNsV0goe9LywT6pMj5etSjsvVMQxQFLZOc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190701092628eucas1p2fd3557cf8ab6c7d057c68e6fcf26c464~tPlberIQb2678126781eucas1p2u;
        Mon,  1 Jul 2019 09:26:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 79.D8.04298.4C1D91D5; Mon,  1
        Jul 2019 10:26:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190701092627eucas1p147af4474d3a5350784ed8477a42f4f5c~tPlaoaxaQ0549005490eucas1p1X;
        Mon,  1 Jul 2019 09:26:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190701092627eusmtrp10690658903edfcd83d1b8b0dc636b66c~tPlaXrdWy0184801848eusmtrp1q;
        Mon,  1 Jul 2019 09:26:27 +0000 (GMT)
X-AuditID: cbfec7f2-3615e9c0000010ca-26-5d19d1c41078
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id CC.3B.04140.3C1D91D5; Mon,  1
        Jul 2019 10:26:27 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190701092626eusmtip22959c3b011eb595c710ae3aec7cfead6~tPlZ_rKTN1441414414eusmtip29;
        Mon,  1 Jul 2019 09:26:26 +0000 (GMT)
Subject: Re: [PATCH] drm: bridge: DRM_SIL_SII8620 should depend on, not
 select INPUT
From:   Andrzej Hajda <a.hajda@samsung.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Message-ID: <d01a9ad5-edcd-81ec-6528-9b6a4e9a8754@samsung.com>
Date:   Mon, 1 Jul 2019 11:26:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a7edece4-fec4-5811-27a9-ca6c275a4c40@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djPc7pHLkrGGnx4z2px5et7NotJ9yew
        WHROXMJucfPTN1aLy7vmsFm8vTOdxeLFvbdMDuwesztmsnpsXqHlMaVTwuN+93Emj74tqxg9
        Pm+SC2CL4rJJSc3JLEst0rdL4MpYcPYmS8FJvoonr18yNTCe5u5i5OSQEDCReNrzjKWLkYtD
        SGAFo8SPQ1uZIZwvjBKNF29BZT4zSjx89ZMVpuXu01VMILaQwHJGiXvvyiHst4wSv/tNQWxh
        gTCJcw1HwWrYBDQl/m6+yQYySERgO6PEjkUf2UEcZoFZjBLL+kCWc3LwCthJ3Diykg3EZhFQ
        kWhYfRxsm6hAhMTlLbsYIWoEJU7OfAJWzylgL7Fi636wemYBeYntb+cwQ9jiEreezGcCWSAh
        sItdYueZO4wQZ7tILG1aCfWCsMSr41vYIWwZidOTe1gg7HqJ+ytamCGaOxgltm7YyQyRsJY4
        fPwiUDMH0AZNifW79CHCjhI/T/1jBwlLCPBJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVihL3z26F
        GigusfTCV7YJjEqzkHw2C8k3s5B8Mwth7wJGllWM4qmlxbnpqcWGeanlesWJucWleel6yfm5
        mxiBqej0v+OfdjB+vZR0iFGAg1GJh7fhjkSsEGtiWXFl7iFGCQ5mJRHe/SskY4V4UxIrq1KL
        8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8sSc1OTS1ILYLJMnFwSjUwNj5Ss20vvmR2JMt5ctWZ
        Iv83AYc5j7bM+tkmkqAwdd68q3p9rfJLA3Jyk/e0potJWLTr3Dhq47xnUvD/JBPVA9Y2KxNf
        Sx8/V8f/Vnm5/GPZ9FsnWFgcXD4FBhoYlTQF7+abectl/gYvdRHuHnnLastIxnXv/9ue6U3o
        21qne66VSfmhW5oSS3FGoqEWc1FxIgC5yQEMQQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xe7qHL0rGGuz8ImRx5et7NotJ9yew
        WHROXMJucfPTN1aLy7vmsFm8vTOdxeLFvbdMDuwesztmsnpsXqHlMaVTwuN+93Emj74tqxg9
        Pm+SC2CL0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL
        0MtYcPYmS8FJvoonr18yNTCe5u5i5OSQEDCRuPt0FVMXIxeHkMBSRom+5Y9ZIRLiErvnv2WG
        sIUl/lzrYoMoes0osWD7Z/YuRg4OYYEwidYnRSA1bAKaEn833wSrERHYySjxvW8l2FRmgVmM
        Epdaj7GCNAgJnGSU2KEG0sArYCdx48hKNhCbRUBFomH1cbDFogIREn1ts9kgagQlTs58wgJi
        cwrYS6zYuh8sziygLvFn3iVmCFteYvvbOVC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnF
        KJJaWpybnltspFecmFtcmpeul5yfu4kRGHvbjv3csoOx613wIUYBDkYlHl6NWxKxQqyJZcWV
        uYcYJTiYlUR496+QjBXiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGBayCuJNzQ1NLewNDQ3
        Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwBidWtOYIWo0Y6Hel6LetbK6RdOaTc+K
        rXvuvNGOM2SVx+bG1257v75iPH9n6SKFpJO+SeafuO8ZNHLOZdz8aebjI/73FbzFBXvtbYLs
        z9Zkcch07pY69s4wPeeLzt6sV+paa53e6O6+vF7lpzLHde7vwttTuHmM+1d6vYt/s2XS6jPF
        8XkNUkosxRmJhlrMRcWJANmi8rXTAgAA
X-CMS-MailID: 20190701092627eucas1p147af4474d3a5350784ed8477a42f4f5c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a
References: <CGME20190701033927epcas2p2d7d0b611a0d32b7b208acc787069a83a@epcas2p2.samsung.com>
        <8baa25c0-498b-d321-4e6a-fe987a4989ba@infradead.org>
        <a7edece4-fec4-5811-27a9-ca6c275a4c40@samsung.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 01.07.2019 11:23, Andrzej Hajda wrote:
> On 01.07.2019 05:39, Randy Dunlap wrote:
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> A single driver should not enable (select) an entire subsystem,
>> such as INPUT, so change the 'select' to "depends on".
>>
>> Fixes: d6abe6df706c ("drm/bridge: sil_sii8620: do not have a dependency of RC_CORE")
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Inki Dae <inki.dae@samsung.com>
>> Cc: Andrzej Hajda <a.hajda@samsung.com>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>> Linus has written this a couple of times in the last 15 years or so,
>> but my search fu cannot find it.  And there are a few drivers in the
>> kernel tree that do this, but we shouldn't be adding more that do so.
>
> The proper solution has been already posted [1], but it has not been
> applied yet to input tree?
>
> Randy are there chances your patchset will appear in ML in near future,
> or should I merge your sii8620 patch alone?


Ups, I used wrong surname, I meant Ronald, added him input ML to cc.


Regards

Andrzej



>
>
> [1]:
> https://lore.kernel.org/lkml/20190419081926.13567-2-ronald@innovation.ch/
>
>
> Regards
>
> Andrzej
>
>
>
>>  drivers/gpu/drm/bridge/Kconfig |    3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> --- lnx-52-rc7.orig/drivers/gpu/drm/bridge/Kconfig
>> +++ lnx-52-rc7/drivers/gpu/drm/bridge/Kconfig
>> @@ -83,10 +83,9 @@ config DRM_PARADE_PS8622
>>  
>>  config DRM_SIL_SII8620
>>  	tristate "Silicon Image SII8620 HDMI/MHL bridge"
>> -	depends on OF
>> +	depends on OF && INPUT
>>  	select DRM_KMS_HELPER
>>  	imply EXTCON
>> -	select INPUT
>>  	select RC_CORE
>>  	help
>>  	  Silicon Image SII8620 HDMI/MHL bridge chip driver.
>>
>>
>>
>>

