Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 498A66C72B4
	for <lists+linux-input@lfdr.de>; Thu, 23 Mar 2023 23:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjCWWCF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 18:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjCWWB5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 18:01:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A949318AB1
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 15:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679608872;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5jtTIwyDGyWL4CBJenmE0zHcHIlBdGu1ZJLi6bC3JfM=;
        b=UntYX6FJvFV5ceQ6IdbLh+iwAGZlQkwh3esElTasmam+FVvUcVn8q7XMp9F3LM+845Rme5
        v/R4A+NzLHezlhhQqBRHMtS65tyB8m18BoGcHcoY16i+ohIpFYb7mt41Th2nnuDIn+8KmT
        c2FJojJjjIESiIe3lkH3uG2iPehTgrM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-5EjCGONDPVOB8Lf_s6zq9A-1; Thu, 23 Mar 2023 18:01:11 -0400
X-MC-Unique: 5EjCGONDPVOB8Lf_s6zq9A-1
Received: by mail-ot1-f69.google.com with SMTP id f14-20020a9d5f0e000000b0069d8d0ff799so10037644oti.6
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 15:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679608871;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jtTIwyDGyWL4CBJenmE0zHcHIlBdGu1ZJLi6bC3JfM=;
        b=IBHjaY2+LPnC1bZyIl13iSf7SZD99s0pDZwR05Z5IsyAj72ts/uc8NW03HpsdGn4nA
         C8BhwK1q/7FHcMUrdVK3R4HC/TEYcOVRyQVYJ5knQab0Lox1J+yO2SHiIHsUUPcFLkc4
         nYzD3xxAkqSp4gwZjpNWKimcI6b8aEIuYKNt8aBvvxCV4DEErJB7J1+HQxxbYycoImfx
         8CKRb7R7e4fZ0MyXfVPh2mGLO9MhcihBap8ZMGnjZTT1snM76Xhvn35rreCP2AhpTuiK
         Lnu/U9f3QZWQFxw/jt6RTcKa6lsF2VPPhN2AvCXGVelE1Tr1LtTEhIcWRVhgWgtw6SZG
         lv2w==
X-Gm-Message-State: AO0yUKWJ3CVD5OaB/rXSk9UwYC8ryytTEOVzLrSK0qi9meGe30e4Vlhr
        yPvEu6zmK0ffWMQUF9D4nnmsxpxPllfiBl/x+3co/vDPl6JLAg49G/SzHO9+PGOtDJuFBkxMJCH
        mTQbO8hZ12J3+/nup6v3Ywe8=
X-Received: by 2002:a05:6870:c1c2:b0:177:dfdb:76 with SMTP id i2-20020a056870c1c200b00177dfdb0076mr521742oad.49.1679608870948;
        Thu, 23 Mar 2023 15:01:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350YyjOx/UmT2r8fXaIMyC8UPDUPyXIiUWCb29CB29Ft0i2s+w41rmlfUNaw/OhbxPVk2RhgC0A==
X-Received: by 2002:a05:6870:c1c2:b0:177:dfdb:76 with SMTP id i2-20020a056870c1c200b00177dfdb0076mr521718oad.49.1679608870713;
        Thu, 23 Mar 2023 15:01:10 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c57:b700::feb? ([2600:4040:5c57:b700::feb])
        by smtp.gmail.com with ESMTPSA id f67-20020a37d246000000b00745daadd210sm13718841qkj.71.2023.03.23.15.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 15:01:10 -0700 (PDT)
Message-ID: <2c7ddfcc0323971c3ca3e7b6c6ef1d12b93b3ca6.camel@redhat.com>
Subject: Re: [PATCH 1/3] Input: xpad - fix support for some third-party
 controllers
From:   Lyude Paul <lyude@redhat.com>
To:     Vicki Pfau <vi@endrift.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>
Date:   Thu, 23 Mar 2023 18:01:09 -0400
In-Reply-To: <6db0559eea8a92d27408faadbeee9974471ce2c9.camel@redhat.com>
References: <20230225012147.276489-1-vi@endrift.com>
         <20230225012147.276489-2-vi@endrift.com>
         <6db0559eea8a92d27408faadbeee9974471ce2c9.camel@redhat.com>
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

Ah wnoops, Vicki pointed out I made a mistake here and that this one is sti=
ll
awaiting reviews from someone. will review in just a moment

On Thu, 2023-03-23 at 17:39 -0400, Lyude Paul wrote:
> Hey Dmitry, this patch series seems to have only gotten radio silence as =
well.
> What could we do to get this moving?
>=20
> On Fri, 2023-02-24 at 17:21 -0800, Vicki Pfau wrote:
> > Some third-party controllers, such as the HORPIAD FPS for Nintendo Swit=
ch and
> > Gamesir-G3w, require a specific packet that the first-party XInput driv=
er sends
> > before it will start sending reports. It's not currently known what thi=
s packet
> > does, but since the first-party driver always sends it's unlikely that =
this
> > could cause issues with existing controllers.
> >=20
> > Co-authored-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > Signed-off-by: Vicki Pfau <vi@endrift.com>
> > ---
> >  drivers/input/joystick/xpad.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >=20
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpa=
d.c
> > index 403b57e8176b..04af2213407f 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -265,6 +265,7 @@ static const struct xpad_device {
> >  	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
> >  	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS=
_TO_BUTTONS, XTYPE_XBOXONE },
> >  	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTT=
ONS, XTYPE_XBOXONE },
> > +	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_=
BUTTONS, XTYPE_XBOX360 },
> >  	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
> >  	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
> >  	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
> > @@ -2020,6 +2021,27 @@ static int xpad_probe(struct usb_interface *intf=
, const struct usb_device_id *id
> >  		goto err_free_in_urb;
> >  	}
> > =20
> > +	if (xpad->xtype =3D=3D XTYPE_XBOX360) {
> > +		/* Some third-party controllers Xbox 360-style controllers
> > +		 * require this message to finish initialization */
> > +		uint8_t dummy[20];
> > +		int ret;
> > +
> > +		usb_control_msg_recv(udev, 0,
> > +				     /* bRequest */ 0x01,
> > +				     /* bmRequestType */
> > +				     USB_TYPE_VENDOR | USB_DIR_IN |
> > +				     USB_RECIP_INTERFACE,
> > +				     /* wValue */ 0x100,
> > +				     /* wIndex */ 0x00,
> > +				     dummy, sizeof(dummy),
> > +				     25,
> > +				     GFP_KERNEL);
> > +		if (ret)
> > +			dev_warn(&xpad->dev->dev,
> > +				 "unable to receive magic message: %d\n", ret);
> > +	}
> > +
> >  	ep_irq_in =3D ep_irq_out =3D NULL;
> > =20
> >  	for (i =3D 0; i < 2; i++) {
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

