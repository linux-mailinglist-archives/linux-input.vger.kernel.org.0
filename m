Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6315738A65
	for <lists+linux-input@lfdr.de>; Wed, 21 Jun 2023 18:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbjFUQFH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jun 2023 12:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbjFUQFG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jun 2023 12:05:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D57B19F
        for <linux-input@vger.kernel.org>; Wed, 21 Jun 2023 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687363458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QmT3Gc0lW/ucUiaDWp2AxDA5W8tEtcDlIAyVVWyU4Hk=;
        b=iWa85H1BDNzrBVTaENlvN3ES0uKgZfj678KkxoLzbUGh7132HB3sVBXAQEWFBG8j6DBZo7
        NE1BTABUkf5luNhN+fsZAu+GXY5vv3Rq4rOIEF3c5cwz9bPDVgikB3tqSUMBunT/84YFrf
        l36IVNrYmRdkgKEJIypzGhKuCn2TowQ=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-8GWeoo_TPNy1txOBvxdEVQ-1; Wed, 21 Jun 2023 12:04:17 -0400
X-MC-Unique: 8GWeoo_TPNy1txOBvxdEVQ-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-bd476ef40e0so7894545276.1
        for <linux-input@vger.kernel.org>; Wed, 21 Jun 2023 09:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687363456; x=1689955456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmT3Gc0lW/ucUiaDWp2AxDA5W8tEtcDlIAyVVWyU4Hk=;
        b=ETv5LG6++M1iQzf/4sZOVOv//SYs8vdWu97ch9NE5shKfvMtqdgt1LJjnBcBMvRMnL
         ngUkPpUG+RO9bGECqf4QAvioH5fltVECgWPA/fDXscLiQ1g+93I6sSHJSNzqvJoSg20W
         4n7VXGSg3bVeUeMTzrXkeSZqJcnx6RxHkdTHYDRLU14rB9Ng1mS0NK2aPKswRCPm0GGk
         BB/Xtk7KDdz1o9pN6RK4Pb3sHAD4cU04YRpmPJgDicAlXqDNUCpYPWox6N3CbCCX4HsG
         L408T2SYCAg0GiQZr+WC5NXXBc4Oa+GvsUCiEESWTatnHxY0hMIOZt4xIVyyBZGjr/6e
         EV1g==
X-Gm-Message-State: AC+VfDzkmnjI/MwOEyOTL6EW9GO/OmozC/8QeeU5X4SZxMW9Pzky3HXA
        z6VHfuNahUIJC8VhLD8YyQaHgRCmQhJIXwENqLvsTZfqvDHKhEIWaiQlgEy9D1YrTHjQjS5YbOI
        DvYZhidi8elVB4TTlz1p74ijU//Ln1CR0hCUOsUU=
X-Received: by 2002:a05:6902:cd:b0:bd5:9d1e:7182 with SMTP id i13-20020a05690200cd00b00bd59d1e7182mr12128747ybs.8.1687363456516;
        Wed, 21 Jun 2023 09:04:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4kFwrrvmPXuFgNQH/CV48S0tndy+CEIheFsur0TrgAkaHEYIA3UQOJ56+HqPbjpaZnLwzdWC8X6uaAgsytr9M=
X-Received: by 2002:a05:6902:cd:b0:bd5:9d1e:7182 with SMTP id
 i13-20020a05690200cd00b00bd59d1e7182mr12128724ybs.8.1687363456267; Wed, 21
 Jun 2023 09:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230607214102.2113-1-jason.gerecke@wacom.com>
 <20230608213828.2108-1-jason.gerecke@wacom.com> <CANRwn3R-XbfB+mP9AQ-J7R_19jLi4eS3MhswaWjL+LCEih-7pg@mail.gmail.com>
In-Reply-To: <CANRwn3R-XbfB+mP9AQ-J7R_19jLi4eS3MhswaWjL+LCEih-7pg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 21 Jun 2023 18:04:05 +0200
Message-ID: <CAO-hwJJC12dRhmykE+P_LBcEJ2G0gHy3Nh1gvWULjdA=4qa-ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: wacom: Use ktime_t rather than int when dealing
 with timestamps
To:     Jason Gerecke <killertofu@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@joshua-dickens.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jason Gerecke <jason.gerecke@wacom.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 21, 2023 at 5:18=E2=80=AFPM Jason Gerecke <killertofu@gmail.com=
> wrote:
>
> Following up since no action seems to have been taken on this patch yet.

Sorry, this went through the cracks (I seem to have a lot of cracks recentl=
y...)

>
> On Thu, Jun 8, 2023 at 2:38=E2=80=AFPM Jason Gerecke <killertofu@gmail.co=
m> wrote:
> >
> > Code which interacts with timestamps needs to use the ktime_t type
> > returned by functions like ktime_get. The int type does not offer
> > enough space to store these values, and attempting to use it is a
> > recipe for problems. In this particular case, overflows would occur
> > when calculating/storing timestamps leading to incorrect values being
> > reported to userspace. In some cases these bad timestamps cause input
> > handling in userspace to appear hung.

I have to ask, is this something we should consider writing a test for? :)

Also, you are missing the rev-by from Peter, not sure if the tools
will pick it up automatically then.

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

> >
> > Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/901
> > Fixes: 17d793f3ed53 ("HID: wacom: insert timestamp to packed Bluetooth =
(BT) events")
> > CC: stable@vger.kernel.org
> > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > ---
> > v2: Use div_u64 to perform division to deal with ARC and ARM architectu=
res
> >     (as found by the kernel test robot)
> >
> >  drivers/hid/wacom_wac.c | 6 +++---
> >  drivers/hid/wacom_wac.h | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > index 2ccf838371343..174bf03908d7c 100644
> > --- a/drivers/hid/wacom_wac.c
> > +++ b/drivers/hid/wacom_wac.c
> > @@ -1314,7 +1314,7 @@ static void wacom_intuos_pro2_bt_pen(struct wacom=
_wac *wacom)
> >         struct input_dev *pen_input =3D wacom->pen_input;
> >         unsigned char *data =3D wacom->data;
> >         int number_of_valid_frames =3D 0;
> > -       int time_interval =3D 15000000;
> > +       ktime_t time_interval =3D 15000000;
> >         ktime_t time_packet_received =3D ktime_get();
> >         int i;
> >
> > @@ -1348,7 +1348,7 @@ static void wacom_intuos_pro2_bt_pen(struct wacom=
_wac *wacom)
> >         if (number_of_valid_frames) {
> >                 if (wacom->hid_data.time_delayed)
> >                         time_interval =3D ktime_get() - wacom->hid_data=
.time_delayed;
> > -               time_interval /=3D number_of_valid_frames;
> > +               time_interval =3D div_u64(time_interval, number_of_vali=
d_frames);
> >                 wacom->hid_data.time_delayed =3D time_packet_received;
> >         }
> >
> > @@ -1359,7 +1359,7 @@ static void wacom_intuos_pro2_bt_pen(struct wacom=
_wac *wacom)
> >                 bool range =3D frame[0] & 0x20;
> >                 bool invert =3D frame[0] & 0x10;
> >                 int frames_number_reversed =3D number_of_valid_frames -=
 i - 1;
> > -               int event_timestamp =3D time_packet_received - frames_n=
umber_reversed * time_interval;
> > +               ktime_t event_timestamp =3D time_packet_received - fram=
es_number_reversed * time_interval;
> >
> >                 if (!valid)
> >                         continue;
> > diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
> > index 1a40bb8c5810c..ee21bb260f22f 100644
> > --- a/drivers/hid/wacom_wac.h
> > +++ b/drivers/hid/wacom_wac.h
> > @@ -324,7 +324,7 @@ struct hid_data {
> >         int ps_connected;
> >         bool pad_input_event_flag;
> >         unsigned short sequence_number;
> > -       int time_delayed;
> > +       ktime_t time_delayed;
> >  };
> >
> >  struct wacom_remote_data {
> > --
> > 2.41.0
> >
>

