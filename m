Return-Path: <linux-input+bounces-5201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE59401AA
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 01:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30AC02832E2
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 23:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FAB140E29;
	Mon, 29 Jul 2024 23:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Crk/4gxV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D1288BD;
	Mon, 29 Jul 2024 23:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722295025; cv=none; b=eRqoytk744fKHXCJ60fsd6dr+rVJ68RP2QOynqaIUv5BMElUlcQwpOCLR3wr2/ZBrQAEtp5FlSDmnA6r31JmYgw7TPo87+tQvJ2pKokC7ErPLr+mPXCWD8FI0/0umtfDRr/ScPqeFMGgtdSAYWIXX2djq9kGsssuP/0hg420ceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722295025; c=relaxed/simple;
	bh=RrvqmgLgqLnMAmqJKNZ7eoEkTpSJreqnYx0rN8RHGkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfjO4Dd0BA9i6EJO78cZQ1+19gRGa6daRbGnskonbP3Dgk5dwE7UDsMVNC7OjDFGcZ8YcmS0b6VJHtYoqZRUyFm5Dr/X47OkvLK/ZpyJTinwUyoDiUHtnIsfigTB9D08jVqjNlyIz7Uy4ZaU0wboGBDJqkZu02frHQ9UCeE/wbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Crk/4gxV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cb56c2c30eso2531509a91.1;
        Mon, 29 Jul 2024 16:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722295023; x=1722899823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XLDTo8udNoQ8sH9s/3k371tAlYwBcapamVwSmgChJE=;
        b=Crk/4gxV/du0REEm3BDJmfhU7x+1J0+5fMcxkxe74Jj3/Ge0Eil4Iu77VPLWcKZ6Bg
         G0UfDoTuqy0ORyP0vXbWIr6893TvanKwQyLv2sK48IhzYUbcfReaIfbgpp/A9V5+UP4r
         nh2w/puirC1+fOVTSF8WFITmEKOFmrtxyUYq23WG85p+bnhmmrqAotFme0TcaJsAVT87
         RNakeTWHZMQzD2jVT5e+WaUsFenfGOvdTDPSXiUhby9+YkrLslOM6bWv02tm62MUlJwk
         T7dOFeWF4/BkxGO+MNLct+wVfyVf5uI0/uLMXmxQpO8Cs4nyaAVWm/cbKywHgFKL3arG
         +Bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722295023; x=1722899823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XLDTo8udNoQ8sH9s/3k371tAlYwBcapamVwSmgChJE=;
        b=fXjLvPpnKBKL4vd9nAQp0MtvrAadmiWT9M/jJtToYpZVa2wgSxeJBAODq+UOMO1iFM
         EKe3noXHzPh6B0J9QqQNVm/5qKDgi+tvbR61VVWiLnI+mh80UTxWg2LHtSTqMhauYWL4
         ZxnKaN0zf5lf4bjsP3xhBlAIMooJtMLvha7pEwOGyrszf9gdpFAUCUbR/2u5RLBKRQD6
         4l899E5EbUlApAUy2OOhO3YmzkP/8Vx9vs9WPQ0L/wowc0kohlsgMEl2SBSymwVU5XQY
         r75EiIXf6RvD8OsgqKR7J1GKY5BsBq1yrLGRPiTEwgy/xJ3pM6SMe8iqfT/OR7rd+66v
         e16w==
X-Forwarded-Encrypted: i=1; AJvYcCVvSeyPeQP5UIDY+3vMN8hHEAbKkXKobYyso6gUPe2gmQCdKlz+2sDYuCNufBaSsx2Q1VEIJBahPhAnTuJQakqiSiCgJwSKjcIzmT0Ib2Ahb3Wzw6eeLWOsWGUfyPBF5XfuVMYeldk3YHU=
X-Gm-Message-State: AOJu0YzQHsCIR0d6yChDeMRrUM39v4+K79RXtb6VrqXk5rRb4OyqzMJ2
	r6K0YEv49iW3/hLuvNX1nWJVRdaXL3oPzdlXaIrMX6eUTVSDt0mV
X-Google-Smtp-Source: AGHT+IFOLMBqJmfe/8i/vRam/QiNv6uQtorhY+JcwYQOAtKd/R5L5EFtLPw0+DI3gNrPxhcecMuLuQ==
X-Received: by 2002:a17:90b:4c03:b0:2ca:f755:1040 with SMTP id 98e67ed59e1d1-2cfcaaec72fmr374995a91.7.1722295023211;
        Mon, 29 Jul 2024 16:17:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f53a:d352:6282:526b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28ca3b75sm9226981a91.25.2024.07.29.16.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 16:17:02 -0700 (PDT)
Date: Mon, 29 Jul 2024 16:17:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Henrik Rydberg <rydberg@bitmath.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
Message-ID: <Zqgi7NYEbpRsJfa2@google.com>
References: <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
 <ZqfYfIp3n7Qfo1-Q@google.com>
 <CAHk-=wiT8RzFUVXe=r3S9dfCpV+FhARgtb5SxLDSOKCJKCLOZA@mail.gmail.com>
 <Zqfg8FW-SFFedebo@google.com>
 <CAHk-=wg4peLPGB+Lyvdtwxe6nVeprvTbZiO8_=E8-R_M+VyWow@mail.gmail.com>
 <ZqfpgmmLgKti0Xrf@google.com>
 <CAHk-=wgo9iEZ20wB4rOpt6h36Dymudqf6HXww1N094bVoqyMmg@mail.gmail.com>
 <Zqf00C_eOBwcEiWG@google.com>
 <CAHk-=whH+xp7ZxqgwOEm=_H=fVpWQvWpPqK6gzcPt8xdEXzwrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whH+xp7ZxqgwOEm=_H=fVpWQvWpPqK6gzcPt8xdEXzwrg@mail.gmail.com>

On Mon, Jul 29, 2024 at 01:14:36PM -0700, Linus Torvalds wrote:
> On Mon, 29 Jul 2024 at 13:00, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > Hmm, maybe the checks should go into drivers/input/misc/uinput.c which
> > is the only place that allows userspace to create input device instances
> > and drive them rather than into input core logic because all other
> > devices are backed by real hardware.
> 
> Ack, that sounds like a good idea, particularly if there is some
> single location that could validate the input.
> 
> uinput_validate_absinfo(), perhaps?

Yes, I think that's the right place.

> 
> We do end up trying to protect against some forms of bad hardware too
> when possible, but realistically _that_ kind of protection should be
> more along the lines of "don't cause security issues".

Most of them have statically defined slot limit. The exception is HID
(which can also be fed garbage through uhid) but hid-multitouch uses u8
for maximum number of contacts, so can't go above 256.

Thanks.

-- 
Dmitry

---8<------------------8<------------------8<---------------

Input: uinput - reject requests with unreasonable number of slots

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

When exercising uinput interface syzkaller may try setting up device
with a really large number of slots, which causes memory allocation
failure in input_mt_init_slots(). While this allocation failure is
handled properly and request is rejected, it results in syzkaller
reports. Additionally, such request may put undue burden on the
system which will try to free a lot of memory for a bogus request.

Fix it by limiting allowed number of slots to 100. This can easily
be extended if we see devices that can track more than 100 contacts.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/uinput.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index d23f3225b00f..ea3d34e62eb2 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -417,6 +417,20 @@ static int uinput_validate_absinfo(struct input_dev *dev, unsigned int code,
 		return -EINVAL;
 	}
 
+	/*
+	 * Limit number of contacts to a reasonable value (100). This
+	 * ensures that we need less than 2 pages for struct input_mt
+	 * (we are not using in-kernel slot assignment so not going to
+	 * allocate memory for the "red" table), and we should have no
+	 * trouble getting this much memory.
+	 */
+	if (code == ABS_MT_SLOT && max > 99) {
+		printk(KERN_DEBUG
+		       "%s: unreasonably large number of slots requested: %d\n",
+		       UINPUT_NAME, max);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 


