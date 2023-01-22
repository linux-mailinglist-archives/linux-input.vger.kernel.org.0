Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65302676C67
	for <lists+linux-input@lfdr.de>; Sun, 22 Jan 2023 12:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjAVLnV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Jan 2023 06:43:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjAVLnV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Jan 2023 06:43:21 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBABF10F8
        for <linux-input@vger.kernel.org>; Sun, 22 Jan 2023 03:43:17 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id z5so8456581wrt.6
        for <linux-input@vger.kernel.org>; Sun, 22 Jan 2023 03:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikoRiidxjPkX4ktxVLX4Gwl8Qt4jDjKyu7y/+1AMooE=;
        b=hAagfF4qD7ODv8JqEnF2Tb5DXUffszD2rqYKZjnX/j7Jk2yGVddSBFf0TSV7/+ITtH
         zF3mpMGPqtbF1UHtlrS+bw37duUAlD6+c/OVv+x58+k2RpLwbJ9nb1ybWxc+wleAXBxQ
         swk2LDIBhokwQbrkgjEiHD2lrvBm/n/I3rvm0saY3qclzKbaFp9E9pguUZd7HUiWky/D
         dQGR2pLIdA87rBl0DVPdZnbhMDondn1jCeenyJ3nX5eaGXjMkpTDZ9M1I8oVXssWxAyK
         JBifC00fpuWwVFaK9fKGHfLotOZSdylzCPyoWLp7Rc07B5C55p/Duh4yC4HlLKezDaKo
         k4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikoRiidxjPkX4ktxVLX4Gwl8Qt4jDjKyu7y/+1AMooE=;
        b=NPMxQQzmLsoy5smWSQlzYntmdYj59el/mpLPxR6cFQ+4fdElkAYfT1OvLfxRmg6Kom
         C2ZgHwl9b3GH3HOgx5qhry1nqV9Ws8NhXd5lBA4hlC7Ut3d3lglVzRmpYpO0Dtsn+Muz
         ztKou/cfJVFMxhKiWAacZBOn2IbOE+FFcSefphgM0RHQX7JoMz4rlFuMK4pVq4x5boFb
         TxKBBx7KED/J/Pkf49xmaMDQ3oKi43K72x6BPv5xlzxu+918XZyDh7GtZa183LUKhMld
         06txvqdJL390LL3bpr1rh7Tk+0YbHKTPNV+3FBKkSfynpLaq+opL48P8ySGn3XkOjUMY
         tD4A==
X-Gm-Message-State: AFqh2kq+4AH4YEF528QtdcIGSl1zCHG6DYgM7uOQ0ej5EeBVtGYG1nwu
        WOwQe+Y4BKV9bH/AyKEOTZSkZpOAaEkDrfdHMSE=
X-Google-Smtp-Source: AMrXdXsmVX0j7vQi7yvNeYJCU2LYyrzAdCyowyb0T3cASkwgPtUENIRmaFLXHhsyf20RiY19kVaO/6/HHaGj2d3Bf54=
X-Received: by 2002:adf:f987:0:b0:2be:3539:20f with SMTP id
 f7-20020adff987000000b002be3539020fmr337930wrr.158.1674387796211; Sun, 22 Jan
 2023 03:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20221223172130.938395-1-giuseppe.bilotta@gmail.com> <CAEc3jaBwTHiC5_JBdYm1eO-zdingohQsbndGEPWnTbRSW_tzmw@mail.gmail.com>
In-Reply-To: <CAEc3jaBwTHiC5_JBdYm1eO-zdingohQsbndGEPWnTbRSW_tzmw@mail.gmail.com>
From:   Giuseppe Bilotta <giuseppe.bilotta@gmail.com>
Date:   Sun, 22 Jan 2023 12:43:05 +0100
Message-ID: <CAOxFTcyqV-BgBTs33=Ux6EiiBuVRPX=OQGpbxQpTUQ91czK1RQ@mail.gmail.com>
Subject: Re: [RFC PATCH] HID: support the NACON / BigBen PS4 / PC Compact controller
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
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

Hello Roderick,

I'm terribly sorry for the late reply, it's a bit of a busy period for
me and I have had less time than I wished to test things.

> Thanks for your work so far. My first thought was 'yikes what an ugly
> device'. I'm not really sure what the best way of handling it is.

The patch is beyond ugly (in addition to not working). But I'm barely
treading water here, I'm way out of my element, hence why I came to
the ML looking for help 8-)

> First is the device a HID device? It would normally be picked up by
> hid-generic. You can try dumping the HID descriptors.

I'm afraid this is not the case, at least as far as I can tell. Again,
keep in mind I'm not even exactly sure how to check these things out,
so please bear with me, and feel free to direct me to appropriate
resources.
What I have tried is to first plug the pad in with xpad blacklisted,
and lsusb -vs the device, which gave me:

--8<-----------------
Bus 001 Device 006: ID 146b:0603 BigBen Interactive PC Compact Controller
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass       255 Vendor Specific Subclass
  bDeviceProtocol       255 Vendor Specific Protocol
  bMaxPacketSize0        64
  idVendor           0x146b BigBen Interactive
  idProduct          0x0603
  bcdDevice            1.00
  iManufacturer           1 Bigben Interactive
  iProduct                2 PC Compact Controller
  iSerial                 3 58B00422
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0031
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass     93
      bInterfaceProtocol      1
      iInterface              0
      ** UNRECOGNIZED:  11 21 00 01 01 25 81 14 00 00 00 00 13 02 08 03 03
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               4
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               8
Device Status:     0x0000
  (Bus Powered)
--8<-----------------

I also tried running usbhid-dump, that claimed there were =E2=80=9CNo match=
ing
HID interfaces=E2=80=9D.

If I enable the xpad module shipping with my Debian sid distribution
(6.0.12-1 from 2022-12-09), there's no difference on the lsusb and
usbhid-dump outputs,
even though xpad seems to detect and bind with the device:

--8<-----------------
[Jan23 05:33] usb 1-1: new full-speed USB device number 7 using xhci_hcd
[  +0.149801] usb 1-1: New USB device found, idVendor=3D146b,
idProduct=3D0603, bcdDevice=3D 1.00
[  +0.000017] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Serial=
Number=3D3
[  +0.000008] usb 1-1: Product: PC Compact Controller
[  +0.000006] usb 1-1: Manufacturer: Bigben Interactive
[  +0.000006] usb 1-1: SerialNumber: 58B00422
[  +0.068217] input: Generic X-Box pad as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/input/input35
[  +0.000114] usbcore: registered new interface driver xpad
--8<-----------------

Is there some other tool I can use to inspect the HID descriptors or
check which protocols are supported, possibly depending on the device
initialization?
(I have other gamepads whose behavior seems to depend on
initialization sequence, so this may be the case for this device too?)

> It is a bit ugly if the device has to spawn multiple drivers. My
> initial gut feeling would have been to complete the support within the
> xpad driver. My understanding of our licensed controllers is that the
> HID protocol they use is different from the DS4 protocol, so it is
> really like handling an entire new device needing its own HID report
> parsing. So, no matter what each driver would have needed some changes
> to deal with the device properly and it is probably smallest in xpad.

I don't have enough knowledge to know exactly what would be better,
but I would expect the protocol to be closer to the PS one than the
XBOX one,
even though out of the box it kind of works with xpad (modulo the
issues I mentioned).
I also have no idea how similar or different the PS and XBOX protocols
are, so it might just be that for the limited use and testing I've
done they match.

> You mention access flipping and then the touchpad.

Axes mapping is weird, but I think my original issue was actually with
jstest-gtk not using the correct information. The CLI jstest seems to
report things correctly.
The =E2=80=9Ctouchpad=E2=80=9D is a rectangular area above the joysticks an=
d between
the DPAD and the box/triangle/x/o buttons. I'm not entirely surely if
it's a touchpad or something else,
but it seems to be clickable =E2=80=9Ceverywhere=E2=80=9D. It's not detecte=
d or
exposed by the xpad driver in any way, but  assume it would be
accessible in the protocol.
There's also something that looks like an audio jack.

I can run tests on this thing, but I really don't know what to try next.

Thank you for your reply, and looking forward for things to try,
Giuseppe Bilotta


>
> Thanks,
> Roderick
>
> On Fri, Dec 23, 2022 at 9:25 AM Giuseppe Bilotta
> <giuseppe.bilotta@gmail.com> wrote:
> >
> > ---
> >
> > I have recently come into possession of a NACON / Big Ben Interactive
> > USB wired PC Compact controller (USB vendor:device 146b:0603).
> > This is advertised as an =C2=ABofficially licensed PS4=E2=84=A2 wired c=
ontroller=C2=BB
> > that =C2=ABalso boasts full compatibility with PC games=C2=BB.
> >
> > It is supposed to be similar to a DualShock 4 controller except for the
> > lack of built-in speaker, light bar and =E2=80=9CSIXAXIS=E2=80=9D motio=
n sensor.
> > In particular, in addition to the typical gamepad goodies, it has a
> > built-in touchpad and an audio jack.
> >
> > As things are currently, the Linux kernel automatically matches it with
> > the xpad driver, that detects this as a =E2=80=9CGeneric X-Box controll=
er=E2=80=9D.
> > This kind of works, but in addition to minor issues such as the default
> > axis mapping being wrong (which could be fixed in the xpad driver),
> > the major downside for the xpad driver binding to the controller
> > is that it fails to expose the touchpad and the audio jack.
> >
> > My hope was to let the xpad driver skip this device, and to manage it
> > through the hid subsystem, expecting the hid-sony and/or hid-playstatio=
n
> > drivers to be able to manage it.
> >
> > However, I obviously don't understand enough about how the hid driver
> > manages the bindings, and so far I've been at a loss about making this
> > work. The hack to ignore the device in xpad works, although it's a
> > horrible hack that probably shouldn't be needed in the first place,
> > but the HID subsystem doesn't seem to pick up the device.
> > This patch is my very poor (and currently NOT WORKING) attempt,
> > and since I'm obviously going at this all wrong, I'd be glad for
> > any recommendations on how to approach this.
> >
> > Cheers,
> >
> > Giuseppe Bilotta
> >
> >
> >  drivers/hid/hid-ids.h         | 1 +
> >  drivers/hid/hid-playstation.c | 5 ++++-
> >  drivers/hid/hid-quirks.c      | 1 +
> >  drivers/hid/hid-sony.c        | 3 +++
> >  drivers/input/joystick/xpad.c | 5 +++++
> >  5 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index 82713ef3aaa6..78d993415071 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -250,6 +250,7 @@
> >  #define USB_VENDOR_ID_BETOP_2185V2BFM  0x20bc
> >
> >  #define USB_VENDOR_ID_BIGBEN   0x146b
> > +#define USB_DEVICE_ID_BIGBEN_PC_COMPACT_CONTROLLER     0x0603
> >  #define USB_DEVICE_ID_BIGBEN_PS3OFMINIPAD      0x0902
> >
> >  #define USB_VENDOR_ID_BTC              0x046e
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstatio=
n.c
> > index f399bf0d3c8c..8302394479bd 100644
> > --- a/drivers/hid/hid-playstation.c
> > +++ b/drivers/hid/hid-playstation.c
> > @@ -2589,7 +2589,8 @@ static int ps_probe(struct hid_device *hdev, cons=
t struct hid_device_id *id)
> >                 goto err_stop;
> >         }
> >
> > -       if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS4_CONTROLLER ||
> > +       if (hdev->product =3D=3D USB_DEVICE_ID_BIGBEN_PC_COMPACT_CONTRO=
LLER ||
> > +               hdev->product =3D=3D USB_DEVICE_ID_SONY_PS4_CONTROLLER =
||
> >                 hdev->product =3D=3D USB_DEVICE_ID_SONY_PS4_CONTROLLER_=
2 ||
> >                 hdev->product =3D=3D USB_DEVICE_ID_SONY_PS4_CONTROLLER_=
DONGLE) {
> >                 dev =3D dualshock4_create(hdev);
> > @@ -2632,6 +2633,8 @@ static void ps_remove(struct hid_device *hdev)
> >  }
> >
> >  static const struct hid_device_id ps_devices[] =3D {
> > +       /* NACON / BigBen Interact Wired PC Compact controller */
> > +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_BIGBEN, USB_DEVICE_ID_BIGB=
EN_PC_COMPACT_CONTROLLER) },
> >         /* Sony DualShock 4 controllers for PS4 */
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_P=
S4_CONTROLLER) },
> >         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CON=
TROLLER) },
> > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > index 0e9702c7f7d6..fa9503257621 100644
> > --- a/drivers/hid/hid-quirks.c
> > +++ b/drivers/hid/hid-quirks.c
> > @@ -639,6 +639,7 @@ static const struct hid_device_id hid_have_special_=
driver[] =3D {
> >         { HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP_LTD, USB_DEVICE_ID_SUP=
ER_JOY_BOX_5_PRO) },
> >  #endif
> >  #if IS_ENABLED(CONFIG_HID_SONY)
> > +       { HID_USB_DEVICE(USB_VENDOR_ID_BIGBEN, USB_DEVICE_ID_BIGBEN_PC_=
COMPACT_CONTROLLER) },
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LO=
GITECH_HARMONY_PS3) },
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_PS3=
_BDREMOTE) },
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_NSG=
_MR5U_REMOTE) },
> > diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> > index 13125997ab5e..4f5d5643dd19 100644
> > --- a/drivers/hid/hid-sony.c
> > +++ b/drivers/hid/hid-sony.c
> > @@ -3180,6 +3180,9 @@ static const struct hid_device_id sony_devices[] =
=3D {
> >         /* SMK-Link PS3 BD Remote Control */
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_PS3=
_BDREMOTE),
> >                 .driver_data =3D PS3REMOTE },
> > +       /* NACON / BigBen Interact Wired PC Compact controller */
> > +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_BIGBEN, USB_DEVICE_ID_BIGB=
EN_PC_COMPACT_CONTROLLER),
> > +               .driver_data =3D DUALSHOCK4_CONTROLLER_USB },
> >         /* Sony Dualshock 4 controllers for PS4 */
> >         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CON=
TROLLER),
> >                 .driver_data =3D DUALSHOCK4_CONTROLLER_USB },
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpa=
d.c
> > index 2959d80f7fdb..d3d3ce84bd6c 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -92,6 +92,7 @@
> >  #define XTYPE_XBOX360W    2
> >  #define XTYPE_XBOXONE     3
> >  #define XTYPE_UNKNOWN     4
> > +#define XTYPE_NOTXBOX     0xff
> >
> >  /* Send power-off packet to xpad360w after holding the mode button for=
 this many
> >   * seconds
> > @@ -281,6 +282,7 @@ static const struct xpad_device {
> >         { 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_D=
PAD_TO_BUTTONS, XTYPE_XBOX },
> >         { 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
> >         { 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, =
XTYPE_XBOX360 },
> > +       { 0x146b, 0x0603, "BigBen Interactive PC Compact Controller", 0=
, XTYPE_NOTXBOX },
> >         { 0x146b, 0x0604, "Bigben Interactive DAIJA Arcade Stick", MAP_=
TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
> >         { 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
> >         { 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_B=
UTTONS, XTYPE_XBOXONE },
> > @@ -1951,6 +1953,9 @@ static int xpad_probe(struct usb_interface *intf,=
 const struct usb_device_id *id
> >                         break;
> >         }
> >
> > +       if (xpad_device[i].xtype =3D=3D XTYPE_NOTXBOX)
> > +               return -ENODEV;
> > +
> >         xpad =3D kzalloc(sizeof(struct usb_xpad), GFP_KERNEL);
> >         if (!xpad)
> >                 return -ENOMEM;
> > --
> > 2.39.0
> >



--=20
Giuseppe "Oblomov" Bilotta
