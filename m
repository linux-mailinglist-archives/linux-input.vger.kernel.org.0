Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC53373CB2
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 15:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhEENxw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 09:53:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:41890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229559AbhEENxv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 09:53:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FB5D61182;
        Wed,  5 May 2021 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620222774;
        bh=Gj7r3JoBNNH/NvO1A6+1ai/VnVaPCAy9xJgwL9pQeKA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=V/I1JznnMXeCxJxcF4ehf7pq9OyPqj5camxPcOBX8nf8ZzqUMACaIcAniixPy7fX3
         Rg1+ohRLK0K4bEaeRPUUEP+Tx1OGF8gg0Ibynh2HeyhYLE/+YafXvfqWVvZwbats30
         U9ppPPijlASZ70Ftqh/PShUkdKSvo1N+UiUJFbvM4fOTzLHj0z8UGE8WsHZh74at34
         EZfkd2PW9/mBOii0GFBaBBGPeFLu/XNUB+ehNUjB6muur8s+JCEourzMoWzsjyUGyn
         g6g7W4I2UlLfffwzXYdWpsB1EQmMPTA388gNcrdltbAb3huTUJszxvkS3/3DzXqooK
         WS+E/6mBenLEw==
Date:   Wed, 5 May 2021 15:52:50 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Anirudh Rayabharam <mail@anirudhrb.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usbhid: fix info leak in hid_submit_ctrl
In-Reply-To: <CAO-hwJJKyLT4iG4DEhXGREPLVU8UASB8_gOFULmQ7hx2dYG7uw@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2105051552350.28378@cbobk.fhfr.pm>
References: <20210425173353.10231-1-mail@anirudhrb.com> <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm> <CAO-hwJJ4u5NZ-81Tq3PGu-F9r3iUSCiKp=JUsTfuVsyd-Sxsew@mail.gmail.com> <nycvar.YFH.7.76.2105051528090.28378@cbobk.fhfr.pm>
 <CAO-hwJJKyLT4iG4DEhXGREPLVU8UASB8_gOFULmQ7hx2dYG7uw@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 5 May 2021, Benjamin Tissoires wrote:

> > > I don't have a reproducer like syzbot has for the exact bug here, as I
> > > am relying on one real USB device to check if usbhid is not too broken.
> > > However, the test suite should catch if there is an error implied by the
> > > hid_report_len() change.
> >
> > Yes, that was exactly what I wanted to check, sorry for not being verbose
> > enough :)
> >
> > > Anyway, I manually started the job and will report when it is done.
> >
> 
> Heh, no problems.
> 
> "Job succeeded" \o/
> 
> Given that you are on a spree:

:-)

> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Applied to for-5.13/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

