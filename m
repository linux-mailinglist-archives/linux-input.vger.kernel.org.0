Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC353CA122
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 17:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbfJCPZa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 11:25:30 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:44508 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728608AbfJCPZa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Oct 2019 11:25:30 -0400
Received: (qmail 8371 invoked by uid 2102); 3 Oct 2019 11:25:29 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Oct 2019 11:25:29 -0400
Date:   Thu, 3 Oct 2019 11:25:29 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrej Shadura <andrew.shadura@collabora.co.uk>
cc:     linux-usb@vger.kernel.org,
        =?UTF-8?B?SmnFmcOtIEtvc2luYQ==?= <jikos@kernel.org>,
        <linux-input@vger.kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        <kernel@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v3] HID: add driver for U2F Zero built-in LED and RNG
In-Reply-To: <43025708-080e-b577-031a-840b4cd42f3f@collabora.co.uk>
Message-ID: <Pine.LNX.4.44L0.1910031124460.1797-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 3 Oct 2019, Andrej Shadura wrote:

> On 01/04/2019 14:42, Andrej Shadura wrote:
> > U2F Zero supports custom commands for blinking the LED and getting data
> > from the internal hardware RNG. Expose the blinking function as a LED
> > device, and the internal hardware RNG as an HWRNG so that it can be used
> > to feed the enthropy pool.
> > 
> > Signed-off-by: Andrej Shadura <andrew.shadura@collabora.co.uk>
> 
> I’ve been testing this with a different modification of U2F Zero,
> Nitrokey FIDO U2F, and on that device only I’m getting a kernel warning
> (see below).
> 
> > +static int u2fzero_recv(struct u2fzero_device *dev,
> > +			struct u2f_hid_report *req,
> > +			struct u2f_hid_msg *resp)
> > +{
> > +	int ret;
> > +	struct hid_device *hdev = dev->hdev;
> > +	struct u2fzero_transfer_context ctx;
> > +
> > +	mutex_lock(&dev->lock);
> > +
> > +	memcpy(dev->buf_out, req, sizeof(struct u2f_hid_report));
> > +
> > +	dev->urb->context = &ctx;
> > +	init_completion(&ctx.done);
> > +
> > +	ret = usb_submit_urb(dev->urb, GFP_NOIO);
> 
> Here, usb_submit_urb() returns EBUSY in the first attempt to read random
> numbers from the device:
> 
> URB ffff917256d5d540 submitted while active
> WARNING: CPU: 3 PID: 31 at drivers/usb/core/urb.c:363
> usb_submit_urb+0x4c2/0x5b0
> <...>
> Call Trace:
>  u2fzero_rng_read+0x16e/0x340 [hid_u2fzero]
>  ? ttwu_do_activate+0x67/0x90
>  add_early_randomness+0x53/0xc0
>  hwrng_register+0x175/0x180
>  devm_hwrng_register+0x41/0x7e
>  u2fzero_probe+0x2dd/0x350 [hid_u2fzero]
>  hid_device_probe+0x119/0x180 [hid]
>  really_probe+0xfe/0x3b0
>  driver_probe_device+0xba/0x100
>  __device_attach_driver+0x97/0x100
> 
> I don’t understand why since 1) it’s likely to be the first transmission
> of this URB, 2) there’s a mutex locked just before it. I received a
> comment from a colleague mentioning I’m probably not using the mutex
> correctly, but I don’t understand why.
> 
> I’m trying to figure this out, so I’d welcome any help with it.

You can try using usbmon to see exactly what URBs are actually running.

Alan Stern

