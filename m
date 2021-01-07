Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA012ED029
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 13:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbhAGMm7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 07:42:59 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:45423 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728675AbhAGMm5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 07:42:57 -0500
Date:   Thu, 07 Jan 2021 12:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610023334;
        bh=QegKq5w0B0K1wSKH+Ma1s3ZVdYjsw/w0Yumg9kivo4M=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=R6w//+4pb55DTdTdqt/3xB/6CP0AvmplgHO+PorxtD5W2/OR04aE5g/BThOJ918Lo
         PFXlV4QTZy0uZIwNDWW0hKXzGmdCZ4SycalMywHz+ZcXOgfK0DGl1+31q5dcxmC14I
         vyO9q6xNfWg/j0jv4QtWqYbFtFgfPabJRw06TldY=
To:     Hui Wang <hui.wang@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jkosina@suse.cz" <jkosina@suse.cz>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] HID: multitouch: add a quirk to skip set inputmode for 2 new laptops
Message-ID: <uQnmWiLQ4Lmlm2GUj2fhPTv6zZ9Cszx0BNMz2K4WvVE7TjLE82lmU6mi0Leu4OK2fXfn-86Tw8WeR6kla03TdTpKIn-1zcmb1mLHl8WAt_Q=@protonmail.com>
In-Reply-To: <20210107112708.25990-1-hui.wang@canonical.com>
References: <20210107112708.25990-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi


2021. janu=C3=A1r 7., cs=C3=BCt=C3=B6rt=C3=B6k 12:27 keltez=C3=A9ssel, Hui =
Wang =C3=ADrta:

> we have 2 latest Thinkpad laptops, the synaptics trackpoint module is
> connected to i8042 bus and the synaptics touchpad module is on the i2c
> bus. The trackpoint is driven by input/mouse/trackpoint.c and the
> touchpad is driven by hid-multitouch.c.
>
> They all work well independently, but if users press any buttons of
> trackpoint and meanwhile move finger on the touchpad, the touchpad
> can't work, the i2c bus can't generate interrupts even. That is to say
> the touchpad can't work with trackpoint together, once trackpoint
> works, the touchpad stops working.
>
> The current hid driver parses the device descriptor and selects the
> hid-multitouch.c and applies the MT_CLS_WIN_8 to the touchpad, I found
> this issue begins to happen after the driver sets the
> MT_INPUTMODE_TOUCHPAD to the device, If skipping to set it, the
> touchpad work well and doesn't have that issue, even after suspend and
> resume, the touchpad still work well.
>
> This touchpad module doesn't support multi inputmodes, and its init
> mode is set by BIOS already, it is safe to skip to set it again in
> the kernel driver.
> [...]

Assuming I'm not missing anything obvious, a windows precision touchpad
should revert back to reporting events via its HID compliant mouse collecti=
on
when power cycled or reset by the host[1].

Doesn't that imply that the events will be reported via the mouse collectio=
n
in this case, and that the multi-touch capabilities of the device will not
be usable? Or am I missing something?


[1]: https://docs.microsoft.com/en-us/windows-hardware/design/component-gui=
delines/windows-precision-touchpad-required-hid-top-level-collections#input=
-mode-feature-report


Regards,
Barnab=C3=A1s P=C5=91cze

