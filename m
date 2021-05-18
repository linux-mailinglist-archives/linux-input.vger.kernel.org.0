Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D832387EFF
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 19:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351196AbhERRxF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 May 2021 13:53:05 -0400
Received: from vps.thesusis.net ([34.202.238.73]:34832 "EHLO vps.thesusis.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237923AbhERRxE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 May 2021 13:53:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by vps.thesusis.net (Postfix) with ESMTP id 4492A2181A;
        Tue, 18 May 2021 13:51:46 -0400 (EDT)
Received: from vps.thesusis.net ([IPv6:::1])
        by localhost (vps.thesusis.net [IPv6:::1]) (amavisd-new, port 10024)
        with ESMTP id lFpdzBQUarjJ; Tue, 18 May 2021 13:51:46 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
        id 0BC992181E; Tue, 18 May 2021 13:51:46 -0400 (EDT)
References: <87o8dw52jc.fsf@vps.thesusis.net> <20210506143654.17924-1-phill@thesusis.net> <YJRRCEJrQOwVymdP@google.com> <871ra4yprd.fsf@vps.thesusis.net>
User-agent: mu4e 1.5.7; emacs 26.3
From:   Phillip Susi <phill@thesusis.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Xen Keyboard: don't advertise every key known to man
Date:   Tue, 18 May 2021 13:13:45 -0400
In-reply-to: <871ra4yprd.fsf@vps.thesusis.net>
Message-ID: <87zgwsc4lp.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Phillip Susi writes:

> Dmitry Torokhov writes:
>
>> By doing this you are stopping delivery of all key events from this
>> device.

Hrm... I don't have very many "interesting" keys to test, but when I hit
the menu key, I see KEY_COMPOSE, which is > KEY_MIN_INTERESTING.  When I
press the button to have my vnc client send a windows key, I see
KEY_LEFTCTRL+KEY_ESC.  I also see KEY_PAUSE when I hit that key and it
is also "interesting".  I get the same thing with or without this patch,
so it does not appear to be breaking delivery of the keys that are no
longer being advertised.

Oddly though, libinput list-devices does not even show the Xen Virtual
Keyboard.  It's sysfs path is /sys/class/input/input1, but it also does
not have a device node in /dev/input so I can't even ask libinput to
only monitor that device.

Ok... this is really odd.. it does show the device without this patch,
and not with it.  The input events I was seeing were coming through the
"AT Translated Set 2 keyboard" and no events come though the Xen Virtual
Keyboard ( even without this patch ).  This makes me wonder why we have
this device at all?
