Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839E4248D81
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 19:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgHRRwX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 13:52:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726552AbgHRRwX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 13:52:23 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00A122080C;
        Tue, 18 Aug 2020 17:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597773142;
        bh=3aMLxxWspsNXFhHUTwiks8mFCN+jOjk9Yh/Rr2M8e9Q=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ryrzwbtFBjRiryBBFltJ0UsFRPNNH3gwXaLOlpRy4iI+mw546Wa5e2mjma+Xe6rDv
         D9u93Ja3H1/PDivSIX9jQo+C4o0R8pAKQKLBeTgp6lRlPllJ1yRP9tK68G1PW8Pq88
         X3CxoYYx5SF88cbx+fvv+Yvf+I3tGG8YuZvHVnhM=
Date:   Tue, 18 Aug 2020 19:52:19 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Johannes Hirte <johannes.hirte@datenkhaos.de>
cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        groeck@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: usbhid: do not sleep when opening device
In-Reply-To: <20200818115906.GA26874@latitude>
Message-ID: <nycvar.YFH.7.76.2008181951490.27422@cbobk.fhfr.pm>
References: <20200610043824.GA171503@dtor-ws> <20200818115906.GA26874@latitude>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 18 Aug 2020, Johannes Hirte wrote:

> > usbhid tries to give the device 50 milliseconds to drain its queues when
> > opening the device, but dies it naively by simply sleeping in open handler,
> > which slows down device probing (and thus may affect overall boot time).
> > 
> > However we do not need to sleep as we can instead mark a point of time in
> > the future when we should start processing the events.
> > 
> > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > 
> 
> This change breaks various Logitech devices: 
> https://bugzilla.kernel.org/show_bug.cgi?id=208935

Copy/pasting from the other thread:

=====
Yeah, this problem popped out also in other contexts, where many Logitech 
devices didn't probe properly, because of the race where the first IRQ is 
dropped on the floor (after hid_device_io_start() happens, but before the 
50ms timeout passess), and report descriptor never gets parsed and 
populated.

As this is just a boot time micro-optimization, I am going to revert the 
patch for 5.9 now, and we can try to fix this properly for next merge 
window.
=====

Thanks,

-- 
Jiri Kosina
SUSE Labs

