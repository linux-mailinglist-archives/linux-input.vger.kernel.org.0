Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1832BD441A
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 17:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfJKP0U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 11:26:20 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39909 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726705AbfJKP0U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 11:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570807579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r91xPcIl5SV0V09jWIUEt2F7Evym3w9uEOcXPXEGEUc=;
        b=SR+NrgnuVTfyUKsNnG3AQm+tGT4e0eZOyyY1sJo4SA7rHvuRk+0aUPFoeaDkmFKt37J/U3
        n8wxW0wXWLcU7LwoTjb1II8bGiyiTIad4HlIGaMNFE5BeKdosQbhOuXI1jaVS3RyPCLhft
        Wf+EI4dlqrRjaWadvXHWG+zTbFyXVGM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-eGmSgCYINPazHNQQQlb5Ag-1; Fri, 11 Oct 2019 11:26:17 -0400
Received: by mail-qk1-f200.google.com with SMTP id z128so9249385qke.8
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 08:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eafnjM529pN7ytDsYuN9GhEVboOCnNDOd+7f++5XrSw=;
        b=e+447PB4rGcK8RDLWyBlAiH7+yK7AR4AqSw6Dz04TAjCALny64jWf+Xy1kJUMiqdeg
         HTG5XG3PeF0l3aw3SEcuhuhvpfoOqjayZdQAqcpgMHbgsmPe/Y4lLGQ0vqbiTqhqtJ60
         cfwKnD7gJGtb3T9gURE7crpx0jB8f6D7srpcQZ1UuTJnUpMmL0BtUwTT/+eC+/PM/5Yy
         BL//23JSdoh6y3XJ5zoe3+Vv4zvdvqrGh0SL5QDT4sZyb2T8A3m7GCSHUr6Lj0I7kQi3
         cOy0tti7J/q34xn3C0tJPwoDkAz8QzqRvyHTu9S2Ql8Jiaiuq77QjIp2LLADkySVlbMJ
         gpTw==
X-Gm-Message-State: APjAAAUIPDo9gYYJaQJ5F2K/oPB0r2CCbt7yF3tQLsFalby6HQVSN+6L
        A5xITFNtaZ/16jEQtIRn/HKSI9zivRtKD+LStar15VuOh4d5ikdGpC1swopCJI8yjT/KzmZtBlp
        qJjQxciBic4NLWsW3OMOEb2HIn0+wMfpJi2z8/Pw=
X-Received: by 2002:ac8:550d:: with SMTP id j13mr17291387qtq.260.1570807577212;
        Fri, 11 Oct 2019 08:26:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwihUT7ZaSBXE6LG6Mw9e0mezUZBFwyFWl/NYeOO+TbjFoJkmo9MEWVn+fn/yd1iuBIM3qcM1cLiK80d2mFMlc=
X-Received: by 2002:ac8:550d:: with SMTP id j13mr17291356qtq.260.1570807576936;
 Fri, 11 Oct 2019 08:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191001070845.9720-1-kai.heng.feng@canonical.com>
In-Reply-To: <20191001070845.9720-1-kai.heng.feng@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 17:26:05 +0200
Message-ID: <CAO-hwJJ_hjL8=D+BDTW6LQRhd86NawORuY-jnDF71mD88woiDw@mail.gmail.com>
Subject: Re: [PATCH] Revert "Input: elantech - enable SMBus on new (2018+) systems"
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
X-MC-Unique: eGmSgCYINPazHNQQQlb5Ag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kai-Heng,

On Tue, Oct 1, 2019 at 9:09 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> This reverts commit 883a2a80f79ca5c0c105605fafabd1f3df99b34c.
>
> Apparently use dmi_get_bios_year() as manufacturing date isn't accurate
> and this breaks older laptops with new BIOS update.
>
> So let's revert this patch.
>
> There are still new HP laptops still need to use SMBus to support all
> features, but it'll be enabled via a whitelist.
>

You might want to add here:
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D204771

> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Oops, seems like you are missing my acked by:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Also, don't we want to send this one to stable as well? I can't
remember if we reverted it in all the released kernels.

Cheers,
Benjamin

> ---
>  drivers/input/mouse/elantech.c | 55 ++++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantec=
h.c
> index 04fe43440a3c..2d8434b7b623 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1827,31 +1827,6 @@ static int elantech_create_smbus(struct psmouse *p=
smouse,
>                                   leave_breadcrumbs);
>  }
>
> -static bool elantech_use_host_notify(struct psmouse *psmouse,
> -                                    struct elantech_device_info *info)
> -{
> -       if (ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version))
> -               return true;
> -
> -       switch (info->bus) {
> -       case ETP_BUS_PS2_ONLY:
> -               /* expected case */
> -               break;
> -       case ETP_BUS_SMB_HST_NTFY_ONLY:
> -       case ETP_BUS_PS2_SMB_HST_NTFY:
> -               /* SMbus implementation is stable since 2018 */
> -               if (dmi_get_bios_year() >=3D 2018)
> -                       return true;
> -               /* fall through */
> -       default:
> -               psmouse_dbg(psmouse,
> -                           "Ignoring SMBus bus provider %d\n", info->bus=
);
> -               break;
> -       }
> -
> -       return false;
> -}
> -
>  /**
>   * elantech_setup_smbus - called once the PS/2 devices are enumerated
>   * and decides to instantiate a SMBus InterTouch device.
> @@ -1871,7 +1846,7 @@ static int elantech_setup_smbus(struct psmouse *psm=
ouse,
>                  * i2c_blacklist_pnp_ids.
>                  * Old ICs are up to the user to decide.
>                  */
> -               if (!elantech_use_host_notify(psmouse, info) ||
> +               if (!ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version) ||
>                     psmouse_matches_pnp_id(psmouse, i2c_blacklist_pnp_ids=
))
>                         return -ENXIO;
>         }
> @@ -1891,6 +1866,34 @@ static int elantech_setup_smbus(struct psmouse *ps=
mouse,
>         return 0;
>  }
>
> +static bool elantech_use_host_notify(struct psmouse *psmouse,
> +                                    struct elantech_device_info *info)
> +{
> +       if (ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version))
> +               return true;
> +
> +       switch (info->bus) {
> +       case ETP_BUS_PS2_ONLY:
> +               /* expected case */
> +               break;
> +       case ETP_BUS_SMB_ALERT_ONLY:
> +               /* fall-through  */
> +       case ETP_BUS_PS2_SMB_ALERT:
> +               psmouse_dbg(psmouse, "Ignoring SMBus provider through ale=
rt protocol.\n");
> +               break;
> +       case ETP_BUS_SMB_HST_NTFY_ONLY:
> +               /* fall-through  */
> +       case ETP_BUS_PS2_SMB_HST_NTFY:
> +               return true;
> +       default:
> +               psmouse_dbg(psmouse,
> +                           "Ignoring SMBus bus provider %d.\n",
> +                           info->bus);
> +       }
> +
> +       return false;
> +}
> +
>  int elantech_init_smbus(struct psmouse *psmouse)
>  {
>         struct elantech_device_info info;
> --
> 2.17.1
>

