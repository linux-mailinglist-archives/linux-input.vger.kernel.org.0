Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0000C4F2681
	for <lists+linux-input@lfdr.de>; Tue,  5 Apr 2022 10:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbiDEIFZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Apr 2022 04:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbiDEHzw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Apr 2022 03:55:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B71E369E4
        for <linux-input@vger.kernel.org>; Tue,  5 Apr 2022 00:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649145033;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l/JGifjbCPcOyb4WsjeQPKe0JmxGEhOLOxgGQxX5iC0=;
        b=Wt75JUHquNRliLP6GIq04lTdbJ8ebEC3GMaiwi/3i7DCS/nxQy3cluKWhw1xXZWhaBFaMx
        /cklmvhCaBV8ajHfjeKl4de3W3EIue+UHy5v3ZTP98+VvXTsev8sBUf/Inituoi3mFz6da
        bfiAFDrHU+cD99n6cb0ytXUpW8/UWls=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-2NNswu9NNyOM3ceVjGJCNw-1; Tue, 05 Apr 2022 03:50:29 -0400
X-MC-Unique: 2NNswu9NNyOM3ceVjGJCNw-1
Received: by mail-pj1-f72.google.com with SMTP id oj16-20020a17090b4d9000b001c7552b7546so1178865pjb.8
        for <linux-input@vger.kernel.org>; Tue, 05 Apr 2022 00:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l/JGifjbCPcOyb4WsjeQPKe0JmxGEhOLOxgGQxX5iC0=;
        b=rxvvPr4Z4OpXM/Ya4ewPnqi36GQ+gT+VRAKiiIYhhbCBVidRrrG4g5rzn5wMcVIqK8
         vrG8c/rRYwiE9NIALMUZ4jrZu+YAkHR3J0hdYxzESU1NawlCGp+AkNyPcdaJ4c3Z8gna
         DPXqbGPoHY4FW3DOqKg6lfXY+Oksg9oFLsfCsHsBJ+1wWfAVrlxPs97/PMhI638904rX
         j4InRFpzzrCCI5EfNzSpP721nPZ9xEKk5wXSHuF/QmBcDsNN3TMr5iMqE+ofH/6fDKV8
         0NzxYJ011UPODVKuSil5uqrrtz9nSGVzi40J7jQKUXoptD7h2Ym2hpqYXpvTVmmkV0Yt
         tDiQ==
X-Gm-Message-State: AOAM533C1A+GYKTfZbVj41Xf2NFm/zbRI/OLAbFTQVczHghKWPrYfs9q
        X5zLsyS4LkHphm0kZ8CX+a+Y/2X5kpmyWWwMctEwHRoGAsJCsDpgls8J+D4+OGSpQNtUoB9XY4M
        DKDLefbrDxZv6lm0d1RYXrtOravGlzPihf5/fKUw=
X-Received: by 2002:a17:90b:224b:b0:1c6:f027:90b1 with SMTP id hk11-20020a17090b224b00b001c6f02790b1mr2615017pjb.173.1649145028836;
        Tue, 05 Apr 2022 00:50:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwabSU0dqJFmbHn9VSFjF4Zcl+2rjAgqoAjWN72wM1wdY9Ph/qTLcQuXx+2G6uGErYc41i66nKMncNHG0t+2TU=
X-Received: by 2002:a17:90b:224b:b0:1c6:f027:90b1 with SMTP id
 hk11-20020a17090b224b00b001c6f02790b1mr2614994pjb.173.1649145028479; Tue, 05
 Apr 2022 00:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <7b345a16-60bd-001f-edec-724ca2b3c47a@semihalf.com>
In-Reply-To: <7b345a16-60bd-001f-edec-724ca2b3c47a@semihalf.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 5 Apr 2022 09:50:17 +0200
Message-ID: <CAO-hwJ+18Ce_A8F-QVp=TJj2iu60r=f4MkrktYbou-rkXsj+mA@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Add support for Google Whiskers Touchpad
To:     =?UTF-8?Q?Marek_Ma=C5=9Blanka?= <mm@semihalf.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marek,

On Mon, Apr 4, 2022 at 10:22 PM Marek Ma=C5=9Blanka <mm@semihalf.com> wrote=
:
>
> The Google Whiskers touchpad does not work properly with the default
> multitouch configuration. Instead, use the same configuration as Google
> Rose.
>
> Signed-off-by: Marek Maslanka <mm@semihalf.com>
> ---
>   drivers/hid/hid-multitouch.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 99eabfb4145b..bda79197273b 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -2178,6 +2178,9 @@ static const struct hid_device_id mt_devices[] =3D =
{
>         { .driver_data =3D MT_CLS_GOOGLE,
>                 HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOG=
LE,
>                         USB_DEVICE_ID_GOOGLE_TOUCH_ROSE) },
> +       { .driver_data =3D MT_CLS_GOOGLE,
> +               HID_USB_DEVICE(USB_VENDOR_ID_GOOGLE,
> +                       USB_DEVICE_ID_GOOGLE_WHISKERS) },

You probably want to restrict the group to only multitouch devices.
This device is already handled through hid-google-hammer.c, and adding
this line will make both drivers fight for the resource.

The hid-google-hammer.c line is only for HID_GROUP_GENERIC, so you
should be able to add something along HID_GROUP_MULTITOUCH_WIN_8 or
use
MT_USB_DEVICE() if it's not declared as Win8 compatible.

Cheers,
Benjamin

>
>         /* Generic MT device */
>         { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID,
> HID_ANY_ID) },
> --
> 2.32.0
>

