Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42CB577222B
	for <lists+linux-input@lfdr.de>; Mon,  7 Aug 2023 13:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbjHGLaT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Aug 2023 07:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjHGLaF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Aug 2023 07:30:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8D8359A;
        Mon,  7 Aug 2023 04:27:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12A8C6182A;
        Mon,  7 Aug 2023 11:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192DAC433C8;
        Mon,  7 Aug 2023 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691407550;
        bh=huj/YZI6eACOtA8GcLj19qMOP6KUe7+ijru9lKFOs8k=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=AoX7+p9SFW+Dua5G7nm4+BtAAs3FIgpaBYjXuGx+wwLZQLx1oFiYy22UIJkAyA+L9
         5ExgbHXq5iqv/3lgRqJr9q2mZh7RaqE5HC6JEn7qGUa+zgLf9u6NyzBQKthU+w2l6A
         H7g+91VUD+v9JSL4itNdCUfB0I9IrUJ6xgDSlGgJgCcF3lnmHuDx1jS/LQgJ/fQfml
         a99wnOoeWSq7lde1Tgk6aB32shTnvZYxd3OJxl+WF7ydTcQ2hgkj6icrZKe9QkZiD5
         p4EJLON1DT2+xh/tSywfLm2fpZU4t+U5osr8Ftq9oiztTmqC7EBiQGQ1i50YW0ZxYW
         Ik3xw6Qw+JjuQ==
Date:   Mon, 7 Aug 2023 13:25:46 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
cc:     Marco Morandini <marco.morandini@polimi.it>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] HID: Add introduction about HID for non-kernel
 programmers
In-Reply-To: <87lef9c8jz.fsf@meer.lwn.net>
Message-ID: <nycvar.YFH.7.76.2308071325150.14207@cbobk.fhfr.pm>
References: <9c021454-bb7a-a8ce-dc2d-ee9f168c9db5@polimi.it> <87lef9c8jz.fsf@meer.lwn.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 21 Jul 2023, Jonathan Corbet wrote:

> > Add an introduction about HID meant for the casual programmer
> > that is trying either to fix his device or to understand
> > what is going wrong.
> >
> > Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
> > Co-authored-by: Peter Hutterer <peter.hutterer@who-t.net>
> > ---
> > v2: https://lore.kernel.org/linux-input/70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it/
> >
> > changes: 
> >   - corrections suggested in https://lore.kernel.org/linux-input/20230627060437.GA726439@quokka/
> >   - corrections suggested in https://lore.kernel.org/linux-input/f53e756f-7c81-1c79-23ea-b9009fdd2ef4@infradead.org/
> >   - corrections suggested in https://lore.kernel.org/linux-input/20230710021034.GA600582@quokka/
> >   - corrections suggested in https://lore.kernel.org/linux-input/20230717001544.GA129954@quokka/
> >   - some rewording of Documentation/hid/hidreport-parsing.rst
> >
> >  Documentation/hid/hidintro.rst          | 524 ++++++++++++++++++++++++
> >  Documentation/hid/hidreport-parsing.rst |  49 +++
> >  Documentation/hid/index.rst             |   1 +
> >  include/linux/hid.h                     |  23 ++
> >  4 files changed, 597 insertions(+)
> >  create mode 100644 Documentation/hid/hidintro.rst
> >  create mode 100644 Documentation/hid/hidreport-parsing.rst
> 
> Is there a plan for this patch?  Please let me know if I should take it
> through the docs tree.

I have now queued this in hid.git#for-6.5/doc. Sorry for the delay, I was 
off for pretty much whole July, and it takes time to go through all the 
things that accumulated.

Thanks,

-- 
Jiri Kosina
SUSE Labs

