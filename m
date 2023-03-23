Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF9526C7273
	for <lists+linux-input@lfdr.de>; Thu, 23 Mar 2023 22:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjCWVkK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 17:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbjCWVkH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 17:40:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD261132F3
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 14:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679607554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nhLwkSIcRxIyT0ntDvkg4XkFajU67KKJyhK6ZICoIeQ=;
        b=ho2fYGKJTvjhkrusReTLMO/Ivrw7KJSKHOvHfLHOkU+xf21XHB4TzhfrbjOSFnhGaMRNYO
        N4UapPyB9cbACjuAgDHnQ22fAwye3i7s/v/YLmXebBBO51Bjw3e4K3caNN+T8qe7sxivUz
        Q0rjgQzfoenKQ8qkSzEl/sptz/xS0Vc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-PRuyd4bDMv29oM1fZAYFvg-1; Thu, 23 Mar 2023 17:39:12 -0400
X-MC-Unique: PRuyd4bDMv29oM1fZAYFvg-1
Received: by mail-qk1-f198.google.com with SMTP id dw26-20020a05620a601a00b0074300c772c0so10978197qkb.11
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 14:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679607552;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhLwkSIcRxIyT0ntDvkg4XkFajU67KKJyhK6ZICoIeQ=;
        b=itoSoXJ4562jsH9i/AClS33XdjaLfC6PHulvWnJwuaE6xGtVPkXXAeKml+KEL3Fh/q
         y1Zkae2FoV9l/75eILUC/pewe6zvAU8keMnwzA9B5sIGn4L+3gzcncCdhZhruVqzzhfq
         CkVsiC5uRNjvE9xmpB/gWC+uYMf16pFifTqaCNynXeCIweyRokJdYilxEYzEJdjfjZSt
         uQTUrxTB9XkcqsV1kJRmbgsN8wYfCNqsO2P/kYStKG6VX9Htf9StGSkiuO5s6Sb2f0Yd
         eL0mReD/hizXipDvC2K3ywB+6PlFFTwpitvwkUKP8db39eTDzSuKFTcNUZ/ZqXTj8ql8
         wwCQ==
X-Gm-Message-State: AO0yUKV/kZcnOI/mFMX0EaqhrbE7K0+j1BXbisdkp2OdYwTSr0nj6PPU
        YUp12BlMGRcGBxt3xmckyjRiyYSJYXCqvqvvL5kQ8v4vC9nc5GiIIUU8dOrIg6tvFYsbFXmdx65
        IGMpIginI0K/Im+84rCy5XGU=
X-Received: by 2002:ac8:5c8c:0:b0:3bf:e005:3a85 with SMTP id r12-20020ac85c8c000000b003bfe0053a85mr1307301qta.5.1679607552023;
        Thu, 23 Mar 2023 14:39:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set9yGIPbTXZUKtpVwIYjjB5NIFyF/qhEa3O7cQWhHl4Alst8EpSuY049s7U3SMyCYnan2tQgLQ==
X-Received: by 2002:ac8:5c8c:0:b0:3bf:e005:3a85 with SMTP id r12-20020ac85c8c000000b003bfe0053a85mr1307286qta.5.1679607551830;
        Thu, 23 Mar 2023 14:39:11 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c57:b700::feb? ([2600:4040:5c57:b700::feb])
        by smtp.gmail.com with ESMTPSA id z7-20020ac84547000000b003d7e923736asm6203987qtn.6.2023.03.23.14.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:39:11 -0700 (PDT)
Message-ID: <6db0559eea8a92d27408faadbeee9974471ce2c9.camel@redhat.com>
Subject: Re: [PATCH 1/3] Input: xpad - fix support for some third-party
 controllers
From:   Lyude Paul <lyude@redhat.com>
To:     Vicki Pfau <vi@endrift.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>
Date:   Thu, 23 Mar 2023 17:39:10 -0400
In-Reply-To: <20230225012147.276489-2-vi@endrift.com>
References: <20230225012147.276489-1-vi@endrift.com>
         <20230225012147.276489-2-vi@endrift.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey Dmitry, this patch series seems to have only gotten radio silence as we=
ll.
What could we do to get this moving?

On Fri, 2023-02-24 at 17:21 -0800, Vicki Pfau wrote:
> Some third-party controllers, such as the HORPIAD FPS for Nintendo Switch=
 and
> Gamesir-G3w, require a specific packet that the first-party XInput driver=
 sends
> before it will start sending reports. It's not currently known what this =
packet
> does, but since the first-party driver always sends it's unlikely that th=
is
> could cause issues with existing controllers.
>=20
> Co-authored-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/xpad.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.=
c
> index 403b57e8176b..04af2213407f 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -265,6 +265,7 @@ static const struct xpad_device {
>  	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
>  	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_T=
O_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTON=
S, XTYPE_XBOXONE },
> +	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BU=
TTONS, XTYPE_XBOX360 },
>  	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
>  	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
>  	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
> @@ -2020,6 +2021,27 @@ static int xpad_probe(struct usb_interface *intf, =
const struct usb_device_id *id
>  		goto err_free_in_urb;
>  	}
> =20
> +	if (xpad->xtype =3D=3D XTYPE_XBOX360) {
> +		/* Some third-party controllers Xbox 360-style controllers
> +		 * require this message to finish initialization */
> +		uint8_t dummy[20];
> +		int ret;
> +
> +		usb_control_msg_recv(udev, 0,
> +				     /* bRequest */ 0x01,
> +				     /* bmRequestType */
> +				     USB_TYPE_VENDOR | USB_DIR_IN |
> +				     USB_RECIP_INTERFACE,
> +				     /* wValue */ 0x100,
> +				     /* wIndex */ 0x00,
> +				     dummy, sizeof(dummy),
> +				     25,
> +				     GFP_KERNEL);
> +		if (ret)
> +			dev_warn(&xpad->dev->dev,
> +				 "unable to receive magic message: %d\n", ret);
> +	}
> +
>  	ep_irq_in =3D ep_irq_out =3D NULL;
> =20
>  	for (i =3D 0; i < 2; i++) {

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

