Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FCF37A280
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 10:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhEKIvW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 04:51:22 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:11750 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhEKIvV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 04:51:21 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620723006; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ssw2nfbJInwO2EZDBz1hpWgmX+x8qdNbHngLj2q5MLnV1nPTbfRJxjav0czKXq1h35
    2JazBrdv1385wJxv933ltuMjBLwvgpZOmcKUBqk+QnRextehVWuOXgLYxLrhZ0UT6v4S
    28YDnn0EDeNt0x0SeUgmli/hI4xguY/RmDPmYGaORNVQ/4VJkSTxv2A7SiVqZaASksQ6
    CzbPrOy7WIoLJUjWvqUQv4aIaeJn+bxDcFUSg/JaGYFCRdYbIzq6tvJRHca/CoWqp5RV
    VpOyYIrKSkwn6+qY2PGj2wd+5iw69n857Hrk+J/gD0LKqspGi+054yV+O0xOcTuw5d+N
    X+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620723006;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=HuyggU0+c1IyGuqhfH37nqp0a2aZqTw9VSyu5gx2FuI=;
    b=bj5F/p/HxQJbkKmh5bvJ4og2RD6dxeOHkQQwASJti5iiEKUWJAKxalZwNoBBBCd4Sm
    +ux5e2Z0yIYj7JvIeGpSppkPYWZnuAoGw954Or/ESkZ3lQKksl1tU8yoGOjlGB/8I+Ku
    aOkczFD5kbNVkpc7tc51/GyO0RzDERL87TioY9fu4Jub0/v66kf77soKMUPCnjkM90if
    vnIL9N3uon9UfyX8VdEaJkb51TZJzFMyv+39J56m4KtMxy7cFR1lklXCJxp12o6KuQu8
    4EQaywKRBKc3iXbSx9W0YsLt55iBC3lEuNUHzZHgNM9ADxacpmZ22NksQhNUkIMciEzT
    wwHQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620723006;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=HuyggU0+c1IyGuqhfH37nqp0a2aZqTw9VSyu5gx2FuI=;
    b=tA2ATFgf7hZEJ3fH7rXkFEq3jbW042aEnnPszG0yTT84mglI4gcFCooinVWefT2sx2
    EKN7T3X64KxybpdwfdBd/7u7i/1itf9Ta9dXvZ7niS53Ryr36H6RZZ1fJUs7UP2fjdEv
    laZFeu0FStR2Nq9S82C5wlu/Q0FEO7ISRfDdtSUneRGMExhlDu4hH8vzcEmSKSJ6Mzq3
    QH5UcVns7ES4iNUIjm70X+DQoi6zv41OpUkkeZ/mi/HoF0NtcMREkNIO905V66tv+U5H
    ENa0a3Y9aik8droOGhmJNsNjnDFughMr0Vl4j10ahnqjBGx6zna5FM9uxP5IaaXb4nb6
    be/Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j8IczFY4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.25.6 DYNA|AUTH)
    with ESMTPSA id e01f26x4B8o6bkS
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 11 May 2021 10:50:06 +0200 (CEST)
Date:   Tue, 11 May 2021 10:50:01 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <YJpFOVv1ifKBEwWV@gerhold.net>
References: <20210510193108.50178-1-stephan@gerhold.net>
 <20210510193108.50178-2-stephan@gerhold.net>
 <20210510194848.g7cgty3lirxkht5g@core>
 <YJmUm/6Vm3d9hp1z@gerhold.net>
 <YJowd/tDgVD2TBKO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YJowd/tDgVD2TBKO@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 11, 2021 at 10:21:27AM +0300, Andy Shevchenko wrote:
> On Mon, May 10, 2021 at 10:16:41PM +0200, Stephan Gerhold wrote:
> > On Mon, May 10, 2021 at 09:48:48PM +0200, Ondřej Jirman wrote:
> > 
> >   - Bulk regulator API: AFAICT there is no way to use it while also
> >     maintaining the correct enable/disable order plus the 10us delay.
> >     See https://lore.kernel.org/linux-input/X%2Fwj+bxe%2FIlznCj6@gerhold.net/
> 
> This by the way can be fixed on regulator level (adding some like ranges into
> bulk structure with timeouts, and if 0, skip them).
> 

At the moment the bulk regulator API seems specifically designed to
enable all the regulators at the same time (with some funky asynchronous
scheduling code). I'm not sure if there is a straightforward way to
fit in a sequential enable/disable order with potential delays.

I'm also not entirely convinced it's worth it in this case. I would say
the code in this patch (except for the dev_err_probe()) is still quite
easy to read. Encoding the enable/disable order + delays in some bulk
regulator struct might actually be more difficult to read.

Thanks,
Stephan
