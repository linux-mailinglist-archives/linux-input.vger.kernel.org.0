Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19FF8281330
	for <lists+linux-input@lfdr.de>; Fri,  2 Oct 2020 14:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgJBMya (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Oct 2020 08:54:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:55356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgJBMya (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 2 Oct 2020 08:54:30 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F06F206DC;
        Fri,  2 Oct 2020 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601643269;
        bh=/Jvd9G9vUFWXYH5i7FKo0KxfQOgjboDZb1vy3XQqRlk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VnY1FpYHzs6Ieq/+EBAxAkkAD4q0eS2uCEMO8wYPuxZXlCeYbnXhfCdX6NHDZmy63
         n+H0AQyi6jdj/714c0StkOlwRukAxpH/axKD3SL1UULk63tlTRt/2kZPUqv+Tfd9mN
         O3fnmruZjie9EsvFmkvGtEd2FZMe9Hv2FSxB3Dvw=
Date:   Fri, 2 Oct 2020 14:54:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jiri Slaby <jslaby@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com
Subject: Re: [PATCH v3 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
Message-ID: <20201002125429.GA3350322@kroah.com>
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20200818112825.6445-3-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818112825.6445-3-andrzej.p@collabora.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 18, 2020 at 01:28:25PM +0200, Andrzej Pietrasiewicz wrote:
> Userland might want to execute e.g. 'w' (show blocked tasks), followed
> by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
> upon a single magic SysRq. Or one might want to execute the famous "Raising
> Elephants Is So Utterly Boring" action. This patch adds a configurable
> handler, triggered with 'C', for this exact purpose. The user specifies the
> composition of the compound action using syntax similar to getopt, where
> each letter corresponds to an individual action and a colon followed by a
> number corresponds to a delay of that many milliseconds, e.g.:
> 
> ws:1000c
> 
> or
> 
> r:100eis:1000ub

A macro language for sysrq commands, who would have thought...

Anyway, _why_ would userland want to do something so crazy as this?
What is the use-case here?

thanks,

greg k-h
