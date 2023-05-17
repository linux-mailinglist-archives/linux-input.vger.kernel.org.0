Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82BC2706EB3
	for <lists+linux-input@lfdr.de>; Wed, 17 May 2023 18:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjEQQwD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 May 2023 12:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjEQQvr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 May 2023 12:51:47 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3798F93E8
        for <linux-input@vger.kernel.org>; Wed, 17 May 2023 09:51:24 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f41dceb93bso7287775e9.1
        for <linux-input@vger.kernel.org>; Wed, 17 May 2023 09:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684342283; x=1686934283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEHRwckbXh0gQNMkqMbHW38Yr2bdv6JqSqYWXUGnd5c=;
        b=L+x1h0P7HkQPidftBNge9HezLSHAZX0rRayo8r4j4EjJln4zciAZmtG67ahnB35+9/
         JJ9UmSiAt5xBaIDh2nGYguy8ineOfCQxUUv6tnsfjxRinhNQA/8d9MFChTswWO2gTwZW
         maaA9UyYFpVyCwNMhjFqlv4ZXlwGMsGDRg83NCmB7dMmtrQamjFMuAlslYGokjrYgYSd
         K2LBBJqgkn4+iBs3UOSp0UdB3E+mlsyKmFj7/gnUhCtihTIgo9LWXdH9hfl6uOHnqw1f
         /FRxsGViDjvAVDb1cmZe+PdK8Sr2fNXUsrJONo4uhQVB4TOqQNLbF50M8jYsUBwNrc7t
         mqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684342283; x=1686934283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEHRwckbXh0gQNMkqMbHW38Yr2bdv6JqSqYWXUGnd5c=;
        b=bUC/p3Qth0HWdtpbHq4xDFK/hSJTz6T0/2HP71HbeSOrT2uPuw6FQVgcq/qrkIzfCe
         0tAN4FGJHSzo3PhzZiZ7zWDs7jeUMpVYmhrZa2621MWdte7VCVfwObmwJibuuqYFe/y5
         9rfAhJBY8SKlrNf5veDeq/oNj2gcIKKnNkaPO3+eq8U5AoUSpQ811P5dL5ta1GYOvCio
         /fZnD/7bWe0P0QwV/IsQTZOwDnaYRE9E0jivfQx1QsW6sufQ3Jo0ecIg4oEFuRZ70msp
         qmrPVixhItlndDg7DKwlp3Ec0KlhULT9wYUPAnYtigb0p2/gnk7ozCq19t8qZ4BGQgbw
         0/BA==
X-Gm-Message-State: AC+VfDwZ5iPHCPbUsb/cgsVs6yM8Z0x/yOB024D0o+I+AgzutjUVrLta
        Sk/dKzMcDvDZHSHopExDhJORFB8+NFhG8cuGQUQ=
X-Google-Smtp-Source: ACHHUZ4yjvc1h2GyY6I8qfjGjx6FYI2gtUMHTqoWupw9XWl2t/ikSy69rx/t10komInf9QFWrVSIEYu4O6vk4BUSI3c=
X-Received: by 2002:a1c:7315:0:b0:3f1:bb10:c865 with SMTP id
 d21-20020a1c7315000000b003f1bb10c865mr27739565wmb.38.1684342282946; Wed, 17
 May 2023 09:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230414182210.383218-1-jason.gerecke@wacom.com> <20230504043442.GB1129520@quokka>
In-Reply-To: <20230504043442.GB1129520@quokka>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Wed, 17 May 2023 09:51:11 -0700
Message-ID: <CANRwn3R276BWscVgx+Y9Y7_JEt2AWxLccsmAmi2D7kN53Q5PVw@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Check for string overflow from strscpy calls
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@joshua-dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 3, 2023 at 9:34=E2=80=AFPM Peter Hutterer <peter.hutterer@who-t=
.net> wrote:
>
> On Fri, Apr 14, 2023 at 11:22:10AM -0700, Jason Gerecke wrote:
> > From: Jason Gerecke <killertofu@gmail.com>
> >
> > The strscpy function is able to return an error code when a copy would
> > overflow the size of the destination. The copy is stopped and the buffe=
r
> > terminated before overflow actually occurs so it is safe to continue
> > execution, but we should still produce a warning should this occur.
> >
> > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
>
> Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
>
> Cheers,
>   Peter
>

Sending another request for follow-up.

Jason

> > ---
> >  drivers/hid/wacom_sys.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> > index 8214896adadad..7192970d199a0 100644
> > --- a/drivers/hid/wacom_sys.c
> > +++ b/drivers/hid/wacom_sys.c
> > @@ -2224,7 +2224,9 @@ static void wacom_update_name(struct wacom *wacom=
, const char *suffix)
> >               } else if (strstr(product_name, "Wacom") ||
> >                          strstr(product_name, "wacom") ||
> >                          strstr(product_name, "WACOM")) {
> > -                     strscpy(name, product_name, sizeof(name));
> > +                     if (strscpy(name, product_name, sizeof(name)) < 0=
) {
> > +                             hid_warn(wacom->hdev, "String overflow wh=
ile assembling device name");
> > +                     }
> >               } else {
> >                       snprintf(name, sizeof(name), "Wacom %s", product_=
name);
> >               }
> > @@ -2242,7 +2244,9 @@ static void wacom_update_name(struct wacom *wacom=
, const char *suffix)
> >               if (name[strlen(name)-1] =3D=3D ' ')
> >                       name[strlen(name)-1] =3D '\0';
> >       } else {
> > -             strscpy(name, features->name, sizeof(name));
> > +             if (strscpy(name, features->name, sizeof(name)) < 0) {
> > +                     hid_warn(wacom->hdev, "String overflow while asse=
mbling device name");
> > +             }
> >       }
> >
> >       snprintf(wacom_wac->name, sizeof(wacom_wac->name), "%s%s",
> > @@ -2500,8 +2504,10 @@ static void wacom_wireless_work(struct work_stru=
ct *work)
> >                               goto fail;
> >               }
> >
> > -             strscpy(wacom_wac->name, wacom_wac1->name,
> > -                     sizeof(wacom_wac->name));
> > +             if (strscpy(wacom_wac->name, wacom_wac1->name,
> > +                     sizeof(wacom_wac->name)) < 0) {
> > +                     hid_warn(wacom->hdev, "String overflow while asse=
mbling device name");
> > +             }
> >       }
> >
> >       return;
> > --
> > 2.40.0
> >
