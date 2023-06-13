Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F7C72E734
	for <lists+linux-input@lfdr.de>; Tue, 13 Jun 2023 17:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242928AbjFMP3D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Jun 2023 11:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242949AbjFMP3A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Jun 2023 11:29:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E6EDC
        for <linux-input@vger.kernel.org>; Tue, 13 Jun 2023 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686670097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wJEC09yQalJKUXlJeh+NJY27alAb7rmApKKaqnBztmc=;
        b=DZ7b0ktcecEsJMZhmdJvoC1ChLbTW3tA5bTv839AP80wfF99fisqGAgujFbIo7PuBiP7G8
        MJ4381VggznDxvVvMow46gxmf+L3o9Xwl4Le0+TIpsV2LEe2AfUkvvADlBmWInFRQgIk9g
        Uw8rn7VfMv6IEHUCNkpp1uXWSu7YVkY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-jGY39UadMm20C8Fk9G2X2w-1; Tue, 13 Jun 2023 11:28:15 -0400
X-MC-Unique: jGY39UadMm20C8Fk9G2X2w-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-56cf9a86277so47646947b3.3
        for <linux-input@vger.kernel.org>; Tue, 13 Jun 2023 08:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670094; x=1689262094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJEC09yQalJKUXlJeh+NJY27alAb7rmApKKaqnBztmc=;
        b=bV+2dbX9u5MIKAxUbsOK8AuAmqFvyELvuLn733BZFNBNaO6tbVrxdPeiwX7Ud+NVk/
         J0XmAachOIsnyhQ29WtHhZyPh3gK6gGkSjxnLdNvDZ4iz0MJtsQiHktlIveY7lzhZPYG
         xp/VXL/Rx/n1tqiSUUE/fL2QjXq29B932pO6Lhjcn2jzGCX+tW9cl6Lt4LpBANdSJ/ah
         3Hfdz7ZS8frjWhuHePXY2Uo32djdJh2gMe3ZsBveQ5m/Bk1Gm93Dx+D3dYh6DmA+3l/P
         R/fc9EAKOgoj51D60S6xub4fYZE5vlnAkvDT3spX7xIN0o0e1y2yu00fOtOpZGM4yunT
         MwoA==
X-Gm-Message-State: AC+VfDwe11jDWYUh826NsxZsXtFLAdeW6vnt4k1Mrm5opkeKxT2PnZVX
        ITbF6umzmqWqoD6ArGe7/QnS07GDJELfWDF+NWpea4PPzMnej75T0w2VLymXFX4mxBHR5LOF1gx
        oMGq78ueXOdKY5QqOIH4vbOzQ0CQ/n0uxo2eAZbHdmeu56Y0=
X-Received: by 2002:a05:6902:1350:b0:bce:9515:b904 with SMTP id g16-20020a056902135000b00bce9515b904mr1584978ybu.2.1686670094238;
        Tue, 13 Jun 2023 08:28:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4NV8oqS1dX40Qwz2YM8gG0Y9hjjtGBn6xzxWHoKAUNsUDtljbysXSG2sWtsrZws5WKb0EuPa+RNuO3IQ5DNR0=
X-Received: by 2002:a05:6902:1350:b0:bce:9515:b904 with SMTP id
 g16-20020a056902135000b00bce9515b904mr1584966ybu.2.1686670093888; Tue, 13 Jun
 2023 08:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <5673fd15-b3f2-7911-6eea-39e5126f4874@polimi.it>
 <CAO-hwJKNqosABrr-VGSUVPs8CKRpQNTL0xgNLeT4yg453ADWZA@mail.gmail.com> <cce96d0b-1642-bf52-b9e6-64e40e8ae275@polimi.it>
In-Reply-To: <cce96d0b-1642-bf52-b9e6-64e40e8ae275@polimi.it>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 13 Jun 2023 17:28:02 +0200
Message-ID: <CAO-hwJKvO3PLpDYBNE0PvVns3UaAzZJ1Xp3EHgDTBd+a_EpJwg@mail.gmail.com>
Subject: Re: Tree dumb questions from an occasional
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 12, 2023 at 9:33=E2=80=AFPM Marco Morandini
<marco.morandini@polimi.it> wrote:
>
> > Yeah, right. This is the kind of situation where it's usually easy
> > enough to detect with hid-tools[0]. We can record the device on your
> > machine, then we can replay it locally on ours, and make several
> > attempts.
>
> I was not aware of hid-tools, I will mention it in my doc attempt!
>
> > Sure. Please write (if you want) your first draft, we can review it
> > and we can iterate from there. Do not forget to add the linux doc
> > mailing list in CC in case some people from there want to also add
> > things.
>
> Ok, will try.

\o/

>
> >> 2) if I got it right, one can add a quirk like HID_QUIRK_MULTI_INPUT
> >> while loading the usb_hid module, but not while loading the usb_generi=
c
> >> one (that turned out to be the module that manages my HP pointer),
> >> even if the statically defined quirks were moved into their own file.
> >> Would it make sense to add the possibility to
> >> add quirks while loading hid_generic? Is this the right place for
> >> such code? If yes, I can try in my spare time to do this,
> >> even if I'm not sure I'll be able to get it right.
> >
> > I'm not 100% sure of what you mean, but currently dynamic quirks can
> > be added to the *usbhid* module (not usb_hid or usb_generic), which is
> > the transport layer driver for HID.
> > This module is responsible for creating a HID device, which can be
> > handled by HID drivers, hid_generic being one of them.
>
> You are right, I should have written usbhid.
> I was convinced that hid_generic
> did not get the quirks that were set at loading time by usbhid, but only =
those
> defined in quirks.c .
>
> What I really meant was that the quirk I ended up adding is
>
> { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_HP, 0x464a), HID_QUIRK_MULTI_INPUT }
>
> If I got it right usbhid can add only quirks with
>
> BUS_USB (and not BUS_BLUETOOTH, like the above)

Yes, that is correct

>
> because of the code in usbhid/hid-core.c
>
> (
>
> retval =3D hid_quirks_init(quirks_param, BUS_USB, MAX_USBHID_BOOT_QUIRKS)=
;
>
> is this the right line in hid_init ?
>
> )
>
> and the fact that one cannot specify the
> bus that should be used (whatever this "bus" means in the kernel, I
> still need to get it):

The bus is the transport layer that exposes the HID device.

If you plug in your mouse over USB, then the bus is BUS_USB. If the
mouse is wirelessly connected through Bluetooth, then it's
BUS_BLUETOOTH, and if your touchpad is integrated in the laptop and is
using I2C to communicate, the bus is BUS_I2C :)

Each bus has its own transport driver (usbhid, i2c_hid, hidp
(Bluetooth classic), uhid (BLE)) and they all translate the data from
the original bus into HID.

>
> MODULE_PARM_DESC(quirks, "Add/modify USB HID quirks by specifying "
>                 " quirks=3DvendorID:productID:quirks"
>                 " where vendorID, productID, and quirks are all in"
>                 " 0x-prefixed hex");
>
> Long story short: if I
>
> - either boot with
>
> usbhid.quirks=3D0x3f0:0x464a:0x40
>
> - or, alternatively try to
>
> sun:/home/marco/READMEs/HPElitePresenterMouse # rmmod usbhid
> sun:/home/marco/READMEs/HPElitePresenterMouse # modprobe -v usbhid "quirk=
s=3D0x03f0:0x464a:0x40"
> insmod /lib/modules/6.3.6-1-default/kernel/drivers/hid/usbhid/usbhid.ko.z=
st quirks=3D0x03f0:0x464a:0x40
>
> my device does not work correctly, but with the added
>
> { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_HP, 0x464a), HID_QUIRK_MULTI_INPUT }
>
> it does work.

That is correct, because usbhid is only responsible for USB devices
(which is the vast majority of devices), and hidp (nor uhid) doesn't
have such dynamic quirks.

>
> Hoping that I got it right and HID_QUIRK_MULTI_INPUT corresponds to
> 0x40, otherwise all what I've written make no sense, and I should go back
> and re-do my homework....
>
> At any rate: if there is a way to specify the correct quirk for a device =
like the one
> I stumbled upon, while waiting for the correct upstream fix to percolate =
down
> to the distributions, then of course my questions 2) and 3) (add the opti=
ons to
> specify quirks while loading hid-generic (question 2) and by resorting to=
 ebpf (question 3))
> do not make sense.

OK. The missing point was that you were using a Bluetooth device, and
not a USB one. And that makes a big difference, because yes, you can
not dynamically quirk devices for anything but USB.

I still stand by the fact that hid_generic is not the correct place.
These kinds of quirks are global to the device, and putting them in
hid_generic would make it the wrong place IMO.

Actually, the one place where it would make sense to have such dynamic
quirks is in the hid-core (hid.ko) module itself. It would make sense
to have a BUS:VID:PID:QUIRKS parameter.
But having such a parameter is not without constraints, because it's
not really "dynamic", and we can only set a limited number of quirks.

In your particular case, we might as well use an HID-BPF program that
tweaks the report descriptor which would force the kernel to "use" the
multi-input quirk.

Would you mind attaching the output of hid-recorder while you do some
HID events and where you show the bug?

Also, FWIW, the number of MULTI_INPUT quirk required in the kernel is
probably a sign that we are not using the best default implementation,
and I've already been pinged to change that. I couldn't find the time
to get back to this, but your device might also help me in having a
broader range of use cases so that we can ditch that quirk once and
for all.

Cheers.
Benjamin

>
> > As the name says, hid_generic is supposed to be generic, and I do not
> > want to see special cases handled there, because it would not be
> > generic anymore.
>
> Understood, thank you.
>
>
> > Furthermore, if you submit your patch to the LKML, the quirk will
> > likely end up in driver/hid/hid-quirks.c which is exactly the static
> > equivalent of the dynamic one from usbhid.
>
> Not exactly, because of the bus issue (again, assuming I got it right).
>
> > No need to apologize. You are actually proposing ideas and your help
> > to make things better for end-users, which is extremely valuable in
> > itself :)
>
> Thank you, you are very kind. I only hope I've not written too much
> nonsense here above.
>
> Marco
>

