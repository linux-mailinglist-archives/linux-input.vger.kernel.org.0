Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B285C6BBF39
	for <lists+linux-input@lfdr.de>; Wed, 15 Mar 2023 22:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjCOVjZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Mar 2023 17:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbjCOVjX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Mar 2023 17:39:23 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E0B22DDC
        for <linux-input@vger.kernel.org>; Wed, 15 Mar 2023 14:39:17 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x17so9910069lfu.5
        for <linux-input@vger.kernel.org>; Wed, 15 Mar 2023 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678916356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xpb1J1NQ6EcmoUdHknfKnhbMa93N3wEHpyW+bdyQONg=;
        b=LbnrbqYotsDEftqvLOrYJFCfLK5i4oqISnGrGn6agxzw8/YnPyrS2vxPYqM+1z/vQF
         wINDblmUBDxiKsig19Csd5SheO95lETJnskgZFHG0aI8waJ6sg7tXZrgjMo9S6s1gXg8
         hOEJ6A7EDOSdDDFObXNkYXRcynmHJTDjemnMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678916356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xpb1J1NQ6EcmoUdHknfKnhbMa93N3wEHpyW+bdyQONg=;
        b=4cdzz8hNdYlOfPv/qdAFFjBO2SuzNZf5JuVZpisukPdOH5R7A9AtuR+SD+j9cL9Au0
         yjmNrOx9gGVLM4/DFdfgc0bNimNKPVrF42sba9XVGFF2jHdNuQchq7t6XRr3OuH8/tw1
         8WGh10r/HnbSkEtmfLaD3EqGL93tLgLmgEEh1TgNcNL30Kt86yEoslG2faQHwl128+z0
         09ncPSdV/Zna4Sz0Pv0eSZJt7ux6Hw8DRKzL/kqiJEwt016Jvg8dA6kDqHAmWV1wvf9B
         pZSOhLOCqPvhjZbBHQLrx7oju4tW4GH4XiPRb3A7KI2cgWHWOVWHg8AVRAvtYFtre2qJ
         HUBw==
X-Gm-Message-State: AO0yUKX2G3oGAUUQxVdOcpze5qJEPOPdXT5C/DwUo7BygTkWfEetW+1r
        U6ebxfWNOaHFl4BJnPTsZcX0K/+m21lKATpH1T2YTA==
X-Google-Smtp-Source: AK7set+mP/RuDHK+N/Y6H+PENikTQrRb0WwxcH0GLjHAjy6KeV/C6zmPe7FvsqJU2zV137xoXpWUGB+f3Rnz3qEEY7g=
X-Received: by 2002:ac2:4a65:0:b0:4db:1a8b:1b87 with SMTP id
 q5-20020ac24a65000000b004db1a8b1b87mr2468829lfp.8.1678916355956; Wed, 15 Mar
 2023 14:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230303152623.45859-1-jdenose@google.com> <e8f5e2aa-d7fa-88ff-6306-4c1ee8feeade@redhat.com>
In-Reply-To: <e8f5e2aa-d7fa-88ff-6306-4c1ee8feeade@redhat.com>
From:   Jonathan Denose <jdenose@chromium.org>
Date:   Wed, 15 Mar 2023 16:39:04 -0500
Message-ID: <CALNJtpWsvZEdGJFA30cv0cSq43Djm7q+trDQVxx5aRDzg7u3Gw@mail.gmail.com>
Subject: Re: [PATCH] Input: i8042 - Add quirk for Fujitsu Lifebook A574/H
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jonathan Denose <jdenose@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Takashi Iwai <tiwai@suse.de>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Hans,

Thank you very much for your review.

For my knowledge, what is the timeline for patches in the input
mailing list getting applied to a maintainer branch after review?

Best,
Jonathan

On Mon, Mar 6, 2023 at 5:00=E2=80=AFAM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi,
>
> On 3/3/23 16:26, Jonathan Denose wrote:
> > Fujitsu Lifebook A574/H requires the nomux option to properly
> > probe the touchpad, especially when waking from sleep.
> >
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans
>
>
> > ---
> >
> >  drivers/input/serio/i8042-acpipnpio.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/seri=
o/i8042-acpipnpio.h
> > index efc61736099b..fe7ffe30997c 100644
> > --- a/drivers/input/serio/i8042-acpipnpio.h
> > +++ b/drivers/input/serio/i8042-acpipnpio.h
> > @@ -610,6 +610,14 @@ static const struct dmi_system_id i8042_dmi_quirk_=
table[] __initconst =3D {
> >               },
> >               .driver_data =3D (void *)(SERIO_QUIRK_NOMUX)
> >       },
> > +     {
> > +             /* Fujitsu Lifebook A574/H */
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "FMVA0501PZ"),
> > +             },
> > +             .driver_data =3D (void *)(SERIO_QUIRK_NOMUX)
> > +     },
> >       {
> >               /* Gigabyte M912 */
> >               .matches =3D {
>
