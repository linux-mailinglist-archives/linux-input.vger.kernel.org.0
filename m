Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B38A50725D
	for <lists+linux-input@lfdr.de>; Tue, 19 Apr 2022 17:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354128AbiDSP74 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Apr 2022 11:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354142AbiDSP7v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Apr 2022 11:59:51 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD22A23BF6
        for <linux-input@vger.kernel.org>; Tue, 19 Apr 2022 08:57:08 -0700 (PDT)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MoNu2-1oI6lm0cbg-00omkK; Tue, 19 Apr 2022 17:52:02 +0200
Received: by mail-wr1-f41.google.com with SMTP id q3so22402428wrj.7;
        Tue, 19 Apr 2022 08:52:02 -0700 (PDT)
X-Gm-Message-State: AOAM532RhodXEZhbBz4IT2UDAdzoCnyWt3q/3yEuIaL2+QGoT/+lVLGn
        fJTPRGEPeAXSDMOq+bzG24dQBLepeTJ5FpmFGZA=
X-Google-Smtp-Source: ABdhPJxprta94GGTRggzdNaK+Ebzz+38bj4lMNTvLRapjJIb5gsqgg6f1i2QroIG0V1Waa/9seZrEzqeMzsaSpxaM0g=
X-Received: by 2002:a5d:6da5:0:b0:20a:8805:6988 with SMTP id
 u5-20020a5d6da5000000b0020a88056988mr11128970wrs.317.1650383521805; Tue, 19
 Apr 2022 08:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de> <20191018154201.1276638-28-arnd@arndb.de>
 <87tv7sk0ph.fsf@belgarion.home>
In-Reply-To: <87tv7sk0ph.fsf@belgarion.home>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 19 Apr 2022 17:51:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3nFB2N7sRrS90eTECxXtwwo8EJdPvHRjnp-G5HGEt3aw@mail.gmail.com>
Message-ID: <CAK8P3a3nFB2N7sRrS90eTECxXtwwo8EJdPvHRjnp-G5HGEt3aw@mail.gmail.com>
Subject: Re: [PATCH 28/46] input: touchscreen: mainstone: sync with zylonite driver
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Daniel Mack <daniel@zonque.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:eneU2avD34ZziM4Dzhuxd3ES0LC3AGZBjJoEx5pjNbSuTRUNlva
 XZcj0lJDyuatZKXBHRY5dde4tgfqFbrww7MZlssDkHoHaTyQ1d2/XyMk6JXPU/afGPytPc/
 t8J43KI9OHC/iWbyZmNBzukskGiLAUcRdlM0E6lhlPimWTE0Qet3ev+HpLRcRp14KL7uJU2
 xuyOadnRNvOIcuGaprSNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/hVgHO7EfPY=:j5Nbf/VXszyXxl0ZVVzi2d
 XauefaQzqzdqENV94cz3yni6zcdwyh9tDhHsgZj6UeO30m2BxtZ+DBT83oSOhg2cdSDzfoMpF
 D5S6/wHoKSmPqXYDof45AU0w2Dy8OjftXJiMWhD+d5QycMC7KdpZVIcI7LbC+vBkn/oWiAo1W
 maq/C8LE6yFOKgUtN1kNtU/MtsHOCPEIdwfLo62LCfZEQcUytqPk66vicKoOZ/oNm4bXzVDsT
 7McrwJjXu+8zT0HIHqer85ojsNy0pmKr2ufqBD1QblXMJhfyFkNy+Asktvoy4YuJzxtl+yb1N
 PMsykoUKULj7JiPz8syVYZ1+SY/E2XXSmp1GJG17UfdWXwpZIqU2GA2kLsA7ixGs5w1UPJc4M
 YkRg8WyBaaxjpAk9vPfl2Bpv+CRRL8hG0XI1kTL911V+jjjHV/ndyAKBMWVeU2DFsihpdxNjL
 wnFpuKfs/+is5Efe52z8CvlqWruGy+RsM99OFTeDsLN5yjlHft755oc9ukHPfk6HOhHuW01sD
 Z/2i4R2hHU/tt3mGYNCT4r5K60MiaJFJmRLjYwgRfIMH6nV7JhxdzVBGoSzK+yRtLfX2AYPso
 16Z5ILx1OgSPCjVeUoXRh1Mum9pwnJz3/+SeOmIt99f0eUQbu5BQSR23p2a2wjcPG4JlzAWUC
 KCqaHDr/OHUONKYF6j/H2cu3uouCG3Glkztbwwoc6lnd2gmApBt20o67nM+J7iK7rh1g2Zioa
 7OLKPmwZ+xAn/jvGPe7qTL7yL62+l7XJM5Vg0qNBTTJM4vgdj767hRmnHm69vrR+wHfS+/m+9
 xVM0Oc99fGEf1Dkb6N5vzETOGy98d0HGz4OYPINq84tG48mrzI=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 28, 2019 at 10:41 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
> Arnd Bergmann <arnd@arndb.de> writes:
>
> > +     } else if (machine_is_zylonite()) {
> > +             pen_int = 1;
> >       }
> I don't understand that part, why do you check for a zylonite board in this file
> ?
>

Revisiting another old patch. The reason here is that both the zylonite and
mainstone drivers are for the same hardware, using the same "wm97xx-touch"
platform_driver name, which means that we cannot have them both built
in the same kernel on a multiplatform machine.

By making the mainstone driver deal with zylonite hardware, we can
ensure that this driver works on all the relevant machines. I'm fairly sure
my plan was to later remove the zylonite driver entirely, but for some reason
I did not include a patch for that in my series.

We can probably do that as a follow-up later.

       Arnd
