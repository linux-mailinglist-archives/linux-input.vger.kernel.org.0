Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C2F42EAFD
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 10:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236615AbhJOIHU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 04:07:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:32984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236665AbhJOIHJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 04:07:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 583BE610D2;
        Fri, 15 Oct 2021 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634285100;
        bh=u5fuOrCinZRN4ATl5DIzbkv1xnAp5VPMYx2WeVQ6J88=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=St1fZJfR3DWNpvjfYIJm57w+gErtzT9iFnqDvb0tLbodrivkqv5dDpfF0+N7fu0mB
         86VZOyOUlwoj704K1El+rtvw795t/bVxua0lJ0qsMIVzAX15qj4BFywq8j6/JEyb2J
         6U3BuLkkIay3LVUc2XTY0sVOx6K4mXMaLrVwRvcE=
Date:   Fri, 15 Oct 2021 10:04:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     changlianzhi <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWk2Ksxw3yWxWHDp@kroah.com>
References: <20211015064534.26260-1-changlianzhi@uniontech.com>
 <YWklQYRE87UJ6HRz@kroah.com>
 <616934f3.1c69fb81.59ff6.49d9SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <616934f3.1c69fb81.59ff6.49d9SMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 15, 2021 at 03:59:38PM +0800, changlianzhi wrote:
> 
> On 2021/10/15 下午2:52, Greg KH wrote:
> > On Fri, Oct 15, 2021 at 02:45:34PM +0800, lianzhi chang wrote:
> > > Switching from the desktop environment to the tty environment,
> > > the state of the keyboard led lights and the state of the keyboard
> > > lock are inconsistent. This is because the attribute kb->kbdmode
> > > of the tty bound in the desktop environment (xorg) is set to
> > > VC_OFF, which causes the ledstate and kb->ledflagstate
> > > values of the bound tty to always be 0, which causes the switch
> > > from the desktop When to the tty environment, the LED light
> > > status is inconsistent with the keyboard lock status.
> > > 
> > > Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
> > > ---
> > >   drivers/input/input.c     | 46 ++++++++++++++++++++++++++++++++++++++-
> > >   drivers/tty/vt/keyboard.c | 19 ++++++++++++++--
> > >   include/linux/input.h     |  3 +++
> > >   3 files changed, 65 insertions(+), 3 deletions(-)
> > Hi,
> > 
> > This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> > a patch that has triggered this response.  He used to manually respond
> > to these common problems, but in order to save his sanity (he kept
> > writing the same thing over and over, yet to different people), I was
> > created.  Hopefully you will not take offence and will fix the problem
> > in your patch and resubmit it so that it can be accepted into the Linux
> > kernel tree.
> > 
> > You are receiving this message because of the following common error(s)
> > as indicated below:
> > 
> > - This looks like a new version of a previously submitted patch, but you
> >    did not list below the --- line any changes from the previous version.
> >    Please read the section entitled "The canonical patch format" in the
> >    kernel file, Documentation/SubmittingPatches for what needs to be done
> >    here to properly describe this.
> > 
> > If you wish to discuss this problem further, or you have questions about
> > how to resolve this issue, please feel free to respond to this email and
> > Greg will reply once he has dug out from the pending patches received
> > from other developers.
> > 
> > thanks,
> > 
> > greg k-h's patch email bot
> > 
> 
> >>The latest changes:
> >>(1) Move the definition of ledstate to the input module
> (/drivers/input/input.c), and set or get its value through the
> input_update_ledstate and input_get_ledstate functions.
> >>(2) To update the ledstate reference in keyboard.c, you must first get the
> value through input_get_ledstate.
> >>(3) Other necessary changes

I do not want to see this here, it needs to go into the patch you submit
as the documentation says to.  Read the link that the bot pointed you at
above please...
