Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D50C736FB68
	for <lists+linux-input@lfdr.de>; Fri, 30 Apr 2021 15:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhD3N0v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Apr 2021 09:26:51 -0400
Received: from vps.thesusis.net ([34.202.238.73]:37846 "EHLO vps.thesusis.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230047AbhD3N0v (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Apr 2021 09:26:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by vps.thesusis.net (Postfix) with ESMTP id DE4482ED16;
        Fri, 30 Apr 2021 09:26:02 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
        by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sFHONqrJWNCf; Fri, 30 Apr 2021 09:26:02 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
        id 6F1D82ED15; Fri, 30 Apr 2021 09:26:02 -0400 (EDT)
References: <87o8dw52jc.fsf@vps.thesusis.net> <87fsz84zn1.fsf@vps.thesusis.net> <YIszOwADJ8jdBov8@google.com>
User-agent: mu4e 1.5.7; emacs 26.3
From:   Phillip Susi <phill@thesusis.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Date:   Fri, 30 Apr 2021 09:16:57 -0400
In-reply-to: <YIszOwADJ8jdBov8@google.com>
Message-ID: <87bl9vaoph.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Dmitry Torokhov writes:

> I don't know why Xen keyboard exports that many keycodes ;) In general,
> my recommendation is to mirror the physical device when possible, and
> instantiate several devices so there is 1:1 relationship between virtual
> and physical devices.

I'm still trying to wrap my head around why keys are even declared in
the first place.  PS/2 ports have no idea what keys are on the keyboard
plugged into them, so I guess they don't declare any?  And that doesn't
stop them from emitting any of the scan codes, so what is the use in
declaring them in the first place?

A lot of "interesting" buttons don't seem very interesting to me, such
as left and right parenthesis.  Is a user space mail program really
going to bypass X11/wayland and open input devices directly to look for
someone to press the "send mail" key?  Even if it did, why would it only
want to open a keyboard that advertises that it has such a key instead
of listening to all keyboards?  Even if all USB keyboards report all of
their special keys, the fact that you could still have a PS/2 keyboard
that has a "send mail" key on it means that the reporting function can
not be relied on and so you just have to listen on all keyboards anyhow.

I guess as long as not reporting keys doesn't stop you from using them,
then the Xen Virtual Keyboard driver should just report none, like the
PS/2 keyboard driver.
