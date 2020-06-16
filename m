Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36F61FB649
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 17:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgFPPfB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 11:35:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:45848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729627AbgFPPfA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 11:35:00 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54BB6208B3;
        Tue, 16 Jun 2020 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592321700;
        bh=G7RNOAh0TjW7w/eqygx9XVsCddug7QF6AH+5CbfsSgg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LF19z7hTW1lDiBcUVQDgYLm82BO8mZ2NY0EMiZ3vPDfsBr+CjhybZVIIRat6K9f5P
         2FpRi3Y99SIAQLHrSWQbdku7VFuCnhyVvx8TnmE6FdTXHskNBJGIl5nTDmDQpGwlZh
         sLL4/aINTJHuKnNqfEBX3BFqfKaCaix+zQDzE5Z4=
Date:   Tue, 16 Jun 2020 17:34:57 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Yariv <oigevald+kernel@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: magicmouse: do not set up autorepeat
In-Reply-To: <20200524235134.GA143513@dtor-ws>
Message-ID: <nycvar.YFH.7.76.2006161734390.13242@cbobk.fhfr.pm>
References: <20200524235134.GA143513@dtor-ws>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 24 May 2020, Dmitry Torokhov wrote:

> Neither the trackpad, nor the mouse want input core to generate autorepeat
> events for their buttons, so let's reset the bit (as hid-input sets it for
> these devices based on the usage vendor code).
> 
> Reported-by: Yariv <oigevald+kernel@gmail.com>
> Tested-by: Yariv <oigevald+kernel@gmail.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> Jiri, Benjamin, this is fixes jitter in event packets that became
> apparent when we moved the point at which timestamps are being
> generated, so maybe mark for stable?

I've marked it for stable, fixed the typo in the comment, and applied, 
thanks.

-- 
Jiri Kosina
SUSE Labs

