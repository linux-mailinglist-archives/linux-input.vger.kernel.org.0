Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3D229ED3D
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 14:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgJ2Nmi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 09:42:38 -0400
Received: from mail-03.mail-europe.com ([91.134.188.129]:38074 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbgJ2Nmf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 09:42:35 -0400
Date:   Thu, 29 Oct 2020 13:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1603978920;
        bh=NRjt3oyVql1aETw3JurQIeYqGdg12DIrD4j2L8YgllM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=M2+MjBGXipaoJ4nt1LdgocUrR4x5WGYmH9ASlTHje7Xf5aCPTfk3Fhpx1c3kQcfUs
         SWo4WtLxp/GtX/cnai+Acap4pb+exM7C+L2ihTnrnL2tL4+VZznYyBZ3kJWCieTzY2
         hHAX++XcTIJ2ONxoQ1ZmpYmXgRk8+cXYyT83i9+E=
To:     "hj2.im@samsung.com" <hj2.im@samsung.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        Jungrae Kim <jryu.kim@samsung.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2] input: add 2 kind of switch
Message-ID: <j4-zngLfuvM3x15SD8ezJ__FTdOdLCudaTGBvuotwzYwnYFusBe655vH3UahNgtBzB8n6VpfoV7iS1tPXvv-0R8T7-RsvMDxnTZ-Zo-xs4o=@protonmail.com>
In-Reply-To: <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
References: <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8> <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

> [...]
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_deviceta=
ble.h
> index 5b08a473cdba..897f5a3e7721 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -320,7 +320,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX=09=090x0f
>  #define INPUT_DEVICE_ID_SND_MAX=09=090x07
>  #define INPUT_DEVICE_ID_FF_MAX=09=090x7f
> -#define INPUT_DEVICE_ID_SW_MAX=09=090x10
> +#define INPUT_DEVICE_ID_SW_MAX=09=090x12
>  #define INPUT_DEVICE_ID_PROP_MAX=090x1f
>
>  #define INPUT_DEVICE_ID_MATCH_BUS=091
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/=
input-event-codes.h
> index 0c2e27d28e0a..8ca2acee1f92 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -889,7 +889,9 @@
>  #define SW_MUTE_DEVICE=09=090x0e  /* set =3D device disabled */
>  #define SW_PEN_INSERTED=09=090x0f  /* set =3D pen inserted */
>  #define SW_MACHINE_COVER=090x10  /* set =3D cover closed */
> -#define SW_MAX=09=09=090x10
> +#define SW_COVER_ATTACHED=090x11  /* set =3D cover attached */
> +#define SW_EXT_PEN_ATTACHED=090x12  /* set =3D external pen attached */
> +#define SW_MAX=09=09=090x12
>  #define SW_CNT=09=09=09(SW_MAX+1)
> [...]

This part of the patch conflicts with another one:
https://lore.kernel.org/linux-input/20201026144512.621479-1-markpearson@len=
ovo.com/


Regards,
Barnab=C3=A1s P=C5=91cze
