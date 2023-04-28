Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74BF46F1D7B
	for <lists+linux-input@lfdr.de>; Fri, 28 Apr 2023 19:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344556AbjD1Rcg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Apr 2023 13:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjD1Rcf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Apr 2023 13:32:35 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CBE524A
        for <linux-input@vger.kernel.org>; Fri, 28 Apr 2023 10:32:23 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f1cfed93e2so75047705e9.3
        for <linux-input@vger.kernel.org>; Fri, 28 Apr 2023 10:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682703142; x=1685295142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKRwhXMIVy76UJwdB0ULG1Oxbcp28/BLr128eQUP+sw=;
        b=dkMKHiT1vW9PQ8+nYH1K/1p7YlhTNK4eGNBgBAlNp+FyuDkRvP55MsyVYBmIM3eHTR
         ftC7f6Xg0Rmc3AREVv5ztMhvNHA60cy4PVH6+WURjzmMaKeEb7PrVKCXB+Upkc/BTHLD
         W4eqQh2j0nncqYlEWAeqVjRmr7mS8axCdpUBURMszAxTeSwuxDtupQDJPxH+f2pJSJ1g
         Xipg4IuQYP3AXfdG+o0xp2kXRj+92tbbA1kBy6QTV4ezLlF2+cUXHXZYQ3DENPNK5UKt
         Jw3QLK+uanMpTQ12vyHEzNqOitLevz8gL4geA8qLGl1LHfyKxA07n9rmi4J3V7TQQLxl
         /E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682703142; x=1685295142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKRwhXMIVy76UJwdB0ULG1Oxbcp28/BLr128eQUP+sw=;
        b=HKkEyQIlzc0KMHVnpeAoJs3RD+D7p/bUsd6yvav+CrNYbHHxYx7WHuUG+jpK4/gjd0
         pDd0Fz9X2H5dJZcBVN9tSfI9u12ZJyM2Qy+vMIJ8YR1TAY6RxJett/Yp3LhCtkzTIpO/
         ut6K9W9P+Ni6Gz4vvmG76pKI5zcnWyvv0SA6p2Hi4HwSKJzZtkHUXqiv85gK0U1x17nc
         Mh9Gsb/5m4hqzEbzwEM2Ca/l+ODubITbkyz7+lQNkMh6JOKr/9VwK6YgEYemv2FR+cSJ
         yTdOpyKDi45F4+LGVjOpfZor7Si/oKmjP1r5wV5R90GeTjbQctwNS2d6DwWjkDIr9tVV
         zCkQ==
X-Gm-Message-State: AC+VfDyZXrnZl0Y52FhTDtAa3exNEfbJEMTjDB19o2dPm/5lhYW+VDgg
        a1/L6Ra6k82z87xXeKP48yTNR9puJOlOXr20VevYQGFDaqo=
X-Google-Smtp-Source: ACHHUZ4G2l0iCSlpD/53cvO1eBCsbd29OgvGDdU/HAsnYIEKJNivmbUJ4W1HnmFkQv2+rmKkFrJ9dXcZWzGUIrXgpqI=
X-Received: by 2002:a05:600c:b41:b0:3f1:79ad:f3a8 with SMTP id
 k1-20020a05600c0b4100b003f179adf3a8mr4748170wmr.16.1682703141562; Fri, 28 Apr
 2023 10:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230414182210.383218-1-jason.gerecke@wacom.com>
In-Reply-To: <20230414182210.383218-1-jason.gerecke@wacom.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Fri, 28 Apr 2023 10:32:10 -0700
Message-ID: <CANRwn3RbuXvYGJ24_=36J3JDroMvCvSxL2kc3iSS+2JbbhXXPQ@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Check for string overflow from strscpy calls
To:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Ping Cheng <pinglinux@gmail.com>,
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

On Fri, Apr 14, 2023 at 11:22=E2=80=AFAM Jason Gerecke <killertofu@gmail.co=
m> wrote:
>
> From: Jason Gerecke <killertofu@gmail.com>
>
> The strscpy function is able to return an error code when a copy would
> overflow the size of the destination. The copy is stopped and the buffer
> terminated before overflow actually occurs so it is safe to continue
> execution, but we should still produce a warning should this occur.
>
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> ---
>  drivers/hid/wacom_sys.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 8214896adadad..7192970d199a0 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -2224,7 +2224,9 @@ static void wacom_update_name(struct wacom *wacom, =
const char *suffix)
>                 } else if (strstr(product_name, "Wacom") ||
>                            strstr(product_name, "wacom") ||
>                            strstr(product_name, "WACOM")) {
> -                       strscpy(name, product_name, sizeof(name));
> +                       if (strscpy(name, product_name, sizeof(name)) < 0=
) {
> +                               hid_warn(wacom->hdev, "String overflow wh=
ile assembling device name");
> +                       }
>                 } else {
>                         snprintf(name, sizeof(name), "Wacom %s", product_=
name);
>                 }
> @@ -2242,7 +2244,9 @@ static void wacom_update_name(struct wacom *wacom, =
const char *suffix)
>                 if (name[strlen(name)-1] =3D=3D ' ')
>                         name[strlen(name)-1] =3D '\0';
>         } else {
> -               strscpy(name, features->name, sizeof(name));
> +               if (strscpy(name, features->name, sizeof(name)) < 0) {
> +                       hid_warn(wacom->hdev, "String overflow while asse=
mbling device name");
> +               }
>         }
>
>         snprintf(wacom_wac->name, sizeof(wacom_wac->name), "%s%s",
> @@ -2500,8 +2504,10 @@ static void wacom_wireless_work(struct work_struct=
 *work)
>                                 goto fail;
>                 }
>
> -               strscpy(wacom_wac->name, wacom_wac1->name,
> -                       sizeof(wacom_wac->name));
> +               if (strscpy(wacom_wac->name, wacom_wac1->name,
> +                       sizeof(wacom_wac->name)) < 0) {
> +                       hid_warn(wacom->hdev, "String overflow while asse=
mbling device name");
> +               }
>         }
>
>         return;
> --
> 2.40.0
>

Poking this thread again in case it got lost in the inbox...

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....
