Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD5151B80B
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 08:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237034AbiEEGiK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 02:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245025AbiEEGiE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 02:38:04 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31D21F625
        for <linux-input@vger.kernel.org>; Wed,  4 May 2022 23:34:01 -0700 (PDT)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mr8vG-1o9A6D2JUs-00oH8T for <linux-input@vger.kernel.org>; Thu, 05 May 2022
 08:33:59 +0200
Received: by mail-wr1-f54.google.com with SMTP id v12so4690845wrv.10
        for <linux-input@vger.kernel.org>; Wed, 04 May 2022 23:33:59 -0700 (PDT)
X-Gm-Message-State: AOAM5324SqtefLl+XzZSDVUKvPAnTiJ9fVI7YBE1FP63YTNgVy9yVTPH
        k5DOdeDVAivlav21YvFF0nh1S/o9TvAppwhT19o=
X-Google-Smtp-Source: ABdhPJzGKPdAh/NO/xKiZFmh6usYmCx2XzwJkWKkYhLWSi6AAxb/Vp9woK1o/qkOR1u2HErCwVkWndqFXNEYeWLzEsM=
X-Received: by 2002:a5d:6da4:0:b0:20c:6d76:cc54 with SMTP id
 u4-20020a5d6da4000000b0020c6d76cc54mr10997904wrs.317.1651732439196; Wed, 04
 May 2022 23:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de> <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
In-Reply-To: <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 5 May 2022 08:33:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2xnKMsdOeO=DF20rt=pT6zQvBvocqOUNwceXKzXFpSfw@mail.gmail.com>
Message-ID: <CAK8P3a2xnKMsdOeO=DF20rt=pT6zQvBvocqOUNwceXKzXFpSfw@mail.gmail.com>
Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
To:     "Hennerich, Michael" <Michael.Hennerich@analog.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, "Sa, Nuno" <Nuno.Sa@analog.com>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:57IZbZAVYmpjm/DVfueFxNrkn/RF+9mXHl0pfeoy0aaT27zBXpo
 nX7zIjmPT//LBpls9JaK9HPOGP8MtXLo39JX3cAUwi5yrqVO/ntlCPKyGJtBsEqeS5L2wl0
 YQGl7l4lOntwFd9+LLXVwpLumnntFN84UTiBdYzKhr0l1nGCsfGhzXpcaFV/TnVYfG0jNqT
 OOeX9sXkKc/W1NJfwVROQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ec3GVz91yKE=:ann7NSNlhsaOHm1Xl/K8Pk
 57TRqUUYoKh5/is/7IQ3/qIvCbWsUHkGdbMhvFs9m1vJIQ9Tj1aK99mXZvgMxgKdmRDXVdW3C
 y/eCHaOl2GR/+r3bm8B8BdgJCXaJPWdhEMaJV8c6CaamUgBBn1kH/wSOxTea4kHdMh+4lYTjY
 nclo91JxY+Rq8kC67JF8MsvkBKu1E4dwTiEUBcQpXOCzMoqsVtSaxFjpeYrCjPIQ3CgDP81HB
 F4V3lNBgKbBqA14H6wHjviFrIlvnRa6KvlyM18OfUgjyggBNVB1K0WqlQj3VZTzFWGq0lI3Y9
 zln7FoxO3+Lm0TUBova4Lvogl4Gwz23PpaVsEi6IgqamqWUf1q/a0GoiiCxldw7Qq0//y3ahS
 6REMUiMg8Gk9zrDTFg8sxPykYXEF3GBYKO7k2iyfIqwvtMVBqK4Q9aywI8VTUaHPdSIctjXl2
 5uZm+m/iIw7sTYJxNNnIMNgs/xS3M/tJz2Sxr8K8BheB1cTwRP8+8IfiUgN1yTrWxtnPcbWUm
 9TAiikNKKaFzSAk2hvYTWRXxwpCsxA/0wgRf2C5XA1z79mi9yiQLgcOarYD+E5SBfIlL24iWE
 sau/2pWIiDNxnCw8VqlIq3IXpdju0NaCd4KbJsJLHkdSZP3rgdF4BiTI5p9BscAWFx5tn2ghs
 1uHUy8Q795YUrKTPdwRTqEB9MNbfDnKzP1cRLf/C/G+fhOKfo433jvYuWtJVOoFTvxCM=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 5, 2022 at 8:20 AM Hennerich, Michael
<Michael.Hennerich@analog.com> wrote:
> >
> > The last user is gone since 2018 (commit 4ba66a976072 ("arch: remove
> > blackfin port")). This is an i2c driver, so it could be used on a non-blackfin
> > machine, but this driver requires platform data, so it cannot be bound using
> > device tree.
>
> Hi Uwe,
>
> If we start removing drivers which obviously don't have a mainline in-tree user,
> we would upset up many users of these drivers.
> I agree on updating this driver to make platform data optional.
> We could provide a patch in a few days.
>
> Thoughts?

I think the absence of both a DT binding and platforms that define the
platform_data
is a good indication that there are exactly zero users, I wouldn't
worry about that
unless you know of specific users.

If it turns out that there are users on non-blackfin machines that still run on
modern kernels, you should work with them to make a proper DT binding and
drop the platform_data side of the driver.

        Arnd
