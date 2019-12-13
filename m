Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2F9111EBFB
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 21:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfLMUmi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 15:42:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:47884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfLMUmi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 15:42:38 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB239246A2;
        Fri, 13 Dec 2019 20:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576269757;
        bh=3MSTz0i9BnAG98WU/nWqtDLkfOWcfbnKwzBSKtsiF9I=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=yOGwbFmCZBLardLhZWGQwMnI3hczgxv5bAp/ZvtLvPwpssBKs9Hjld31e5yKORz68
         cl2U1iazmtCwcbyBXdSNQNcyulbDIVRiZhLtPEhprEY8n/x0NTqzQXU2uDiNMfhK7K
         61hW1V1l/FJ96CXTLxcV+r66qqgz9Nq5m81yJSmk=
Date:   Fri, 13 Dec 2019 21:42:34 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@jikos.cz>
Subject: Re: [PATCH v2] HID: hid-input: clear unmapped usages
In-Reply-To: <CAO-hwJ+8gwm28DTx2Lw8Gj+eTbOa8kVoFbc0tpqFtyu8+WOA8w@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.1912131342460.4603@cbobk.fhfr.pm>
References: <20191207210518.GA181006@dtor-ws> <nycvar.YFH.7.76.1912131027560.4603@cbobk.fhfr.pm> <CAO-hwJ+8gwm28DTx2Lw8Gj+eTbOa8kVoFbc0tpqFtyu8+WOA8w@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 13 Dec 2019, Benjamin Tissoires wrote:

> > > We should not be leaving half-mapped usages with potentially invalid
> > > keycodes, as that may confuse hidinput_find_key() when the key is located
> > > by index, which may end up feeding way too large keycode into the VT
> > > keyboard handler and cause OOB write there:
> > >
> > > BUG: KASAN: global-out-of-bounds in clear_bit include/asm-generic/bitops-instrumented.h:56 [inline]
> > > BUG: KASAN: global-out-of-bounds in kbd_keycode drivers/tty/vt/keyboard.c:1411 [inline]
> > > BUG: KASAN: global-out-of-bounds in kbd_event+0xe6b/0x3790 drivers/tty/vt/keyboard.c:1495
> > > Write of size 8 at addr ffffffff89a1b2d8 by task syz-executor108/1722
> > > ...
> > >  kbd_keycode drivers/tty/vt/keyboard.c:1411 [inline]
> > >  kbd_event+0xe6b/0x3790 drivers/tty/vt/keyboard.c:1495
> > >  input_to_handler+0x3b6/0x4c0 drivers/input/input.c:118
> > >  input_pass_values.part.0+0x2e3/0x720 drivers/input/input.c:145
> > >  input_pass_values drivers/input/input.c:949 [inline]
> > >  input_set_keycode+0x290/0x320 drivers/input/input.c:954
> > >  evdev_handle_set_keycode_v2+0xc4/0x120 drivers/input/evdev.c:882
> > >  evdev_do_ioctl drivers/input/evdev.c:1150 [inline]
> > >
> > > Reported-by: syzbot+19340dff067c2d3835c0@syzkaller.appspotmail.com
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >
> > > v2: fixed up interaction with hid-multitouch according to Benjamin's
> > > feedback
> > >
> > > Please consider tagging for stable.
> >
> > I'd like to push this for 5.5 (and tag for stable), but would prefer this
> > to have gone through the full battery of Benjamin's testing infrastructure
> > first.
> >
> > Benjamin, did you have chance to run Dmitry's patch through your
> > machinery?
> 
> yep, this one was OK, so:
> Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Thanks, I am queuing this in for-5.5/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs

