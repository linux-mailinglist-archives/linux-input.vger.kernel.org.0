Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B723B11E0B8
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 10:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfLMJ2y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 04:28:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:35620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbfLMJ2y (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 04:28:54 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FF792077B;
        Fri, 13 Dec 2019 09:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576229333;
        bh=z085srnn3eTmF1mwhBfbPVedeQToZQE/o5DkKGsSR08=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=IeJvapsUVcA8uVcYv5Kqitdr29GDDro0ZX5vgTAm8nlrNJMFOwfHEINqU5/07nins
         iZT3KIv033pIQW7UJDWTl6HtXUN0QwcpfUfDre+wNu2XLF9+BPpUJGbYJLB9jh4TyU
         yx3wg+JU4X8cmI8IRYPPtGFex/90Cjx3t2Yz2+OM=
Date:   Fri, 13 Dec 2019 10:28:50 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hid-input: clear unmapped usages
In-Reply-To: <20191207210518.GA181006@dtor-ws>
Message-ID: <nycvar.YFH.7.76.1912131027560.4603@cbobk.fhfr.pm>
References: <20191207210518.GA181006@dtor-ws>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 7 Dec 2019, Dmitry Torokhov wrote:

> We should not be leaving half-mapped usages with potentially invalid
> keycodes, as that may confuse hidinput_find_key() when the key is located
> by index, which may end up feeding way too large keycode into the VT
> keyboard handler and cause OOB write there:
> 
> BUG: KASAN: global-out-of-bounds in clear_bit include/asm-generic/bitops-instrumented.h:56 [inline]
> BUG: KASAN: global-out-of-bounds in kbd_keycode drivers/tty/vt/keyboard.c:1411 [inline]
> BUG: KASAN: global-out-of-bounds in kbd_event+0xe6b/0x3790 drivers/tty/vt/keyboard.c:1495
> Write of size 8 at addr ffffffff89a1b2d8 by task syz-executor108/1722
> ...
>  kbd_keycode drivers/tty/vt/keyboard.c:1411 [inline]
>  kbd_event+0xe6b/0x3790 drivers/tty/vt/keyboard.c:1495
>  input_to_handler+0x3b6/0x4c0 drivers/input/input.c:118
>  input_pass_values.part.0+0x2e3/0x720 drivers/input/input.c:145
>  input_pass_values drivers/input/input.c:949 [inline]
>  input_set_keycode+0x290/0x320 drivers/input/input.c:954
>  evdev_handle_set_keycode_v2+0xc4/0x120 drivers/input/evdev.c:882
>  evdev_do_ioctl drivers/input/evdev.c:1150 [inline]
> 
> Reported-by: syzbot+19340dff067c2d3835c0@syzkaller.appspotmail.com
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> v2: fixed up interaction with hid-multitouch according to Benjamin's
> feedback
> 
> Please consider tagging for stable.

I'd like to push this for 5.5 (and tag for stable), but would prefer this 
to have gone through the full battery of Benjamin's testing infrastructure 
first.

Benjamin, did you have chance to run Dmitry's patch through your 
machinery?

Thanks,

-- 
Jiri Kosina
SUSE Labs

