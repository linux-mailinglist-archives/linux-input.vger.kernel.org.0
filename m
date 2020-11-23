Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6952C18CE
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 23:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbgKWWsh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 17:48:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:50258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgKWWsh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 17:48:37 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33380206D8;
        Mon, 23 Nov 2020 22:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606171716;
        bh=NHP7DeFuTriFmLmgIAMA3888uSWouW8p1oJNbPF8Ax8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nqn63GevH1MwQQ0HpdIDNDSJrHpQKqwt6WH4RQcs+CD0/6/034vOOlsOUGlfBJ5p+
         LjJgYgxV1ZjLU2iFDX1ts71IbtR0a2hLfkIZb9sCKlZ4lU7zrN1s1tTKKCarn59zpY
         0nZEJ8q9aERlLOAkcmDOEZOFIJec0Dxb1I8jVm9A=
Date:   Mon, 23 Nov 2020 16:48:50 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 037/141] Input: pcspkr - Fix fall-through warnings for
 Clang
Message-ID: <20201123224850.GK21644@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <4b659e3e65f2fa3c8bb7ed153e2016c3fb395bbc.1605896059.git.gustavoars@kernel.org>
 <20201123061555.GW2034289@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123061555.GW2034289@dtor-ws>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 22, 2020 at 10:15:55PM -0800, Dmitry Torokhov wrote:
> On Fri, Nov 20, 2020 at 12:30:02PM -0600, Gustavo A. R. Silva wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a break statement instead of just letting the code
> > fall through to the next case.
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Applied, thank you.

Thanks, Dmitry.
--
Gustavo
