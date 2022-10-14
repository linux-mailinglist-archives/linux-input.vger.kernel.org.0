Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D76925FED4E
	for <lists+linux-input@lfdr.de>; Fri, 14 Oct 2022 13:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiJNLpC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Oct 2022 07:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiJNLpB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Oct 2022 07:45:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E969521E1B
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 04:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665747896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+SaMoWTI1va/GeQPVZGv1GV3k10aJeG+I3b8tcuOi4k=;
        b=Kc8O1g//Qe0f40n6JjCIUmAMNc6Cl6tinWG3kBs6S5BSkIwY9QEoPrCQPxakrTjBVxJWVM
        mzuBJk1sD7AlHKIQTUUps4S0VFcZk2LuoQCVtvKp4ABq/lFl4YeXea0ykvWMcHyCWVCvCw
        HESBjRzOtIHQ+zZY4/eD4ndGijI6KKw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-JXYk8BqDOUO61PvZVeCfkQ-1; Fri, 14 Oct 2022 07:44:55 -0400
X-MC-Unique: JXYk8BqDOUO61PvZVeCfkQ-1
Received: by mail-io1-f70.google.com with SMTP id b12-20020a5d804c000000b006b723722d4eso2906426ior.17
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 04:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SaMoWTI1va/GeQPVZGv1GV3k10aJeG+I3b8tcuOi4k=;
        b=rUpVy65kZF+ti0AAWT0Q9COKUyi3+MEKMgzqbQn1xXOL1h7XKXQFViMS7Y7NbU7zmG
         f0bhHCqkJEBw46QO4z7VPDcivYCot7sXBNY8ra+YvLRYR0WYgTCLgng8fmOXYcl1ThT4
         QKHZLyZ/6qvA111ISG8JFBKoEItLBJmA7GqwvBecdnsEZ6CO2oMQ+r6FjJzpTW5t8vw2
         dA8N65RwFfVV0b5FODBpau1/8V439kQBoLRhU5coEIr6ulOrqXruS9QMUNYKTOJXxqVZ
         fhjxkxw9ysL7VTYK3KgQEEG8DSgHdSafwL5U86vepYbBHl0kHNG3owjOz2DhwJvINiV5
         MkxQ==
X-Gm-Message-State: ACrzQf0FZeyUKNDLWQ48R4+91GThQst4zCXmPTJYnNKU/mvs+Q5mDQ+O
        nziSQunTbV+BBlOo6eK1ls0N0qGvrs3xxcIIKBu/RIVAt0xGp+EKhJeE00LH2FTN7tjFJbdOkmC
        O2ys/5ekkJy71aJB8QNhV250WZXuiUFlW/wXDI7w=
X-Received: by 2002:a05:6e02:1ba3:b0:2fa:3547:477a with SMTP id n3-20020a056e021ba300b002fa3547477amr2333627ili.34.1665747895140;
        Fri, 14 Oct 2022 04:44:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bwkw/YLVKENVtQ5QSSOSYDV5uyqFVv+l7NGeCxPr7b/ll4YvLxvKADWuES9vE93ktW2TZnt4eeMdL4zO9Gmg=
X-Received: by 2002:a05:6e02:1ba3:b0:2fa:3547:477a with SMTP id
 n3-20020a056e021ba300b002fa3547477amr2333619ili.34.1665747894973; Fri, 14 Oct
 2022 04:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221009182747.90730-1-jose.exposito89@gmail.com>
In-Reply-To: <20221009182747.90730-1-jose.exposito89@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 14 Oct 2022 13:44:43 +0200
Message-ID: <CAO-hwJKJ8SROR5WVyogAAh=L3jyuHuJwLi6B1C9wGD=14PjYGA@mail.gmail.com>
Subject: Re: [PATCH] HID: magicmouse: Do not set BTN_MOUSE on double report
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     jikos@kernel.org, rydberg@bitmath.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nulo <git@nulo.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Oct 9, 2022 at 8:28 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gma=
il.com> wrote:
>
> Under certain conditions the Magic Trackpad can group 2 reports in a
> single packet. The packet is split and the raw event function is
> invoked recursively for each part.
>
> However, after processing each part, the BTN_MOUSE status is updated,
> sending multiple click events. [1]
>
> Return after processing double reports to avoid this issue.
>
> Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/811  # [1=
]
> Fixes: a462230e16ac ("HID: magicmouse: enable Magic Trackpad support")
> Reported-by: Nulo <git@nulo.in>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

Applied to for-6.1/upstream-fixes, thanks for spotting that old bug :)

Cheers,
Benjamin

>  drivers/hid/hid-magicmouse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
> index 664a624a363d..c9c968d4b36a 100644
> --- a/drivers/hid/hid-magicmouse.c
> +++ b/drivers/hid/hid-magicmouse.c
> @@ -480,7 +480,7 @@ static int magicmouse_raw_event(struct hid_device *hd=
ev,
>                 magicmouse_raw_event(hdev, report, data + 2, data[1]);
>                 magicmouse_raw_event(hdev, report, data + 2 + data[1],
>                         size - 2 - data[1]);
> -               break;
> +               return 0;
>         default:
>                 return 0;
>         }
> --
> 2.25.1
>

