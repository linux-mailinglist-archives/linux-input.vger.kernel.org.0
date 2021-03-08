Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0242D330A76
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 10:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhCHJqd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 04:46:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:49980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229740AbhCHJqB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 04:46:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00FBF65134;
        Mon,  8 Mar 2021 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615196761;
        bh=q6SWqhpUriM+vIzRFxbfC7AUvgDbLRAHIyb9SQHxCEc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=DtdUpaPh73JoTLX3MdtWcrqPc88fNEfptyZJKk9vaz+AI4wZAzyc8kH/R2twptM/I
         7bJk7KpepOVNL4i5Gqyy6C/j0zVUp48T2c9JIFQ/AuwUMv8gxdmisxr9P8EZMs30ly
         gMvst9/mZ4nA6XK78Ca3H3noYXi4CQJkJjZ1p4ZTGmIp9lTCgM8cl+W7aGfs4Hrd9l
         8WajQ8VUk4IePSZX1JcfqdnwzXIMQJQWyTtt/mJWzuYSWefYUS5Uu+vGGTmm6KtQuQ
         +VlQ/341JOCkPJa04OhqHO+Q5Yl2qKD5o7VL0+cjHNFezYdOfCbX39mH+d/rBzL33h
         vOZ1nK7s5/SkA==
Date:   Mon, 8 Mar 2021 10:45:57 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] HID: i2c-hid: acpi: Drop redundant ACPI_PTR()
In-Reply-To: <YD0S7U9CKHf5rKr6@smile.fi.intel.com>
Message-ID: <nycvar.YFH.7.76.2103081045440.12405@cbobk.fhfr.pm>
References: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com> <20210226193225.47129-4-andriy.shevchenko@linux.intel.com> <CAO-hwJLWbsj4kDkn3TKdEW0mDv6XdafQEaheCCC0Nyq3=YaOYQ@mail.gmail.com> <nycvar.YFH.7.76.2103011633490.12405@cbobk.fhfr.pm>
 <YD0S7U9CKHf5rKr6@smile.fi.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 1 Mar 2021, Andy Shevchenko wrote:

> > > > The driver depends on ACPI, ACPI_PTR() resolution is always the same.
> > > > Otherwise a compiler may produce a warning.
> > > >
> > > > That said, the rule of thumb either ugly ifdeffery with ACPI_PTR or
> > > > none should be used in a driver.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > Thanks a lot for the series. This indeed cleans things up.
> > 
> > Indeed, thanks.
> > 
> > > For the series:
> > > Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > 
> > > Jiri, I wonder where we want to land this one. This is not strictly
> > > bug fixes, but we could definitively sneak this one in 5.12-rc1.
> > > Well, I should probably run the series on an acpi laptop here before
> > > merging, but I'd like to know if delaying to 5.13 is OK or if we need
> > > this in 5.12.
> > 
> > I'd like to do it the standard way and have it bake in for-next to see if 
> > it really doesn't break anything, so unless there are convicing arguments 
> > for 5.12-rcX, I'd rathre queue this for 5.13.
> 
> For the record, I'm not in hurry with this, up to you how to proceed.
> Thanks!

Queued in for-5.13/i2c-hid. Thanks,

-- 
Jiri Kosina
SUSE Labs

