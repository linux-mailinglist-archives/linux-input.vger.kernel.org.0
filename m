Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9363329EE66
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 15:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgJ2OhC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 10:37:02 -0400
Received: from mail-03.mail-europe.com ([91.134.188.129]:39864 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgJ2OhB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 10:37:01 -0400
Date:   Thu, 29 Oct 2020 14:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1603982218;
        bh=kXRaeNvaCmQH2VeUBzDabkr/fRY1SIHCsnhlrezOIP4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=xMcf3HkfGEjU8Xvf7JJCjEXO0w1zUcqbBYZRaJVfJn6oMKF4vUSUc6ldi50W4twFA
         cjjIHv0FZApDZ2G/XZi2+/qfp3pESK89HwC6U13UwL3qTOCWy/FXk1QaqMSpfk8SXf
         jBUk3injLDg4q0qLeoYQqucX8YkSKzUhDL/1xLyg=
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "hj2.im@samsung.com" <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        Jungrae Kim <jryu.kim@samsung.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2] input: add 2 kind of switch
Message-ID: <Y8lswhvitTRIuUmvccVHbI2zTCGbh44XnkszUcl2qG2mT93vWVcnovbN8UsBOnXkE-gnRB6jLLnOaNWLgf8B9Pn6R2uGgv7pV-vqj4RdiUk=@protonmail.com>
In-Reply-To: <20201029135415.GA3470996@kroah.com>
References: <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8> <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8> <j4-zngLfuvM3x15SD8ezJ__FTdOdLCudaTGBvuotwzYwnYFusBe655vH3UahNgtBzB8n6VpfoV7iS1tPXvv-0R8T7-RsvMDxnTZ-Zo-xs4o=@protonmail.com> <20201029135415.GA3470996@kroah.com>
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
> > > diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devi=
cetable.h
> > > index 5b08a473cdba..897f5a3e7721 100644
> > > --- a/include/linux/mod_devicetable.h
> > > +++ b/include/linux/mod_devicetable.h
> > > @@ -320,7 +320,7 @@ struct pcmcia_device_id {
> > >  #define INPUT_DEVICE_ID_LED_MAX=09=090x0f
> > >  #define INPUT_DEVICE_ID_SND_MAX=09=090x07
> > >  #define INPUT_DEVICE_ID_FF_MAX=09=090x7f
> > > -#define INPUT_DEVICE_ID_SW_MAX=09=090x10
> > > +#define INPUT_DEVICE_ID_SW_MAX=09=090x12
> > >  #define INPUT_DEVICE_ID_PROP_MAX=090x1f
> > >
> > >  #define INPUT_DEVICE_ID_MATCH_BUS=091
> > > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/li=
nux/input-event-codes.h
> > > index 0c2e27d28e0a..8ca2acee1f92 100644
> > > --- a/include/uapi/linux/input-event-codes.h
> > > +++ b/include/uapi/linux/input-event-codes.h
> > > @@ -889,7 +889,9 @@
> > >  #define SW_MUTE_DEVICE=09=090x0e  /* set =3D device disabled */
> > >  #define SW_PEN_INSERTED=09=090x0f  /* set =3D pen inserted */
> > >  #define SW_MACHINE_COVER=090x10  /* set =3D cover closed */
> > > -#define SW_MAX=09=09=090x10
> > > +#define SW_COVER_ATTACHED=090x11  /* set =3D cover attached */
> > > +#define SW_EXT_PEN_ATTACHED=090x12  /* set =3D external pen attached=
 */
> > > +#define SW_MAX=09=09=090x12
> > >  #define SW_CNT=09=09=09(SW_MAX+1)
> > > [...]
> >
> > This part of the patch conflicts with another one:
> > https://lore.kernel.org/linux-input/20201026144512.621479-1-markpearson=
@lenovo.com/
>
> Is that merged?  If not, it's fine as-is until then, and someone has to
> pick to go first :)

It is not, to my knowledge. Nonetheless I figured the information may be re=
levant.


Regards,
Barnab=C3=A1s P=C5=91cze
