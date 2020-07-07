Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393672176BE
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 20:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgGGSaW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jul 2020 14:30:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:45138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728149AbgGGSaV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jul 2020 14:30:21 -0400
Received: from embeddedor (unknown [200.39.26.250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41180206F6;
        Tue,  7 Jul 2020 18:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594146621;
        bh=xTRNX+tombqeYkaSwvGumK40pfLh5dWiBc6gh61ysqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0YrtAj7tQ/yq/2V3gsl6Ih2gYIDovZiLEolwSX/XiOdfmF9uZ63hV0ipmstb1K+jt
         WQsXiCGOQbtbEtlYZsEYtG28/Y5T27RMjPb6GRbnDJJIvn8sDGfJsPlUKtriUJbTMF
         XqFUn8bzlgICV3qF40EiAbWfT5TODneOvdBlDJ2A=
Date:   Tue, 7 Jul 2020 13:35:48 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH][next] Input: Use fallthrough pseudo-keyword
Message-ID: <20200707183548.GA1280@embeddedor>
References: <20200707180857.GA30600@embeddedor>
 <20200707182654.GF3273837@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707182654.GF3273837@dtor-ws>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 07, 2020 at 11:26:54AM -0700, Dmitry Torokhov wrote:
> On Tue, Jul 07, 2020 at 01:08:57PM -0500, Gustavo A. R. Silva wrote:
> > Replace the existing /* fall through */ comments and its variants with
> > the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> > fall-through markings when it is the case.
> > 
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Applied, thank you.
> 

Thanks, Dmitry.

--
Gustavo
