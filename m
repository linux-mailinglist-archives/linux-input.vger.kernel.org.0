Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB76B382B5F
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 13:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhEQLpc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 07:45:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:40800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229681AbhEQLpb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 07:45:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0117161073;
        Mon, 17 May 2021 11:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621251855;
        bh=fKCrMo6p14G4Wd3Gph0gHVlY5XhhTyAJlztAR6yNqIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ySmJsb6Kq26EFm75VotlrybSRJYh9BgyTdlHhhH1MYiuz7pXDnCD+DVn0/RjC/u+7
         0YrvQkCqZDtfqjQ9KBwfwVmklm9WARziPOoZMZXgVnCNvshItrkREl0xwJA80tm6mT
         o4qI1b9MOjKrbOvel2+o9I6Vme+mJico4N/bPci4=
Date:   Mon, 17 May 2021 13:44:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?6ams5by6?= <maqianga@uniontech.com>
Cc:     jikos <jikos@kernel.org>,
        "benjamin.tissoires " <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: Re: Re: Re: [PATCH] HID: usbhid: enable remote wakeup for
 mouse
Message-ID: <YKJXDT/xuzw1Gi+8@kroah.com>
References: <20210517060145.32359-1-maqianga@uniontech.com>
 <YKIwIwx+nLyX/9LG@kroah.com>
 <1547909475.114060.1621244274064.JavaMail.xmail@bj-wm-cp-4>
 <YKI7WJa+YTRhwm5M@kroah.com>
 <1781917892.119659.1621247946603.JavaMail.xmail@bj-wm-cp-4>
 <YKJIfmkiDbqzlDjC@kroah.com>
 <440071991.120491.1621248757251.JavaMail.xmail@bj-wm-cp-4>
 <YKJRLMoohNUp4I/t@kroah.com>
 <671637326.122188.1621250895330.JavaMail.xmail@bj-wm-cp-4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <671637326.122188.1621250895330.JavaMail.xmail@bj-wm-cp-4>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 17, 2021 at 07:28:15PM +0800, 马强 wrote:
> 
> > Given that you have not tested this change, why should we take this? 
> 
> 
> I have tested this change.
> 
> Before adding the patch, "dev->power.should_wakeup" is disabled after the
> insertion of the USB mouse,
> 
> and after adding the patch, "dev->power.should_wakeup" is enabled after the
> insertion of the USB mouse.
> 
>  
>  
> 

How many different mice did you test this on?  What specific models?

Again, this is not a requirement of all Mice devices, as it is not a
requirement of the USB specification, which is why we can not enable it
for all devices of this type.

And no other operating system does so either that I know of.  Do you
know of one?

thanks,

greg k-h
