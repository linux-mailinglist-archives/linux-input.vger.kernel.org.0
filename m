Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6A25099DD
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 09:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386223AbiDUHy4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 03:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386232AbiDUHyv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 03:54:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CF26ADFB3
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 00:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650527518;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vcDMc/v6G1RUr7soEl1v7NFepVRNt7oskkNmS8zGYGw=;
        b=gH66sATdQwt3WqmRZtESu7gkelWtTzkc8cr9UufB9IQiBwxHpRm7fP1LAzboA3B8NY4j5b
        GFliaC2EsaXXDmTWvG2VSsJUxx6IGATztFUPXXHcKrxdOPdpPQUP05T3tkBab6gduCcAxM
        v+bH0al3G42xEij/wCdjTXfBp2rTPBM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-r1wvsc5qNYmVjNaIT4yl9Q-1; Thu, 21 Apr 2022 03:51:57 -0400
X-MC-Unique: r1wvsc5qNYmVjNaIT4yl9Q-1
Received: by mail-pf1-f199.google.com with SMTP id x12-20020a62860c000000b0050ad0349021so1668216pfd.15
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 00:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vcDMc/v6G1RUr7soEl1v7NFepVRNt7oskkNmS8zGYGw=;
        b=RsVufEqJp7Citdd/my1daRLv3Ci7RtnZvpGWlLUJRbnSchBJgzFAxjrN4bj7Z+ikkO
         zN1EdzMkTe8rDEx7eLsmDcBqEmMSPpk+U0PBR0ZyOV5GD7TdVs2XFv8CrXieaPNZj6Xe
         3UJqSTy6+WAvoxBBn2VZfIxz/N3SMiv6PgPa9blJIAblocI0OW+hTj55jTZ6YG2jlSvr
         bcJ931H4Dr2s3cBHcLJpFb5o0BoWJwbhqlnacTeLrqTxYbXS3dt9EIkpargLS0TGuLhB
         d1NmXO9ddV60H3qQ5GL8CYN9ScARDZ9UbDSxMDdyUJm+OICdKo0MtPgvoSl8rM3i43sT
         kisg==
X-Gm-Message-State: AOAM530AKOpOUaLbOud3UNNaS3xrJpDndu8agat8hTWxZ3NH0bzsW1Eo
        Y04xcV4X/Wr0OKhMFG8kIJ/B6VcSHUDHOJlQ8V+2eml4E2SAcnro4dNRJdUZRe8mTlk9bGzsxeC
        9F/kaBHMfmkHBxln6eWzYXkwuLFNv3g8UUiwjtOo=
X-Received: by 2002:a63:6c0a:0:b0:398:6bd2:a16a with SMTP id h10-20020a636c0a000000b003986bd2a16amr23135205pgc.191.1650527516295;
        Thu, 21 Apr 2022 00:51:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo9FVIsB0fdHveGRRI2PdwfhUpSFuC7f7Z7zCLCHeOrOj6Bqu/sy4Fp110uUzv0jvy9kFTRpWOtgcYLnvztKM=
X-Received: by 2002:a63:6c0a:0:b0:398:6bd2:a16a with SMTP id
 h10-20020a636c0a000000b003986bd2a16amr23135188pgc.191.1650527516033; Thu, 21
 Apr 2022 00:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <17e7b7ad-1a5b-d813-888f-abea0aa099b1@semihalf.com> <nycvar.YFH.7.76.2204210945560.30217@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2204210945560.30217@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 21 Apr 2022 09:51:45 +0200
Message-ID: <CAO-hwJKa5t3zaM5a_uLAj3v=uDORAdUqnxUTszNTgQ2wFgXJyw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: multitouch: Add support for Google Whiskers Touchpad
To:     Jiri Kosina <jikos@kernel.org>
Cc:     =?UTF-8?Q?Marek_Ma=C5=9Blanka?= <mm@semihalf.com>,
        linux-input@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 21, 2022 at 9:46 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 5 Apr 2022, Marek Ma=C5=9Blanka wrote:
>
> > The Google Whiskers touchpad does not work properly with the default
> > multitouch configuration. Instead, use the same configuration as Google
> > Rose.
> >
> > Signed-off-by: Marek Maslanka <mm@semihalf.com>
> > ---
> >
> > Changes in v2:
> >   - As a HID device group use HID_GROUP_MULTITOUCH_WIN_8.
> >
> >  drivers/hid/hid-multitouch.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.=
c
> > index 99eabfb4145b..87a92f2654c0 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -2178,6 +2178,9 @@ static const struct hid_device_id mt_devices[] =
=3D {
> >       { .driver_data =3D MT_CLS_GOOGLE,
> >               HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOG=
LE,
> >                       USB_DEVICE_ID_GOOGLE_TOUCH_ROSE) },
> > +     { .driver_data =3D MT_CLS_GOOGLE,
> > +             HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
> > USB_VENDOR_ID_GOOGLE,
> > +                     USB_DEVICE_ID_GOOGLE_WHISKERS) },
>
> This device is already claimed by google-hammer driver though ... ?

See my answer at [0].

hid-google-hammer entry is using the group HID_GROUP_GENERIC, and here
we use HID_GROUP_MULTITOUCH_WIN_8, so the 2 are not stepping on each
other's toes.

FWIW:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

[0] https://lore.kernel.org/linux-input/CAO-hwJ+18Ce_A8F-QVp=3DTJj2iu60r=3D=
f4MkrktYbou-rkXsj+mA@mail.gmail.com/

>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

