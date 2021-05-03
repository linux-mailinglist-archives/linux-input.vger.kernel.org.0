Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580E537233A
	for <lists+linux-input@lfdr.de>; Tue,  4 May 2021 00:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhECWwW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 May 2021 18:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhECWwV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 May 2021 18:52:21 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5170DC061574;
        Mon,  3 May 2021 15:51:28 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d:444a:d152:279d:1dbb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6D21F9B4;
        Mon,  3 May 2021 22:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6D21F9B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620082287; bh=vUYn10gfkWACgeF91tNwBUDU+sGLPwXv/C8uXC9/XBw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=hI+cLCGpKhPZskStOIVlPB9ZZ0sNE5TwR8XMMCu/fOjsQhgrKh/AsInLp9ed+1GIh
         dPGFdmDigsYUVHjPuMXoAXVry9HXlGgF+U6JCJMLBBNX07cKzs4G+52BI/PKRE//+b
         FB08xIXH6yX1r+C1DHKJH6fqrDnR9eRkJ493tzTxwZ05wdG+ygee//n7ABs4HSbIYK
         MM9jDuXoeItS/UvwtnrRSVCU8X8Wr+vZ4sY361IddV3KlxV3i5xb+bCA24wdlAGGvI
         agUY8myalGAFqt1fiydhjXwJMsGJ+n0FnKaBUOH1A8Et/tfrfO2+FpuMe6yeGCysBC
         eXmjDIMTi6qTQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Documentation: input: joydev file corrections
In-Reply-To: <20210429063137.20232-1-rdunlap@infradead.org>
References: <20210429063137.20232-1-rdunlap@infradead.org>
Date:   Mon, 03 May 2021 16:51:26 -0600
Message-ID: <87mttbh1n5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Fix typos, grammar, punctuation in
> Documentation/input/joydev/*.rst files.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> ---
>  Documentation/input/joydev/joystick-api.rst |   14 ++++-----
>  Documentation/input/joydev/joystick.rst     |   26 +++++++++---------
>  2 files changed, 20 insertions(+), 20 deletions(-)

Applied, thanks.

jon
