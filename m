Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9898C387D4D
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 18:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243867AbhERQZK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 May 2021 12:25:10 -0400
Received: from vps.thesusis.net ([34.202.238.73]:34664 "EHLO vps.thesusis.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237986AbhERQZJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 May 2021 12:25:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by vps.thesusis.net (Postfix) with ESMTP id 44EF421786;
        Tue, 18 May 2021 12:23:50 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
        by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Xl3Chf79Qxz2; Tue, 18 May 2021 12:23:50 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
        id 17BE82178C; Tue, 18 May 2021 12:23:50 -0400 (EDT)
References: <87o8dw52jc.fsf@vps.thesusis.net> <20210506143654.17924-1-phill@thesusis.net> <YJRRCEJrQOwVymdP@google.com>
User-agent: mu4e 1.5.7; emacs 26.3
From:   Phillip Susi <phill@thesusis.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Xen Keyboard: don't advertise every key known to man
Date:   Tue, 18 May 2021 12:20:00 -0400
In-reply-to: <YJRRCEJrQOwVymdP@google.com>
Message-ID: <871ra4yprd.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Dmitry Torokhov writes:

> By doing this you are stopping delivery of all key events from this
> device.

It does?  How does the PS/2 keyboard driver work then?  It has no way of
knowning what keys the keyboard has other than waiting to see what scan
codes are emitted.

If the keys must be advertised in order to emit them at runtime, then I
see no other possible fix than to remove the codes from the modalias
string in the input subsystem.  Or maybe allow certain drivers that
don't know to set some sort of flag that allows them to emit all codes
at runtime, but NOT advertise them so you end up with a mile long
modalias.

