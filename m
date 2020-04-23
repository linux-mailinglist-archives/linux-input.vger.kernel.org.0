Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3151B58B1
	for <lists+linux-input@lfdr.de>; Thu, 23 Apr 2020 11:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgDWJ7M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Apr 2020 05:59:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:59238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726343AbgDWJ7M (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Apr 2020 05:59:12 -0400
Received: from pobox.suse.cz (unknown [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2583320776;
        Thu, 23 Apr 2020 09:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587635951;
        bh=h0cEpFyyTV9DIslKZvNsTAoxOPb/8EK4/m+d0jhEsZw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=mPzDOmfNMHch49qxZ6670ViWhek75QlHoYknXGyv0HzFtVpaMX6oSBnDFNvw+fOUv
         faDBVd/Kp+qO8ntHsLErzLvOHMuvoZfmWouAXkrIzHnL2lsQwzdoCgH4EpqEfeDHee
         YyB8W9SchtJ41Ny3gi+vPpE/WhC+kvXEd6VvxpeE=
Date:   Thu, 23 Apr 2020 11:59:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
cc:     syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Julian Squires <julian@cipht.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, andreyknvl@google.com,
        gregkh@linuxfoundation.org, ingrassia@epigenesys.com,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com, Ping Cheng <pingc@wacom.com>,
        pinglinux@gmail.com, killertofu@gmail.com
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
In-Reply-To: <Pine.LNX.4.44L0.2004221058240.20574-100000@netrider.rowland.org>
Message-ID: <nycvar.YFH.7.76.2004231157160.19713@cbobk.fhfr.pm>
References: <Pine.LNX.4.44L0.2004221058240.20574-100000@netrider.rowland.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 22 Apr 2020, Alan Stern wrote:

> > Jiri, you should know: Are HID drivers supposed to work okay when the
> > ->close callback is issued after (or concurrently with) the ->stop
> > callback?
> 
> No response.  

Sorry, I've been a bit swamped recently. Thanks a lot for taking care of 
this.

> I'll assume that strange callback orderings should be supported.  Let's 
> see if the patch below fixes the race in usbhid.

Unfortunately I don't believe the supportability of this is fully defined. 
I have tried to quickly go over the few major drivers and didn't find 
anything relying various orderings, but I might have easily missed some 
case.

So unless we have a programatic way to check it, the patch you created for 
mutual exclusion is a good bandaid I believe.

Thanks again Alan, I'll push it to Linus for 5.7.

-- 
Jiri Kosina
SUSE Labs

