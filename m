Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDDA1DFE93
	for <lists+linux-input@lfdr.de>; Sun, 24 May 2020 13:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgEXLWs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 May 2020 07:22:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:50426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728405AbgEXLWs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 May 2020 07:22:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C0FF2076C;
        Sun, 24 May 2020 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590319367;
        bh=vxjidV+o2Zato0RAyIvJcJditbT+FyBOCaV10Y80YQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Im33GO9LfLxWwBjtMKGvnzdPvsLx2KCug4xfziF2buJwpIRRH1AJW+Gl0a+FVubuj
         SmdxHyT7QCnuLc+nmAXSAjCbEqziNmy7YCwakN/uS+p+2p4FUsj/Rv4SvRGOoNc6bG
         uf4o0tti7P7Ulw7CWsD3MU0CvIyBlNyTtvNTs7Q4=
Date:   Sun, 24 May 2020 13:22:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     syzbot <syzbot+20458a5eab138777efc9@syzkaller.appspotmail.com>
Cc:     brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        heikki.krogerus@linux.intel.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, rafael.j.wysocki@intel.com,
        rdunlap@infradead.org, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in evdev_cleanup
Message-ID: <20200524112244.GA1919625@kroah.com>
References: <0000000000007ae41505a66243fb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000007ae41505a66243fb@google.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, May 24, 2020 at 03:24:12AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    c11d28ab Add linux-next specific files for 20200522
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=14f54441100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6dbdea4159fb66
> dashboard link: https://syzkaller.appspot.com/bug?extid=20458a5eab138777efc9
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133e254a100000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15dbf016100000
> 
> The bug was bisected to:
> 
> commit 4ef12f7198023c09ad6d25b652bd8748c965c7fa
> Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Date:   Wed May 13 15:18:40 2020 +0000
> 
>     kobject: Make sure the parent does not get released before its children

All issues that point to this commit can be now marked invalid as it has
been reverted in Linus's tree.

thanks,

greg k-h
