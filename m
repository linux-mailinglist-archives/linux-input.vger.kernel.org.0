Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D872463ED
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 12:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgHQKEj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 06:04:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:44658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbgHQKEj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 06:04:39 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 015842072E;
        Mon, 17 Aug 2020 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597658678;
        bh=iya4JNlCwBy3mlDCX2dWKo+UNuvsrCInzwONmRoUabk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=n1N4ND04aAMT5Q4VjzexiGYo3V+uRQIk32WxR2BQN+/L37C0iQDD9NB36E5tLasXs
         hMLruD2wo53BHIBkrsTM6vVU+XuNPdlYBva50l9S6Bb75xgbdoqymivAgwR3iuolwY
         JjYj3c9Fu2Em1jCZX0Xo1VPJKqBXTSZ/l7U3XTYY=
Date:   Mon, 17 Aug 2020 12:04:36 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Luke Jones <luke@ljones.dev>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: asus: Add support for N-Key keyboard 0x1866
In-Reply-To: <I7N9EQ.8IGH4DTLLTFG1@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2008171203590.27422@cbobk.fhfr.pm>
References: <I7N9EQ.8IGH4DTLLTFG1@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 30 Jul 2020, Luke Jones wrote:

> Enable missing functionality of the keyboard found in many ASUS
> Zephyrus laptops: Fn key combos and hotkeys, keyboard backlight
> brightness control. Two input event codes are added for keyboard
> LED mode switching prev/next.
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

Luke,

thanks for the patch.

Unfortunately it has been completely whitespace-damaged by your mail 
client, so it can't be properly applied / reviewed. Could you please 
adjust your setup and resend?

Thanks,

-- 
Jiri Kosina
SUSE Labs

