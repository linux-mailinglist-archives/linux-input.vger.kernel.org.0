Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 742317DA1E8
	for <lists+linux-input@lfdr.de>; Fri, 27 Oct 2023 22:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjJ0Upy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Oct 2023 16:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjJ0Upx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Oct 2023 16:45:53 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102081B5
        for <linux-input@vger.kernel.org>; Fri, 27 Oct 2023 13:45:51 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d9a58aa4983so1844912276.0
        for <linux-input@vger.kernel.org>; Fri, 27 Oct 2023 13:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698439550; x=1699044350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWlYSZeCB45t1dRU5Qs1Y4gop/HsLoRYGjFb2ZI7mMI=;
        b=hzENY3tOpgOa+RzTjY9TWzudb5ZLxSDjpP+vw1PFluzxJ4xnXeVwnp8zIf/WyAdaEo
         9vQ0kyIzUzZlz0VxkuDxpzLtQhQl/Y+JOymLy7e8UEmPgDPhwyMOPRqQDgjd2+JOCXus
         ADZkh1HZIcPGRaoQXtyO9sK+HtJIcQ4TNE55stAUCJRjJtcqAy+fBCh1Vi4RT7o6UWbv
         9JwRxcexZAcw8rpX+yb2CEB6bakza0cFD61kqlwWun669c9lNfEogO4ZogdyPlD0os6b
         RDLb0cbmfDVa+RwQJrlxAm/Ws9+Dyc+TJIgdJbZ28+ZOTjPUuBuacGOxIDt92aTH0r+v
         ssJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698439550; x=1699044350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWlYSZeCB45t1dRU5Qs1Y4gop/HsLoRYGjFb2ZI7mMI=;
        b=Zv6u1lIsnG3L3AjbS2XxD20XIsuj54oul9QQVuOctBfgcnLUspEfErBjBDlThUdJp3
         N1Qjxe6tCXujvTQz9d8cFR6K5bjCudYgsSxY5LUpqZzQaUkfw6dec5cFPgqjiuepfccK
         uJmddTt4dlPUZpfvz/fvSbf/dqoKSTwGoqnJEJBQLWfX/GF+mv9+ZLxsklp7KrQmFwHb
         /Vb2daGxqiQTcgtKhVK0DzUVghCB6cQ7H4q1apuqjCRvaDtAjdrBhPQQCwDIPowGC9Qm
         R7uOfkFLj4pnz4IC+rQT4+8N2PLhjGJOV+3peWr33zTMY2oS1GmMT3OOhlNm1lInyk61
         8hmQ==
X-Gm-Message-State: AOJu0YySZmK57Ji/XjwPd+qopvwav7N1G90OF/btt9U9VIKtEjCWbMPf
        X2ArA4TVpPlyN6qhbwasegDlnAgUGjjgkMnnn9Zb7Tw=
X-Google-Smtp-Source: AGHT+IH8o2ogmEDEMx5Yhbwikue+X6TA/VC1Y7+Js/F7uAID9PuSZQIQeIsw+D5zOuAfYiTN+iVXXntipB4etDIWJxo=
X-Received: by 2002:a5b:151:0:b0:d9a:4870:7943 with SMTP id
 c17-20020a5b0151000000b00d9a48707943mr3975570ybp.28.1698439550128; Fri, 27
 Oct 2023 13:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAAboi9vHvg8++oei61Ti4osPZ-fQ_FXVkSo1oPRxhY6CpZmW7A@mail.gmail.com>
 <nycvar.YFH.7.76.2310271533070.3534@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2310271533070.3534@cbobk.fhfr.pm>
From:   Robert Ayrapetyan <robert.ayrapetyan@gmail.com>
Date:   Fri, 27 Oct 2023 13:45:14 -0700
Message-ID: <CAAboi9sTyaaU1Kbu=iC8qcs8satwzC67f+VSQac7bO6JzLH5JA@mail.gmail.com>
Subject: Re: Dell Pro Wireless Keyboard and Mouse KM5221W require
 HID_QUIRK_ALWAYS_POLL patch
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks!

On Fri, Oct 27, 2023 at 6:33=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Thu, 17 Aug 2023, Robert Ayrapetyan wrote:
>
> > Dell Pro Wireless Keyboard and Mouse KM5221W constantly reconnect with =
a
> > following error messages:
>
> This totally fell in between cracks, sorry for that. I have now applied
> the patch below, thanks a lot for the report.
>
> From: Jiri Kosina <jkosina@suse.cz>
> Date: Fri, 27 Oct 2023 15:32:09 +0200
> Subject: [PATCH] HID: Add quirk for Dell Pro Wireless Keyboard and Mouse =
KM5221W
>
> This device needs ALWAYS_POLL quirk, otherwise it keeps reconnecting
> indefinitely.
>
> Reported-by: Robert Ayrapetyan <robert.ayrapetyan@gmail.com>
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> ---
>  drivers/hid/hid-ids.h    | 1 +
>  drivers/hid/hid-quirks.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index e4d2dfd5d253..f7973ccd84a2 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -366,6 +366,7 @@
>
>  #define USB_VENDOR_ID_DELL                             0x413c
>  #define USB_DEVICE_ID_DELL_PIXART_USB_OPTICAL_MOUSE    0x301a
> +#define USB_DEVICE_ID_DELL_PRO_WIRELESS_KM5221W                0x4503
>
>  #define USB_VENDOR_ID_DELORME          0x1163
>  #define USB_DEVICE_ID_DELORME_EARTHMATE        0x0100
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 3983b4f282f8..5a48fcaa32f0 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -66,6 +66,7 @@ static const struct hid_device_id hid_quirks[] =3D {
>         { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_STR=
AFE), HID_QUIRK_NO_INIT_REPORTS | HID_QUIRK_ALWAYS_POLL },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CREATIVELABS, USB_DEVICE_ID_CREATI=
VE_SB_OMNI_SURROUND_51), HID_QUIRK_NOGET },
>         { HID_USB_DEVICE(USB_VENDOR_ID_DELL, USB_DEVICE_ID_DELL_PIXART_US=
B_OPTICAL_MOUSE), HID_QUIRK_ALWAYS_POLL },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_DELL, USB_DEVICE_ID_DELL_PRO_WIREL=
ESS_KM5221W), HID_QUIRK_ALWAYS_POLL },
>         { HID_USB_DEVICE(USB_VENDOR_ID_DMI, USB_DEVICE_ID_DMI_ENC), HID_Q=
UIRK_NOGET },
>         { HID_USB_DEVICE(USB_VENDOR_ID_DRACAL_RAPHNET, USB_DEVICE_ID_RAPH=
NET_2NES2SNES), HID_QUIRK_MULTI_INPUT },
>         { HID_USB_DEVICE(USB_VENDOR_ID_DRACAL_RAPHNET, USB_DEVICE_ID_RAPH=
NET_4NES4SNES), HID_QUIRK_MULTI_INPUT },
>
>
> --
> Jiri Kosina
> SUSE Labs
>
