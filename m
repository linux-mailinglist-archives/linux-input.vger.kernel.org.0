Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0C31CE075
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 18:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730627AbgEKQ3m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 12:29:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729463AbgEKQ3m (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 12:29:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC57C206D7;
        Mon, 11 May 2020 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589214582;
        bh=n0T8CPx7nqEYjHPik6TeHQbKTFQFAYFcFOayQjf9Xf8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J1iuz8NWX+oX7wZRn4+AGLJxrhVXEBjhCQJlZ7HNsgp/eEGUkm582Ty5ESsqEsDRO
         Na7eHYXDF4xwf4FRWeULbtggxY15/OGgKJbpOIA22Mfvpv1TQDUy1FoDKoFs+9Bx2p
         xyhsXkg4wOF5q1vkJtaIQmpDXq5px0FyJ02W81MY=
Date:   Mon, 11 May 2020 18:20:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        kernel@collabora.com
Subject: Re: [PATCH 5/6] tty/sysrq: Add configurable handler to signal a
 process
Message-ID: <20200511162017.GB2221063@kroah.com>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
 <20200511135918.8203-6-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511135918.8203-6-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 11, 2020 at 03:59:17PM +0200, Andrzej Pietrasiewicz wrote:
> Some userland might want to implement a policy to signal a configured
> process with a configured signal. This patch adds necessary kernel-side
> infrastructure and the newly added handler is triggered with
> Alt-Shift-SysRq-s. Optionally the userland can also specify the expected
> name of parent process of the victim.

THat's crazy, what "userspace" wants to do something like this that
can't just do it by running a program?  Why force the kernel to do it
for them?

And you don't document any of this :(

greg k-h
