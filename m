Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6000F15AA52
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 14:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgBLNrg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 08:47:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:40602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727439AbgBLNrf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 08:47:35 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9508C206B6;
        Wed, 12 Feb 2020 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581515255;
        bh=ro3LSlOyjGaCnmdhkZyiUrM+ZZXKFjz46uFU39iMKSc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=sz2rx/U/NGWhMakQft6YyTpSCHRYBu+NylRYYK0/D4m6mbpHGa/ErjQsUwaSaFst6
         n0SFofDSuom4AsQlEdekNhRhS/SQiy/1l87CSIy24mgfnNH8r0GObHfjIfokCZxOED
         oWN1TZab3PAer0lf88toG1SWinsmGcu6X/fNUu2M=
Date:   Wed, 12 Feb 2020 14:47:31 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        syzbot <syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com>
cc:     Alan Stern <stern@rowland.harvard.edu>, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: hiddev: Fix race in in hiddev_disconnect()
In-Reply-To: <20200115174628.zxpxbpa6bwspjajg@kili.mountain>
Message-ID: <nycvar.YFH.7.76.2002121447190.3144@cbobk.fhfr.pm>
References: <20200115174628.zxpxbpa6bwspjajg@kili.mountain>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 15 Jan 2020, Dan Carpenter wrote:

> Syzbot reports that "hiddev" is used after it's free in hiddev_disconnect().
> The hiddev_disconnect() function sets "hiddev->exist = 0;" so
> hiddev_release() can free it as soon as we drop the "existancelock"
> lock.  This patch moves the mutex_unlock(&hiddev->existancelock) until
> after we have finished using it.
> 
> Reported-by: syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com
> Fixes: 7f77897ef2b6 ("HID: hiddev: fix potential use-after-free")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-5.6/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

