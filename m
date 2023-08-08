Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D5C774D58
	for <lists+linux-input@lfdr.de>; Tue,  8 Aug 2023 23:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjHHVuL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Aug 2023 17:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjHHVuK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Aug 2023 17:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2C512D
        for <linux-input@vger.kernel.org>; Tue,  8 Aug 2023 14:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691531367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3HHpd2DyqwIaB/0YOoy2WWN/WubeXp77NhUhN2HwSHc=;
        b=MESzgcNfDmxZErt6rJ3SGyXfAOwlHTkBi7hB4CZO31mEhyqE0V5YKQ6mt/4beKZrda5xao
        ZnSm/2fazlpsrrwf0qkeaF5sS2ppb4lf9wtZ+Pa13CCoMAQ9z6SJxov97z4bk7RbsZCysp
        0xWm649ji6FyRoWGRPm9WeL18loMtos=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-px0nNJ5iOZ-lxE5vZQOncw-1; Tue, 08 Aug 2023 17:49:26 -0400
X-MC-Unique: px0nNJ5iOZ-lxE5vZQOncw-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-410080f43c3so27785211cf.1
        for <linux-input@vger.kernel.org>; Tue, 08 Aug 2023 14:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691531366; x=1692136166;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3HHpd2DyqwIaB/0YOoy2WWN/WubeXp77NhUhN2HwSHc=;
        b=EttmUBT+DWdKzJzESiO8A0s7106zlIhNI8e8iKCzwTeHerSt3oph1yXZSoervkD1rU
         Cj5IH34bO7MZpn2eGiwcRcxTKC7lGMcKMv/5ihD2Od3t/LDdAqsqXOxVmc/ohHz+bZ59
         vcEAcMTJajDQsh2NZQHstjbgtbiNI6LV9RiDsdlnovCkEWoaMwDDuMbgUrcXmhxHPIfV
         8ntQ33zyx8vC0ldzKlyv4YtMoMdM0isANkpcGkS8EvK3up/B0KCDA2otNnI13pVG290L
         nX4D7I0jKcwuCUML2ECiyKY5njNQEH84TzFULSm8I5l+koRKJ042BHHj8qbuKNWFx3ZN
         +lhA==
X-Gm-Message-State: AOJu0Yzdp6BQ0JLSpR/bGckbqP/AGoViKvRcNxXwfK+Qj3ihx24rZNVd
        ZXFvwcUM6qZhGM+11JyQ1RoV0L5RpEaIafF6RYWOnhe9TrACVPuyLEfv61+E0tIjefmkld/uhAM
        D5PuLHElnNy5CdttSZdWstms=
X-Received: by 2002:a0c:ca83:0:b0:63c:df3f:41da with SMTP id a3-20020a0cca83000000b0063cdf3f41damr736279qvk.26.1691531365820;
        Tue, 08 Aug 2023 14:49:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/T6S9mFSWztCIivqVIIiDWMSbuIskys6wM00BvZ+4kxTXId/IxkNMa5Bz6ZHgmWRAPwVW+Q==
X-Received: by 2002:a0c:ca83:0:b0:63c:df3f:41da with SMTP id a3-20020a0cca83000000b0063cdf3f41damr736270qvk.26.1691531365544;
        Tue, 08 Aug 2023 14:49:25 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
        by smtp.gmail.com with ESMTPSA id h6-20020a0cab06000000b0063d119034a9sm3921473qvb.140.2023.08.08.14.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 14:49:24 -0700 (PDT)
Message-ID: <f13f4ff7d46ecf887ca652b664860c4e07ec8b73.camel@redhat.com>
Subject: Re: [PATCH] Revert "Input: synaptics - enable InterTouch for the
 ThinkPad P1 G3"
From:   Lyude Paul <lyude@redhat.com>
To:     Sebastian Wick <sebastian.wick@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aman Dhoot <amandhoot12@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Raul Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Duggan <aduggan@synaptics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 08 Aug 2023 17:49:23 -0400
In-Reply-To: <20230808152817.304836-1-sebastian.wick@redhat.com>
References: <20230808152817.304836-1-sebastian.wick@redhat.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hm, This looks fine to me (if not as a final fix, certainly as a workaround=
)

Reviewed-by: Lyude Paul <lyude@redhat.com>

However, this is definitely something we probably should try to fix at some
point - as I imagine this must be happening because something regarding how
clicks are reported must have changed again. Andrew, do you have any idea?

On Tue, 2023-08-08 at 17:28 +0200, Sebastian Wick wrote:
> This reverts commit 7984b43542070f5888546d95b48003c4a8af7c0f to make the
> touchpad usable again.
>=20
> Tapping does not generate any events for user space and moving the
> cursor is janky. Disabling InterTouch fixes those issues.
>=20
> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> ---
>  drivers/input/mouse/synaptics.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synapt=
ics.c
> index ada299ec5bba..0e01df88cf69 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -182,7 +182,6 @@ static const char * const smbus_pnp_ids[] =3D {
>  	"LEN0099", /* X1 Extreme Gen 1 / P1 Gen 1 */
>  	"LEN009b", /* T580 */
>  	"LEN0402", /* X1 Extreme Gen 2 / P1 Gen 2 */
> -	"LEN040f", /* P1 Gen 3 */
>  	"LEN200f", /* T450s */
>  	"LEN2044", /* L470  */
>  	"LEN2054", /* E480 */

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

