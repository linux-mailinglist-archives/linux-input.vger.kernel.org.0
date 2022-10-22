Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1D5608D33
	for <lists+linux-input@lfdr.de>; Sat, 22 Oct 2022 14:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiJVMnB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 08:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiJVMm6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 08:42:58 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40A629E58E;
        Sat, 22 Oct 2022 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666442575;
        bh=oR1BVjZrjjdJ0kRRSfE79Lzz81osWJFEDxWg+ZS/r5M=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=D+/VL03LsJ1NrxZe9qpgjOPkZx/1A0PiV5NlMLcIxtLO6tKT441lZgLfqetjKVL8L
         /VBp11ySCY0prYoR5C14JU1mXj8ENA2miaS27RbDOQyCUwkPprJK9Q1WUZYQmsVMdi
         2hHZnc+gw07U9q6AcVC5EiLwfyzT+FyjDVDySv4c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mail-ed1-f46.google.com ([209.85.208.46]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MPog5-1oPLdV3ouJ-00MwTn; Sat, 22 Oct 2022 14:42:54 +0200
Received: by mail-ed1-f46.google.com with SMTP id t16so15279992edd.2;
        Sat, 22 Oct 2022 05:42:54 -0700 (PDT)
X-Gm-Message-State: ACrzQf1PQ60W63kiD2oWeKoUYdpL7oEsr4GITmsIsfNMw9ehXs4xfUKN
        VzfBmypCE6c5jOiPTWVx8lm0Y615tSDBh+Hes6s=
X-Google-Smtp-Source: AMsMyM43q1O504LftU3KK+iV3+k7d/ocmdmXdwVvLyYQzyTXk2Ogr0SspKt3RrpCqfFx1X2xd/q2tV6+3+l6p6AunFk=
X-Received: by 2002:a17:907:9707:b0:78d:45d1:487e with SMTP id
 jg7-20020a170907970700b0078d45d1487emr19555272ejc.566.1666442574460; Sat, 22
 Oct 2022 05:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu>
In-Reply-To: <Y1AVDck5sQf8+QFX@rowland.harvard.edu>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Sat, 22 Oct 2022 14:42:43 +0200
X-Gmail-Original-Message-ID: <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
Message-ID: <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CFdm4qzk5tLMDSWN2vXH1+eThRJECmtM+q1qxY9Ax1C17bm3xmP
 4fv7UBXBq81manYbnFWKILTBXcyLmUgTYxRCYMNFxMHi2ynntyzNQeG00prrMI51NbTVD+/
 rO9MGmB67CrpXqFtalRl6g+4D0JeOPDH01p9QGMWSE6Ub7q9KWEh/SecLLUk2ozXGC2GK2+
 QdJM+BtSeTjGOzTYZcPdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:plI+JvnfLzk=:M6SBcoHdTL6i87nJHigv9v
 g/fCU7zlPhu4ar8A9nJBfq9IgZjH39ZyGnk8EtKRjF4Qg5AwgNMFTE3U0HAVOqHruVeA2iplO
 kQIrQl/XyDqzpwPoSi82LRnVspgEfZeDOYK+wNJ5FacyVoyhG8M9kVkqZvNUNStrVoz8xEzSt
 Gt1r41t6usmfXvpNP8kCxdP7WjsAjxrgt0KkqIBLywXAIBUwSXmMG0ydsGY7VjLJKsiD0Zr79
 fF2G5KANoL7a4NYOo+ypHB9KJ1+r83r5pPU4Ir+32lry59XCrjrQByCDxZJera3dAblT7B9Mf
 3IPBTNh5PN3sRJAGBeJIgmWuRm1cJWeSnr3yTRkvKCav4nweb4c82KMtiZ7mtt/3h/u0GQWV9
 cm/2P5g1LwMXF7jmvqf/sYC+LmxQxFEBIPsROr5ltU9NmBJ4hukKcwOW5VgwRCpEyotHDUwo/
 BGvQ8X1XzZ0/2CrPGAVboM6ER1/q/kDas1zMRrelfvps/4ceUSXyYHxW1jGQjZ+1cEXZaKqiP
 YvFlHq9CGCoOtX0dYJj5R/yag4S98r9WMymY6MwFKMc2RleOBtQtQQi7Q1+64cJDJ4zQgZPIN
 yqyoZpNG0M3pGfCkUmwwuM7ARJgYiM4+SEW8HNldwyOIXccO09Xh9Ll/a3nXreOiYkNUqO0mO
 S8MXFLVyJFGgdfDOoWW+yh4mC6G/mmanWj2KMs4fCEkhoHw7UMLM54dfw/qwctdIE9lc3KLbB
 Vr68JDS+P9CC4mgEuEbO8teoS9xEfmU74wNfDmjKalEj+iPpB7z8K6fgqlgTK2Fsyk9Y7waxp
 vHxvrHOJpKNQt/1+a13RkrpFaUTIyaBo+Zj6R5SuOQAR/ZyMjWQ7uhOgcqqOs0peRJ5QSIGmm
 ZIU9FXT/ct0a+P/7YITvAqbnJQuFRK3PgWPLVla7vzLIwJUlCoUQGMEqkyeERg9MNqE/Ug6e/
 y++aEQw7KR0KWLt8+tHoQoDSetRvdJ9KFWGnBm+82J1sJa/yQYcMJ37tFYkWbfYttOHFqt1rB
 4cE3MkcjcGykb8khHfYPVPnths+nH59LF3fN64Yr3zLlsR2F3eIUZ4JpQ0Hx1hlfuSs7YwQHD
 XISlDVB28myzX87FOUkLafDQTcFEvABeWlKeRkw9XxPgwXhyHzbhBWbGJ5tDcaWHZlmsdRNt4
 p6kB2BCWR/X3iTsMCmKJyN73ZoNqKjQFuvi5LUUR8SfTkKpRZLrgcGEHCDG4bQsv6nAWftESE
 VaCn6CVAOhCDD1d2sl3+HXHvODWTF+m1cbk5UABDdbcA8Mv5MbAw3kNFauXqRJ/UcX2NdqTE7
 0/elRKPoxafadcaceXHju3SKaDu4b0VPrNRkvmKXGznTUjBxFYCbEBAbMnXocKtRrMoMR71yn
 ZEYz+9XPjfdbiYYRaA94bjNCJQl4oALgw5D5lkR992oo4x/Eej3xCLw9PbGuheyGgJTBzaEYN
 EtgEye9ZAwhFkatfajpHbcrQcceip5z77ptKi/SMhXBeghK1pdu+rV/JK+FKYLAzJaIR+dJY5
 9bRJOCPT0APEVDDGaqeePDNjWcYXnl2OKBB9SkuPXEG2r
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> Date: Mon, 17 Oct 2022 18:45:30 +0200
> From: Andreas Bergmeier <abergmeier@gmx.net>
> To: linux-usb@vger.kernel.org
> Subject: Litra Glow on Linux
>
> On my Ubuntu machine i am running 5.15.0. Now when I plugin in my
> Logitech Litra Glow, it gets detected and the following shows up in my
> dmesg:
>
> ```
> input: Logi Litra Glow Consumer Control as
> /devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4.2/3-4.2:1.0/0003:046D:C900.000B/input/input75
> hid-generic 0003:046D:C900.000B: input,hiddev0,hidraw2: USB HID v1.11
> Device [Logi Litra Glow] on usb-0000:00:14.0-4.2/input0
> ```
>
> Via (hardware) buttons you can switch the device on, regulate the
> color temperature as well as the brightness.
So I looked into the sources of `hid-input` and `hig-lg` and I hope
that I have a halfway decent
understanding why the linux modules/dev nodes handle the way they do.
What I do not yet understand is how to map the device to input "primitives".
To recap there are 5 hardware buttons and 3 states:
- State: "Color temperature in range [u, x]" Button: up
- State: "Color temperature in range [u, x]" Button: down
- State/Button On/Off
- State "Brightness in range [y, z]" Button: up
- State "Brightness in range [y, z]" Button: down

What would be a best practice to expose these correctly via HID (as
e.g. ABS_WHEEL?)?
Or at least - what are the canonical options?

Since the exposed Record interface seems "wrong" I assume I need to
write code to fix the device handling.
Now, is this better suited in `hid-input` or `hid-lg`?
The former currently tries to handle the device (wrongly) and the
latter yet ignores the device but seems to be
the one stop to fix Logitech devices.


> I know of no way to fully control the device from my computer and
> would like to change that.
By now I am confident that I will soon have the full device control figured out.
