Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22FC746534C
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 17:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238499AbhLAQut (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 11:50:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbhLAQur (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Dec 2021 11:50:47 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E44C061574
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 08:47:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8CA2DCE1D80
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 16:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381B6C53FAD;
        Wed,  1 Dec 2021 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638377242;
        bh=ZyrJ00LaWUO5YZDaqneRniX0vmINqs9SYoITySPY5OY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ut7PUGUHZXa44MkBuaeg6X2vxKvm43LpHxjQ4xh30NZ3FNCwx/mMVzNIvgMCiUqRh
         F7eCAcOBTkLFNYMopbSrRTvy21L9iWPZdLZRQV8zJQiAbArDPdisng8eHEkeA8kJVd
         X5ViGCvLpD4Ftqchsppj/ZTjEUjx9tcuSJZxPH9M=
Date:   Wed, 1 Dec 2021 17:47:20 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 2/2] HID: check for valid USB device for many HID drivers
Message-ID: <YaenGMpE8Atsfiyc@kroah.com>
References: <20211201141513.2107815-1-gregkh@linuxfoundation.org>
 <20211201141513.2107815-2-gregkh@linuxfoundation.org>
 <CAO-hwJJHrpUkbqCr2psqF62v0rR6E6zSUryee=S6SSwGfHCNhQ@mail.gmail.com>
 <YaeKH4E/cPfDkerc@kroah.com>
 <CAO-hwJ+HQxdVWA_Q3O+i7-Ur3RfeZ6VDZPJepb2Bx87Yhj1Ymw@mail.gmail.com>
 <4c57c020-a708-aa61-8d68-23f691dffa4c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c57c020-a708-aa61-8d68-23f691dffa4c@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 01, 2021 at 05:38:49PM +0100, Benjamin Tissoires wrote:
> 
> 
> On Wed, Dec 1, 2021 at 4:05 PM Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> > > > FWIW, I am also working on a test that generates all registered USB
> > > > vid/pids from the currently running kernel and will try to inject them
> > > > in the testsuite. This should validate this patch and prevent future
> > > > mishaps.
> > >
> > > That would be great to see.  Let me know if you want these broken up
> > > smaller, and I will go fix the above issues.
> > 
> > https://gitlab.freedesktop.org/bentiss/hid-tools/-/commit/2b04c6cf46c7405c8a916f324988660cb54dadea
> > 
> > This seems sufficient to make an unpatched kernel scream :)
> 
> I have now opened https://gitlab.freedesktop.org/libevdev/hid-tools/-/merge_requests/122
> with a quicker solution.
> 
> This leads apparently to 2 extra crashes:
> - one in hid-holtek-kbd -> hid_is_usb() is called *after* hid_parse(), so
>   report_fixup is actually called for uhid devices.

Fixed that one in my v2 patch submission.

> - another in bigbenff which is fixed by the following patch:
> 
> ---
> diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
> index db6da21ade06..74ad8bf98bfd 100644
> --- a/drivers/hid/hid-bigbenff.c
> +++ b/drivers/hid/hid-bigbenff.c
> @@ -191,7 +191,7 @@ static void bigben_worker(struct work_struct *work)
>  		struct bigben_device, worker);
>  	struct hid_field *report_field = bigben->report->field[0];
> -	if (bigben->removed)
> +	if (bigben->removed || !report_field)

I don't see how this is a "USB device" issue.  It's a good "fuzz the
driver with invalid data" fix though :)

thanks,

greg k-h
