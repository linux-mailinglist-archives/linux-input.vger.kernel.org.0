Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F77A382AC6
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 13:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236623AbhEQLU1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 07:20:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:34588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236528AbhEQLU1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 07:20:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9033611CA;
        Mon, 17 May 2021 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621250350;
        bh=0DgojqgUOV8kKtdojQtC3GoH2zxJez/TBhgucSCiSrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AFozVQlnqNNIZ10tyE79qLmerQziYQ1zI/NJvQSnVEuoliw7AENpF3tRTzmXsYG1e
         U4wABEEzB9uCo6BhanaRh+0T6VTyKjJUgEz2VUPGozXyTvHNrCxUwFE+ohEBEVLGbU
         Z+Tf1nwYAItr6P+Ki2OXXvnKKAITKnOX3hvOcNmk=
Date:   Mon, 17 May 2021 13:19:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?6ams5by6?= <maqianga@uniontech.com>
Cc:     jikos <jikos@kernel.org>,
        "benjamin.tissoires " <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: Re: Re: [PATCH] HID: usbhid: enable remote wakeup for mouse
Message-ID: <YKJRLMoohNUp4I/t@kroah.com>
References: <20210517060145.32359-1-maqianga@uniontech.com>
 <YKIwIwx+nLyX/9LG@kroah.com>
 <1547909475.114060.1621244274064.JavaMail.xmail@bj-wm-cp-4>
 <YKI7WJa+YTRhwm5M@kroah.com>
 <1781917892.119659.1621247946603.JavaMail.xmail@bj-wm-cp-4>
 <YKJIfmkiDbqzlDjC@kroah.com>
 <440071991.120491.1621248757251.JavaMail.xmail@bj-wm-cp-4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <440071991.120491.1621248757251.JavaMail.xmail@bj-wm-cp-4>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 17, 2021 at 06:52:37PM +0800, 马强 wrote:
> 
> > >  
> 
> > > > >  
> > >  
> > > > > Thanks for the prompt response.  
> > > > >  
> > > > > We can change "dev->power.should_wakeup" to enabled,  
> > > >  
> > > > I do not understand this statement.  
> > > >  
> > > > > but ultimately it depends on the hardware and BIOS for wakeup.  
> > > >  
> > > > Yes, and the hardware here (USB mice), do not all support this, so you  
> > > > can not enable it universally as it will cause problems, right?  
> > >  
> > > I mean, the kernel should set should_wakeup to enabled  
> > >  
> > > so that system can be awakened when the hardware here(USB mice) supports
> the  
> > > wake-up ability.  
> > 
> > And how do you determine, in the kernel, if the mouse can do that?  
> > 
> > What range of hardware did you test this change with?  
>  
> At the kernel level, "dev->power.should_wakeup" is the device property
> 
> that should enable the wake-up capability. 
> 


Given that you have not tested this change, why should we take this?
