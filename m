Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD5142EC3C
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 10:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbhJOI2Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 04:28:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:53204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236976AbhJOI2A (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 04:28:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1F8B6115C;
        Fri, 15 Oct 2021 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634286354;
        bh=aBYrQ1RwqNb90dGA4folI8lt2W24F5L9RUAriOorGhY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DwlwWIyprCEyaubGD9kSzHTWNUl9r4q45c5FPl8E9+1tAgWAqCfnzgDqvPwbQlN63
         b61pF8n3+ODMXl3Re3acQAdieDRTjXbFGNFUzXJvogmJWmPfSXe89xSEE7+jILyJAB
         EsJld7VitKjSI32hSlaxOarQwX2pDMij9nlErECk=
Date:   Fri, 15 Oct 2021 10:25:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     changlianzhi <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWk7D09iprF3P0pH@kroah.com>
References: <61693925.1c69fb81.a058.27f2SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61693925.1c69fb81.a058.27f2SMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 15, 2021 at 04:16:35PM +0800, changlianzhi wrote:
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
> drivers/input/input.c | 46 ++++++++++++++++++++++++++++++++++++++-
> drivers/tty/vt/keyboard.c | 19 ++++++++++++++--
> include/linux/input.h | 3 +++
> 3 files changed, 65 insertions(+), 3 deletions(-)

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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

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
