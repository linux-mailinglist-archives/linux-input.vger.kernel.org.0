Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823B021B618
	for <lists+linux-input@lfdr.de>; Fri, 10 Jul 2020 15:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgGJNPP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jul 2020 09:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgGJNPP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jul 2020 09:15:15 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C062CC08C5CE
        for <linux-input@vger.kernel.org>; Fri, 10 Jul 2020 06:15:14 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id d21so3164510lfb.6
        for <linux-input@vger.kernel.org>; Fri, 10 Jul 2020 06:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HatYWsWjAYZDo/VI9JPBHwaGt+iGT5r2vzkw+4UnyaI=;
        b=brfOHy+1MViqjqhRbgD8WqTzFsNRG3hxUa+SVZZRv3SIOKL7HwqiDp5CxDg8Ut0MAc
         yJUQBLB6w11htT6S9Dm2p0FVzBTdmWjgKJETo3jO7RUPT5+HkBWW+agqioV6802cWsFp
         U7rJ+3FdxsAw77rXOpHGi8Q5OOrLBPDywvl6/Ur4hEWKn5CbtiHPd21z6nEDuSJU9BlD
         9w8fvLG1NBlO+6jcg0qnEFxc7ytMM5BT+uM0EPwPiYnvYKLnoFWJO2fgbtGMEsDatWnl
         yQ1CZw0SqUVu6u1Ec8B2+sdVAKX7EgoK7yHNap/LvqpEbMzXE+v3nAc4qrd3alywcBK0
         s/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HatYWsWjAYZDo/VI9JPBHwaGt+iGT5r2vzkw+4UnyaI=;
        b=ounDIEVaJznv2lvx8kpjOPLUtvOrfIPAIeXeiAUkSUCa+vtLRnosDC6CR0aW8Jc5cJ
         UqamwrcVBTbnrAoMa6WwPjcl0Lb1CnjJpWSzjtFEuFsLIR2yjdJC7UKQPa+eGaMUFBqg
         7I25zRV++Hp31DTo9zdO0aZhB6416dm03t2hsUl+1injC2JPcJeLaGZEfYdu+xELO2dt
         tn2Gef9MJuZx3+4bWMardi6rEtkrGkswCa8VQJ0/OUvc9B7FlcYpgeTzScSn0yQua34F
         SND2AM6tNqHz6zUA7Oyx2sUczWB+vp+1d+00695CiM2Rr6mUd+fxDDru4KyhD+Jn9rzn
         NuTw==
X-Gm-Message-State: AOAM5314w8nkdI5pn59pikjjYhU1d8LTmlwOwXRUvvo9JQ4jaQ1Mdr/G
        89OdjYN1dnQEIFeIvgpbtULEhsRDq41Q9llV28M=
X-Google-Smtp-Source: ABdhPJyj0p1wGWtF4umvi3+S8ncHXGh8d6uRnsAGhRhUXuAubnh+uxEYqYUBuS/7TsL1CmBXsj0Ln1LqlJgdx26jC7I=
X-Received: by 2002:ac2:558f:: with SMTP id v15mr43592623lfg.187.1594386913235;
 Fri, 10 Jul 2020 06:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <CACa7zynY07xp3hhe5SA4wcGxJB6shc9qoos-BOL2CeXPEobzuA@mail.gmail.com>
 <CACa7zynMpa3BOJUW=s_Tj1TwH5txDQOuta5Fph45PYhDOtQQ3g@mail.gmail.com>
In-Reply-To: <CACa7zynMpa3BOJUW=s_Tj1TwH5txDQOuta5Fph45PYhDOtQQ3g@mail.gmail.com>
From:   Wei Shuai <cpuwolf@gmail.com>
Date:   Fri, 10 Jul 2020 21:15:02 +0800
Message-ID: <CACa7zy=HvvtLoRzvc-ip2WZ2H0kL-tYK9xyn16YxXXXbpp+phw@mail.gmail.com>
Subject: Re: Linux General Joystick Max buttons limitation 80
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Dmitry Torokhov,

I have tried this change on Ubuntu, it really works. The small fix
will break the limitation of the max button number of Joystick.
Please help to review the patch, I have sent the patch in a different
email thread.

Wei Shuai <cpuwolf@gmail.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=8810=E6=97=A5=
=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=887:10=E5=86=99=E9=81=93=EF=BC=9A
>
> Dear Joystick Maintainer,
>
> we found Linux kernel has max joystick buttons up to 80, no more
>
> We are selling a USB joystick device QMCP737C for flight simulator,
> which is nothing but a common USB joystick. it has 104 buttons
>
> Product link
> https://x-plane.vip/quickmade/qmcp737c/
>
> it works good on Windows, Mac, but not on Linux.
> Linux kernel exposes /dev/input/js0 max to 80 buttons, but we have 104 bu=
ttons.
>
> I did a lot of google search, but nothing I got. then I have to look
> at Kernel source, to find out where this number max 80 comes from
>
> Eventually I found the final limitation
>
> #define BTN_JOYSTICK 0x120
>
> #define BTN_DEAD 0x12f
>
> #define BTN_TRIGGER_HAPPY 0x2c0
>
> #define KEY_MAX 0x2ff
>
> include/uapi/linux/input-event-codes.h
>
> according to function hidinput_configure_usage() in file drivers/hid/hid-=
input.c
>
> the joystick button mapping is not a continuous space, general speak
> the mapping space is from
>
> BTN_JOYSTICK~BTN_DEAD
> BTN_TRIGGER_HAPPY~KEY_MAX
>
> and finally I got the max limitation is 80.
>
> My question is why KEY_MAX is 0x2ff?  this number 0x2ff looks like it
> does not align with char?integer? the answer is no
>
> so may I ask to expand KEY_MAX to such as 0x4ff? or you need me to
> submit patch for it, I am OK
>
> Thank you
