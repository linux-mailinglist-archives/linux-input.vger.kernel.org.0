Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937946A261E
	for <lists+linux-input@lfdr.de>; Sat, 25 Feb 2023 02:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjBYBPU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Feb 2023 20:15:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjBYBPT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Feb 2023 20:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1ED125AF
        for <linux-input@vger.kernel.org>; Fri, 24 Feb 2023 17:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677287672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SaS4erUg3NM6XTSby1vUqTF0lmqfCt4MqXmFWji6VL4=;
        b=h/FuutavUWhEfPnOyO4VS/dnMaGiOOHRR4BIZJ7l8vdtXMiHPK+3Cj/vQTxgREWVqM0t6u
        YnJp+oywktXuWgipa2+6VJXavikyVQMWuktwTxVHjiQr/OaYsLBweqXMQdAeMBt0sFkJkN
        adXmsoOfRxC3588DugXRx5U18tKrYEY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-wuy_vWzhOdmhQqEBUSut0w-1; Fri, 24 Feb 2023 20:14:30 -0500
X-MC-Unique: wuy_vWzhOdmhQqEBUSut0w-1
Received: by mail-lf1-f70.google.com with SMTP id cf37-20020a056512282500b004cfd8133992so319093lfb.11
        for <linux-input@vger.kernel.org>; Fri, 24 Feb 2023 17:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SaS4erUg3NM6XTSby1vUqTF0lmqfCt4MqXmFWji6VL4=;
        b=SAw1kxOB6nGySKlOgjpdeqi5FOb+CAKsypY9DSrpndoEBnnKkqLGUJrbBl7yRhxHzn
         Bdio6V+W9foeTYnInPrx4f97R12gmC9ZZ6TBdSPwOnv6p6ln5nXMA09TJTTklvGgabTq
         q/ViloILElxRCeiSDuFnhNfay0ZVqYf4CyRNCPf4JRbv5oeV4kNRIFm5wDnGMn1GEby8
         EC6twelNbB04cDMvhRyYDZtGx4dIyC8ofoMQ/e4z1Z1LNmRv1/C29yXIGgciPpwt3yKl
         OGQkHYHNVqogZ/CY8hi2E/JyGNIudmYcMDxymCvZltNF2eLjnqxBmVlF5Ftt8rJzmiGk
         MS3g==
X-Gm-Message-State: AO0yUKV34FWs5UNZ1JYtAoVdXTWfJIPtVN5/ml8ft60jSGCb3IHs8j9O
        QaR1EbPqa/eO7UgraZJA32+hNJaxhrUFTIGBo4epA1boLUutTQx+Fr2+du93UjReHR4zKk0dtbm
        Vc/0e9JMhD+rQK42WtXHN+Ww=
X-Received: by 2002:a19:f609:0:b0:4cb:3d40:93ff with SMTP id x9-20020a19f609000000b004cb3d4093ffmr6157275lfe.58.1677287669305;
        Fri, 24 Feb 2023 17:14:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZM4OYN++Gn/LUarN8aMvH5+wvuR+LWol7AobErVLrZrgakJ8UqKBhGZZOGRnZjjg20fdzzQ==
X-Received: by 2002:a19:f609:0:b0:4cb:3d40:93ff with SMTP id x9-20020a19f609000000b004cb3d4093ffmr6157270lfe.58.1677287668987;
        Fri, 24 Feb 2023 17:14:28 -0800 (PST)
Received: from [10.30.5.34] (194-16-89-154.customer.telia.com. [194.16.89.154])
        by smtp.gmail.com with ESMTPSA id h2-20020ac25962000000b004db9dbe09c6sm54215lfp.89.2023.02.24.17.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 17:14:28 -0800 (PST)
Message-ID: <d4b320fcca34c25713836c1ef5a34157c67071f0.camel@redhat.com>
Subject: Re: [PATCH] Input: xpad - fix PowerA EnWired Controller guide button
From:   Lyude Paul <lyude@redhat.com>
To:     Vicki Pfau <vi@endrift.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Cullen <michael@michaelcullen.name>,
        Marcos Alano <marcoshalano@gmail.com>,
        linux-input@vger.kernel.org
Date:   Sat, 25 Feb 2023 02:14:27 +0100
In-Reply-To: <20221006221209.2016372-1-vi@endrift.com>
References: <20221006221209.2016372-1-vi@endrift.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Poke, Dmitry - any chance we could get this pushed?

On Thu, 2022-10-06 at 15:12 -0700, Vicki Pfau wrote:
> Some Xbox One controllers require more complete versions of the controlle=
r
> start-up sequence used in official software in order to function properly=
.
> This patch adds a usb_set_interface call that matches official startup an=
d
> nominally disabled the audio interface, which isn't supported in the xpad
> driver in the first place.
>=20
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/xpad.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.=
c
> index 18190b529bca..6449665d7b61 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -1509,6 +1509,13 @@ static int xpad_start_input(struct usb_xpad *xpad)
>  		return -EIO;
> =20
>  	if (xpad->xtype =3D=3D XTYPE_XBOXONE) {
> +		/* Explicitly disable the audio interface. This is needed for some
> +		 * controllers, such as the PowerA Enhanced Wired Controller
> +		 * for Series X|S (0x20d6:0x200e) to report the guide button */
> +		error =3D usb_set_interface(xpad->udev, 1, 0);
> +		if (error)
> +			return error;
> +
>  		error =3D xpad_start_xbox_one(xpad);
>  		if (error) {
>  			usb_kill_urb(xpad->irq_in);

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

