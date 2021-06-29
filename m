Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71663B73BA
	for <lists+linux-input@lfdr.de>; Tue, 29 Jun 2021 16:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhF2OGE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Jun 2021 10:06:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhF2OGC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Jun 2021 10:06:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC84561DBC;
        Tue, 29 Jun 2021 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624975415;
        bh=AOf1hLbhW8ExMxmDRBQFjznQog2wDILxU65eq6cY/QM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fuzMYFmPIQtg4+mUaELuVt0DYOhFp6lZ8vZZc/m61WUVMee5+6WEHUdo6pVk0mbIF
         Pije2vvBU4y7IFtpZKeBphPrG4vxCjVUO8qHzobb63lTEVHUrqGTcLvt2lH2FVA51P
         RgLzyRDx/z0dElEI3KkouNdPrH9G5UMI2rQgYbrSoTJ6qUmFtZnp6rZt9vNrEmEfqx
         c4ax7fDaw5nNhUZgF9v1gyMx4MDINQAezUxnxiZL++TkPwVbqjyf6Vu+R3tD6LX098
         6A9kwO7nYjQaMnhx9VpaWzp99WOdqEmjZbwEC/wZj2GjGA5EmpkgNoHfY2NXJL6edF
         Rias1XxwBG0Sw==
Date:   Tue, 29 Jun 2021 09:05:25 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Joe Perches <joe@perches.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH][next] Input: Fix fall-through warning for Clang
Message-ID: <20210629140525.GA65130@embeddedor>
References: <20210607214852.GA65141@embeddedor>
 <91eef5ab3143ae8fadb8eb2969aecba5f3e7ad98.camel@perches.com>
 <YMfUT7pvBWreiR1K@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YMfUT7pvBWreiR1K@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 14, 2021 at 03:12:31PM -0700, Dmitry Torokhov wrote:
> Hi Joe,
> 
> On Mon, Jun 07, 2021 at 03:02:40PM -0700, Joe Perches wrote:
> > On Mon, 2021-06-07 at 16:48 -0500, Gustavo A. R. Silva wrote:
> > > In preparation to enable -Wimplicit-fallthrough for Clang, fix a
> > > warning by explicitly adding a fallthrough; statement.
> > []
> > > diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
> > []
> > > @@ -660,6 +660,7 @@ static int sw_connect(struct gameport *gameport, struct gameport_driver *drv)
> > >  					fallthrough;
> > >  				case 45:				/* Ambiguous packet length */
> > >  					if (j <= 40) {			/* ID length less or eq 40 -> FSP */
> > > +					fallthrough;
> > >  				case 43:
> > >  						sw->type = SW_ID_FSP;
> > >  						break;
> > 
> > Yuck.  Super ugly.  There's no need to play games with indentation.
> 
> Yeah, the original code is not pretty :(

Isn't this a Duff device for performance[1]?

In which case it might be better not to modify it and just go
with the fallthrough marking?

Another similar case can be found at
drivers/scsi/aic94xx/aic94xx_sds.c:714:

 714 static void *asd_find_ll_by_id(void * const start, const u8 id0, const u8 id1)
 715 {
 716         struct asd_ll_el *el = start;
 717
 718         do {
 719                 switch (id1) {
 720                 default:
 721                         if (el->id1 == id1)
 722                 case 0xFF:
 723                                 if (el->id0 == id0)
 724                                         return el;
 725                 }
 726                 el = start + le16_to_cpu(el->next);
 727         } while (el != start);
 728
 729         return NULL;
 730 }

--
Gustavo

[1] https://www.drdobbs.com/a-reusable-duff-device/184406208

> 
> > 
> > Perhaps the simpler:
> > 
> > 				case 43:
> > 					sw->type = SW_ID_FSP;
> > 					break;
> > 				case 45:				/* Ambiguous packet length */
> > 					if (j <= 40) {			/* ID length less or eq 40 -> FSP */
> > 						sw->type = SW_ID_FSP;
> > 						break;
> > 					}
> > 					sw->number++;
> > 					fallthrough;
> > 
> > 
> 
> Could you resubmit this version properly formatted?
> 
> Thanks.
>  
> -- 
> Dmitry
