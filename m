Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FA860681E
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 20:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiJTSWW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 14:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiJTSWU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 14:22:20 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E7041A6536;
        Thu, 20 Oct 2022 11:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666290137;
        bh=GuX8PRrzPSQzHHWQXajvky7pB9OhUb0PNpYLFlgpVec=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=c8v3oTe7TX423hc5z5sWE0LrgU3myaXPo4Zc5OtsRDTpjiYmO2b55+sM4S+MRQPHl
         Tdn/BGlU0VV7yX8E49lll8WkXSNTWjFuxCY3RiQ7ChtUi2bWXgAqFMR3Q8EuHsQPn5
         Cgmr9Yleo9LIKWd5B6H4pShQmQAjpYflHJuZG4Hw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mail-ej1-f48.google.com ([209.85.218.48]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mo6ux-1pRXm61u3f-00pZGz; Thu, 20 Oct 2022 20:22:17 +0200
Received: by mail-ej1-f48.google.com with SMTP id bj12so1420770ejb.13;
        Thu, 20 Oct 2022 11:22:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf3dW76Nbv+7UyIr+Bj2nyv3+nF9nTs5WyC5xRPyjW9BfRd6t5dC
        X7tBFE2IPFHYBnJaG1PP2sw3w8tvTnFg5HsjuWA=
X-Google-Smtp-Source: AMsMyM5Ng2Wc3Lxpm48RV5DmHO9IHb+UxKxzzhgloStGIyxLRUtmbwox7Y70QMoBUw3P4qel7jAkoyRZbcFbpfp6sF0=
X-Received: by 2002:a17:906:8b81:b0:78e:1cb:e411 with SMTP id
 nr1-20020a1709068b8100b0078e01cbe411mr11761561ejc.681.1666290137095; Thu, 20
 Oct 2022 11:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu>
In-Reply-To: <Y1AVDck5sQf8+QFX@rowland.harvard.edu>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Thu, 20 Oct 2022 20:22:05 +0200
X-Gmail-Original-Message-ID: <CABfF9mMsneu3dUbahDgjJ1rbfqyLArKXyDD-RAvh1SXLM6XWBw@mail.gmail.com>
Message-ID: <CABfF9mMsneu3dUbahDgjJ1rbfqyLArKXyDD-RAvh1SXLM6XWBw@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uwEZeF8UFozm4zhpmdGOcN8FxJmQaa7BZ1iAAWZdsznylUzQaia
 cuoclt0S155LNKxD79mp7O0KaS7FkzmTt5AfYTwrbgh1CTPyA93Sj5OEGo8vqwtEwk3lgOu
 WF9wuaqMQDztG9+himnb2LzHnoxqu/n5xRuHw2LyQy2GUy0k0qEBQHZlEvNIS6PZWTL2b/2
 NR9l5RxZQ2Da6SxAuxNwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G7HVB5zKt44=:1uCaaRULh4ovS9kPGaUJCO
 dOntBkAMPchEZmO+IxyW7vmX6i2AIAnkZTim+fcy+DVEudZMzWJRxcvbQzPkSs5G6X1YJBcxy
 pGNqV9Rv7OkrrGvOeI+BbAKpa5GOGXklrizDvCdo4VBkmLQ20ylbz3JQzdj4Gr8FUoB/cy9XV
 Wy9ELBLw8+GQKmQjLx17WTdvVSo8JZjWHLW1ezm6mRUJS3ZSSxMfJOLWsJWK6hZ84B3OXGElh
 CFJJ4rCBNO/q4vpiRVio1IawlnOLj4qSE6RdWbinWmi92WIQ4bt22ouj0nIzQJS42awTyJKD6
 Uk94Yy/8NC3A/x0EXtB1mg9SKfqTlMOOgSsLojU9WgFb8ZpwVLj97GI01OPvD8IqEPWOMtxAh
 vUSnXs0jUBRj4Uhkox9BdlOif6cMMs/GL5a/kIdl4hBebvzJ/lru0rvQkqLrj4+EHLPLr32Cz
 NWnGDjL2imAdYHfPgIDvdJ6miC+peQpZyAZyfS7bCNBIVrm6AuiSHAXw7bxsqsl7btiwM4prw
 30PRxsJkjzvoE6CnzSSsA9SCMil9YM6UcyUmz+vZDOYu5FcrQi31btnWbTZM+9fp/z1cwUH5E
 cUkxWoI9aiUoqV3BYYBogjVYH++OY+R3f3qlBBZvvUYzYyj7NFzL7MecgLsDXNQJbr3Fr8Jyi
 6tnJuxdiqQeu697eXsayAgVruG9XH0+6jurUv8mGALV3yJ7TXFgqyAYz45dEGXSQEB8Zq9MUm
 cur1TZKugA6ZTX7GL+3FesFMlU2QwdXhuBDLkGFkrRSISm3BBiKBfFweoZuqpj+FvpVfm2uiD
 ebKGDHhx2WbPnZ5EuOh51QHgZEdRjbNdd+gncZFT2a9XEGxrY9/k2CQyBxib4Co5hY/c0xO7e
 0d+tkfVLTet5ddbVRhrEhR63/QUH8qRKsPNdx9KKhZXnn12wdCHay7x1IsM8LlQ+42IzPVvpM
 UaiBGi9jytQiyXAx293M/pj+6THfx4OVCyR1ZyM/5XL7QxNalDfq7wAtXKJXn9h1ThIhQ+9kU
 K63xQZ6aedwJ1pwRgSy28ry/SCMnKTm0uLRam9fqOtPde93BrZ3/xHnkhhX+dE/2IPn1uEZpM
 6hTqFH+f3sIaOBUTHM/nj7uO1GhqXLx+1PnU/PH3OFqdC7uH6x/uzU7AjxU3JK2GvR9eCG/lv
 ralO8A9HRt/xHkAvYV1Vxsx89lMCbqy3ZnS941SUN4th4oO0WALKZCeSXhlmZObNP9/e8jnlX
 OApZp5M91LHCj3ibZgU6PONEWV0a2Q/PaYMQplNsup5/RqRXBnomxm465BBgR393SP7fqmSi6
 qPUIGOGDbGjW53DdtgI0sKQIbrgneMCYwFudB1QOyekUmhkXlJHHIGyujbXNeYxL8sfls5hcq
 MJnJUfSjVJck0oIACJ1PXcBletA1SPcnXj25h+LIcKfjlabaJiXiBt6WrsD/uS6xsUhHEYTtg
 j0GeTFbGYbIABoLuwvQacMYk3wTe/vB8gDn7IBxK31XC20JCKNcYPwO3ul3Gileze/Z151GHK
 xrzd+b6wbR7Qql21ONrUFPdGCvU841/TnIJl2XQLpcNhx
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Reading through hid-input it seems like the custom Usage Page of
Logitech gets explicity ignored.
So for Brightness and/or Color Temperature controls I wonder whether
it would be appropriate to map these to ABS_WHEEL.

On Wed, 19 Oct 2022 at 17:17, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Forwarding this message to the linux-input mailing list, since it
> concerns the input layer and not the USB layer.
>
> Alan Stern
>
> PS: Note that problem 1 below is easily solved with a udev script.
>
> ----- Forwarded message from Andreas Bergmeier <abergmeier@gmx.net> -----
>
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
> /devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4.2/3-4.2:1.0/0003:046D:C900.=
000B/input/input75
> hid-generic 0003:046D:C900.000B: input,hiddev0,hidraw2: USB HID v1.11
> Device [Logi Litra Glow] on usb-0000:00:14.0-4.2/input0
> ```
>
> Via (hardware) buttons you can switch the device on, regulate the
> color temperature as well as the brightness.
> I know of no way to fully control the device from my computer and
> would like to change that.
>
> It seems to me like I need to solve 4 problems (in userspace and maybe
> kernelspace):
> 1. Handle plugging in and off
> 2. Listen to events (button pressed) from the device
> 3. Get the current state of the device
> 4. Send events to the device
>
>
> The device seems to provide a pretty bare HID Report interface with no
> alternate configurations:
> https://github.com/abergmeier/litra_glow_linux/blob/main/lsusb
> The HID seems to define 3 Reports:
> https://github.com/abergmeier/litra_glow_linux/blob/main/parsed_descripto=
r
>
> Ignoring 1. for now.
>
> Trying to solve 2. I wrote a basic HIDDEV application. Using `read` I
> only see events from Report 17 (0x11). For all my experimenting with
> the device I have never seen a Report 1 or 2.
> So I get events, but it seems like the provided
> `hiddev_usage_ref.value` is sometimes wrong (seems to be 0 and 1 for
> most of the time even if I adjust the brightness).
> Doing a recording (turning on, adjusting brightness, turning off) of
> the raw HID events seems like the "correct" events are sent from the
> device: https://github.com/abergmeier/litra_glow_linux/blob/main/hid-reco=
rder.
> So it seems to me like maybe the values get mixed up somewhere in the HID=
 code.
> Alternatively I did a `evtest` run on the /dev/input/event* for the
> `Logi Litra Glow Consumer Control`:
> https://github.com/abergmeier/litra_glow_linux/blob/main/evtest
> When pressing (hardware) buttons no events showed up in `evtest=E0=B8=94.
> Probably not surprising since these would be from Report 1 and 2 IIUC.
> Now I am not sure whether the USB interface is sketchy or whether one
> needs to activate the _Consumer Control_ somehow.
>
> Trying to solve 3. from what I understand with HID there usually is no
> way of reading the current state of the device?
>
> Trying to solve 4. there are userspace libraries in Python and Go
> which send events to the device bypassing HID. So there may be some
> quirks handling necessary in HID but I would defer that until 2. is
> done.
>
> With all that I am pretty much at my wits end and would appreciate any
> input how to further analyze the device situation.
>
> Cheers
>
> ----- End forwarded message -----
