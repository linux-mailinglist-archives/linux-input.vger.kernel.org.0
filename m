Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17AF29523D
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 20:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504098AbgJUSam (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Oct 2020 14:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504097AbgJUSal (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Oct 2020 14:30:41 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9DFC0613CE;
        Wed, 21 Oct 2020 11:30:40 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id a200so1976138pfa.10;
        Wed, 21 Oct 2020 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7auQJthfmTNlSrtZ+CH9jxeOG8noGxVhPXlUtJljNLQ=;
        b=U2+yKRmFictz7rO5Qa1eHHO+g687tvv4q7eJusa4a5RFmEyinImylGfjU1gZmPxsVD
         HkWbQDzSQIOHYRGjqVD5fW5fI8SQmyeiNP/KaFfiJBqIhbzI1KySCFcK5HVBiH4FziJr
         LZFSSonc7xSIhbR0TrmIUElcmZJ6RDhuiZsHD8ylDrDeHKsUDPuTuJL9+CHuQwVO4ZFf
         HGsmhufQp4L9tEw6UeJkUy5nPPwdWTeurk00ZNrYib/BkXxWvIDQb7cSjcwwrZ8iv5XW
         8ZKA2fhMCKScC0I0Q4uxwhnfLk8nYWWw5OQIFJ5fBUgJV955DI/6VR+EtbR4rmFTISIG
         Oo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7auQJthfmTNlSrtZ+CH9jxeOG8noGxVhPXlUtJljNLQ=;
        b=fhPhwIWNTAojZsF+zmMLBy3O+GceV6qa8FPZzeTvnEo+TdhIp3cGIgUau/Vcerd7dj
         FUkPV1wlKYBypNSnVwpedVvq8lqvd0oLmIYOWWiWIrS1zZp9Se9yDSfK+dpoDfW6JIqe
         BWBb3x+qdWvdC+CaeUAfzcgOI5mxfji8ifSFn8jxV0vTPfooHdH9sIxbkr54If+cJ5No
         KTaynAToxn4GD/2EC7oWFd87XcoRjfK1jrzDCrxKHvJ/cxs2Svt2i2Nf7/ru7ZhFe5RF
         o7aW0M36cRAuq8oLQyC1o2EHw/UDHkEIqwyAbgfOYJ2zQ16R7ic3kID7e6DFDOqCuDSS
         /m0w==
X-Gm-Message-State: AOAM532UMYLpWWa+GSRaq0ZSkMS4HF65e6XVxmIsqRpJnwouSFN2DNj5
        EV6bmepREPm9+NIS/YFy9zo=
X-Google-Smtp-Source: ABdhPJwjy0srkrpDtLu7hBRBR4lSEkm2y9cp2TVseV9ovxZ2N5bPwPUmgJ4ymJAjuowJLkFE6kLMhQ==
X-Received: by 2002:aa7:9a4a:0:b029:155:323e:adae with SMTP id x10-20020aa79a4a0000b0290155323eadaemr4826408pfj.70.1603305039857;
        Wed, 21 Oct 2020 11:30:39 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u5sm2675141pjn.15.2020.10.21.11.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 11:30:39 -0700 (PDT)
Date:   Wed, 21 Oct 2020 11:30:36 -0700
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     HyungJae Im <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>
Subject: Re: [PATCH] FROMLIST: input: add 2 kind of switch
Message-ID: <20201021183036.GB444962@dtor-ws>
References: <CGME20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935@epcms1p5>
 <20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935@epcms1p5>
 <20201021051035.GA966058@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021051035.GA966058@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 21, 2020 at 07:10:35AM +0200, gregkh@linuxfoundation.org wrote:
> On Wed, Oct 21, 2020 at 12:12:16PM +0900, HyungJae Im wrote:
> > >From ec9859ee01b7bc0e04255971e0fe97348847dab7 Mon Sep 17 00:00:00 2001
> 
> You sent this 3 times, why?
> 
> And why is this in the body of the email, have you read the "how to send
> your first kernel patch" document at kernelnewbies.org?
> 
> > From: "hj2.im" <hj2.im@samsung.com>
> > Date: Tue, 20 Oct 2020 16:57:04 +0900
> > Subject: [PATCH] FROMLIST: input: add 2 kind of switch
> 
> What does "FROMLIST:" mean?
> 
> > 
> > We need support to various accessories on the device,
> > some switch does not exist in switch list.
> > So added switch for the following purpose.
> > 
> > SW_COVER_ATTACHED is for the checking the cover
> > attached or not on the device. SW_EXT_PEN_ATTACHED is for the
> > checking the external pen attached or not on the device
> > 
> > Signed-off-by: hj2.im <hj2.im@samsung.com>
> 
> As per the kernel documentation, you need to use your real name here,
> please do so.
> 
> > ---
> >  include/linux/mod_devicetable.h        | 2 +-
> >  include/uapi/linux/input-event-codes.h | 4 +++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> > index 5b08a473cdba..897f5a3e7721 100644
> > --- a/include/linux/mod_devicetable.h
> > +++ b/include/linux/mod_devicetable.h
> > @@ -320,7 +320,7 @@ struct pcmcia_device_id {
> >  #define INPUT_DEVICE_ID_LED_MAX		0x0f
> >  #define INPUT_DEVICE_ID_SND_MAX		0x07
> >  #define INPUT_DEVICE_ID_FF_MAX		0x7f
> > -#define INPUT_DEVICE_ID_SW_MAX		0x10
> > +#define INPUT_DEVICE_ID_SW_MAX		0x12
> >  #define INPUT_DEVICE_ID_PROP_MAX	0x1f
> >  
> >  #define INPUT_DEVICE_ID_MATCH_BUS	1
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> > index 0c2e27d28e0a..8ca2acee1f92 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -889,7 +889,9 @@
> >  #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
> >  #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
> >  #define SW_MACHINE_COVER	0x10  /* set = cover closed */
> > -#define SW_MAX			0x10
> > +#define SW_COVER_ATTACHED	0x11  /* set = cover attached */
> > +#define SW_EXT_PEN_ATTACHED	0x12  /* set = external pen attached */
> 
> Is there an in-kernel user for these values anywhere?  Please submit
> this patch along with the users at the same time, otherwise this change
> makes no sense at all.

It kind of does, as nowadays most uses come from DT, not from
hard-coding in drivers. However I need to better understand the intended
use of this. How SW_COVER_ATTACHED differs from SW_MACHINE_COVER and the
same for SW_PEN_INSERTED SW_EXT_PEN_ATTACHED.

Thanks.

-- 
Dmitry
