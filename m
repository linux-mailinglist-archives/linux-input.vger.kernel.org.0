Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF266E0FAF
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 16:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjDMOJD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 10:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjDMOJC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 10:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115BDE49
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681394867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z8S/3z50KeDlr3nmdDJrToXPuWy9ec9cnJcuoMpqve8=;
        b=L/73SuqbTzvV5Uat0GcXu3ULx7ZeYdlYteHPK7Qwgudt+EdDsbB+sC8hNsBfPeEkOJ5AU/
        oYdHcYGLBTz5snUhQbEjlLgbwCoxaS/QwaywJ1P9cnu4GwKZwoZKdq7GaPI6ihUU5bijGz
        9Eujn1RUgurZaUzwyUj3FGROFoQTghU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-m6o62jMBMji9dTn1dH30-g-1; Thu, 13 Apr 2023 10:07:45 -0400
X-MC-Unique: m6o62jMBMji9dTn1dH30-g-1
Received: by mail-yb1-f198.google.com with SMTP id c67-20020a254e46000000b00b88f1fd158fso31367285ybb.17
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 07:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681394865; x=1683986865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8S/3z50KeDlr3nmdDJrToXPuWy9ec9cnJcuoMpqve8=;
        b=ZnUsmwznZ3P1eV2Fw2j/kxR+AS9SpyXMYYTAOqLeP/x4kTAxyIZudJx8vO3R4dfvNy
         +wEjUZQtVrKvRfHHXcuBG4RKdtygG5pTIZKOShCu/n09z/KqtrQd8QP9fxPMBjGy3CrZ
         tOwIgy68rYXxprpDPrS+x+ZWahPSlSr45CPxzHIyht6ZxD90GyJ/VyfCtZ/rxCCuIGDE
         5kzBIEKu5eMU4AtrQsEIf1Le5KH/7+6R/jUmKQ5c6I3VFXREwzLDd7TnN02zphMulavE
         Q/9K/UVzknLudjqCOuWMiJUq3SbTvzWoP9zd+VbHVS+9yhWkcAFN07/BEtn3l1NJZoBw
         5/JA==
X-Gm-Message-State: AAQBX9cpGXnkUKlvFsD/rWnoZ2CRelNT2/A0Wl6ACZsqcUaGh/qj2sAO
        2un/eBDUVfAhPq/nloviEHivBSkw60ydoahjMGAMk5X42HZnxe+VTD/TbMt1HMAEmUM+OyTW5L1
        j3fEt8z8C78xY/8NHGp8hCNCLhycvP0uiaWl5mwA=
X-Received: by 2002:a25:8e11:0:b0:b8f:329c:1cfb with SMTP id p17-20020a258e11000000b00b8f329c1cfbmr4529262ybl.6.1681394865324;
        Thu, 13 Apr 2023 07:07:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350YZLt1UD/SmeKNh96vjD2i8HUFPbfPTPfZ55lN/e+SUQYJDn/Mt0CiSUic4DPuJznQ3ZObv0lu8vVAKeID9pCU=
X-Received: by 2002:a25:8e11:0:b0:b8f:329c:1cfb with SMTP id
 p17-20020a258e11000000b00b8f329c1cfbmr4529250ybl.6.1681394865064; Thu, 13 Apr
 2023 07:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230413093625.71146-1-hdegoede@redhat.com> <20230413140148.3cqpylpfwpna5vj5@mail.corp.redhat.com>
 <714731d2-de10-8db1-f271-a2a68cb55910@redhat.com>
In-Reply-To: <714731d2-de10-8db1-f271-a2a68cb55910@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 13 Apr 2023 16:07:34 +0200
Message-ID: <CAO-hwJKtNW9-PN-o2=VQ2QfhSFkkv70T2Vg70Kk8LdNgJcxCfw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 13, 2023 at 4:03=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi,
>
> On 4/13/23 16:01, Benjamin Tissoires wrote:
> > On Apr 13 2023, Hans de Goede wrote:
> >> Hi Benjamin,
> >>
> >> Here is a v2 of my series to allow using i2c-hid-of on non OF platform=
s
> >> to allow I2C-HID devices which are not enumerated by ACPI to work on A=
CPI
> >> platforms (by manual i2c_client instantiation using i2c_client_id matc=
hing).
> >>
> >> Changes in v2:
> >> - As discussed Drop the patches to consolidate all the i2c-hid-of*
> >>   drivers into one
> >> - Add a comment to the "post-reset-deassert-delay-ms" property reading=
,
> >>   that it is a kernel internal (non public) property used between x86
> >>   platform code and the i2c-hid driver.
> >
> > The series is:
> > Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> Thank you.
>
> > I'd rather have at least Doug test this one before we merge it, but I'l=
l
> > be out next week, so you'll have to rely on Jiri to merge it (or wait
> > for one week).
>
> Since Doug's devices use the separate specialized drivers and this series
> now only touches the generic i2c-hid-of driver I don't think Doug can tes=
t
> this, or am I missing something ?

Ooh, sorry for the confusion. I thought we were having:
i2c-hid-of-elan -> i2c-hid-of -> i2c-hid-core
When actually, i2c-hid-of-elan is only talking to i2c-hid-core.

This is why I wanted i2c-hid-of-elan/goodix to override the property
in their probe and then forward the payload to i2c-hid-of...

I guess we can take this series right away then

Cheers,
Benjamin

>
> Regards,
>
> Hans
>
>
>
>
>
> >> Hans de Goede (3):
> >>   HID: i2c-hid-of: Consistenly use dev local variable in probe()
> >>   HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
> >>   HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of
> >>
> >>  drivers/hid/i2c-hid/Kconfig      |  6 +++--
> >>  drivers/hid/i2c-hid/i2c-hid-of.c | 38 ++++++++++++++++++++++++-------=
-
> >>  2 files changed, 33 insertions(+), 11 deletions(-)
> >>
> >> --
> >> 2.39.1
> >>
> >
>

