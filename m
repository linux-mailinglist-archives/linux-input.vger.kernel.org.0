Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 870791834DD
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 16:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgCLPWm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Mar 2020 11:22:42 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35454 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbgCLPWm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Mar 2020 11:22:42 -0400
Received: by mail-ot1-f67.google.com with SMTP id k26so6678827otr.2;
        Thu, 12 Mar 2020 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3CEHFjpyc9/ZGVlSOC4X/gcnKa22KLNZWM3ttUw+GaY=;
        b=X1aj1zSaQSY8xndb9omYxHIdZwCylcFB6uD+ViZebe28st96b/Zey2TdqN3YVNGQOg
         XlqWlmyJtDuydUWHsG0xpr+QPpJ0e8baLS1usHhOh2zTO6o7FF3iOd5/zVi3V/EvF1rc
         yRFl//ENMNcJA1Eih0NRBK+BDyIr7kia9QUdo/Ov77e306V5jLFU6LE1azSZL9WWfum/
         7JA/dXzoHtyFTgtNwIyZSsRmZCXPYq+iLQCfbo8ep0DXfeJYHYvU1oZZGzchFDg7ur+F
         gWSpAyav3tYz3HUVumNQicWmIWhB60EwMjUt8KfM87pOlmNxk9lQRXamaz9Gfr54sRXY
         zzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3CEHFjpyc9/ZGVlSOC4X/gcnKa22KLNZWM3ttUw+GaY=;
        b=dBuDNAJiawz2LNz2QWMsoUChlPbASavE+sMy6x9Xnhyr7r8nSQU8bDqDa+y8iOJKGM
         JftoOs4FD/gW0gqHU29HnGGnlFRf2KNx/69OiyM485gkjVhwEmXvEJnnGtS7oeabViOY
         f8ViOV+WU75zHasspn7wFbhzgOeWxDLaOtDam/m4r2tujHFpZSOGDA/vFN7xmEI2fGCo
         fVfRvPOkXcmjWvs3a2DXP/cXaZx5ZCfcwcAuphbwEGsKwuVXDTwpyMeM9ukVQxinDhtQ
         QEVENwK+REDfhiTqOv4WjSBJ3fLFrgbgSeaaz3UlxFUiobDAuttWJiOqfsyzm6RdTE7X
         kF6A==
X-Gm-Message-State: ANhLgQ1SQSr8YW6ZaiWcgD2LAj2V8pEBbtKxnIphqvHE5LKGjwzm0Wog
        +PH3L4aYNgC3xskJoe9knIO4lv9PNQnCfU23OysyjcAV
X-Google-Smtp-Source: ADFU+vsjS/B8wd7MjyjSvFWCuIRNbsoBiEnwif9Xs2TVDjTHdUTqIT5q5v2JXe3xoCnprDgyo0xUfH87+FEdx5X+430=
X-Received: by 2002:a4a:bf19:: with SMTP id r25mr4310784oop.3.1584026561419;
 Thu, 12 Mar 2020 08:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200304164700.11574-1-tony.fischetti@gmail.com> <6c58685f039d329615d84e2df1cd2a155db73c61.camel@archlinux.org>
In-Reply-To: <6c58685f039d329615d84e2df1cd2a155db73c61.camel@archlinux.org>
From:   Tony Fischetti <tony.fischetti@gmail.com>
Date:   Thu, 12 Mar 2020 11:22:30 -0400
Message-ID: <CAOMV6SVxL=DLP6yWa+jHzu5A+PUJTJi4bk_1ZW-kXXwnaCBT5Q@mail.gmail.com>
Subject: Re: [PATCH] add ALWAYS_POLL quirk to lenovo pixart mouse
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for the feedback, y'all.
I will rename the device and add the signed-off field and resubmit.
Thanks again

On Tue, Mar 10, 2020 at 9:48 AM Filipe La=C3=ADns <lains@archlinux.org> wro=
te:
>
> On Wed, 2020-03-04 at 11:47 -0500, Tony Fischetti wrote:
> > A lenovo pixart mouse (17ef:608d) is afflicted common the the malfuncti=
on
> > where it disconnects and reconnects every minute--each time incrementin=
g
> > the device number. This patch adds the device id of the device and
> > specifies that it needs the HID_QUIRK_ALWAYS_POLL quirk in order to
> > work properly.
> > ---
> >  drivers/hid/hid-ids.h    | 1 +
> >  drivers/hid/hid-quirks.c | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index 3a400ce603c4..9e1dfc714ea8 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -726,6 +726,7 @@
> >  #define USB_DEVICE_ID_LENOVO_X1_COVER        0x6085
> >  #define USB_DEVICE_ID_LENOVO_X1_TAB  0x60a3
> >  #define USB_DEVICE_ID_LENOVO_X1_TAB3 0x60b5
> > +#define USB_DEVICE_ID_LENOVO_PIXART_USB_OPTICAL_MOUSE        0x608d
>
> This ID is really ambiguous. Pixart makes the sensors for the big
> majority of devices. Isn't there any other identifier you could use? If
> there isn't, you could do USB_DEVICE_ID_LENOVO_MOUSE_608D.
>
> >  #define USB_VENDOR_ID_LG             0x1fd2
> >  #define USB_DEVICE_ID_LG_MULTITOUCH  0x0064
> > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > index 0e7b2d998395..247747d6d8cf 100644
> > --- a/drivers/hid/hid-quirks.c
> > +++ b/drivers/hid/hid-quirks.c
> > @@ -103,6 +103,7 @@ static const struct hid_device_id hid_quirks[] =3D =
{
> >       { HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_M=
912), HID_QUIRK_MULTI_INPUT },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M40=
6XE), HID_QUIRK_MULTI_INPUT },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTI=
CAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
> > +     { HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXAR=
T_USB_OPTICAL_MOUSE), HID_QUIRK_ALWAYS_POLL },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C=
007), HID_QUIRK_ALWAYS_POLL },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C=
077), HID_QUIRK_ALWAYS_POLL },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_K=
EYBOARD_G710_PLUS), HID_QUIRK_NOGET },
>
> --
> Filipe La=C3=ADns



--=20
--
Tony Fischetti
tony.fischetti@gmail.com
(718) 431-4597
