Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F84B5E8266
	for <lists+linux-input@lfdr.de>; Fri, 23 Sep 2022 21:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbiIWTNv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Sep 2022 15:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbiIWTNn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Sep 2022 15:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83AF311D611
        for <linux-input@vger.kernel.org>; Fri, 23 Sep 2022 12:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663960420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1kL1sKvWl7toJq/naTSlRJEPH2yxVO7xF2IQr8yMOBc=;
        b=Ilk1Vurt1NeIvIw5sMdoWxBXa2ZFncxgvk2LiK7xztBP3K7y7/C6zLVTyg5zQ9zMdvnaCI
        IM09aOHQNNoxUmTBfFn2wea/gpYUgBFN4EQQvJZQ8cI7BI9ecrd/dsd529FqmWTTwruX1H
        YMOpRSrTKq30UmMGIms8oZwLcxaQmPk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-42hRUWO5P4u5iQYjziYIYA-1; Fri, 23 Sep 2022 15:13:39 -0400
X-MC-Unique: 42hRUWO5P4u5iQYjziYIYA-1
Received: by mail-qk1-f198.google.com with SMTP id n15-20020a05620a294f00b006b5768a0ed0so674004qkp.7
        for <linux-input@vger.kernel.org>; Fri, 23 Sep 2022 12:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1kL1sKvWl7toJq/naTSlRJEPH2yxVO7xF2IQr8yMOBc=;
        b=1k1AW2fA2YP5sz309H8CcQdU7kA2MgRudIeqHtdlPsghzJrZ59ejHsFcbnVoI0xCLF
         JyfIz2mvt5v/erQIT3Af94vdTv70zuvJ8gc0emtVSSeKZqnGwCEJvyIz7134frfTOVXN
         hDlYXnbGsWV/xg9mMHkN03/xeEJ8Vx8wByy8VVu1B9SCaBJs+15+PzdghyUlUfG8qLlU
         ihwi7lhmJXri//19m1361jmYpwSylSc5hmmjHApwpK21aP4yhO5dtko2XVxuavnm4E08
         N8+/FAXSnMDqmun/GMJR8GpUXC2L6uLzUP8fnLIf2GiuityVNxIKiqHyvmNI5QJU1WWJ
         pGJQ==
X-Gm-Message-State: ACrzQf1Xgk4eumM8nodJgxvSi2OawBIBRlAUMdiQ2cSsFex0I3hiw1Sx
        2xoohNdDdUOhkmuh0se+2KcLW1z5ea4WYmYM1unG2naU71xcTVMRzyNH0ZS4v3kokNz6ZNqDxoA
        2hvu6R5krbNtH4iNIfrxwIr8=
X-Received: by 2002:a05:620a:294a:b0:6ce:9944:f65a with SMTP id n10-20020a05620a294a00b006ce9944f65amr6694293qkp.434.1663960418792;
        Fri, 23 Sep 2022 12:13:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77DHnyJvaE6za+YOcsEoyOQZgd8Rm22c/EKhemffNRu+daj/GqP44WuMHgeOFroeF2XhsNwQ==
X-Received: by 2002:a05:620a:294a:b0:6ce:9944:f65a with SMTP id n10-20020a05620a294a00b006ce9944f65amr6694280qkp.434.1663960418592;
        Fri, 23 Sep 2022 12:13:38 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::feb? ([2600:4040:5c48:e00::feb])
        by smtp.gmail.com with ESMTPSA id y17-20020a37f611000000b006b5cc25535fsm6158496qkj.99.2022.09.23.12.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 12:13:37 -0700 (PDT)
Message-ID: <e63a16f8c89e33078966ba518576eafb075b5012.camel@redhat.com>
Subject: Re: [PATCH 1/9] Input: synaptics-rmi4 - fix firmware update
 operations with bootloader v8
From:   Lyude Paul <lyude@redhat.com>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 23 Sep 2022 15:13:36 -0400
In-Reply-To: <b2c30a8cd1ad8c40d16a25e3a4f190cab214dc4c.camel@ew.tq-group.com>
References: <20220608124808.51402-1-matthias.schiffer@ew.tq-group.com>
         <20220608124808.51402-2-matthias.schiffer@ew.tq-group.com>
         <3da8a0c9ae4e6d8a1d772498e4d4186bf969fd76.camel@redhat.com>
         <b2c30a8cd1ad8c40d16a25e3a4f190cab214dc4c.camel@ew.tq-group.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2022-09-23 at 11:12 +0200, Matthias Schiffer wrote:
> On Thu, 2022-09-22 at 16:06 -0400, Lyude Paul wrote:
> > Would add a Cc: stable@vger.kernel.org for this
> > 
> > With that fixed: Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Thanks for the review!
> 
> Should I reroll with the added Cc? In my experience, patches will end
> up queued for stable through AUTOSEL anyways as soon as the word "fix"
> appears somewhere in the commit message.

Ahhh, totally forgot about this. Nevermind then, it should be fine as-is :)

> 
> 
> > 
> > On Wed, 2022-06-08 at 14:48 +0200, Matthias Schiffer wrote:
> > > Commit a6977d758fed ("Input: synaptics-rmi4 - support bootloader v8 in
> > > f34v7") allowed the F34v7 driver to probe with bootloader v8, but it did
> > > not update various other bootloader version checks in the F34 code.
> > > 
> > > Fixes: a6977d758fed ("Input: synaptics-rmi4 - support bootloader v8 in f34v7")
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > ---
> > >  drivers/input/rmi4/rmi_f34.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/input/rmi4/rmi_f34.c b/drivers/input/rmi4/rmi_f34.c
> > > index e5dca9868f87..3afc94f679ed 100644
> > > --- a/drivers/input/rmi4/rmi_f34.c
> > > +++ b/drivers/input/rmi4/rmi_f34.c
> > > @@ -370,7 +370,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
> > >  
> > >  	f34 = dev_get_drvdata(&data->f34_container->dev);
> > >  
> > > -	if (f34->bl_version == 7) {
> > > +	if (f34->bl_version >= 7) {
> > >  		if (data->pdt_props & HAS_BSR) {
> > >  			dev_err(dev, "%s: LTS not supported\n", __func__);
> > >  			return -ENODEV;
> > > @@ -382,7 +382,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
> > >  	}
> > >  
> > >  	/* Enter flash mode */
> > > -	if (f34->bl_version == 7)
> > > +	if (f34->bl_version >= 7)
> > >  		ret = rmi_f34v7_start_reflash(f34, fw);
> > >  	else
> > >  		ret = rmi_f34_enable_flash(f34);
> > > @@ -413,7 +413,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
> > >  	f34 = dev_get_drvdata(&data->f34_container->dev);
> > >  
> > >  	/* Perform firmware update */
> > > -	if (f34->bl_version == 7)
> > > +	if (f34->bl_version >= 7)
> > >  		ret = rmi_f34v7_do_reflash(f34, fw);
> > >  	else
> > >  		ret = rmi_f34_update_firmware(f34, fw);
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

