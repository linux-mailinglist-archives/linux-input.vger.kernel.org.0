Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518AD314BE9
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 10:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBIJlV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 04:41:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:54316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229638AbhBIJi0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Feb 2021 04:38:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF1E464E70;
        Tue,  9 Feb 2021 09:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612863457;
        bh=Q2fZA2RMjgvKK8UDAqpAhIusskTRp4HvpE38j1a08ME=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Iqz6QZoBflLFrGUBVRgnsVbnCwm4h+roF5G4ZD/cd0XCQLbIV9Ck0cz0ZxReA+P+N
         A9Qe2ZvrUEvY6rT91yiR2jqHMcTUvZ1Dnatp0nDl0d1KVtGDxk/DWhfi9ckzUbPsq2
         TQ7gPch0X77zHVJMiExKTfxdYHIbYcyuuuLfqm+KyxQvdxOnB0kCzmQdNyCIVpG+Rp
         intVH122nLahvGpu3NmuRbEcuPnUIw8WxwSYV+t/g6ADY+F3dlA0eHpiEY4XDL9saA
         i/5Xz6HH8xHl5+9Ub8CEHNnLQPc9gPzh4nHayeBv7FiMWAyWGsGVMeeurprjJBuy1H
         PhdcyUkwNN5iQ==
Date:   Tue, 9 Feb 2021 10:37:34 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>
Subject: Re: [PATCH] HID: logitech-dj: add support for the new lightspeed
 connection iteration
In-Reply-To: <20210123180220.3056430-1-lains@archlinux.org>
Message-ID: <nycvar.YFH.7.76.2102091037250.28696@cbobk.fhfr.pm>
References: <20210123180220.3056430-1-lains@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 23 Jan 2021, Filipe Laíns wrote:

> From: Filipe Laíns <lains@riseup.net>
> 
> This new connection type is the new iteration of the Lightspeed
> connection and will probably be used in some of the newer gaming
> devices. It is currently use in the G Pro X Superlight.
> 
> This patch should be backported to older versions, as currently the
> driver will panic when seing the unsupported connection. This isn't
> an issue when using the receiver that came with the device, as Logitech
> has been using different PIDs when they change the connection type, but
> is an issue when using a generic receiver (well, generic Lightspeed
> receiver), which is the case of the one in the Powerplay mat. Currently,
> the only generic Ligthspeed receiver we support, and the only one that
> exists AFAIK, is ther Powerplay.
> 
> As it stands, the driver will panic when seeing a G Pro X Superlight
> connected to the Powerplay receiver and won't send any input events to
> userspace! The kernel will warn about this so the issue should be easy
> to identify, but it is still very worrying how hard it will fail :(

Applied to for-5.11/upstream-fixes, thanks Filipe.

-- 
Jiri Kosina
SUSE Labs

