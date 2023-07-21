Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A54775D5BD
	for <lists+linux-input@lfdr.de>; Fri, 21 Jul 2023 22:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjGUU3j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jul 2023 16:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjGUU3i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jul 2023 16:29:38 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5D0B7;
        Fri, 21 Jul 2023 13:29:37 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id F0F40733;
        Fri, 21 Jul 2023 20:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F0F40733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689971377; bh=K8YYCx06vp8NIpzDLIV9skou8jj6r9/2NAyb3DhvZ3k=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=Y20Kcs7SBCp/tTa4eorswsn3vuXJaYNBV71Z2Xyarg63TNCccA0dJWYHi8CexzaML
         8vWyvcOCaJmhjsubgggjjR6fNEmN3EwBZXwZxB1asbDyo3efBfjDf+PpPSzNkND3Wu
         qeL0uhNfxeJ8vGTERiNcSU8gDou9kp0uhBVozqHtQLgfN4R1Hd2z1Qwm1chkbQ5//n
         8yZDgXS0qLol7jp95idxdGT3fATIekPNokQ6AgylrUcyytpKS6xHA1XCoWZjo1kMz3
         Nrm1g3JBtP/bhk1/LvpJn2LA0JIQaXal/2ANB4nT4fueTyM8n5on2Xx68hRfS8abB6
         sPKTuGiQd5bYA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Marco Morandini <marco.morandini@polimi.it>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] HID: Add introduction about HID for non-kernel
 programmers
In-Reply-To: <9c021454-bb7a-a8ce-dc2d-ee9f168c9db5@polimi.it>
References: <9c021454-bb7a-a8ce-dc2d-ee9f168c9db5@polimi.it>
Date:   Fri, 21 Jul 2023 14:29:36 -0600
Message-ID: <87lef9c8jz.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Marco Morandini <marco.morandini@polimi.it> writes:

> Add an introduction about HID meant for the casual programmer
> that is trying either to fix his device or to understand
> what is going wrong.
>
> Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
> Co-authored-by: Peter Hutterer <peter.hutterer@who-t.net>
> ---
> v2: https://lore.kernel.org/linux-input/70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it/
>
> changes: 
>   - corrections suggested in https://lore.kernel.org/linux-input/20230627060437.GA726439@quokka/
>   - corrections suggested in https://lore.kernel.org/linux-input/f53e756f-7c81-1c79-23ea-b9009fdd2ef4@infradead.org/
>   - corrections suggested in https://lore.kernel.org/linux-input/20230710021034.GA600582@quokka/
>   - corrections suggested in https://lore.kernel.org/linux-input/20230717001544.GA129954@quokka/
>   - some rewording of Documentation/hid/hidreport-parsing.rst
>
>  Documentation/hid/hidintro.rst          | 524 ++++++++++++++++++++++++
>  Documentation/hid/hidreport-parsing.rst |  49 +++
>  Documentation/hid/index.rst             |   1 +
>  include/linux/hid.h                     |  23 ++
>  4 files changed, 597 insertions(+)
>  create mode 100644 Documentation/hid/hidintro.rst
>  create mode 100644 Documentation/hid/hidreport-parsing.rst

Is there a plan for this patch?  Please let me know if I should take it
through the docs tree.

Thanks,

jon
