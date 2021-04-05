Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B9D3546FD
	for <lists+linux-input@lfdr.de>; Mon,  5 Apr 2021 21:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234289AbhDETLe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Apr 2021 15:11:34 -0400
Received: from mout.web.de ([212.227.15.14]:42353 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233194AbhDETLe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Apr 2021 15:11:34 -0400
X-Greylist: delayed 6037 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Apr 2021 15:11:34 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1617649882;
        bh=N2Vk9DfuNMjiOjfXUQZ6ZkL3HDed82ee27rnGwb5C6c=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=GHgpwlaHtqqLEafx0ie+HLJ18G3OC8i1T/nS5y1EJAhtUtiLekwfF31Kqnrxz/lhl
         RzpJQXVBQYrU+XVWpAjPOv2JqpGRqMYx8gMhUSNmo8MuC5dVGuWAwIIRupWYhcFCRX
         Sbp0Qpk1L0KwGIqmwy+s0rSk6CX5rVfNs58AcY1A=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.0.9] ([109.193.148.190]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7usw-1lXMVc0bdC-005Eqc; Mon, 05
 Apr 2021 21:11:22 +0200
Message-ID: <7b16a2f3700b17da5b53c5362255974706208463.camel@web.de>
Subject: Re: [PATCH] HID: quirks: Add Apple Magic Trackpad 2 to
 hid_have_special_driver list
From:   Felix =?ISO-8859-1?Q?H=E4dicke?= <felixhaedicke@web.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Sean O'Brien <seobrien@chromium.org>
Date:   Mon, 05 Apr 2021 21:11:21 +0200
In-Reply-To: <CAO-hwJLk5hpBQA=Xy4Hmfhx8iMJp+TuqyV33r2ocJX7JW-PkFQ@mail.gmail.com>
References: <20201119082232.8774-1-felixhaedicke@web.de>
         <CAKdAkRSyi53f0pwyzmNP4fNhkDT4P5vV_aDneZuCKTqWDvb+Kg@mail.gmail.com>
         <CAO-hwJLk5hpBQA=Xy4Hmfhx8iMJp+TuqyV33r2ocJX7JW-PkFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N8gv7BVzKJgYALK+ZmHveF/8yy99p24NHcvh/Y0pGDheD83gJg0
 Mnfh/aVTgxYm78EuBkUD+S/atjhN0ql6M5kE7CqC7nVtT/hnGEd5aFORmpETyKIuK4q2QYX
 VMLNHyAuHDthj9aXT15t1hr8xbVO5CLmiUA87zsIF9uOgrsTyRfLn2IbHIx++8VGRJ1ipcr
 AY1J3m5+fQAaGn2qJG0AA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GzPmfWwGMPg=:PyR6F7r2U/JFvNFcMCylQx
 YnYsBrB8snu6hVaR+r/9vWXmoNnKUX/ob47O49nFTMeYSlzGlMBhWw5qWpiO6IH0e3C3CcKbD
 bmd/eamnwFygA8YnY5pGMj9UysAY75LQkwiqp9SRbhZV77sgqgNpbtw+GHLB+qLyDonhAsqA7
 JDWGuUjCub906w0RPCM53e3zQTCLywlBveUXaux1xBaIaZso+BYYlluUgrvhQiOkGonKnuRIg
 iKftnCPJDgsTO9bVuWrcxc7YfnTevRM0pNcv6lD1LppXTrc19FSZctMg59iddAyax+zk0ew59
 UgGldyECAGl/0nGmOgDfTaXnDgPx4FYrfWcpn5eQm5O4qq0CqqOrl8pLyXuI5VaM30hSdfLFD
 5k4o/QdsETqPj1WQdG4X9pmysCdipsbBXG10wFVTCXU7RxqurhEY57cV6CoIehECoPZDs6T/9
 T3qwRt5CQNzEEc3r+v713ri2+ALiROdDgj/lsD6TWnbFw7OKzcgpLdL1k1+/7WUzOhAN40J6R
 /TqfpRAyCjmHtaywI62mB2QUmhGOrqcYbA3lGU42LFuh5VdR1dWGbeKADJwAcvwgeFd8bYMeI
 K7/sw7uInyP3IalYEjxgNkHOX+WX8aIqY1sqZY99tTZtNpJXrwEyqoVKrO+HfqFYBR5QLWYl7
 WYOUQufr+TygXtXQhJegrdyZkEolGglPkzCu2qEujFfCUL8sEN//6JEi2DgiVotgoylLX0Fga
 nSx4KDTZlQuK92fprlS0SDMXBz3twQYHWc6mBpdG9IfpXxRSsycl/rUAG2/UP16e40PtEAkd9
 r5edwwytI/7k9Z0D+2gpb2wDRM9KGzXQ3IxJX3fSklAwxIndqz7rxA2qYsnEQdWOxi1A3B2lm
 2r9r9YkvvwFL27BOb22QYg5zBsP5vnRK5iV1p9GzxhfJzCbxXq8rvZFp1EWU96uEffVuSL39r
 ecgvmpaQIV3323QvjG/5X6Byl5wz6KQgXDmcdrv6xXqgu+B8dY3KXBPi496+ZZp3X+9SeWKT7
 2BLhgKHPF/gowbxYWiuZi6pl8sluhAtG1GAjO3Mr+BcDYFZOinm9ec71JBXC8U6QUX/+D9D9n
 LoI+j/6Z/wruwaZ1CyCIuuwEWbSpqd6zzcYmbe6d9OCS9fpZqsRmx7zwSgUMWQTJQCrxpIFX+
 ehdKEY1aWobKJvA9zTUIMNPndrEB1/F2PZGiRwmZDFLsu1LY9V20apEsbIkx0JECSw0EQ=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Benjamin,

On Wed, 2020-12-02 at 11:21 +0100, Benjamin Tissoires wrote:
> Hi Felix,
>
> On Wed, Dec 2, 2020 at 5:31 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Thu, Nov 19, 2020 at 12:31 AM Felix H=C3=A4dicke <
> > felixhaedicke@web.de> wrote:
> > >
> > > The Apple Magic Trackpad 2 is handled by the magicmouse driver.
> > > And
> > > there were severe stability issues when both drivers (hid-generic
> > > and
> > > hid-magicmouse) were loaded for this device.
> > >
> > > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D210241
>
> As mentioned in the bug, this hardly looks like the correct solution.
>
> The magicmouse is one of the 2 only drivers that calls
> `hid_register_report` and then overwrites the size of the report
> manually. I can not figure out immediately if this is wrong, and how
> that would impact a free in usbhid, but this is highly suspicious to
> me.

Sorry for my late reply.

Now I have now found time to investigate this further, and tried to
understand what effect overwriting the size of the report could have.
Without success, I found nothing about this, which could explain a
memory corruption.

But as I commented in bug 210241 (see comment #13), usbhid_stop() is
called twice for the same hid_device instance pointer. The first call
seems to happen when the HID default driver tries to initialise this
device, which failes (probably because the hid-magicmouse driver is
already active for this device).

Adding the Magic Trackpad 2 to the hid_have_special_driver list makes
hid_generic_match() return false (in the hid-generic driver), and the
device is ignored by this driver.

Is it not the right thing to have the Magic Trackpad 2 in the
hid_have_special_driver list anyway?

Regards,
Felix


>
> Cheers,
> Benjamin
>
> >
> > +Jiri Kosina +Benjamin Tissoires for visibility.
> >
> > >
> > > Signed-off-by: Felix H=C3=A4dicke <felixhaedicke@web.de>
> > > ---
> > > =C2=A0drivers/hid/hid-quirks.c | 2 ++
> > > =C2=A01 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > > index 7a2be0205dfd..0a589d956e5c 100644
> > > --- a/drivers/hid/hid-quirks.c
> > > +++ b/drivers/hid/hid-quirks.c
> > > @@ -473,6 +473,8 @@ static const struct hid_device_id
> > > hid_have_special_driver[] =3D {
> > > =C2=A0#if IS_ENABLED(CONFIG_HID_MAGICMOUSE)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { HID_BLUETOOTH_DEVICE(US=
B_VENDOR_ID_APPLE,
> > > USB_DEVICE_ID_APPLE_MAGICMOUSE) },
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { HID_BLUETOOTH_DEVICE(US=
B_VENDOR_ID_APPLE,
> > > USB_DEVICE_ID_APPLE_MAGICTRACKPAD) },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { HID_BLUETOOTH_DEVICE(BT_VEND=
OR_ID_APPLE,
> > > USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { HID_USB_DEVICE(USB_VENDOR_ID=
_APPLE,
> > > USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) },
> > > =C2=A0#endif
> > > =C2=A0#if IS_ENABLED(CONFIG_HID_MAYFLASH)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { HID_USB_DEVICE(USB_VEND=
OR_ID_DRAGONRISE,
> > > USB_DEVICE_ID_DRAGONRISE_PS3) },
> > > --
> > > 2.29.2
> > >
> >
> > Thanks.
> >
> > --
> > Dmitry
> >
>


