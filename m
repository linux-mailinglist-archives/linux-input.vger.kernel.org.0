Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610902463FB
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 12:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgHQKGE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 06:06:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:45346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbgHQKGE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 06:06:04 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C8CC2067C;
        Mon, 17 Aug 2020 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597658763;
        bh=+kcykIKO/DvcOSF7ab9/yT5ZJAgui6WMdLUVfXgg6HA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=PtQrJfwcbVypl73R2q7LuYNMf9GqyCSP7QhOEeE7u95NVBIbQX/0dd4b70NQcd6KN
         tIGH6nURs1zwkHmtvuWSbbl7iWbVKKcyyJcCfiJpHEFbQRHtEoXsBtWQwRK7PuJgTS
         UyAJpoeCaaKTjgISNFRfAq90aI2RI7MJDGuO8mPc=
Date:   Mon, 17 Aug 2020 12:06:01 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Luke Jones <luke@ljones.dev>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH V4]: HID: asus: add support for ASUS N-Key keyboard
In-Reply-To: <3e9ce2ae2e42c5c7e39070fc9bfcee89ebd5277a.camel@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2008171205140.27422@cbobk.fhfr.pm>
References: <3e9ce2ae2e42c5c7e39070fc9bfcee89ebd5277a.camel@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 4 Aug 2020, Luke Jones wrote:

> >From 2b70c3daf1bd92f9163efb726e37fb3e0bcc8989 Mon Sep 17 00:00:00 2001
> From: Luke D Jones <luke@ljones.dev>
> Date: Thu, 30 Jul 2020 16:51:06 +1200
> Subject: [PATCH] HID: asus: add support for ASUS N-Key keyboard
> 
> Enable missing functionality of the keyboard found in many ASUS
> Zephyrus laptops: Fn key combos and hotkeys, keyboard backlight
> brightness control, and notify asus-wmi to toggle "fan-mode".
> Two input event codes are added for keyboard LED mode switching
> prev/next.
> 
> The keyboard has many of the same key outputs as the existing G752
> keyboard including a few extras, and varies a little between laptop
> models.
> 
> Additionally the keyboard requires the LED interface to be
> intitialised before such things as keyboard backlight control work.
> 
> Misc changes in scope: update some hardcoded comparisons to use an
> available define, change "Mic Toggle" to use a keycode that works.
> 
> Signed-off-by: Luke D Jones <luke@ljones.dev>

[ ... snip ... ]

This version of patch is ok when it comes to whitespace damage, but it has 
been line-wrapper instead; so if you could look into fixing that as well, 
it'd be great :)

Thanks,

-- 
Jiri Kosina
SUSE Labs

