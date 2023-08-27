Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F42078A01A
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 18:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjH0QAe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 12:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjH0QA1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 12:00:27 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7593129
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 09:00:23 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59288c68eb8so28289797b3.0
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693152023; x=1693756823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYMWHtXhMuFoCaPkemd1V5sgRWnJ3rfscQ00g71T1Ys=;
        b=A+uOhXvIBluQjCrT2isepEIqRX1dY/hKDnRR5770Ed9cjRLgKmUQ+LibVXCaCeNWKm
         bILMjxW+qDQa3JIOnZq7k3omnxPNojG9PC12SDt3lVN80c+mZTOsf3IG81ARnwlEKmsX
         CeajXpRR0giSUIdFu9be5i9E5dFVeB5eVG2rW/TNgZw3U7fgjcl0C/UDLw5Yk3hOgYKJ
         dJnG8wiQz7zna8JDgDACiKREb6tKHNIQm5mkmyvOyRiTud0yEyl0mDxt8mk/fPk1x4hk
         54FbV3s06QO9AhNZx1AbH55xhvhTp42GX611rkrvSqMMf1+9TOnwO+ukGUbB7Rss5Ly8
         iDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693152023; x=1693756823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYMWHtXhMuFoCaPkemd1V5sgRWnJ3rfscQ00g71T1Ys=;
        b=Dv6xDzvbsuXmdjq7Duv9dsYfBKCl09Z/rXlsFtQhUs6Q0lde9WgL3eWUEmdzjfTyeD
         JSU/Wxby/lvhEaQl4ZWt3ro5HZCredWcSY0M41HmcowDR6XfK8caK9vJlhRrz/hLf7e2
         uavRZfgzm0yysCQ5fUMAWqQuj1p5v8NMNdHZe/TTpXfH9m3hCpoXLRw+40tPHc+PICNr
         K4k7GZkX+qksXmm/A1k7cMjpt96fy7OuM+CTRKggXdnCZX8UhykSHOUEsrQM32biE2Hc
         i3jbIKJ2OmAD+51Lyp39SR8g3iuChADP7L0M+vwOt8wZ5ULHsX8LgZtsXzXWqgALtpad
         Wx3w==
X-Gm-Message-State: AOJu0YytB5qm88kOik5QRCEddL9g50tVWlNkURkLSR+zs0mBIhfMrZ0S
        uTW4tT8tGbru6LxCVrmCrrqmqiwTEtcEfRV835A=
X-Google-Smtp-Source: AGHT+IFAAiMPzgKKybW83n0tPgHq/5a/6b5oHdfWp+PHp9aKHlSFs1FWlqmPTrovmLSiTN04tntp9++991CHVkymbHM=
X-Received: by 2002:a05:690c:ec2:b0:592:8ba6:8075 with SMTP id
 cs2-20020a05690c0ec200b005928ba68075mr12955000ywb.42.1693152022490; Sun, 27
 Aug 2023 09:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANWZPgK2+9SCavsbSZv1DfJyhy0XUpJZ6+ebatM9ZGJPpAN1yA@mail.gmail.com>
 <ZNGdYCXOHRqWnoeT@debian.me> <CANWZPgKAtbNRUy0pyL7Zf-S-zLeMkJZ7fSWpFO8__YG0_e2Zgw@mail.gmail.com>
 <CAHQZ30AhngEgVR-Hcjcze2HyZOG=4fbfp_S2=Or7JUJUUxm4mQ@mail.gmail.com> <CANWZPgLcHa2x-Rdy6Hma39p-6E6_5UGUamjPZkKYqz_q0yKJ2g@mail.gmail.com>
In-Reply-To: <CANWZPgLcHa2x-Rdy6Hma39p-6E6_5UGUamjPZkKYqz_q0yKJ2g@mail.gmail.com>
From:   =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= 
        <koalinux@gmail.com>
Date:   Sun, 27 Aug 2023 15:59:44 +0000
Message-ID: <CANWZPg+C4=U1khLJbvUb0nuDQq+ETULZdQyWDBhFhYN_3Wa=3g@mail.gmail.com>
Subject: Re: atkbd input regression
To:     Raul Rangel <rrangel@chromium.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org,
        Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 27 Aug 2023 at 07:20, Jos=C3=A9 Ram=C3=B3n Mu=C3=B1oz Pekkarinen
<koalinux@gmail.com> wrote:
>
> On Tue, 8 Aug 2023 at 18:01, Raul Rangel <rrangel@chromium.org> wrote:
> > From your 6.4 logs, it looks like your keyboard is enumerating correctl=
y:
> > > i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU]
> > > at 0x60,0x64 irq 1,12
> > > serio: i8042 KBD port at 0x60,0x64 irq 1
> > > serio: i8042 AUX port at 0x60,0x64 irq 12
> > > input: AT Translated Set 2 keyboard as
> > > /devices/platform/i8042/serio0/input/input0
> >
> > You also said that evtest works correctly. I would try diffing your
> > plasma logs between kernel versions to see if that sheds any light.
> >
> > Raul
>
>     Excuse the long wait, I've been investigating with the kde community
> and reading the code of libinput, systemd and the like, and I managed to
> find a difference that I'm not quite sure it is relevant to narrow the is=
sue.
> While the keyboard is populated in the udev database as this:
>
> $ udevadm info -e
> P: /devices/platform/i8042/serio0/input/input0
> M: input0
> R: 0
> U: input
> E: DEVPATH=3D/devices/platform/i8042/serio0/input/input0
> E: SUBSYSTEM=3Dinput
> E: PRODUCT=3D11/1/1/ab54
> E: NAME=3D"AT Translated Set 2 keyboard"
> E: PHYS=3D"isa0060/serio0/input0"
> E: PROP=3D0
> E: EV=3D120013
> E: KEY=3D402000000 3803078f800d001 feffffdfffefffff fffffffffffffffe
> E: MSC=3D10
> E: LED=3D7
> E: MODALIAS=3Dinput:b0011v0001p0001eAB54-e0,1,4,11,14,k71,72,73,74,75,76,=
77,79,7A,7B,7C,7D,7E,7F,80,8C,8E,8F,9B,9C,9D,9E,9F,A3,A4,A5,A6,AC,AD,B7,B8,=
B9,D9,E2,ram4,l0,1,2,sfw
>
>     There is no longer a corresponding entry under /run/udev/data,
> the following is the output of the ls -la /run/udev/data on 6.4.12:
>
> total 116
> -rw-r--r--. 1 root root  129 Aug 27 08:53 +backlight:amdgpu_bl1
> -rw-r--r--. 1 root root  737 Aug 27 08:54 +input:input10
> -rw-r--r--. 1 root root  715 Aug 27 08:54 +input:input11
> -rw-r--r--. 1 root root  715 Aug 27 08:54 +input:input12
> -rw-r--r--. 1 root root  776 Aug 27 08:54 +input:input13
> -rw-r--r--. 1 root root  166 Aug 27 08:54 +leds:input10::capslock
> -rw-r--r--. 1 root root  166 Aug 27 08:54 +leds:input10::numlock
> -rw-r--r--. 1 root root  166 Aug 27 08:54 +leds:input10::scrolllock
> -rw-r--r--. 1 root root  107 Aug 27 08:54 +usb:2-2.1:1.0
> -rw-r--r--. 1 root root  107 Aug 27 08:54 +usb:2-2.1:1.1
> -rw-r--r--. 1 root root   88 Aug 27 08:54 +usb:2-2.3:1.0
> -rw-r--r--. 1 root root  171 Aug 27 08:54 +usb:2-2:1.0
> -rw-r--r--. 1 root root  148 Aug 27 08:53 +usb:3-0:1.0
> -rw-r--r--. 1 root root   56 Aug 27 09:07 +usb:4-2:1.0
> -rw-r--r--. 1 root root   56 Aug 27 09:07 +usb:4-2:1.1
> -rw-r--r--. 1 root root   56 Aug 27 09:07 +usb:4-2:1.2
> -rw-r--r--. 1 root root  148 Aug 27 08:53 +usb:5-0:1.0
> drwxr-xr-x. 2 root root 1360 Aug 27 09:07 .
> drwxr-xr-x. 5 root root  100 Aug 27 09:07 ..
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c10:229
> -rw-r--r--. 1 root root   36 Aug 27 08:54 c116:1
> -rw-r--r--. 1 root root   36 Aug 27 08:54 c116:33
> -rw-r--r--. 1 root root  815 Aug 27 08:54 c13:34
> -rw-r--r--. 1 root root  856 Aug 27 08:54 c13:73
> -rw-r--r--. 1 root root  831 Aug 27 08:54 c13:74
> -rw-r--r--. 1 root root  831 Aug 27 08:54 c13:75
> -rw-r--r--. 1 root root  881 Aug 27 08:54 c13:76
> -rw-r--r--. 1 root root  663 Aug 27 08:54 c189:129
> -rw-r--r--. 1 root root  681 Aug 27 08:54 c189:130
> -rw-r--r--. 1 root root  721 Aug 27 08:54 c189:131
> -rw-r--r--. 1 root root  783 Aug 27 09:07 c189:387
> -rw-r--r--. 1 root root    0 Aug 27 08:54 c247:0
> -rw-r--r--. 1 root root    0 Aug 27 08:54 c247:1
> -rw-r--r--. 1 root root    0 Aug 27 08:54 c247:2
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:10
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:11
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:12
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:130
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:131
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:132
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:133
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:134
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:135
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:136
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:137
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:138
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:139
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:140
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:2
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:3
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:4
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:5
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:6
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:66
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:67
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:68
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:69
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:7
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:70
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:71
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:72
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:73
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:74
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:75
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:76
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:8
> -rw-r--r--. 1 root root    0 Aug 27 08:53 c7:9
> -rw-r--r--. 1 root root  991 Aug 27 09:07 n3
>
>     And the same on the working 5.16 kernel:
>
> total 1156
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0003:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:01
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:02
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:03
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:04
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:05
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:06
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:07
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:08
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:09
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:0a
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:0b
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:0c
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:0d
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:0e
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0007:0f
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:ACPI0010:00
> -rw-r--r--. 1 root root   59 Aug 27 09:54 +acpi:AMDI0030:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LEN0071:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LEN0100:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LEN0130:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LEN0268:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LEN0411:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXPOWER:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXPOWER:01
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXPOWER:02
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXPOWER:03
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXPOWER:04
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXPWRBN:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXSYBUS:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXSYBUS:01
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXSYSTM:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:LNXVIDEO:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0000:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0100:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0103:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0200:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0800:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0A08:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0B00:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C01:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:01
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:02
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:03
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:04
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:05
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:06
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:07
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:08
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:09
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:0a
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:0b
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C02:0c
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C04:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C09:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0A:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0C:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0D:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0E:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0F:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0F:01
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0F:02
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0F:03
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0F:04
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0F:05
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0F:06
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C0F:07
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C14:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C14:01
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C14:02
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:PNP0C14:03
> -rw-r--r--. 1 root root   54 Aug 27 09:54 +acpi:SMB0001:00
> -rw-r--r--. 1 root root   70 Aug 27 09:54 +acpi:STM0125:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +acpi:USBC000:00
> -rw-r--r--. 1 root root  128 Aug 27 09:54 +backlight:amdgpu_bl0
> -rw-r--r--. 1 root root  140 Aug 27 09:54 +dmi:id
> -rw-r--r--. 1 root root  156 Aug 27 09:54 +drm:card0-DP-1
> -rw-r--r--. 1 root root  156 Aug 27 09:54 +drm:card0-DP-2
> -rw-r--r--. 1 root root  156 Aug 27 09:54 +drm:card0-HDMI-A-1
> -rw-r--r--. 1 root root  156 Aug 27 09:54 +drm:card0-eDP-1
> -rw-r--r--. 1 root root  230 Aug 27 09:54 +input:input0
> -rw-r--r--. 1 root root  237 Aug 27 09:54 +input:input10
> -rw-r--r--. 1 root root  151 Aug 27 09:54 +input:input3
> -rw-r--r--. 1 root root  154 Aug 27 09:54 +input:input4
> -rw-r--r--. 1 root root  151 Aug 27 09:54 +input:input5
> -rw-r--r--. 1 root root  154 Aug 27 09:54 +input:input6
> -rw-r--r--. 1 root root  154 Aug 27 09:54 +input:input7
> -rw-r--r--. 1 root root  213 Aug 27 09:54 +input:input8
> -rw-r--r--. 1 root root  192 Aug 27 09:54 +input:input9
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:input0::capslock
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:input0::numlock
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:input0::scrolllock
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:platform::micmute
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:platform::mute
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:tpacpi::kbd_backlight
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:tpacpi::lid_logo_dot
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:tpacpi::power
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:tpacpi::standby
> -rw-r--r--. 1 root root  141 Aug 27 09:54 +leds:tpacpi::thinkvantage
> -rw-r--r--. 1 root root  209 Aug 27 09:54 +pci:0000:00:00.0
> -rw-r--r--. 1 root root  215 Aug 27 09:54 +pci:0000:00:00.2
> -rw-r--r--. 1 root root  211 Aug 27 09:54 +pci:0000:00:01.0
> -rw-r--r--. 1 root root  211 Aug 27 09:54 +pci:0000:00:02.0
> -rw-r--r--. 1 root root  258 Aug 27 09:54 +pci:0000:00:02.1
> -rw-r--r--. 1 root root  258 Aug 27 09:54 +pci:0000:00:02.2
> -rw-r--r--. 1 root root  258 Aug 27 09:54 +pci:0000:00:02.4
> -rw-r--r--. 1 root root  211 Aug 27 09:54 +pci:0000:00:08.0
> -rw-r--r--. 1 root root  266 Aug 27 09:54 +pci:0000:00:08.1
> -rw-r--r--. 1 root root  211 Aug 27 09:54 +pci:0000:00:14.0
> -rw-r--r--. 1 root root  195 Aug 27 09:54 +pci:0000:00:14.3
> -rw-r--r--. 1 root root  210 Aug 27 09:54 +pci:0000:00:18.0
> -rw-r--r--. 1 root root  210 Aug 27 09:54 +pci:0000:00:18.1
> -rw-r--r--. 1 root root  210 Aug 27 09:54 +pci:0000:00:18.2
> -rw-r--r--. 1 root root  210 Aug 27 09:54 +pci:0000:00:18.3
> -rw-r--r--. 1 root root  210 Aug 27 09:54 +pci:0000:00:18.4
> -rw-r--r--. 1 root root  210 Aug 27 09:54 +pci:0000:00:18.5
> -rw-r--r--. 1 root root  210 Aug 27 09:54 +pci:0000:00:18.6
> -rw-r--r--. 1 root root  210 Aug 27 09:54 +pci:0000:00:18.7
> -rw-r--r--. 1 root root  278 Aug 27 09:54 +pci:0000:01:00.0
> -rw-r--r--. 1 root root  256 Aug 27 09:54 +pci:0000:02:00.0
> -rw-r--r--. 1 root root  256 Aug 27 09:54 +pci:0000:02:00.1
> -rw-r--r--. 1 root root  256 Aug 27 09:54 +pci:0000:02:00.2
> -rw-r--r--. 1 root root  258 Aug 27 09:54 +pci:0000:02:00.3
> -rw-r--r--. 1 root root  263 Aug 27 09:54 +pci:0000:02:00.4
> -rw-r--r--. 1 root root  176 Aug 27 09:54 +pci:0000:04:00.0
> -rw-r--r--. 1 root root  266 Aug 27 09:54 +pci:0000:06:00.0
> -rw-r--r--. 1 root root  262 Aug 27 09:54 +pci:0000:06:00.2
> -rw-r--r--. 1 root root  260 Aug 27 09:54 +pci:0000:06:00.3
> -rw-r--r--. 1 root root  260 Aug 27 09:54 +pci:0000:06:00.4
> -rw-r--r--. 1 root root  240 Aug 27 09:54 +pci:0000:06:00.5
> -rw-r--r--. 1 root root   59 Aug 27 09:54 +platform:AMDI0030:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +platform:LEN0100:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +platform:LEN0130:00
> -rw-r--r--. 1 root root   62 Aug 27 09:54 +platform:LEN0268:00
> -rw-r--r--. 1 root root   70 Aug 27 09:54 +platform:STM0125:00
> -rw-r--r--. 1 root root  205 Aug 27 09:54 +usb:1-0:1.0
> -rw-r--r--. 1 root root  190 Aug 27 09:54 +usb:2-0:1.0
> -rw-r--r--. 1 root root  148 Aug 27 09:54 +usb:3-0:1.0
> -rw-r--r--. 1 root root  190 Aug 27 09:54 +usb:4-0:1.0
> -rw-r--r--. 1 root root  148 Aug 27 09:54 +usb:5-0:1.0
> drwxr-xr-x. 2 root root 7200 Aug 27 09:54 .
> drwxr-xr-x. 8 root root  180 Aug 27 09:54 ..
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:0
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:1
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:10
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:11
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:12
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:13
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:14
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:15
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:2
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:3
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:4
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:5
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:6
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:7
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:8
> -rw-r--r--. 1 root root   33 Aug 27 09:54 b1:9
> -rw-r--r--. 1 root root  129 Aug 27 09:54 b254:0
> -rw-r--r--. 1 root root  136 Aug 27 09:54 b254:1
> -rw-r--r--. 1 root root  129 Aug 27 09:54 b254:2
> -rw-r--r--. 1 root root  575 Aug 27 09:54 b259:0
> -rw-r--r--. 1 root root 1069 Aug 27 09:54 b259:1
> -rw-r--r--. 1 root root 1137 Aug 27 09:54 b259:2
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:125
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:126
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:127
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:130
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:144
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:183
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:184
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c10:224
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:227
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:228
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:229
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:231
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:232
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:234
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:236
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c10:237
> -rw-r--r--. 1 root root   49 Aug 27 09:54 c10:242
> -rw-r--r--. 1 root root  201 Aug 27 09:54 c13:32
> -rw-r--r--. 1 root root  225 Aug 27 09:54 c13:33
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c13:63
> -rw-r--r--. 1 root root  298 Aug 27 09:54 c13:64
> -rw-r--r--. 1 root root  177 Aug 27 09:54 c13:65
> -rw-r--r--. 1 root root  180 Aug 27 09:54 c13:66
> -rw-r--r--. 1 root root  177 Aug 27 09:54 c13:67
> -rw-r--r--. 1 root root  180 Aug 27 09:54 c13:68
> -rw-r--r--. 1 root root  179 Aug 27 09:54 c13:69
> -rw-r--r--. 1 root root  862 Aug 27 09:54 c13:70
> -rw-r--r--. 1 root root  422 Aug 27 09:54 c13:71
> -rw-r--r--. 1 root root  282 Aug 27 09:54 c13:72
> -rw-r--r--. 1 root root 1026 Aug 27 09:54 c189:0
> -rw-r--r--. 1 root root 1026 Aug 27 09:54 c189:128
> -rw-r--r--. 1 root root 1026 Aug 27 09:54 c189:256
> -rw-r--r--. 1 root root 1026 Aug 27 09:54 c189:384
> -rw-r--r--. 1 root root 1026 Aug 27 09:54 c189:512
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c1:11
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c1:3
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c1:5
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c1:7
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c1:8
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c1:9
> -rw-r--r--. 1 root root  212 Aug 27 09:54 c226:0
> -rw-r--r--. 1 root root  111 Aug 27 09:54 c226:128
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c237:0
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c238:0
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c238:1
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c238:2
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c240:0
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c244:0
> -rw-r--r--. 1 root root  278 Aug 27 09:54 c245:0
> -rw-r--r--. 1 root root   28 Aug 27 09:54 c250:0
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c251:0
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c253:65536
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c254:0
> -rw-r--r--. 1 root root  127 Aug 27 09:54 c29:0
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:0
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:1
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:10
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:11
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:12
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:13
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:14
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:15
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:16
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:17
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:18
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:19
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:2
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:20
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:21
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:22
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:23
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:24
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:25
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:26
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:27
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:28
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:29
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:3
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:30
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:31
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:32
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:33
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:34
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:35
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:36
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:37
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:38
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:39
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:4
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:40
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:41
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:42
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:43
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:44
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:45
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:46
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:47
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:48
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:49
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:5
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:50
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:51
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:52
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:53
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:54
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:55
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:56
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:57
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:58
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:59
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:6
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:60
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:61
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:62
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:63
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:64
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:65
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:66
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:67
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:68
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:69
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:7
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:70
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:71
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:72
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:73
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:74
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:75
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:76
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:77
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:78
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:79
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:8
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:80
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:81
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:82
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:83
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:84
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:85
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:86
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:87
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:88
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:89
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:9
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:90
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:91
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:92
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:93
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:94
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c4:95
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c5:0
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c5:1
> -rw-r--r--. 1 root root   35 Aug 27 09:54 c5:2
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:0
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:1
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:10
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:11
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:12
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:128
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:129
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:130
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:131
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:132
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:133
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:134
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:135
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:136
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:137
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:138
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:139
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:140
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:2
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:3
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:4
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:5
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:6
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:64
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:65
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:66
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:67
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:68
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:69
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:7
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:70
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:71
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:72
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:73
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:74
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:75
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:76
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:8
> -rw-r--r--. 1 root root    0 Aug 27 09:54 c7:9
> -rw-r--r--. 1 root root   52 Aug 27 09:54 n1
> -rw-r--r--. 1 root root  648 Aug 27 09:54 n2
>
>     To what I read, having it in the db either populated
> by the file under /run/udev/data, or populated from sysfs
> should be enough, but for some reason, it seems systemd
> and libudev expects the file under this folder.
>
>     Thanks!
>
>     Jos=C3=A9.

    Re-adding the mailing lists.

    Jos=C3=A9.
