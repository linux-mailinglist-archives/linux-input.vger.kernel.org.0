Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35124678CF3
	for <lists+linux-input@lfdr.de>; Tue, 24 Jan 2023 01:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjAXAqt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Jan 2023 19:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjAXAqs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Jan 2023 19:46:48 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6C8303D8
        for <linux-input@vger.kernel.org>; Mon, 23 Jan 2023 16:46:47 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-4ff1fa82bbbso150009277b3.10
        for <linux-input@vger.kernel.org>; Mon, 23 Jan 2023 16:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmT3iM22OG6kEw3HtjW2I6YF/iHqqIvcScKYOAXXxg4=;
        b=C9nhdTU7Lc9FMNPDMFa3hfmT0bZsbyooqyrTFS974lgTp8TewQTjwmR57HGkbf5ovR
         PMjw4Rsef9k/b4nDXg+iw4MGeWk+Ui5hPkz8zB9+RjvmRtqXUFzBqQFsFGEw5HUdT77E
         zE+9+sujj75mA07LjKCIjeTtvjk2LWyPRT0MzH2TBTUjuWO8iE9lyFcrWotQ+FNvlvyQ
         Kv3bsepXIoUF9nE6z5a3iSKPAYPuzwc/iEm19xkc4di+Q5oCha2/xnQhq9wtFvGm23Fa
         n7E279k1xdhaRv+dpG9rxvxqPz4iwKv4iIt+nEUnpRsBy9nyb6FUmqQJckrabhCmnug7
         Htew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmT3iM22OG6kEw3HtjW2I6YF/iHqqIvcScKYOAXXxg4=;
        b=UzgYAcTim8A6uj6Ap2K+Shc8JqReOlxQAUzjy6JuA8PqmGpRHQjJY7CmNTX+Tbtu3p
         AZUxCldsfi56FMEK/qnWMiWaa/NJYM6Dn4pePMokn0A+g/iNWmvEsiLSkk6/NvKmgdMz
         ZpWA4NwvB8uJizCUw0QE1vQA/Tb4Y5PJ/I8nD7cwqHYFAiHLse2Qja/2bJy3ewyhcPJV
         GQJOG75zEQY3Zgevg4pzEoaLDIZwffEJDUunaUKL32MFYgGgCSlE1Tg0iZGbqllJtEb0
         oyrXpt5DkQdZLWtsq/DjR2RXO/T/4Q/hMnNWHjafl9GxaSJ+qAgmTULBtN/4UqDyd6rZ
         L0+g==
X-Gm-Message-State: AFqh2krt9mb5DI6ORYXAX++yfImNLgJgo5XUPCgzv13DVXpSR53+xTfu
        ldjggO2ROt50qGKYbu54pBPkU3twk9QlBAZ66Oo=
X-Google-Smtp-Source: AMrXdXsRdlHYnjRRjhCk2v17JvkUYoR1CHg4h96nNklQIOMOzqYNWkVmfkWGmg69bT6vcvmx8iHbsHE7/7Xw9m+vMOU=
X-Received: by 2002:a81:a89:0:b0:4fd:6caf:6a06 with SMTP id
 131-20020a810a89000000b004fd6caf6a06mr1698299ywk.170.1674521206643; Mon, 23
 Jan 2023 16:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20221223172130.938395-1-giuseppe.bilotta@gmail.com>
 <CAEc3jaBwTHiC5_JBdYm1eO-zdingohQsbndGEPWnTbRSW_tzmw@mail.gmail.com> <CAOxFTcyqV-BgBTs33=Ux6EiiBuVRPX=OQGpbxQpTUQ91czK1RQ@mail.gmail.com>
In-Reply-To: <CAOxFTcyqV-BgBTs33=Ux6EiiBuVRPX=OQGpbxQpTUQ91czK1RQ@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 23 Jan 2023 16:46:35 -0800
Message-ID: <CAEc3jaD0=h_N-PyRwWJnuJWU_r9ML44OO_mNvJuUtdu4K+gNkw@mail.gmail.com>
Subject: Re: [RFC PATCH] HID: support the NACON / BigBen PS4 / PC Compact controller
To:     Giuseppe Bilotta <giuseppe.bilotta@gmail.com>
Cc:     Linux Input ML <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Giuseppe,

On Sun, Jan 22, 2023 at 3:43 AM Giuseppe Bilotta
<giuseppe.bilotta@gmail.com> wrote:
>
> Hello Roderick,
>
> I'm terribly sorry for the late reply, it's a bit of a busy period for
> me and I have had less time than I wished to test things.
>
> > Thanks for your work so far. My first thought was 'yikes what an ugly
> > device'. I'm not really sure what the best way of handling it is.
>
> The patch is beyond ugly (in addition to not working). But I'm barely
> treading water here, I'm way out of my element, hence why I came to
> the ML looking for help 8-)
>
> > First is the device a HID device? It would normally be picked up by
> > hid-generic. You can try dumping the HID descriptors.
>
> I'm afraid this is not the case, at least as far as I can tell. Again,
> keep in mind I'm not even exactly sure how to check these things out,
> so please bear with me, and feel free to direct me to appropriate
> resources.
> What I have tried is to first plug the pad in with xpad blacklisted,
> and lsusb -vs the device, which gave me:
>
> --8<-----------------
> Bus 001 Device 006: ID 146b:0603 BigBen Interactive PC Compact Controller
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          255 Vendor Specific Class
>   bDeviceSubClass       255 Vendor Specific Subclass
>   bDeviceProtocol       255 Vendor Specific Protocol
>   bMaxPacketSize0        64
>   idVendor           0x146b BigBen Interactive
>   idProduct          0x0603
>   bcdDevice            1.00
>   iManufacturer           1 Bigben Interactive
>   iProduct                2 PC Compact Controller
>   iSerial                 3 58B00422
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0031
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass       255 Vendor Specific Class

You would normally expect bInterfaceClass to be 3 for 'Human Interface
Device'. I recall Xbox controllers in general have this at a vendor
specific value as they are not actual HID devices (with the exception
of in Bluetooth mode recently).

So it is not a formal HID device.

>       bInterfaceSubClass     93
>       bInterfaceProtocol      1
>       iInterface              0
>       ** UNRECOGNIZED:  11 21 00 01 01 25 81 14 00 00 00 00 13 02 08 03 0=
3
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               8
> Device Status:     0x0000
>   (Bus Powered)
> --8<-----------------
>
> I also tried running usbhid-dump, that claimed there were =E2=80=9CNo mat=
ching
> HID interfaces=E2=80=9D.
>
> If I enable the xpad module shipping with my Debian sid distribution
> (6.0.12-1 from 2022-12-09), there's no difference on the lsusb and
> usbhid-dump outputs,
> even though xpad seems to detect and bind with the device:
>
> --8<-----------------
> [Jan23 05:33] usb 1-1: new full-speed USB device number 7 using xhci_hcd
> [  +0.149801] usb 1-1: New USB device found, idVendor=3D146b,
> idProduct=3D0603, bcdDevice=3D 1.00
> [  +0.000017] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D3
> [  +0.000008] usb 1-1: Product: PC Compact Controller
> [  +0.000006] usb 1-1: Manufacturer: Bigben Interactive
> [  +0.000006] usb 1-1: SerialNumber: 58B00422
> [  +0.068217] input: Generic X-Box pad as
> /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/input/input35
> [  +0.000114] usbcore: registered new interface driver xpad
> --8<-----------------
>
> Is there some other tool I can use to inspect the HID descriptors or
> check which protocols are supported, possibly depending on the device
> initialization?

The device doesn't seem to be a HID device, which is why there are no
descriptors. I haven't looked at the Xbox protocol in detail, but I
recall Xbox compatible devices report some magic value in some USB
descriptor, which is picked up by drivers and hence no need for a
formal driver unless overrides are needed.

> (I have other gamepads whose behavior seems to depend on
> initialization sequence, so this may be the case for this device too?)
>
> > It is a bit ugly if the device has to spawn multiple drivers. My
> > initial gut feeling would have been to complete the support within the
> > xpad driver. My understanding of our licensed controllers is that the
> > HID protocol they use is different from the DS4 protocol, so it is
> > really like handling an entire new device needing its own HID report
> > parsing. So, no matter what each driver would have needed some changes
> > to deal with the device properly and it is probably smallest in xpad.
>
> I don't have enough knowledge to know exactly what would be better,
> but I would expect the protocol to be closer to the PS one than the
> XBOX one,
> even though out of the box it kind of works with xpad (modulo the
> issues I mentioned).
> I also have no idea how similar or different the PS and XBOX protocols
> are, so it might just be that for the limited use and testing I've
> done they match.

So far it looks like the device is not a HID device, but only a USB
device. If true, you can't leverage the HID drivers and need to be in
a classic input driver such as xpad.

I'm honestly not sure how this device is working on PlayStation if it
is one of BigBen's licensed PlayStation compatible controllers. Our PS
input stack is all HID based (at least to my knowledge).

>
> > You mention access flipping and then the touchpad.
>
> Axes mapping is weird, but I think my original issue was actually with
> jstest-gtk not using the correct information. The CLI jstest seems to
> report things correctly.
> The =E2=80=9Ctouchpad=E2=80=9D is a rectangular area above the joysticks =
and between
> the DPAD and the box/triangle/x/o buttons. I'm not entirely surely if
> it's a touchpad or something else,
> but it seems to be clickable =E2=80=9Ceverywhere=E2=80=9D. It's not detec=
ted or
> exposed by the xpad driver in any way, but  assume it would be
> accessible in the protocol.
> There's also something that looks like an audio jack.
>

The key question is to figure out how this touchpad works. Maybe some
people in the community documented this somewhere.

> I can run tests on this thing, but I really don't know what to try next.
>
> Thank you for your reply, and looking forward for things to try,
> Giuseppe Bilotta
>
>

Thanks,
Roderick
