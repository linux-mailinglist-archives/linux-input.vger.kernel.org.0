Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01B4AEE182
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 14:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfKDNtS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 08:49:18 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39534 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfKDNtR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 08:49:17 -0500
Received: by mail-oi1-f194.google.com with SMTP id v138so14105681oif.6;
        Mon, 04 Nov 2019 05:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L9pLbrcH5xPS7t/mTdpMAUamEXFTVD8IYcBPmnVLKYE=;
        b=mR0JTOqQ+EX6cinqMdndnGS5xir9X70YCKIUsPPCWHV0W0xj8j9EkHRJnzDYhyLne/
         CUk3eKKu618aI4Z3ChZ2xRVbzhShjGUQkrknIz2JNcQidld2FozMSPM38A3J46Xr6nfu
         nH8fiW3+lSXiUgJjx1rzY7tAWlrMt7P3OZY9TlCSpN7kzCO/oCCXEn/uszkgKYe6vViD
         Q/52a9Y0A5pTjl3dZ6yPVKp0RxR7RkynGz5Mu3trxlnJjuY6uUgHybI2pfEk86TtKAVx
         Ke1iUW4TpGtdsT/IEjRelqasG0zX+ze+WVkglQw2dPoV3yydWepONCSzEHDyJAKuzNPB
         pJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L9pLbrcH5xPS7t/mTdpMAUamEXFTVD8IYcBPmnVLKYE=;
        b=cQw4Mrmi0xnbqxHEkMQIRy/Fw1M0fau5+gauxMHbUK4pn/Kcgd/+Mvo5DJB99pOREd
         YGJ6QOONTjorp9zhpDYG3tV8DaWZzgxLWNHYE9u5cZ17ZOe3ri03Fit7AUxPVkn2s7RJ
         0dyrzNgcQfuaGVi3b0OHwDN1xE7BWyK90DRftANnGJvgbJRQUd3LYboRjGUU9A+Ryb6k
         ErmnYD4Jm4K2JcHcCoICpXfGLmVKcJMZMN9jSYsaLZ7p7DzGGSPSEK34+3b0L3fWPj7G
         3sFSFNfmh3bkJm+7+RU3bmo9sQJ+QYIzVJ82r60eINcsy1FYdy4ArTu39zw3zDMT1JzQ
         1QvQ==
X-Gm-Message-State: APjAAAVPHkoFn0Mgs0VYYTDMnkl2R/6gq4Pa1hHU3VU6/uhRDiTf2rzf
        +efCfhXrwXZ85s6tC2u29NQrDYt7ake8q7OF2o8YZrUp
X-Google-Smtp-Source: APXvYqyT2ywHY2Cz5zjsm19s/5bAREbcH+gKOQNOGQigpSMCFD66QPld2caEfOIb+cykSNl95jyMPHsY+SpjuBj1dIQ=
X-Received: by 2002:a05:6808:7d0:: with SMTP id f16mr9859823oij.86.1572875355125;
 Mon, 04 Nov 2019 05:49:15 -0800 (PST)
MIME-Version: 1.0
References: <20190302141704.32547-1-marex@denx.de> <20191101204801.16328-1-TheSven73@gmail.com>
 <20191104070116.GM57214@dtor-ws>
In-Reply-To: <20191104070116.GM57214@dtor-ws>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 4 Nov 2019 08:49:04 -0500
Message-ID: <CAGngYiV_eP0M48Ei8K+uNWb_yW1Yi7C_E5M6O9HpJmrnxkmvyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 4, 2019 at 2:01 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Can you please tell me what device you have? Do the patches work for
> you?

I have an ILI2117A/ILI2118A.

I'll try out the patches today. I'm stuck with a 4.1 vendor kernel, so
I'll need to backport the (patched) mainline driver to 4.1 before
I'm able to test.

I wil try Marek's patch, and Dmitry's rebased patch from
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=ili2xxx-touchscreen
and let you know the results.

If the problem with Dmitry's patch is located in ili251x_read_touch_data,
then using a ILI2117A should work fine.
