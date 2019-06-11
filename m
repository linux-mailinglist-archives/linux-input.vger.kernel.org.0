Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B53553C954
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 12:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfFKKsr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 06:48:47 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40052 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFKKsr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 06:48:47 -0400
Received: by mail-qt1-f196.google.com with SMTP id a15so13876575qtn.7
        for <linux-input@vger.kernel.org>; Tue, 11 Jun 2019 03:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GdsuCopuLs7g2CGx/i2p+QNXyNbL3DFsAp0JkN+Hsf4=;
        b=bL1P7iJ4VDowE09ylaIyIW8DQ5J+dkEBfqAkJwFttj+nRfYV8hq+I2Fu16JB8143th
         tyko9Lo4GdwCkIM6Zlwc5eXxXYc5xierw/kGJU3/ifNI0mH5zYVqV1jj+huz7bnYHkxK
         mjZgQj786EoZcIBkFcOpPnmPLb7TjmWLSa/A36euaCHZyEQqoYYKLqLEOPUHMjvznASa
         /TeMXP7sC3/0IWpM2kmLaRuX8S2plRZ59llfimK89hk4eOa1t/wO8mbkxZeNe7PIn4So
         naq/2QpF971myN86wVTFK20rEYwkUiYmpVo2KaUIuiLYpQBcRK/yaEcXXpXhQ0EclMFF
         yDCw==
X-Gm-Message-State: APjAAAU7go/Ica68e/CDbNIt4T9c5Fr4nhJ8pZyABXP4uKc2XHRmGDFp
        DehrUpcZAZpZrBD3XpQ1c+SU+PLPFE/Ksyeby19fXg==
X-Google-Smtp-Source: APXvYqyn2g/AAwQzW+MoLl4z8XxYFwxeqkupM3d4ea9Nwx6St1UcQCl7x7rSRdoKAIffb1admZCqH0/BOPkxnIQAXRo=
X-Received: by 2002:ac8:275a:: with SMTP id h26mr44547403qth.345.1560250125972;
 Tue, 11 Jun 2019 03:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190608092324.4623-1-git@xen0n.name>
In-Reply-To: <20190608092324.4623-1-git@xen0n.name>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 11 Jun 2019 12:48:34 +0200
Message-ID: <CAO-hwJ+paV03cDbJgtrvHeH6uHun2Y24ru+DwR+MYAfGKX+2GA@mail.gmail.com>
Subject: Re: [PATCH] HID: uclogic: Add support for Ugee Rainbow CV720
To:     Wang Xuerui <git@xen0n.name>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Nikolai Kondrashov <spbnick@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jun 8, 2019 at 1:52 PM Wang Xuerui <git@xen0n.name> wrote:
>
> Add support for Ugee Rainbow CV720 to hid-uclogic.
>
> Signed-off-by: Wang Xuerui <git@xen0n.name>
> ---

Applied to for-5.3/uclogic

Thanks!

Cheers,
Benjamin

>  drivers/hid/hid-ids.h            | 1 +
>  drivers/hid/hid-uclogic-core.c   | 2 ++
>  drivers/hid/hid-uclogic-params.c | 2 ++
>  3 files changed, 5 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 84e0c78d73cd..80edfb639306 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1153,6 +1153,7 @@
>  #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_DECO01 0x0042
>  #define USB_DEVICE_ID_UGEE_TABLET_G5           0x0074
>  #define USB_DEVICE_ID_UGEE_TABLET_EX07S                0x0071
> +#define USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720        0x0055
>
>  #define USB_VENDOR_ID_UNITEC   0x227d
>  #define USB_DEVICE_ID_UNITEC_USB_TOUCH_0709    0x0709
> diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
> index 8fe02d81265d..490c1ddb350c 100644
> --- a/drivers/hid/hid-uclogic-core.c
> +++ b/drivers/hid/hid-uclogic-core.c
> @@ -387,6 +387,8 @@ static const struct hid_device_id uclogic_devices[] = {
>                                 USB_DEVICE_ID_UGEE_TABLET_G5) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
>                                 USB_DEVICE_ID_UGEE_TABLET_EX07S) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
> +                               USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
>                                 USB_DEVICE_ID_UGEE_XPPEN_TABLET_G540) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
> diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
> index 0187c9f8fc22..8e120dde31fa 100644
> --- a/drivers/hid/hid-uclogic-params.c
> +++ b/drivers/hid/hid-uclogic-params.c
> @@ -999,6 +999,8 @@ int uclogic_params_init(struct uclogic_params *params,
>                      USB_DEVICE_ID_UGEE_XPPEN_TABLET_G540):
>         case VID_PID(USB_VENDOR_ID_UGEE,
>                      USB_DEVICE_ID_UGEE_XPPEN_TABLET_G640):
> +       case VID_PID(USB_VENDOR_ID_UGEE,
> +                    USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720):
>                 /* If this is the pen interface */
>                 if (bInterfaceNumber == 1) {
>                         /* Probe v1 pen parameters */
> --
> 2.21.0
>
