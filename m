Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC79142EEA3
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 12:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbhJOKSO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 06:18:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237936AbhJOKSN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 06:18:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA6466101E;
        Fri, 15 Oct 2021 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634292967;
        bh=ENS+gbfMkK4bdqfhnKDhAV6PyJn5YD2/qxDu/E5iwkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZXZGmFMwyPNcdI8NrGBvjMZMXwgo3W2xmRf/ZqXUfWmSuQJzfwasE3nTs2I67xmWc
         zu84MhNlu6yvWgMLJ0kZ5H4QQ8L2Nul7KnRJ0q5Ml+8fCf3nx+NwQjuO7PeQvOSkZs
         iHdL/KtceqAdmP04Vy3XxoHw3vLgDYrSYJWAbEKQ=
Date:   Fri, 15 Oct 2021 12:16:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     changlianzhi <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWlU5AJ4MzNv2qw6@kroah.com>
References: <20211015083613.7429-1-changlianzhi@uniontech.com>
 <YWk+qaUnN+M/dX9o@kroah.com>
 <616942b2.1c69fb81.dfbff.25afSMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <616942b2.1c69fb81.dfbff.25afSMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 15, 2021 at 04:57:17PM +0800, changlianzhi wrote:
> 
> On 2021/10/15 下午4:41, Greg KH wrote:
> > On Fri, Oct 15, 2021 at 04:36:13PM +0800, lianzhi chang wrote:
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
> > > The latest changes:
> > > (1) Move the definition of ledstate to the input module (/drivers/input/input.c),
> > > and set or get its value through the input_update_ledstate and input_get_ledstate
> > > functions.
> > > (2) To update the ledstate reference in keyboard.c, you must first get the value
> > > through input_get_ledstate.
> > > (3) Other necessary changes
> > You have not changed the subject line at all.
> > 
> > Look at how others submit patches that are new versions on the mailing
> > list, and most importantly, read the documentation we have about this.
> > 
> > thanks,
> > 
> > greg k-h
> 
> 
> Sorry, because the emails I send using the mail client are always bounced
> back, I can only use git send-email to send emails. Haven't found a way to
> modify the theme. very sorry.

git send-email works just for for v2 and so on, it will send whatever
you make the patch text file to look like.

thanks,

greg k-h
