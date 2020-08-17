Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD97246453
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 12:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgHQKVp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 06:21:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:53776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgHQKVo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 06:21:44 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 004132078A;
        Mon, 17 Aug 2020 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597659704;
        bh=ovtTW2fCfcjd32QufVbUkaQHW26qGINnQJXinpGHiU8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=zgDDLsZChMNRGx0G1LVTQMnzzPd6AUnV6kVFSIf1/2Ru0+ZBP5khL9w7417w94J0s
         bdmHmULUaaVykYETE0nrGpeGWYEUm6L3Nkbeyn2xBy3USAG0BBdiLfPUiNM1in1Pv9
         qkPUI9iYQZHpf116y4niqlpZwIsadmypTk/nchtM=
Date:   Mon, 17 Aug 2020 12:21:41 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Peilin Ye <yepeilin.cs@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 RESEND] usbhid: Fix slab-out-of-bounds
 write in hiddev_ioctl_usage()
In-Reply-To: <20200729113712.8097-1-yepeilin.cs@gmail.com>
Message-ID: <nycvar.YFH.7.76.2008171221290.27422@cbobk.fhfr.pm>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com> <20200729113712.8097-1-yepeilin.cs@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 29 Jul 2020, Peilin Ye wrote:

> `uref->usage_index` is not always being properly checked, causing
> hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.
> 
> Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v2:
>     - Add the same check for the `HIDIOCGUSAGE` case. (Suggested by
>       Dan Carpenter <dan.carpenter@oracle.com>)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

