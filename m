Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4AC429EDA7
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 14:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgJ2Nx2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 09:53:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725300AbgJ2Nx2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 09:53:28 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C5D92076A;
        Thu, 29 Oct 2020 13:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603979605;
        bh=I1TLmixXOBKPdf1EpArD7mgfV14HIqnNUN5GULknKVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g4eoIJwrM+gIrcTvb/nG1LtR+vN0fqgQsXKQvorEwPzj8XH2J6kFh9ismrGYZMr9n
         xnXBhgNfmlQnZ+mR7L6Z61Mw12YII4AK5b/ijcJLfl7F9ATxAfq3xi7NCI21Cl/6Q9
         h5seO/Duunl9SwhYxbWmEoP27f5NH4iK9dHwwpmA=
Date:   Thu, 29 Oct 2020 14:54:15 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "hj2.im@samsung.com" <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        Jungrae Kim <jryu.kim@samsung.com>
Subject: Re: [PATCH v2] input: add 2 kind of switch
Message-ID: <20201029135415.GA3470996@kroah.com>
References: <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
 <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
 <j4-zngLfuvM3x15SD8ezJ__FTdOdLCudaTGBvuotwzYwnYFusBe655vH3UahNgtBzB8n6VpfoV7iS1tPXvv-0R8T7-RsvMDxnTZ-Zo-xs4o=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <j4-zngLfuvM3x15SD8ezJ__FTdOdLCudaTGBvuotwzYwnYFusBe655vH3UahNgtBzB8n6VpfoV7iS1tPXvv-0R8T7-RsvMDxnTZ-Zo-xs4o=@protonmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 29, 2020 at 01:41:57PM +0000, Barnabás Pőcze wrote:
> Hi
> 
> > [...]
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
> > +#define SW_MAX			0x12
> >  #define SW_CNT			(SW_MAX+1)
> > [...]
> 
> This part of the patch conflicts with another one:
> https://lore.kernel.org/linux-input/20201026144512.621479-1-markpearson@lenovo.com/

Is that merged?  If not, it's fine as-is until then, and someone has to
pick to go first :)

But, most importantly, the questions asked last time about this patch
have not been addressed at all :(

thanks,

greg k-h
