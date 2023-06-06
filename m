Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53075724A83
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 19:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238691AbjFFRrX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 13:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238810AbjFFRrW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 13:47:22 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D18E54
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 10:47:21 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-256797b5664so2892604a91.2
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686073640; x=1688665640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny40JkO1miKnsnMQbVqezWlRzzHYZTeSGc20YbS9C8o=;
        b=clIo/mLjSPHzbDzcgepqzTEVkiZrQd2cLrcbP1jCRbG2lKykn6G3w6phmH0oVyJtFM
         OCfgith3ahD39VtZgXKOK3HP8gQHF5NZNKWNSheX5XwXgTBsQptEiuO2/gzmGoUa1Npb
         kkF1t4mcRGB9JrA8JqkoHJdDCa1gCY0uQEz/G3aHdIAiN2tL1oNT+GZXSf6TYNZr585V
         nJDshSgkusJP1n/h7tQ8mdyMgnF4dLX46RRhPAFuDSfIwW1k1mwvCnASrkuA/8yZRhIN
         r/zIC6ftiv36mx8T7K3w1cA99i+koaLCZKlIRjHrCs7eQIeM8sSCQbafyyddM7ZFBx2p
         HGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686073640; x=1688665640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny40JkO1miKnsnMQbVqezWlRzzHYZTeSGc20YbS9C8o=;
        b=NgoNrn+SrJcuQg4Lc/5Q1xZjry3DildXleapE9qvXjfhGRwwf5ucHEooZ126EH+RuZ
         ri715qtTk1DFO7hh6Smmn7OR4792TSobC/T8DDd8tlUHmfQLoOKrLR+iFfJK5GQe6iSr
         cHdQ8jCkikHn4iDpT2kJhi01QM4WgDT7AJIEqTFDAG9t6IeA8SDltuBz0RPZpYcYfgj2
         XG3w+QfYnZiXuYBT2p3+AT4B8W68bGO1WansnBbt6Lod2SUtcXixWuakRnkCV08zdDHx
         a9XqyK5GpG+X9UDmXBoAwYgkQE+HIhXBBFawyjI52WLmiooN09obF94A2pOm2vc7pMfF
         ddXg==
X-Gm-Message-State: AC+VfDwUBGI5JOxviWUroj1uzR6yZrCMLcynS85A+2ZPUhZoW5dbyUQB
        A/Gq05jurYKDgPluM6aNmLM=
X-Google-Smtp-Source: ACHHUZ41SU4ZgwYrnLYnO9RTn+801yB2ay2oQ1NxpEfIuBh+mLF7WrClIbQM58oMR5lLTiTfVrL99w==
X-Received: by 2002:a17:902:e809:b0:1b0:5e97:ee2c with SMTP id u9-20020a170902e80900b001b05e97ee2cmr1793006plg.11.1686073640411;
        Tue, 06 Jun 2023 10:47:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f59e:5ad5:28cc:2003])
        by smtp.gmail.com with ESMTPSA id je6-20020a170903264600b001ae5d21e95csm8814538plb.117.2023.06.06.10.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 10:47:19 -0700 (PDT)
Date:   Tue, 6 Jun 2023 10:47:16 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Dongliang Mu <dzm91@hust.edu.cn>, linux-input@vger.kernel.org,
        Dan Carpenter <error27@gmail.com>,
        syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] Input: xpad - Move Xbox 360 magic packet sending
Message-ID: <ZH9xJF+gO4O6VYGI@google.com>
References: <20230502031202.1018440-1-vi@endrift.com>
 <81e284e7-7d2d-6ccd-8bac-e20616ede754@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81e284e7-7d2d-6ccd-8bac-e20616ede754@endrift.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vicki,

On Fri, Jun 02, 2023 at 05:35:52PM -0700, Vicki Pfau wrote:
> On 5/1/23 20:12, Vicki Pfau wrote:
> > This moves the sending of the magic packet introduced in db7220c48d8d from
> > xpad_probe to xpad_start_input to ensure that xpad->dev->dev exists in the
> > event that an error occurs. This should also fix issues with suspend that may
> > occur with some controllers.
> > 
> > Fixes: db7220c48d8d ("Input: xpad - fix support for some third-party controllers")
> > Reported-by: syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com
> > Reported-by: Dongliang Mu <dzm91@hust.edu.cn>
> > Link: https://groups.google.com/g/syzkaller-bugs/c/iMhTgpGuIbM
> > Signed-off-by: Vicki Pfau <vi@endrift.com>
> > ---
> >  drivers/input/joystick/xpad.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> > index 50ecff681b89..40abea92c393 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -1720,6 +1720,27 @@ static int xpad_start_input(struct usb_xpad *xpad)
> >  			return error;
> >  		}
> >  	}
> > +	if (xpad->xtype == XTYPE_XBOX360) {
> > +		/*
> > +		 * Some third-party controllers Xbox 360-style controllers
> > +		 * require this message to finish initialization.
> > +		*/
> > +		u8 dummy[20];
> > +
> > +		error = usb_control_msg_recv(xpad->udev, 0,
> > +					     /* bRequest */ 0x01,
> > +					     /* bmRequestType */
> > +					     USB_TYPE_VENDOR | USB_DIR_IN |
> > +						USB_RECIP_INTERFACE,
> > +					     /* wValue */ 0x100,
> > +					     /* wIndex */ 0x00,
> > +					     dummy, sizeof(dummy),
> > +					     25, GFP_KERNEL);
> > +		if (error)
> > +			dev_warn(&xpad->dev->dev,
> > +				 "unable to receive magic message: %d\n",
> > +				 error);
> > +	}
> >  
> >  	return 0;
> >  }
> 
> It's been a month and this fixed version of the patch never got any
> replies. Did it just get overlooked? Or does the fact that the old
> version got reverted mean I need to change the description in some
> capacity?

Yes, because the original patch was reverted you need to adjust the
patch/description and resubmit as a new patch.

Thanks.

-- 
Dmitry
