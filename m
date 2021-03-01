Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A5A32829C
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 16:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237284AbhCAPfi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 10:35:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:45360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237298AbhCAPf1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 10:35:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8393600CF;
        Mon,  1 Mar 2021 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614612886;
        bh=Psb19aCJa1XXoKCEirAWxvB6lyGvYkploMB0td3VfyM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=K1WusRT4Ojy3cEw3dnO53h++h9o5qbISLepa1U4YYuYgB8SOs/aB1ClDpWUp4rF5W
         Dg9G6WBdrCvLhWEPZwWXriUPv7Ypc4db0i95YOA1h3nJAyM3uJ5jGyQz3iUPC3iB27
         M0fOtIqdgPuoCpZVAVZzWT3W+YL7tzEnhDHi+R9y7eh8bbob37AjTS22K8gRCO4cm2
         CokzZfyu7QcCMln2BScoJrCsoxzIuG9gUzzmx3PLYn/OSONRLVoLjx4ThVjNnIkyvw
         QroLMMC4cYOdRuU5EH9n5JDdWq73xwkSS2kuNde7eXQv6vNNnUzpH2Al81XyjuRNPy
         pjK4EKPkmtVWQ==
Date:   Mon, 1 Mar 2021 16:34:41 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] HID: i2c-hid: acpi: Drop redundant ACPI_PTR()
In-Reply-To: <CAO-hwJLWbsj4kDkn3TKdEW0mDv6XdafQEaheCCC0Nyq3=YaOYQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2103011633490.12405@cbobk.fhfr.pm>
References: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com> <20210226193225.47129-4-andriy.shevchenko@linux.intel.com> <CAO-hwJLWbsj4kDkn3TKdEW0mDv6XdafQEaheCCC0Nyq3=YaOYQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 1 Mar 2021, Benjamin Tissoires wrote:

> Hi,
> 
> On Fri, Feb 26, 2021 at 8:34 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > The driver depends on ACPI, ACPI_PTR() resolution is always the same.
> > Otherwise a compiler may produce a warning.
> >
> > That said, the rule of thumb either ugly ifdeffery with ACPI_PTR or
> > none should be used in a driver.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks a lot for the series. This indeed cleans things up.

Indeed, thanks.

> For the series:
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> Jiri, I wonder where we want to land this one. This is not strictly
> bug fixes, but we could definitively sneak this one in 5.12-rc1.
> Well, I should probably run the series on an acpi laptop here before
> merging, but I'd like to know if delaying to 5.13 is OK or if we need
> this in 5.12.

I'd like to do it the standard way and have it bake in for-next to see if 
it really doesn't break anything, so unless there are convicing arguments 
for 5.12-rcX, I'd rathre queue this for 5.13.

Thanks,

-- 
Jiri Kosina
SUSE Labs

