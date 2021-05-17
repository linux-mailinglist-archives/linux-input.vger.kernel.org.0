Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25770382A0B
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 12:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236218AbhEQKn0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 06:43:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:52518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236441AbhEQKnZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 06:43:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A0FF61028;
        Mon, 17 May 2021 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621248128;
        bh=pIR6VuQNypfJQ9IxKiYW045odyC4QjKoJjUL3QZtNTg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yi1X749v2gwM9rrb2WIg9lqiczgnQd+9B8EvjxRi9dVkXOD3Kiwp0dyQUsGmc7Yvb
         N/9OXw6+VZzTDREMe2p5OHo474MjnQ/R1mC6sPfnICRuE1d/+Y+k+sc9Z7Q0JQWvu3
         niR2j41ZsSLgCBZ+3Dy6DqMYEi6ZMsj0okmFNFhc=
Date:   Mon, 17 May 2021 12:42:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?6ams5by6?= <maqianga@uniontech.com>
Cc:     jikos <jikos@kernel.org>,
        "benjamin.tissoires " <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: Re: [PATCH] HID: usbhid: enable remote wakeup for mouse
Message-ID: <YKJIfmkiDbqzlDjC@kroah.com>
References: <20210517060145.32359-1-maqianga@uniontech.com>
 <YKIwIwx+nLyX/9LG@kroah.com>
 <1547909475.114060.1621244274064.JavaMail.xmail@bj-wm-cp-4>
 <YKI7WJa+YTRhwm5M@kroah.com>
 <1781917892.119659.1621247946603.JavaMail.xmail@bj-wm-cp-4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1781917892.119659.1621247946603.JavaMail.xmail@bj-wm-cp-4>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 17, 2021 at 06:39:06PM +0800, 马强 wrote:
> 
> > >  
> 
> > > Thanks for the prompt response.  
> > >  
> > > We can change "dev->power.should_wakeup" to enabled,  
> >
> > I do not understand this statement.  
> >
> > > but ultimately it depends on the hardware and BIOS for wakeup.  
> >
> > Yes, and the hardware here (USB mice), do not all support this, so you  
> > can not enable it universally as it will cause problems, right?  
> 
> I mean, the kernel should set should_wakeup to enabled
> 
> so that system can be awakened when the hardware here(USB mice) supports the
> wake-up ability.

And how do you determine, in the kernel, if the mouse can do that?

What range of hardware did you test this change with?

thanks,

greg k-h
