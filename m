Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81FB1781C31
	for <lists+linux-input@lfdr.de>; Sun, 20 Aug 2023 04:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjHTCsX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Aug 2023 22:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjHTCsN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Aug 2023 22:48:13 -0400
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA89286661
        for <linux-input@vger.kernel.org>; Sat, 19 Aug 2023 11:43:06 -0700 (PDT)
Date:   Sat, 19 Aug 2023 18:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1692470584; x=1692729784;
        bh=GNUzubz2wRt2PFaH1WjiQagadeywy6islaPek7yThJk=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=DyCZ6dvB0qV12o3xk0R5tliOz9oCHNKBU+Ifg7dh3julgqg5wB7REGLlykWD/Jvqh
         bVJolvpQE5NIZCApFOoJxcuaz8rFgjcTSRz4ylPQCF7yhwzWO3/669UxidGGH+IN2S
         tkFN2gBz45FaOCLg9Ix9qE3vT7GkQQj4hDv8YIXs3v4H9G8XnoxPyuJRFNrGzhjGHM
         aRpiQRDOZJuDQTJjx6Hg+DmIzFPveUGHa1N7zNIIsVNXgaSpTOTEFaGwyyhf+itBeW
         GVhwk+dZwVlukd+ABUJZKPqF8z/s7Vh74A9i3CkNgWdvK9wKb15WD4XOaFMtw7Zj+k
         b1N4zJ+K3iivg==
To:     Sewer56 <admin@sewer56.dev>
From:   Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [hid-logitech-dj] Inaccurate Mouse Wheel Behaviour using G502 with Logitech Lightspeed Receiver (USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1)
Message-ID: <87350eub4m.fsf@protonmail.com>
In-Reply-To: <5f45c1b7-cf6c-4949-9839-db28f38bd490@sewer56.dev>
References: <5f45c1b7-cf6c-4949-9839-db28f38bd490@sewer56.dev>
Feedback-ID: 26003777:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Fri, 18 Aug, 2023 23:16:14 +0100 "Sewer56" <admin@sewer56.dev> wrote:
> When scrolling with a Logitech G502 Lightspeed mouse (046d:c08d) in wirel=
ess mode
> with the official wireless receiver (046d:c539, i.e. USB_DEVICE_ID_LOGITE=
CH_NANO_RECEIVER_LIGHTSPEED_1
> in `hid-logitech-dj.c`), the REL_WHEEL event is not fired consistently on=
 mouse wheel notch/tick.
>
> [Note: This only affects wireless through receiver; wired works as expect=
ed]
>
> Rather than the event being fired when the mouse skips a notch/tick on th=
e scroll
> wheel, it feels like the REL_WHEEL event is fired somewhere roughly aroun=
d the middle
> point of the last notch/tick and the next notch/tick.
>
> I recorded a quick video to demonstrate this:
> https://youtu.be/IwaQAMDkotg
>
> In this clip I scroll the mouse wheel gently up and down, back and forth.=
 Notice the
> appearance of REL_WHEEL_HI_RES with the value changing from 15 to -15 as =
the direction
> is changed; the wheel is being scrolled past the notch, but the REL_WHEEL=
 event is not fired.

I think it's good to provide some background on what REL_WHEEL and
REL_WHEEL_HI_RES values indicate for the sake of this conversation.

REL_WHEEL is the number of detents (notches) that have been scrolled by.
REL_WHEEL_HI_RES is 1/120th of a detent. For fancier gaming peripherals,
having this capability is important to be able to advertise high
resolution information when someone makes minute wheel movements.

  Event: time 1692246247.376147, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value -15
  Event: time 1692246247.376147, -------------- SYN_REPORT ------------
  Event: time 1692246247.448155, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value -15
  Event: time 1692246247.448155, -------------- SYN_REPORT ------------
  Event: time 1692246247.519161, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value -15
  Event: time 1692246247.519161, -------------- SYN_REPORT ------------
  Event: time 1692246247.549169, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value -15
  Event: time 1692246247.549169, type 2 (EV_REL), code 8 (REL_WHEEL), value=
 -1
  Event: time 1692246247.549169, -------------- SYN_REPORT ------------
  Event: time 1692246247.589171, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value -15
  Event: time 1692246247.589171, -------------- SYN_REPORT ------------
  Event: time 1692246247.626176, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value -15
  Event: time 1692246247.626176, -------------- SYN_REPORT ------------
  Event: time 1692246248.574336, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value 15
  Event: time 1692246248.574336, -------------- SYN_REPORT ------------
  Event: time 1692246248.593325, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value 15
  Event: time 1692246248.593325, -------------- SYN_REPORT ------------
  Event: time 1692246248.606319, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value 15
  Event: time 1692246248.606319, -------------- SYN_REPORT ------------
  Event: time 1692246248.619329, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value 15
  Event: time 1692246248.619329, type 2 (EV_REL), code 8 (REL_WHEEL), value=
 1
  Event: time 1692246248.619329, -------------- SYN_REPORT ------------

What hid-logitech-dj does for the lightspeed receiver is append
information about the report descriptor structure to tell the HID stack
how to parse the HID reports provided by the mouse. For the lightspeed
receiver, hid-logitech-dj will concat the mse_high_res_descriptor
descriptor.

  https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/tree/drivers/=
hid/hid-logitech-dj.c?id=3D1d7546042f8fdc4bc39ab91ec966203e2d64f8bd#n380

When you use the generic usbhid driver, you do not parse the special
report table with the high resolution information but only the defacto
descriptor with the mouse wheel USAGE information.

  Event: time 1692245830.208738, type 2 (EV_REL), code 8 (REL_WHEEL), value=
 -1
  Event: time 1692245830.208738, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value -120
  Event: time 1692245830.208738, -------------- SYN_REPORT ------------
  Event: time 1692245831.231868, type 2 (EV_REL), code 8 (REL_WHEEL), value=
 1
  Event: time 1692245831.231868, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value 120
  Event: time 1692245831.231868, -------------- SYN_REPORT ------------
  Event: time 1692245831.783933, type 2 (EV_REL), code 8 (REL_WHEEL), value=
 -1
  Event: time 1692245831.783933, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value -120
  Event: time 1692245831.783933, -------------- SYN_REPORT ------------
  Event: time 1692245833.004410, type 2 (EV_REL), code 8 (REL_WHEEL), value=
 1
  Event: time 1692245833.004410, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES=
), value 120
  Event: time 1692245833.004410, -------------- SYN_REPORT ------------

What you will notice here is we do get the single detent measurements,
and they are correct. However, we have lost the granularity to measure
the high precision information supported by the device (which is why we
see REL_WHEEL_HI_RES toggle between -120 and 120). This works out well
for games where you do not care about the high resolution precision but
is problematic in general. That said, not accurately counting detents is
also a problem.

>
> When the hid-logitech-dj module is blacklisted, and linux defaults to a m=
ore generic
> driver (usbhid); this issue is not present; which can be seen here: https=
://youtu.be/8AkVWHUe88M
>
> To put this into a realistic end user perspective: If you try to play a g=
ame on Linux
> with the current behaviour; and perform an action that requires the use o=
f a scroll wheel
> [for example; changing the current weapon in a shooter], the input is oft=
en 'dropped' from
> the user perspective, leading to frustration.

The experience may seem like it's 'dropped', but I am getting a feeling
its more about miscounting . At least that's my intuition, but I think
what would likely shine light on this is collecting more information.

>
> I'm not exactly sure what further sort of information I could provide; I'=
ve only got back
> to using Linux on the desktop after 7 years; and it's my first time raisi=
ng a kernel issue.
> That said, I'm happy to provide any further feedback, or even play with t=
he kernel sources
> if someone could give me ideas of what I should experiment with.
>

I think collecting more information using hid-tools would be helpful.

  https://gitlab.freedesktop.org/libevdev/hid-tools

I am interested in capturing a HID recording of the following.

  1. Move the wheel just one detent in a single direction
  2. Wait for a moment
  3. Move the wheel back one detent in the opposite direction
  4. Wait for a moment
  5. Move the wheel two detents in the original direction

If you are interested in looking at the report descriptor structure
yourself, you can use hid-decode on the recording or directly on the
hidraw device fs node.

Here is an example of what happens when I use hid-decode to read the
report descriptor of my mouse device.

  hid-decode /dev/hidraw0 # ran with elevated privileges
  # device 0:0
  # 0x05, 0x01,                    // Usage Page (Generic Desktop)        0
  # 0x09, 0x02,                    // Usage (Mouse)                       2
  # 0xa1, 0x01,                    // Collection (Application)            4
  # 0x09, 0x01,                    //  Usage (Pointer)                    6
  # 0xa1, 0x00,                    //  Collection (Physical)              8
  # 0x05, 0x09,                    //   Usage Page (Button)               1=
0
  # 0x19, 0x01,                    //   Usage Minimum (1)                 1=
2
  # 0x29, 0x10,                    //   Usage Maximum (16)                1=
4
  # 0x15, 0x00,                    //   Logical Minimum (0)               1=
6
  # 0x25, 0x01,                    //   Logical Maximum (1)               1=
8
  # 0x75, 0x01,                    //   Report Size (1)                   2=
0
  # 0x95, 0x10,                    //   Report Count (16)                 2=
2
  # 0x81, 0x02,                    //   Input (Data,Var,Abs)              2=
4
  # 0x05, 0x01,                    //   Usage Page (Generic Desktop)      2=
6
  # 0x09, 0x30,                    //   Usage (X)                         2=
8
  # 0x09, 0x31,                    //   Usage (Y)                         3=
0
  # 0x16, 0x01, 0x80,              //   Logical Minimum (-32767)          3=
2
  # 0x26, 0xff, 0x7f,              //   Logical Maximum (32767)           3=
5
  # 0x75, 0x10,                    //   Report Size (16)                  3=
8
  # 0x95, 0x02,                    //   Report Count (2)                  4=
0
  # 0x81, 0x06,                    //   Input (Data,Var,Rel)              4=
2
  # 0x09, 0x38,                    //   Usage (Wheel)                     4=
4
  # 0x75, 0x08,                    //   Report Size (8)                   4=
6
  # 0x95, 0x01,                    //   Report Count (1)                  4=
8
  # 0x15, 0x81,                    //   Logical Minimum (-127)            5=
0
  # 0x25, 0x7f,                    //   Logical Maximum (127)             5=
2
  # 0x81, 0x06,                    //   Input (Data,Var,Rel)              5=
4
  # 0x05, 0x0c,                    //   Usage Page (Consumer Devices)     5=
6
  # 0x0a, 0x38, 0x02,              //   Usage (AC Pan)                    5=
8
  # 0x95, 0x01,                    //   Report Count (1)                  6=
1
  # 0x81, 0x06,                    //   Input (Data,Var,Rel)              6=
3
  # 0xc0,                          //  End Collection                     6=
5
  # 0xc0,                          // End Collection                      6=
6
  #=20
  R: 67 05 01 09 02 a1 01 09 01 a1 00 05 09 19 01 29 10 15 00 25 01 75 01 9=
5 10 81 02 05 01 09 30 09 31 16 01 80 26 ff 7f 75 10 95 02 81 06 09 38 75 0=
8 95 01 15 81 25 7f 81 06 05 0c 0a 38 02 95 01 81 06 c0 c0
  N: device 0:0
  I: 3 0001 0001

Some new documentation was recently merged into next. Might be a helpful
reference as well.

  https://www.kernel.org/doc/html/next/hid/hidintro.html

--
Thanks,

Rahul Rameshbabu


