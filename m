Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64443CA8B9
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236704AbhGOTCb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 15:02:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240891AbhGOS6w (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 14:58:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 957B0613D7;
        Thu, 15 Jul 2021 18:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626375357;
        bh=yLPHpSQyz99Q4TyLNEM1aboCrgWl3Hpizf4xnkVKx+U=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=esQ1/0RxUMY3Mr/3W5q7vhqV7EBq64Vg55jgDiy3HNdYakl/hEQddRIiaVkrW2mNc
         DyH1CgdGJaVgwkja7NxYGwsL6Wq4VCtmT6ke+MSebPAvxRxnlAqTw2pK/uMf53XPdu
         nXt9T10fh8AyzNFDCg78oet+0iBThClfXKJPssLfLUZDDt6eIsRFip4lW6eEjtWb21
         sFtr7/DIKae4nZvrbBd7RJyTAJpl6n3Mrh2T9W5Zn8EMmFB7gRp6TiId9iyFkc36IU
         sVEnu8l6O/1EVGdK3AyWo7bQ7TTqT5kwWuQeDkvzEOL9DXiLdXHY/xakNSZGBTa4C4
         EbGd6zbW+U72A==
Date:   Thu, 15 Jul 2021 20:55:54 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kenneth Albanowski <kenalba@google.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: input: do not report stylus battery state as
 "full"
In-Reply-To: <YNtlrrKZVQY4byVa@google.com>
Message-ID: <nycvar.YFH.7.76.2107152055360.8253@cbobk.fhfr.pm>
References: <YNtlrrKZVQY4byVa@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 29 Jun 2021, Dmitry Torokhov wrote:

> The power supply states of discharging, charging, full, etc, represent
> state of charging, not the capacity level of the battery (for which
> we have a separate property). Current HID usage tables to not allow
> for expressing charging state of the batteries found in generic
> styli, so we should simply assume that the battery is discharging
> even if current capacity is at 100% when battery strength reporting
> is done via HID interface. In fact, we were doing just that before
> commit 581c4484769e.
> 
> This change helps UIs to not mis-represent fully charged batteries in
> styli as being charging/topping-off.
> 
> Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
> Reported-by: Kenneth Albanowski <kenalba@google.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

As there was no pushback from Bastien, I am queuing this for 5.15. Thanks,

-- 
Jiri Kosina
SUSE Labs

