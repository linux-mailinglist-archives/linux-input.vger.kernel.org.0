Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 352BDCCA18
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2019 15:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfJENU6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 09:20:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57203 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727980AbfJENU6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Oct 2019 09:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570281656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v19mNPkRJ9AE8uxKqZArmEnab1FDl/k/mlgPV+xCOYk=;
        b=hyBLQrFFqmwtbH/IRuBCHVGg7KNCVBODiXxPpTkNaYxCH+FG7GQ0NhsTFzW9xux/wmtqjk
        WjzP/CX+ql7JRttuPOFChueuuplGopMYdKN9Nay6Cs2KXrHu4cu3X6FEkZZQmCHcm5A5hl
        scAcgtGrOwfXqB55f6UH8nnzp8cq4Lk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-20iJxfD5MKKJr3WaaScUJA-1; Sat, 05 Oct 2019 09:20:54 -0400
Received: by mail-wr1-f70.google.com with SMTP id m14so4173064wru.17
        for <linux-input@vger.kernel.org>; Sat, 05 Oct 2019 06:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UJR8lqM5VkVKo9oBw0pEtSAy8UtflGegNgDHZMNB8ts=;
        b=t+S2n+iS96pRkAg4AQur/vhDqNtWsIpDSATqA6rEQ7gglYm8sal/NZoL7we2w1USK7
         1RMw922nYzXnFdEiEnhRQJ4ORR7BxiDp2sSKsBaYmS3h60qS9z5TUCrFutSPa39TwtpJ
         iyBW52MFdc43gZyAVvFJk0KmJTtc8SrgoW+vCeEIsHRi+OMom1xTpqzU61RZKtoSFRFs
         JzWpL9ZWADx5HlWUrdAX3ivISHaxaWpJmKudWhRdFvXfWFH7RzmfKp7VMYxt8Jy1eC3t
         ecxfW5r/fwM1qW73dPx2iZg5d9n8cpI40gHKHv4Egl6UjNAzySFMbES8It4rbVfF6J2+
         X45A==
X-Gm-Message-State: APjAAAXf+POB/NRObloj28XZyrJP4YZlILKzT23URblg9FvV7cY8FqPB
        22HOWU+Ecuo7fOMsjiG5K61Ii1Rgcc+dFp3BebRr9uUxOzoRBqtxpBAWnEAMEjRXmedg46+pI12
        YckzuJaV+uuljQM3vRgZmVRc=
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr4788403wrv.124.1570281653248;
        Sat, 05 Oct 2019 06:20:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlNkl7ZfSWs+3sYpNvrdOU/jVesoaEKe1ah1PinI5JHbJVH7S7suZLVlWiKs/ptZNLlvmhbA==
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr4788390wrv.124.1570281653007;
        Sat, 05 Oct 2019 06:20:53 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id y14sm15566463wrd.84.2019.10.05.06.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 06:20:52 -0700 (PDT)
Subject: Re: [PATCH 5.4 regression fix] Input: soc_button_array - partial
 revert of support for newer surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191005105551.353273-1-hdegoede@redhat.com>
 <222c364a-bc2b-5960-3fe4-7d1ce222e3e2@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <96cea5be-d285-8323-1ab2-9c8e87993165@redhat.com>
Date:   Sat, 5 Oct 2019 15:20:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <222c364a-bc2b-5960-3fe4-7d1ce222e3e2@gmail.com>
Content-Language: en-US
X-MC-Unique: 20iJxfD5MKKJr3WaaScUJA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 05-10-2019 14:17, Maximilian Luz wrote:
> Hi,
>=20
> sorry for the inconvenience this change has caused.
>=20
> On 10/5/19 12:55 PM, Hans de Goede wrote:
>> Note ideally this seamingly unrelated change would have been made in a
>> separate commit, with a message explaining the what and why of this
>> change.
>=20
> Would I have known the impact, then yes. This change was added due to
> some reported instances where it seems that soc_button_array would
> occasionally load on MSHW0040 before the GPIO controller was ready,
> causing power and volume buttons to not work.
>=20
>> I guess this change may have been added to deal with -EPROBE_DEFER error=
s,
>=20
> Correct. After a comment mentioned that gpiod_get() returning
> -EPROBE_DEFER would be the proper way to detect this, I decided on this
> change.

Ok, on x86 the GPIO drivers really should all be builtin because
various ACPI methods including device D0 / D3 (power-on/off) methods
may depend on them. So normally this should never happen.

If this (-EPROBE_DEFER on surface devices) somehow still is happening
please let me know and we will figure something out.

> Might I suggest the following addition:
>=20
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

S-o-b is only for patches which pass through your hands, e.g. if
you make changes to my patch and submit a v2 of it.

I guess you mean / want one of:

Acked-by: ...

or

Reviewed-by: ...


?

Regards,

Hans



> ---
>  =C2=A0drivers/input/misc/soc_button_array.c | 25 ++++++++++++++++++++---=
--
>  =C2=A01 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/s=
oc_button_array.c
> index 97e3639e99d0..a0f0c977b790 100644
> --- a/drivers/input/misc/soc_button_array.c
> +++ b/drivers/input/misc/soc_button_array.c
> @@ -92,11 +92,18 @@ soc_button_device_create(struct platform_device *pdev=
,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 continue;
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio =3D soc_button_loo=
kup_gpio(&pdev->dev, info->acpi_index);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gpio < 0 && gpio !=3D -EN=
OENT) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error=
 =3D gpio;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto =
err_free_mem;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (!gpio_is_valid(gpi=
o)) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Sk=
ip GPIO if not present */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!gpio_is_valid(gpio)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * Skip GPIO if not present. Note we deliberately
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * ignore -EPROBE_DEFER errors here. On some devices
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * Intel is using so called virtual GPIOs which are not
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * GPIOs at all but some way for AML code to check some
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * random status bits without need a custom opregion.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * In some cases the resources table we parse points to
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * such a virtual GPIO, since these are not real GPIOs
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * we do not have a driver for these so they will never
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 * show up, therefor we ignore -EPROBE_DEFER.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 continue;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> @@ -429,6 +436,14 @@ static int soc_device_check_MSHW0040(struct device *=
dev)
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "OEM Platform Revision %llu\n", oe=
m_platform_rev);
>=20
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Explicitly check if GPIO controller is ready.=
 This check is done here
> +=C2=A0=C2=A0=C2=A0=C2=A0 * to avoid issues with virtual GPIOs on other c=
hips, as elaborated above.
> +=C2=A0=C2=A0=C2=A0=C2=A0 * We are at least expecting one GPIO pin for th=
e power button (index 0).
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 if (soc_button_lookup_gpio(dev, 0) =3D=3D -EPROBE_DEF=
ER)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EPROBE_DEFER;
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>  =C2=A0}
>=20

