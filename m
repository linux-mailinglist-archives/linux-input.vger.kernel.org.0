Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC353039E9
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 11:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391829AbhAZKL7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jan 2021 05:11:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:46888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389074AbhAZKKb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Jan 2021 05:10:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0828721744;
        Tue, 26 Jan 2021 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611655790;
        bh=c9HTwpNC2OoP6CsdoYQvvWFURISarvg8sFTLBc4P2x8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=q8Q73RvLO2tm8d4UurU7V+y6LIGRaXCOqdv734PS2hoZInV5UFEaFexTyT+tK5sXB
         t/JLcVkWD93hgyAF/6msQyZ8pi+0gKBqgdYVBhzPpQ4n+ZYnD3/oLtJJPeDu6dukA0
         GKdeuzggpksZDPYKaVmy2DRpdrRm0L/uvkAuUFYQF2/ZRIjy7Y4HrJfkchdB3bOsBB
         my1j+ZbQnMKvCkwoFLsr73mQHG2IgSdr5X3WaMavhieR7ry0gbkoj+mxvXLoLxM2zZ
         DRaJgPX4s/MtaNZy0bbeZUATlyaE4Z+G9/cI3YkkIhSEfgb65h76de273bfLEnw7bG
         cTzzJ/ANGOn0Q==
Date:   Tue, 26 Jan 2021 11:09:47 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Bla=B8_Hrastnik?= <blaz@mxxn.io>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: HID: multitouch: Set to high latency mode on suspend.
In-Reply-To: <2b4c5881-2047-407f-8bb4-623d9bd167c7@www.fastmail.com>
Message-ID: <nycvar.YFH.7.76.2101261109280.5622@cbobk.fhfr.pm>
References: <2b4c5881-2047-407f-8bb4-623d9bd167c7@www.fastmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 19 Dec 2020, Blaž Hrastnik wrote:

> Per Windows Precision Touchpad guidelines:
> 
> > The latency mode feature report is sent by the host to a Windows
> > Precision Touchpad to indicate when high latency is desirable for
> > power savings and, conversely, when normal latency is desired for
> > operation.
> >
> > For USB-connected Windows Precision Touchpads, this enables the device
> > to disambiguate between being suspended for inactivity (runtime IDLE)
> > and being suspended because the system is entering S3 or Connected
> > Standby.
> 
> The current implementation would set the latency to normal on device initialization,
> but we didn't set the device to high latency on suspend.

Applied, thanks Blaž.

-- 
Jiri Kosina
SUSE Labs

