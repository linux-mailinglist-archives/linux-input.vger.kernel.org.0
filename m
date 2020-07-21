Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EFD227A9E
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 10:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGUI1m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 04:27:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:47278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbgGUI1l (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 04:27:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9CC020714;
        Tue, 21 Jul 2020 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595320061;
        bh=I//y4Qz9IX3t5JUGItlkn56iaw4KzS5UTrB2SAe8gE0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZZ8dhI+wal+AI55W5FodivCmeA2FeWazjf13Whvz4nwT+n98ai3vcEajtLEkooEfm
         MYaweIeafs7EzhiCx0DDNFoEM0BT1F/NJBNlBCGUqptvv3EKrIrZC6vG5RpH4KSa94
         cc+eRTfXXuELKC/3njxKlGn7diDrnEoOoyXLpC/s=
Date:   Tue, 21 Jul 2020 10:27:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] usbhid: Fix slab-out-of-bounds
 write in hiddev_ioctl_usage()
Message-ID: <20200721082749.GB1659990@kroah.com>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720115400.GI2549@kadam>
 <20200720121257.GJ2571@kadam>
 <20200720191656.GA3366@PWN>
 <20200721071637.GK2571@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721071637.GK2571@kadam>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 21, 2020 at 10:16:37AM +0300, Dan Carpenter wrote:
> For some reason the reply-to header on your email is bogus:
> 
> Reply-To: 20200720121257.GJ2571@kadam
> 
> "kadam" is a system on my home network.

That's your message-id :)

