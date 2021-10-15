Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA4F42E96A
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 08:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233931AbhJOGy6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 02:54:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:34678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233916AbhJOGy5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 02:54:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E7636108B;
        Fri, 15 Oct 2021 06:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634280771;
        bh=kJLNNbvPPxCqKxbEnHqwodixRci4rQ5VNfWqTPDU11U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=npfqi6Bwgq784kVm6QnBH/YRbtpYfPoX2HhfQmec2i/s0SBnhQKUpNASSu47zYWrZ
         VjN2sAEgsEbQwBd26MSIdXODu5UBkjlsRS4aoaZKGDkSNuZOInJ33I3doI2KkeEPMm
         SaVLTIa/gm5QnPFgoz8g/CNrrOJdNG7Mx7MVzdCA=
Date:   Fri, 15 Oct 2021 08:52:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     lianzhi chang <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWklQYRE87UJ6HRz@kroah.com>
References: <20211015064534.26260-1-changlianzhi@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015064534.26260-1-changlianzhi@uniontech.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 15, 2021 at 02:45:34PM +0800, lianzhi chang wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to
> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.
> 
> Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
> ---
>  drivers/input/input.c     | 46 ++++++++++++++++++++++++++++++++++++++-
>  drivers/tty/vt/keyboard.c | 19 ++++++++++++++--
>  include/linux/input.h     |  3 +++
>  3 files changed, 65 insertions(+), 3 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
