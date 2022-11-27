Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF94639C1C
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 18:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiK0Rsu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 12:48:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiK0Rsu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 12:48:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455E1BF53
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 09:48:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D2AFA60DBA
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 17:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DF7C433C1;
        Sun, 27 Nov 2022 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669571328;
        bh=MGT60PCLMBTz3P1xuIjLiOqmyRCXzMZ72v/qAZbiU5o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kQ+VPQYISYNb5VympRKLfVvIOXyogznvHUJttxlmof2Em35kDc70K2EnhqJRMCtMM
         AZYsyGpyccfnBrhIN9oN4x8adnAbYW0sWqKzefke7D5jKqiWS4r1AfcYqZhYJRMvdK
         IYy/bZ+I+Clkv0HQBLGHaISETPNg6DoSmR4SOKaPTrCfjMrcOqBkWPaXN69wR1zGu2
         Sc62gULo9ld62a5wKEACrtSvdEdcbGg2T1oRFeuxmhk7KEPGuEw/IbtgdHaPPh2b3R
         JdHL0YsIukEdzC10MfkFguzLmWd59eTit5aTjHWJxFWJR/IZWMzAyrW8YxqwWbSrSq
         tfD47Rx3gX31Q==
Date:   Sun, 27 Nov 2022 18:01:26 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 7/9] Input: n64joy - Fix DMA buffer alignment.
Message-ID: <20221127180126.349290c3@jic23-huawei>
In-Reply-To: <20221127184844.f967054e30c47a3caa5090eb@gmx.com>
References: <20221127144116.1418083-1-jic23@kernel.org>
        <20221127144116.1418083-8-jic23@kernel.org>
        <20221127184844.f967054e30c47a3caa5090eb@gmx.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 27 Nov 2022 18:48:44 +0200
Lauri Kasanen <cand@gmx.com> wrote:

> On Sun, 27 Nov 2022 14:41:14 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > The use of ____cacheline_aligned to ensure a buffer is DMA safe only
> > enforces the start of the buffer alignment. In this case, sufficient
> > alignment is already ensured by the use of kzalloc().
> > ____cacheline_aligned does not ensure that no other members of the
> > structure are placed in the same cacheline after the end of the
> > buffer marked.  Thus to ensure a DMA safe buffer it must be at the end
> > of the structure.  
> 
> This move is unnecessary, because the cacheline is 16 bytes and the
> buffer is 64 bytes.

Ah.  That particular option hadn't occurred to me (and I'd failed to notice
how big the buffer is :( ).
The marking isn't needed at all then as the allocation is already
guaranteed to be sufficiently aligned. However, maybe that is a bit subtle
and having some sort of marking is useful.

Curious question though, why is the buffer so big?
Each struct joydata is 8 bytes I think, but the driver only accesses 4 of them.

Is the hardware putting garbage into the remaining 2 cachelines or is there
something subtle going on?

Or given my earlier success, maybe I'm misreading the code entirely.

Jonathan

> 
> > Whilst here switch from ____cacheline_aligned to
> > __aligned(ARCH_KMALLOC_MINALIGN) as on some architectures, with variable
> > sized cacheline lines across their cache hierarchy, require this
> > greater alignment guarantee for DMA safety.  Make this change throughout
> > the driver as it reduces need for a reader to know about the particular
> > architecture.  
> 
> This change looks ok.
> 
> - Lauri

