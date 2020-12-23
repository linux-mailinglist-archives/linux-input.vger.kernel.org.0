Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781842E17F5
	for <lists+linux-input@lfdr.de>; Wed, 23 Dec 2020 05:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgLWEDu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Dec 2020 23:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLWEDu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Dec 2020 23:03:50 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC35C0613D6
        for <linux-input@vger.kernel.org>; Tue, 22 Dec 2020 20:03:09 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id b24so13985404otj.0
        for <linux-input@vger.kernel.org>; Tue, 22 Dec 2020 20:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M0DHG+H05G+vGVNyiEGUd0nNPeHtEuJGU2Fu/N88wYc=;
        b=JeayrbijE3y1HJvpVkt7xJ9yFsRRcF8/H4+ND1BbDza8aIa+CiLeMRDL1WfK+jtccA
         LGPbcQbtn/8XiVxwmbRd0spmA+e50rYBh1IcT1yYBJ+K7OpVRFGnHQfDiLIumy5SvTBB
         xNmdTRwndSG3Lk3nZDCHhya6kN4Z2afWZ1h/5TpgAq9OeX+mfcciKPPCEJEDya10D7ag
         gVm2bS7IMxjdRgHSWIQGeXyjCu/VR1+ZdrV98SSDKfIgmYhdVlInBhYKLyz6s8yVS1W9
         IvMH8SiyEP296gKVYgBAl9awSiEX+GV8pwwK+p3KpOyxDsahrEiuptGpRidRuWZdyAn+
         vLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M0DHG+H05G+vGVNyiEGUd0nNPeHtEuJGU2Fu/N88wYc=;
        b=WWk4IdcuX1cdVVNG6lVF7ja265dxEixwe/7pohNZGxlQF8kGKLAtF52bTdaBu7vExB
         WOotJcdQ4xSqmPwhibsiJ5wEAf4ab6Jbu8FXzqGeux1y+qQRRgt2zNDiBWCjEzj67c66
         NF5CKPuvRqBpGkvomIhihheJpoWz3cOec/fEQ4a365CntmPHEz+vGisf5mEktYZzjyrU
         dZCM63kKoOT3aoSOrB6DgVX5eWcaHnzhDXNb2YfmSSk1v3sA9Ku1Xydk6RKszVs5IbW0
         30O82S2qy3D2ttFKxEb0PedNWyftjch6MeT+RCgcr3+x29BBQOnS1XsV558GJvLYHfx9
         cmCA==
X-Gm-Message-State: AOAM531Qhh3gPvWIqV/kxZJL5YixvsE7WUXSmDpRXuMRWhn5upd6sptm
        rBqr36VwajapE0XTl4P4R6BifaDHtCikycQ7K1g+3g==
X-Google-Smtp-Source: ABdhPJwD8ZHGFh6F+gSqNx1Fmke5vR8qo2q+FKL0wchYbgSAHYg+C9thV3guUrjpfhfL53YIF+8RkwJ6Sr6ZMqlTc2A=
X-Received: by 2002:a9d:1d41:: with SMTP id m59mr18198178otm.100.1608696188947;
 Tue, 22 Dec 2020 20:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20201222073855.98490-1-jhp@endlessos.org> <CAB4CAwfFQrMDYuzjL2nuUnHgXO031ty-mA7GGxW+-nHFkZTGTg@mail.gmail.com>
In-Reply-To: <CAB4CAwfFQrMDYuzjL2nuUnHgXO031ty-mA7GGxW+-nHFkZTGTg@mail.gmail.com>
From:   Jian-Hong Pan <jhp@endlessos.org>
Date:   Wed, 23 Dec 2020 12:02:22 +0800
Message-ID: <CAPpJ_edREMzaNMm=D7OPFLcP-MJASvvs9wDfF4qzbpjhcG9FVw@mail.gmail.com>
Subject: Re: [PATCH] HID: Add Wireless Radio Control feature for Chicony devices
To:     Chris Chiu <chiu@endlessos.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux@endlessos.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Chris Chiu <chiu@endlessos.org> =E6=96=BC 2020=E5=B9=B412=E6=9C=8823=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Dec 22, 2020 at 3:41 PM Jian-Hong Pan <jhp@endlessos.org> wrote:
> >
> > Some Chicony's keyboards support airplane mode hotkey (Fn+F2) with
> > "Wireless Radio Control" feature. For example, the wireless keyboard
> > [04f2:1236] shipped with ASUS all-in-one desktop.
> >
> > After consulting Chicony for this hotkey, learned the device will send
> > with 0x11 as the report ID and 0x1 as the value when the key is pressed
> > down.
> >
> > This patch maps the event as KEY_RFKILL.
> >
> > Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
> > ---
> >  drivers/hid/hid-chicony.c | 58 +++++++++++++++++++++++++++++++++++++++
> >  drivers/hid/hid-ids.h     |  1 +
> >  2 files changed, 59 insertions(+)
> >
> > diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
> > index 3f0ed6a95223..aca963aa0f1e 100644
> > --- a/drivers/hid/hid-chicony.c
> > +++ b/drivers/hid/hid-chicony.c
> > @@ -21,6 +21,42 @@
> >
> >  #include "hid-ids.h"
> >
> > +#define KEY_PRESSED                    0x01
> > +#define CH_WIRELESS_CTL_REPORT_ID      0x11
> > +
> > +static int ch_report_wireless(struct hid_report *report, u8 *data, int=
 size)
> > +{
> > +       struct hid_device *hdev =3D report->device;
> > +       struct input_dev *input;
> > +
> > +       if (report->id !=3D CH_WIRELESS_CTL_REPORT_ID ||
> > +           report->maxfield !=3D 1 ||
> > +           *report->field[0]->value !=3D KEY_PRESSED)
>
> Maybe replace this line with hid_check_keys_pressed() and the KEY_PRESSED
> is not required.

Thanks for your suggestion!

I tried hid_check_keys_pressed().  But, it always returns no key is
pressed in this case.
However, if the idea is: Since there is already a report, there must
be an event from the input.  So, the key press checking is duplicated.
This idea makes sense.  I will have a modification for this.

Thanks!
Jian-Hong Pan

> > +               return 0;
> > +
> > +       input =3D report->field[0]->hidinput->input;
> > +       if (!input) {
> > +               hid_warn(hdev, "can't find wireless radio control's inp=
ut");
> > +               return 0;
> > +       }
> > +
> > +       input_report_key(input, KEY_RFKILL, 1);
> > +       input_sync(input);
> > +       input_report_key(input, KEY_RFKILL, 0);
> > +       input_sync(input);
> > +
> > +       return 1;
> > +}
> > +
> > +static int ch_raw_event(struct hid_device *hdev,
> > +               struct hid_report *report, u8 *data, int size)
> > +{
> > +       if (report->application =3D=3D HID_GD_WIRELESS_RADIO_CTLS)
> > +               return ch_report_wireless(report, data, size);
> > +
> > +       return 0;
> > +}
> > +
> >  #define ch_map_key_clear(c)    hid_map_usage_clear(hi, usage, bit, max=
, \
> >                                         EV_KEY, (c))
> >  static int ch_input_mapping(struct hid_device *hdev, struct hid_input =
*hi,
> > @@ -77,10 +113,30 @@ static __u8 *ch_switch12_report_fixup(struct hid_d=
evice *hdev, __u8 *rdesc,
> >         return rdesc;
> >  }
> >
> > +static int ch_probe(struct hid_device *hdev, const struct hid_device_i=
d *id)
> > +{
> > +       int ret;
> > +
> > +       hdev->quirks |=3D HID_QUIRK_INPUT_PER_APP;
> > +       ret =3D hid_parse(hdev);
> > +       if (ret) {
> > +               hid_err(hdev, "Chicony hid parse failed: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> > +       if (ret) {
> > +               hid_err(hdev, "Chicony hw start failed: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> >
> >  static const struct hid_device_id ch_devices[] =3D {
> >         { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_T=
ACTICAL_PAD) },
> >         { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_W=
IRELESS2) },
> > +       { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_W=
IRELESS3) },
> >         { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_A=
CER_SWITCH12) },
> >         { }
> >  };
> > @@ -91,6 +147,8 @@ static struct hid_driver ch_driver =3D {
> >         .id_table =3D ch_devices,
> >         .report_fixup =3D ch_switch12_report_fixup,
> >         .input_mapping =3D ch_input_mapping,
> > +       .probe =3D ch_probe,
> > +       .raw_event =3D ch_raw_event,
> >  };
> >  module_hid_driver(ch_driver);
> >
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index 4c5f23640f9c..06d90301a3dc 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -270,6 +270,7 @@
> >  #define USB_DEVICE_ID_CHICONY_PIXART_USB_OPTICAL_MOUSE 0x1053
> >  #define USB_DEVICE_ID_CHICONY_PIXART_USB_OPTICAL_MOUSE2        0x0939
> >  #define USB_DEVICE_ID_CHICONY_WIRELESS2        0x1123
> > +#define USB_DEVICE_ID_CHICONY_WIRELESS3        0x1236
> >  #define USB_DEVICE_ID_ASUS_AK1D                0x1125
> >  #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A    0x1408
> >  #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12    0x1421
> > --
> > 2.29.2
> >
