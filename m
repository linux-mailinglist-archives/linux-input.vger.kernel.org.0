Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8102E7D91
	for <lists+linux-input@lfdr.de>; Thu, 31 Dec 2020 02:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgLaBJd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Dec 2020 20:09:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgLaBJc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Dec 2020 20:09:32 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D3CC061573
        for <linux-input@vger.kernel.org>; Wed, 30 Dec 2020 17:08:52 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id 4so8481575qvh.1
        for <linux-input@vger.kernel.org>; Wed, 30 Dec 2020 17:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e4O3KAGdLWo/UGZ9H4yzUaK/s8wkSygxrOMVsU22O8o=;
        b=LjKlQT9rtRlAtM6YHqRUobZFK2luiRBVcs9LlUWDIIKPsyREDZwp+Ygzu395n6pGTJ
         oyYyWM4l2a9TsnXQ3c5K8SCN6jPll1ZHUgCbGFnGG9SDPzinnLHcKntt5vl5B6WHdinC
         KW3ESzg3YL6deav8w7EX9MTPg9YyVjP6Hjk6BR70fbfG43jTwpm5xm6ri9zaSTV63iHV
         XnTjeR+lll1ecK84gASW7hp3i+AXLWuvOqt4a6hJANDvJ9XgvGMB3e0mhLBtbv2t/WcH
         fiSb3arhOqieghI0AavhTU+qPQaOBPKZ2lCF/uuzPXzSxiYGuJRONk30xie4R5oS5X82
         SOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e4O3KAGdLWo/UGZ9H4yzUaK/s8wkSygxrOMVsU22O8o=;
        b=e9sq/c8MkfUMm10CNpiN0xtOJTBv0co0ezDcpr33kleNuuaPLs3N7dFpHGXiP4RCaK
         068e04aPCvkYqkioXL4ngJbmijVisW8ILphNEbqR5Q0Y5LRlq9Z2BxJxVPFTU3wRWv6m
         lTfLj09f2c540HkEQM4VVgLyEosMLaCpCv4pPCC+qwGLfQlJAEd2313Gx3LJ0XXmTez4
         XbQY8xSft514ffnIf3vCrtVOK77F3TAOBp/ILYOFP3RjU84osxId2oK80ze4momF85S0
         JSkViBKfLczfBc6TsnV91HLBYDMXnqgwAvvvZOFK12dnGzlKAt9uTnOnTj4/itLDuZK8
         tiYg==
X-Gm-Message-State: AOAM5339o2wIkxcbqZOVEGjC68GGrmp5fdLB77smqi8xJIS/EC6ap8Ds
        SUDdzyHGmhn9lJluMsPZB+SRC1zI5S171cod0xKJJA==
X-Google-Smtp-Source: ABdhPJzXGO2UhjYEYae4E4i/TPKtRmyIx1h1ohsWvRjxpAlhb2Uy8MKPNdUu/sVhnodxYN559elLn2KB2hDk/20lMPs=
X-Received: by 2002:a0c:8c87:: with SMTP id p7mr59234186qvb.46.1609376931669;
 Wed, 30 Dec 2020 17:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-2-roderick@gaikai.com>
 <XaYh_eZH3W0b4TFT3b5KfG-OC2czmCiodqHnakwh-rTisgWKDt1X7iveFFHPExiktj5lRhIjqp41OjjB463SPTdXK6-zNrC-LCHD17ZwN1Y=@protonmail.com>
In-Reply-To: <XaYh_eZH3W0b4TFT3b5KfG-OC2czmCiodqHnakwh-rTisgWKDt1X7iveFFHPExiktj5lRhIjqp41OjjB463SPTdXK6-zNrC-LCHD17ZwN1Y=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Wed, 30 Dec 2020 17:08:41 -0800
Message-ID: <CANndSKkt6hnT8NGUWPhs0vDOTn_Ny_D9RRejfi0NuGrbVkC3Ow@mail.gmail.com>
Subject: Re: [PATCH 01/13] HID: playstation: initial DualSense USB support.
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Barnab=C3=A1s,

On Wed, Dec 30, 2020 at 4:08 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Hi
>
>
> 2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:
>
> > [...]
> > +static const struct hid_device_id ps_devices[] =3D {
> > +     { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTR=
OLLER),
> > +             .driver_data =3D 0 },
> > +};
> > [...]
>
> I have come across an AUR package [1], and looking at the modifications a=
pplied
> there (work-without-modifying-hid-quirks.patch), I think should be a term=
inating
> entry in this array. And maybe `MODULE_DEVICE_TABLE()` is also missing?
>
> [1]: https://aur.archlinux.org/packages/hid-playstation-dkms/
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze


Good catch, that's indeed missing. I wonder how I didn't stumble on
that (I used an unmodified kernel here and loaded it out of tree). In
any case I will add it and use it in revision 2.

Regards,
Roderick
