Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73972DCF57
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 21:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394866AbfJRThr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 15:37:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:33181 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394836AbfJRThr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 15:37:47 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MUXd0-1iUS3F2K8m-00QWUX; Fri, 18 Oct 2019 21:37:45 +0200
Received: by mail-qt1-f178.google.com with SMTP id o49so2901639qta.7;
        Fri, 18 Oct 2019 12:37:45 -0700 (PDT)
X-Gm-Message-State: APjAAAWuMVDrVgwOvIoSfzdCfr8ofJVpF61DyHBdJs7M0NQ1HkW7ZGpJ
        GAEumHK2YyUPeo9wnxFIyNGwGsFgPnz4WwGNC3A=
X-Google-Smtp-Source: APXvYqwxUyyJwvyfVCPG8c8mF3Sx5XzUNdoCs8nQdFo+YOcYojSMBeTm3NOwBpuU3udL/lLv2xPirOIARmIFDaBY3Zw=
X-Received: by 2002:a05:6214:1150:: with SMTP id b16mr11418954qvt.197.1571427464379;
 Fri, 18 Oct 2019 12:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de> <20191018154201.1276638-25-arnd@arndb.de>
 <20191018183940.GM35946@dtor-ws> <CAK8P3a1Fc=ogknDRGJ3Sn8bZ8tsR_ebE8_bDtF_kZ4AZ5YG_+g@mail.gmail.com>
In-Reply-To: <CAK8P3a1Fc=ogknDRGJ3Sn8bZ8tsR_ebE8_bDtF_kZ4AZ5YG_+g@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 18 Oct 2019 21:37:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a00s4=6YHS_2K1r6=i+artkjgxjHJGVHBLuCj1ft5sqFQ@mail.gmail.com>
Message-ID: <CAK8P3a00s4=6YHS_2K1r6=i+artkjgxjHJGVHBLuCj1ft5sqFQ@mail.gmail.com>
Subject: Re: [PATCH 25/46] ARM: pxa: mainstone-wm97xx: use gpio lookup table
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UmtvT6H0vUmUAjXS4lh9ben7hRjuen/47LUjB4gy+iM2Myq/mKv
 DcBnxfFuUjZpSkNHH1s38VbiWGYc9EIPIFGJ6cyMVQdP9MQBxxvBuqf3TDkOWyYcGrxgqlz
 QhVkj20xHQkkmcKesuDmCVsDM4pQ1qkeMwPdyX04sGRWG8KbBjuOVzu5wKrEXzCwrvqYj1m
 AuHGnadQbj6Hqd7VedZBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1AQf1wOz63s=:lBLg8VbQNtxEKra5TnmriB
 RSWv1YUnTXPenQXYIoyS+I7taBiRxrLwZYdTpGb58yOuOnx1Eg8c4Z5WWSy4mI0J8eTJP9k8b
 pPKSwh00g6YkmQI2EHoK2uNSXK0TJFjrbRDyzX4a3TGBZ2FykHqxE8/JXqEiS2A0UshL2W7oS
 wuMrUWNb4mwQdQv2/xNI1Ksgr8MJCW81QCGifQAB5GxQjqvTDGYQuV4s3GhTLJ0vRHBot7JPr
 uSV4m+ul0SXUuJyUnqQ80cJE+eCHVylIwqkuIQD870fxAVBUkSMOH0s8UEmHmHOPpoYNJjsaa
 SLnV9ud7yomc+zHJybAPHQYl9fyZ3B3+vnJKYF2V/3UGKEGZPCiKduLeFpZi/8dHHrfcrUpfp
 Xgq6qygwA6gi3BwLThvkw61wMY+ySc6Nj+TEL7o/FTrORPP2NJxrPR2j7LiW058lvxPkpUMWZ
 Jd8nQ621NW2gEM9Tkiq3ktFaJLFMA0qtyxDRxVRTcqvPIFoeqDgf/AM5GV+42LsgqBcxyAlov
 Tx9lzlSO08OXT2X5bWminYFcSRawLh7zNuPkwKiaFGCaSVIbLDU3MkOoPTfmY+rNRA3QZhFqq
 Udj+XfU+MaUSh5QOtKUfUSkAoE4Jj+2FDSxcc6B1B/gXgNTC/PCe+FC86YSUSvVPbjYHxsQnW
 kEFsgHhS3OyvorbBaGhEYWvLUyb1fEF0855/pEOSRidS5o6Kg42M6bYssycGFWvCmm0NEJPTv
 +2Jyz5DcLbjeDKn60JpK7eYi8Eq4OJEDgzjOevm3axHSxZvT9SNjHk+B9tBDemHooBufrzjrS
 ACGmpcybOC8DGaDYLUeNwWz0G2jw8x2fQn/rbyVfijwQvMZnH+WPxiXA8g487og+7mbjPGZh/
 IEAZiwBKmEDw0OtlJ0BQ==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 8:39 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Oct 18, 2019 at 05:41:40PM +0200, Arnd Bergmann wrote:
> > This driver hardcodes gpio numbers without a header file.
> > Use lookup tables instead.
> >
> > Cc: Marek Vasut <marek.vasut@gmail.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> Arnd, do you have these devices by chance? I had stached patches
> converting wm97xx core to use threaded ISR and it would be great if
> someone could test them...

Unfortunately I don't, but I'm hoping that someone can test my series
on any hardware they might have.

If you like, send me your patches and I'll add them to this series.

       Arnd
