Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D31A37A876
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 16:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhEKOIL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 10:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhEKOIK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 10:08:10 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC23C061574;
        Tue, 11 May 2021 07:07:03 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 10so16298053pfl.1;
        Tue, 11 May 2021 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rzXwefmc1ZIhs0OCj+56gWFzzGTPcPcD20gXua1lobc=;
        b=dNu7M0LLPm+SeTcspR3orrYl+jyYWCscPTpYdjAIsOfnJoe2pQGx6xVOwxFBNcYq3n
         SLyKze5WH491Ke+DEU3G1hxnXZFgFCn6YMQTNyQkx3W2p6g2ruICICHlyvlkX7llTRRq
         dhKBE2sJgfWV2MKzMQA9R8fpf+2BI4pfxkiXGB4ZVtR0o56Yh6eYZseHe7tGDmBd0IqZ
         SGp+t+ADsdgQsmO/CMIQkLiWLNn8e7y/CppC3h67LVYvFxHBnJwK/6m/smcgrGeE1RH0
         lIIKZ07y6ouJfRhtdBFT6WUjsLr6eRBp/aX6NSXkR/ZdRvNQ2iI1sqZA8lCPB1eatUw5
         4h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rzXwefmc1ZIhs0OCj+56gWFzzGTPcPcD20gXua1lobc=;
        b=WooMvQda2AT25kNY7cP1vYmPBYViUjBpGnj4fu34ol6DBhOmFXo9tTEYhdKR+GvG2z
         WtvHerFnEBcP5tP2KnzBgd67fNfh1ljxVxa1UCJI8AeHUd0gbPrd/dhVdN2mM3MUErHl
         bUSvDC2jxdHKiBiCkGYtgBQ/lvxVc9SVDoMuZtfcokCUvs2fIVTXnlZpTqGdgwtgewYk
         nfBm+FHewzqe2LKRCZmxAcw6ChTWeOLXzW5XyO/Ml2jkLO/lLQtKtvH24ew3YVvPVNXd
         +xYMqQQkMt9KuspxWzInNhCwNL7tdtRJ31DyMCvQbQynpIwGeWu9X2pn4h3Paiq02GyC
         CX3w==
X-Gm-Message-State: AOAM533mcbUZF6NCtqLFn4OfiTrCJ42Z/nOTtCD1n9ThnCJlNQE82Bxi
        NwL5xIXH1NQ4Z3qjWb9JwXCiVRope2uOqlyFup4=
X-Google-Smtp-Source: ABdhPJw/R/yQBIH+1fof5HDOCKYXDxn9Cido3CVKZNHUHkje7gdVUJnfdK6+vAZcOT9gVvy9Y01zNrJA+X9rsWaAmJo=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr30564700pgg.74.1620742022626;
 Tue, 11 May 2021 07:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAMW3L+1CN4ZNQZzF0w9ZziDEYHs4QaWrCzDb4ZCpRpTHu_A3PA@mail.gmail.com>
In-Reply-To: <CAMW3L+1CN4ZNQZzF0w9ZziDEYHs4QaWrCzDb4ZCpRpTHu_A3PA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 May 2021 17:06:46 +0300
Message-ID: <CAHp75VdwHiVidBr9F+XGMUCUyACY-vRvvZj_hFRELwjk=GRUDQ@mail.gmail.com>
Subject: Re: Linux kernel: updating acer-wmi
To:     Jafar Akhondali <jafar.akhoondali@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        jesperjuhl76@gmail.com,
        =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for your email.

Do not send personal emails on OSS related matters, please.

+Cc: mailing list and certain maintainers

On Tue, May 11, 2021 at 4:59 PM Jafar Akhondali
<jafar.akhoondali@gmail.com> wrote:
>
> Hi,
> The Acer predator helios 300 series features a RGB 4-zone backlight keybo=
ard, that is currently controllable only in Windows. The manager uses a spe=
cific WMI interface which currently is not yet implemented in the Linux ker=
nel.
> I've implemented the support for RGB WMI on acer-wmi.c file by reverse en=
gineering the PredatorSense(the official application on Windows which contr=
ols gaming functions for Acer Predator series), exploring WMI functions, an=
d decompiling WQ buffers. But I still need your help as this is my first co=
ntribution to the Linux kernel for the correct place for the user-space com=
munication method.
>
> The RGB keyboard-backlight method accepts a 16bytes(u8[16]) array input f=
or controlling different modes, colors, speed, light intensity, direction, =
etc. What is the most suitable way and place for controlling these paramete=
rs via using space?
>
> My first choice was the "leds.h" subsystem, but it does not support array=
 inputs, thus if I want to use this, I'll need to use 16 different subsyste=
ms which don't look right.
>
> Another choice is using ioctl operation, but I'm not sure where I should =
place it. For example "/sys/kernel", "/sys/devices/", "/sys/module" or ... =
?
>
> Any working examples are extremely appreciated and will help me alot.
>
> It is also worth mentioning that the mentioned WMI supports other gaming =
functions such as fan control, CPU\GPU overclocking, etc. But they are curr=
ently out of scope of my implementation.

--=20
With Best Regards,
Andy Shevchenko
