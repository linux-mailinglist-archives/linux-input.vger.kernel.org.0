Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673774322D9
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 17:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhJRPcJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 11:32:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231915AbhJRPcI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 11:32:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F332D60ED5;
        Mon, 18 Oct 2021 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634570997;
        bh=o27f0/xqINiOBP6m/Oj//CwvUjW48C+jCijf5A0+7nw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=KIOza3uctkk8HIOi022Mzvt6GRrZp9pXKAiAhEx1OFcHIo8EI5wmt4KyG3c0Cjzjj
         hT0uI0BH3ZjaORzN1xephr9jNBThdANFOi95p8uil2p/GTHEysdlZpfKzMSVOVeyQA
         i/Dp+/jJ0AA4ipYbgnrzvUrx/Orxb5zYYtccO2bZvjMqMXd45Md1gUshhUXXKkxAwl
         XLWQfmSze0/LPq5ORX0ATrgN8W48j7hKoKR+8UKGn7OECV1+IIqdeJUa/KUk3EyYa7
         y/Z3FIBFm1L+xcdcWfx+nAHenC8GYlx80m3Ecd266q0KvYFFBDWGDuizJu+0TyxlQR
         9a4yZ3FIO/Ywg==
Date:   Mon, 18 Oct 2021 17:29:53 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc:     Alex Henrie <alexhenrie24@gmail.com>, linux-input@vger.kernel.org,
        benjamin.tissoires@redhat.com, hadess@hadess.net, jslaby@suse.cz,
        juw@posteo.de, lukas@wunner.de
Subject: Re: [PATCH 3/3] HID: apple: Bring back flag for Apple tilde key
 quirk
In-Reply-To: <20211009184051.GA72740@elementary>
Message-ID: <nycvar.YFH.7.76.2110181728030.12554@cbobk.fhfr.pm>
References: <20211008073702.5761-1-alexhenrie24@gmail.com> <20211008073702.5761-3-alexhenrie24@gmail.com> <20211009184051.GA72740@elementary>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 9 Oct 2021, José Expósito wrote:

> > Some Apple ISO keyboards have a quirk where the backtick/tilde key is
> > swapped with the less-than/greater-than key. Unfortunately, there is no
> > perfectly reliable way to detect whether a keyboard has the quirk or
> > not, but the quirk appears to only be present on models that support
> > Bluetooth, and the affected keyboards usually report country code 13 in
> > the HID descriptor.
> > 
> > Therefore, the best we can do is to change
> > /sys/module/hid_apple/parameters/iso_layout to a ternary:
> > 
> > 0 = Not ISO or ISO and not quirky
> > 1 = ISO and quirky
> > -1 = Guess based on product ID and country code
> > 
> > Table of keyboards I have tested:
> > 
> > Product    Model  Shape  Labels      Bus  Country  Quirky
> > =========================================================
> > 05ac:0201  M2452  ANSI   Usonian     USB  0        No
> > 05ac:020b  A1048  ANSI   Usonian     USB  0        No
> > 05ac:020c  A1048  ISO    Québécois   USB  13       No
> > 05ac:0221  A1243  ISO    Norwegian   USB  13       No
> > 05ac:0221  A1243  ISO    Portuguese  USB  13       No
> > 05ac:0221  A1243  ISO    Swedish     USB  13       No
> > 05ac:0221  A1243  ISO    Swiss       USB  13       No
> > 05ac:022c  A1255  ANSI   Usonian     BT   33       No
> > 05ac:022d  A1255  ISO    Hebrew      BT   13       Yes
> > 05ac:022d  A1255  ISO    Québécois   BT   13       Yes
> > 05ac:022d  A1255  ISO    Spanish     BT   13       Yes
> > 05ac:023a  A1314  ISO    Russian     BT   13       Yes
> > 05ac:023a  A1314  ISO    Swiss       BT   13       Yes
> > 05ac:024f  A1243  ANSI   Usonian     USB  0        No
> > 05ac:0250  A1243  ISO    British     USB  13       No
> > 05ac:0250  A1243  ISO    German      USB  13       No
> > 05ac:0250  A1243  ISO    Italian     USB  13       No
> > 05ac:0250  A1243  ISO    Québécois   USB  13       No
> > 05ac:0251  A1243  JIS    Japanese    USB  15       No
> > 05ac:0255  A1314  ANSI   Usonian     BT   33       No
> > 05ac:0255  A1314  ANSI   Taiwanese   BT   33       No
> > 05ac:0255  A1314  ANSI   Thai        BT   33       No
> > 05ac:0256  A1314  ISO    Arabic      BT   13       Yes
> > 05ac:0256  A1314  ISO    French      BT   13       Yes
> > 05ac:0256  A1314  ISO    German      BT   13       Yes
> > 05ac:0256  A1314  ISO    Norwegian   BT   13       Yes
> > 05ac:0256  A1314  ISO    Spanish     BT   13       Yes
> > 05ac:0256  A1314  ISO    Swiss       BT   13       Yes
> > 05ac:0257  A1314  JIS    Japanese    BT   15       No
> > 05ac:0267  A1644  ANSI   Usonian     USB  33       No
> > 004c:0267  A1644  ANSI   Usonian     BT   0        No
> > 05ac:0267  A1644  ISO    British     USB  13       Yes
> > 004c:0267  A1644  ISO    British     BT   0        Yes
> > 05ac:0267  A1644  ISO    Swiss       USB  13       Yes
> > 004c:0267  A1644  ISO    Swiss       BT   0        Yes
> > 05ac:0267  A1644  ISO    Québécois   USB  13       Yes
> > 004c:0267  A1644  ISO    Québécois   BT   0        Yes
> > 05ac:0267  A1644  JIS    Japanese    USB  15       No
> > 004c:0267  A1644  JIS    Japanese    BT   0        No
> > 05ac:029c  A2450  ANSI   Usonian     USB  33       No
> > 004c:029c  A2450  ANSI   Usonian     BT   0        No
> > 05ac:029c  A2450  ISO    Spanish     USB  13       Yes
> > 004c:029c  A2450  ISO    Spanish     BT   0        Yes
> > 05ac:029c  A2450  JIS    Japanese    USB  15       No
> > 004c:029c  A2450  JIS    Japanese    BT   0        No
> 
> You can add to the table:
> 
> 05ac:0267  A1644  ISO    Spanish     USB  13       Yes
> 004c:0267  A1644  ISO    Spanish     BT   0        Yes
> 
> Tested here and it works as expected, both over USB and bluetooth,
> thank you very much for fixing it!
> 
> It's a pitty that we need to add a configuration option, for many users
> it is not going to be easy to discover it.
> 
> macOS doesn't have this issue, so there must be a way of detecting the keyboard
> layout... Unless they apply the quirk on user space checking the selected
> keyboard layout and language in settings.
> I bought ANSI English keyboard to see if I could figure out where is the
> difference but no luck so far.
> 
> For what it's worth, Tested-by: José Expósito <jose.exposito89@gmail.com>

Alex, could you please add the mentioned device IDs, include José's 
Tested-by: and resend, so that I could apply it?

Thanks,

-- 
Jiri Kosina
SUSE Labs

