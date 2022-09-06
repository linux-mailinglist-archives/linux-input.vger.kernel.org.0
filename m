Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C945AF3F8
	for <lists+linux-input@lfdr.de>; Tue,  6 Sep 2022 20:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiIFSxo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Sep 2022 14:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiIFSxn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Sep 2022 14:53:43 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632A687085
        for <linux-input@vger.kernel.org>; Tue,  6 Sep 2022 11:53:40 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso7439065pjd.4
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 11:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=BPjP3jRmhlxmGVXXq1iPkVHZyPcUWBWGdABB7Kvx34M=;
        b=fYIGR4Mb5MQkOWMOQ8HIwVxcLNXYlDtVuK5dIuLM4UPLmkulnwrlmKX3UQ+RuRpEPO
         oPb8C9j9ed7WR3yP+0BoxCVECHSPhkyCz6heSZu2iG+6hVDU++6u0AblwFtqb27GHzm0
         ktgvv8Ha5jc8KidLBcUnEuPfQn5ZxEC3PbNjS5cC3ItE8Ysb9/x1fkwd/P0gDfnWopSA
         6bmAwTDjcOTJUpkyJvP9ueYJ2cAyX8bGaQp/aeWQsVHl1rZxuM6Frbw/vBH3djQL8n2v
         oM7tmAV/EIb0jT5AG6KKVeRZ1/q/7jl/4hd2r0NaUPgb8lGp0djpijr/8NOLTcvrUZjZ
         h47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=BPjP3jRmhlxmGVXXq1iPkVHZyPcUWBWGdABB7Kvx34M=;
        b=kQURUSM+ZMadnb01vKwfNXe6Dd/jnvq47ZS7/BwtYA340vZ25C9V69jNnyNDuMX2UR
         d2OJXX9lmfn/+FfEOYuuq0r4mdxi16Sh5OhwvL2L4VHcDkoQQkiMI6xj7Rx0xkczoatU
         K01fLP+ilFTcnwzUZMuHZmp+jLiJxI7fGBET+QkFiIZ1S/KsLFHfzItZuHXkpKZJtMov
         1EFba/xEGFyXGFya8OGCFJ8XvAgjkhB2vBNlZIt46lXMWQHHG+w6pytVtRR3alf38D6I
         3IAQdJFEHxnpAyiRZ4Ty8a7GImzg4FhnSjjgEyJj5YvCZxJao/jSOgOak02V54VYZNBH
         gw5Q==
X-Gm-Message-State: ACgBeo0iNlpWRGtG/08ZJfQKG2u+dj0umOxnYw8LNy5ClHgrfmB9iz+1
        Yjpw7lWAffV6pyDasNqnUx8fr6yzt/g=
X-Google-Smtp-Source: AA6agR4M03KR/SSqIfnjVHOSewtFAZoVcL2nx6lrMW+rfFF1cS2oPzKT2N/nlx1AK3VJ2EUhrPCHnQ==
X-Received: by 2002:a17:902:edd5:b0:174:a6e6:51f4 with SMTP id q21-20020a170902edd500b00174a6e651f4mr51291plk.82.1662490419360;
        Tue, 06 Sep 2022 11:53:39 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090a7a8f00b001f319e9b9e5sm436609pjf.16.2022.09.06.11.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 11:53:38 -0700 (PDT)
Date:   Tue, 6 Sep 2022 11:53:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Anvin Paul <anvmisc@fastmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for ThrustMaster eSwap PRO
 Controller Xbox for Xbox One
Message-ID: <YxeXMAHF99UZuDcq@google.com>
References: <20220722182818.663816a8@msipc.lan>
 <YxeXD8J46c/5rJaS@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxeXD8J46c/5rJaS@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 06, 2022 at 11:53:03AM -0700, Dmitry Torokhov wrote:
> On Fri, Jul 22, 2022 at 06:28:18PM -0400, Anvin Paul wrote:
> > 
> > From: Anvin Paul <anvmisc@fastmail.com>
> > 
> > Signed-off-by: Anvin Paul <anvmisc@fastmail.com>
> > 
> 
> Adding Pavel Rojtber for comment.

For real now...

> 
> > ---
> >  drivers/input/joystick/xpad.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> > index 18190b529bca..537ffbd53c56 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -118,6 +118,7 @@ static const struct xpad_device {
> >  	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
> >  	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
> >  	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
> > +	{ 0x044f, 0xd012, "Thrustmaster, Inc. eSwap PRO Controller Xbox", 0, XTYPE_XBOXONE },
> >  	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
> >  	{ 0x045e, 0x0285, "Microsoft X-Box pad (Japan)", 0, XTYPE_XBOX },
> >  	{ 0x045e, 0x0287, "Microsoft Xbox Controller S", 0, XTYPE_XBOX },
> > @@ -420,6 +421,7 @@ static const struct usb_device_id xpad_table[] = {
> >  	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* X-Box USB-IF not approved class */
> >  	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 Controller */
> >  	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster X-Box 360 controllers */
> > +	XPAD_XBOXONE_VENDOR(0x044f),            /* Thrustmaster X-Box One controllers */
> >  	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft X-Box 360 controllers */
> >  	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft X-Box One controllers */
> >  	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech X-Box 360 style controllers */
> > @@ -554,6 +556,8 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
> >  	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
> >  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
> >  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
> > +	XBOXONE_INIT_PKT(0x044f, 0xd012, xboxone_pdp_init1),
> > +	XBOXONE_INIT_PKT(0x044f, 0xd012, xboxone_pdp_init2),
> >  	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
> >  	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
> >  	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
> > -- 
> > 2.30.2
> > 
> 
> Thanks.
> 
> -- 
> Dmitry
> 

-- 
Dmitry
