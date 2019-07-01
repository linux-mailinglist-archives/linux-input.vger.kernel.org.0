Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 407595BF08
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 17:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbfGAPHU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 11:07:20 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45349 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbfGAPHU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 11:07:20 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190701150718euoutp011e0bc29e7a33a9bf7d974fe34c00245c~tUPAvCHay1346013460euoutp01f
        for <linux-input@vger.kernel.org>; Mon,  1 Jul 2019 15:07:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190701150718euoutp011e0bc29e7a33a9bf7d974fe34c00245c~tUPAvCHay1346013460euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561993638;
        bh=NEuerPXRhR0c1fio9NicFLHJwcEZamM4eOZMG9irU+M=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=REIun0V9uA1foZhhheRdQ86nxEJXyome8UM8c6l97wauJLEkJ6PkBhI+RZEp3O8ZR
         ZymmwmrHVuaQXSbtFlJaR/k0aGgJ0Wp/EZqJ+FFWa2O7IFRXY1H1CbgZuP6RAhsxNc
         QbpKt3TYXIly2XBtJbDw9+zW0uTB9e2MDHHaQXWU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190701150717eucas1p28f5500809fe9ab988ef7bbfa80c48e4c~tUPARYFZb2700227002eucas1p2V;
        Mon,  1 Jul 2019 15:07:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 8A.39.04325.5A12A1D5; Mon,  1
        Jul 2019 16:07:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190701150716eucas1p1f71d42be2063f4e66cfd4f7b019ceb70~tUO-fTKSJ1580715807eucas1p1X;
        Mon,  1 Jul 2019 15:07:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190701150716eusmtrp23ecadb3a887b4699aa3f07b6482392eb~tUO-RQh6X1467414674eusmtrp2o;
        Mon,  1 Jul 2019 15:07:16 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-2d-5d1a21a5e404
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D6.52.04146.4A12A1D5; Mon,  1
        Jul 2019 16:07:16 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190701150716eusmtip27a43d7cd77bff8a5b51337bcf3ebf721~tUO_6eNPe3112931129eusmtip2B;
        Mon,  1 Jul 2019 15:07:16 +0000 (GMT)
Subject: Re: [PATCH 3/3] video: fbdev: don't print error message on
 framebuffer_alloc() failure
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>,
        Jiri Kosina <jikos@kernel.org>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <6e21ef05-9239-de09-4252-320b437297fa@samsung.com>
Date:   Mon, 1 Jul 2019 17:07:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJJFKQEwEiDe1M6gP5D_yf0BxyzaJH-kxwxqkCVo52WK6g@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsWy7djP87pLFaViDc6sk7K4PmUzq8W5Sa+Z
        La58fc9mcet4K6PFib4PrBY3P31jtbi8aw6bA7vHplWdbB5v5gp43O8+zuTxft9VNo/Pm+QC
        WKO4bFJSczLLUov07RK4Mi6dySxYpVLx6fFElgbGbxJdjJwcEgImEj1v/7N0MXJxCAmsYJTY
        PHkuO4TzhVFi3c9JUM5nRonX+2+ydTFygLVMOOAPEV/OKPHl2mdWkFFCAm8ZJa42BYDYwgKJ
        Eh9+LGACsUUEzCQmd2wGG8Qs0MgksfzsInaQBJuAlcTE9lWMIDavgJ1E05NpbCA2i4CKxIn7
        18DiogIREvePbWCFqBGUODnzCQuIzSkQKPHp2RQwm1lAXOLWk/lMELa8RPPW2cwgyyQENrFL
        vDp/hh3iUReJKXc3sUDYwhKvjm+BistI/N8J0gzSsI5R4m/HC6ju7YwSyyf/Y4OospY4fPwi
        K8j/zAKaEut36UOEHSU2nLrMDgkWPokbbwUhjuCTmLRtOjNEmFeio00IolpNYsOyDWwwa7t2
        rmSewKg0C8lrs5C8MwvJO7MQ9i5gZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmIBO
        /zv+dQfjvj9JhxgFOBiVeHhvcEnFCrEmlhVX5h5ilOBgVhLh3b9CMlaINyWxsiq1KD++qDQn
        tfgQozQHi5I4bzXDg2ghgfTEktTs1NSC1CKYLBMHp1QD4w0JhofG/O8qK1WTjF69f/4m2VD0
        8NFDS5+1r8h4vS323PPSI/IFQUH253hu9r4x/dYo+JIvZMJFI72lYu/+lMdOdBWQKXz/69aR
        3Q4+QdMzJ9vdybGfr6yb6StoYBuVZ/9Q7DTnhQ86E1f1LZ35+fqjVtmZ+ZP2/L71dPUVxe0m
        XnLbj4Zd/abEUpyRaKjFXFScCABe4T6qPAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xe7pLFKViDZ6t17C4PmUzq8W5Sa+Z
        La58fc9mcet4K6PFib4PrBY3P31jtbi8aw6bA7vHplWdbB5v5gp43O8+zuTxft9VNo/Pm+QC
        WKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mi6d
        ySxYpVLx6fFElgbGbxJdjBwcEgImEhMO+HcxcnIICSxllGi5WQURlpE4vr4MJCwhICzx51oX
        WxcjF1DJa0aJk/f+MIEkhAUSJT78WABmiwiYSUzu2MwOUsQs0Mwk8WDjT6iOm4wSzWueg1Wx
        CVhJTGxfxQhi8wrYSTQ9mcYGYrMIqEicuH8NLC4qECFx5v0KFogaQYmTM5+A2ZwCgRKfnk0B
        s5kF1CX+zLvEDGGLS9x6Mp8JwpaXaN46m3kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5
        xYZ6xYm5xaV56XrJ+bmbGIHxtu3Yz807GC9tDD7EKMDBqMTDe4NLKlaINbGsuDL3EKMEB7OS
        CO/+FZKxQrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTAV5JfGGpobmFpaG5sbmxmYWSuK8
        HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYEw6X9F+ynTOjla1q4r8c4YvuZevO3Nlh1Jerkzwh
        wzfiyKp1pw6XpbDa9sTdnL82plxoQlqO7Ma9M0WiQvcqXmSM77LOvHKgT61m7pv2aS+iC2+p
        u17SbHVZrDdd7iDzobvR1+ZHht1YFrq8yuLc1IMK4j+Dfv7aF3IicML+7S8+Xrmf6lY3TYml
        OCPRUIu5qDgRAKhG3jfNAgAA
X-CMS-MailID: 20190701150716eucas1p1f71d42be2063f4e66cfd4f7b019ceb70
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190614145128eucas1p2783e7d644ef8823d211896298e8988fc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190614145128eucas1p2783e7d644ef8823d211896298e8988fc
References: <CGME20190614145128eucas1p2783e7d644ef8823d211896298e8988fc@eucas1p2.samsung.com>
        <3da197ed-a701-2aa7-d775-2bdbe9deab4a@samsung.com>
        <CAO-hwJJFKQEwEiDe1M6gP5D_yf0BxyzaJH-kxwxqkCVo52WK6g@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 7/1/19 10:37 AM, Benjamin Tissoires wrote:
> Hi Bartlomiej,

Hi Benjamin,

> On Fri, Jun 14, 2019 at 4:52 PM Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>>
>> framebuffer_alloc() can fail only on kzalloc() memory allocation
>> failure and since kzalloc() will print error message in such case
>> we can omit printing extra error message in drivers (which BTW is
>> what the majority of framebuffer_alloc() users is doing already).
>>
>> Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
>> Cc: Jiri Kosina <jikos@kernel.org>
>> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> ---
>>  drivers/hid/hid-picolcd_fb.c                   |    4 +---
>>  drivers/video/fbdev/amifb.c                    |    4 +---
>>  drivers/video/fbdev/arkfb.c                    |    4 +---
>>  drivers/video/fbdev/atmel_lcdfb.c              |    4 +---
>>  drivers/video/fbdev/aty/aty128fb.c             |    5 ++---
>>  drivers/video/fbdev/aty/atyfb_base.c           |   10 ++++------
>>  drivers/video/fbdev/aty/radeon_base.c          |    2 --
>>  drivers/video/fbdev/chipsfb.c                  |    1 -
>>  drivers/video/fbdev/cirrusfb.c                 |    5 +----
>>  drivers/video/fbdev/da8xx-fb.c                 |    1 -
>>  drivers/video/fbdev/efifb.c                    |    1 -
>>  drivers/video/fbdev/grvga.c                    |    4 +---
>>  drivers/video/fbdev/gxt4500.c                  |    5 ++---
>>  drivers/video/fbdev/hyperv_fb.c                |    4 +---
>>  drivers/video/fbdev/i740fb.c                   |    4 +---
>>  drivers/video/fbdev/imsttfb.c                  |    5 +----
>>  drivers/video/fbdev/intelfb/intelfbdrv.c       |    5 ++---
>>  drivers/video/fbdev/jz4740_fb.c                |    4 +---
>>  drivers/video/fbdev/mb862xx/mb862xxfbdrv.c     |    5 +----
>>  drivers/video/fbdev/mbx/mbxfb.c                |    4 +---
>>  drivers/video/fbdev/omap/omapfb_main.c         |    2 --
>>  drivers/video/fbdev/omap2/omapfb/omapfb-main.c |    6 +-----
>>  drivers/video/fbdev/platinumfb.c               |    5 ++---
>>  drivers/video/fbdev/pmag-aa-fb.c               |    4 +---
>>  drivers/video/fbdev/pmag-ba-fb.c               |    4 +---
>>  drivers/video/fbdev/pmagb-b-fb.c               |    4 +---
>>  drivers/video/fbdev/pvr2fb.c                   |    6 +-----
>>  drivers/video/fbdev/riva/fbdev.c               |    1 -
>>  drivers/video/fbdev/s3c-fb.c                   |    4 +---
>>  drivers/video/fbdev/s3fb.c                     |    4 +---
>>  drivers/video/fbdev/sh_mobile_lcdcfb.c         |    8 ++------
>>  drivers/video/fbdev/sm501fb.c                  |    4 +---
>>  drivers/video/fbdev/sm712fb.c                  |    1 -
>>  drivers/video/fbdev/smscufx.c                  |    4 +---
>>  drivers/video/fbdev/ssd1307fb.c                |    4 +---
>>  drivers/video/fbdev/sunxvr1000.c               |    1 -
>>  drivers/video/fbdev/sunxvr2500.c               |    1 -
>>  drivers/video/fbdev/sunxvr500.c                |    1 -
>>  drivers/video/fbdev/tgafb.c                    |    4 +---
>>  drivers/video/fbdev/udlfb.c                    |    4 +---
>>  drivers/video/fbdev/via/viafbdev.c             |    6 +-----
>>  drivers/video/fbdev/vt8623fb.c                 |    4 +---
>>  42 files changed, 40 insertions(+), 123 deletions(-)
>>
>> Index: b/drivers/hid/hid-picolcd_fb.c
>> ===================================================================
>> --- a/drivers/hid/hid-picolcd_fb.c
>> +++ b/drivers/hid/hid-picolcd_fb.c
>> @@ -522,10 +522,8 @@ int picolcd_init_framebuffer(struct pico
>>                         sizeof(struct fb_deferred_io) +
>>                         sizeof(struct picolcd_fb_data) +
>>                         PICOLCDFB_SIZE, dev);
>> -       if (info == NULL) {
>> -               dev_err(dev, "failed to allocate a framebuffer\n");
>> +       if (!info)
>>                 goto err_nomem;
>> -       }
> 
> It would have been better to split this change as the HID and fbdev
> are different trees.

Ah, there are no modifications to framebuffer_alloc() itself so changes
are independent. I should have noticed that earlier, sorry about that..

> However, I do not expect a conflict here (there hasn't been updates of
> hid-picolcd_fb.c in a while), so feel free to take this patch through
> the fbdev tree with my:
> Acked-By: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Thank you!

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
