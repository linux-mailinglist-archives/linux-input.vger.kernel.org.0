Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988B552ABED
	for <lists+linux-input@lfdr.de>; Tue, 17 May 2022 21:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352720AbiEQT3f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 May 2022 15:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352718AbiEQT3c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 May 2022 15:29:32 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFC9506F6;
        Tue, 17 May 2022 12:29:31 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:3d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EEBF76D6;
        Tue, 17 May 2022 19:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EEBF76D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1652815771; bh=wH+Dyew/Mz6z59CEKxy9UMuLYVJ1OJ1JMnurh2ah8t4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QPeSmljy02nGrrxIcgVDxrYO8oz/LYrKjeXuKNOwlYxswHcV4eo1u3FF4lx6vBgXW
         h2p4YKlqXi6Mbd1zSDxgyM5DCjYVbZ41pL5b2TZ0OJESj0OUbPEk8nDAtJtpzLccPs
         qsOAoDxO3QKj461y+Gxn3cDQiTpop0WYk8z1AiMZ0bke2RRquXaD9M58NmBH1ESnE5
         UcT7UQutXetSGVqY+FFOAkTVhjyXisbVnqqoTqRX9+NvrOaSaQePY0kSttuf24GLS4
         QJoB6dqZdTpME+Dy21/sIPuKmz5FWmNwdY/zOeIAJRXpk0ZsCc3jaY23VjGbKAjX+r
         /Y+ouLFHjdv6Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] input: Docs: correct atarikbd.rst typos
In-Reply-To: <20220516002055.12000-1-rdunlap@infradead.org>
References: <20220516002055.12000-1-rdunlap@infradead.org>
Date:   Tue, 17 May 2022 13:29:30 -0600
Message-ID: <87y1z0ufdx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Fix 2 "MOSE" typos in atarikbd.rst (found with 'codespell').
> a. s/MOSE/MODE/
> b. s/MOSE/MOUSE/
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/input/devices/atarikbd.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- a/Documentation/input/devices/atarikbd.rst
> +++ b/Documentation/input/devices/atarikbd.rst
> @@ -288,7 +288,7 @@ between 0 and large positive numbers. Ex
>  command sets the maximum positive value that can be attained in the scaled
>  coordinate system. Motion beyond that value is also ignored.
>  
> -SET MOUSE KEYCODE MOSE
> +SET MOUSE KEYCODE MODE
>  ----------------------
>  
>  ::
> @@ -333,7 +333,7 @@ occur before the internally maintained c
>  (independently scaled for each axis). Remember that the mouse position
>  information is available only by interrogating the ikbd in the ABSOLUTE MOUSE
>  POSITIONING mode unless the ikbd has been commanded to report on button press
> -or release (see SET MOSE BUTTON ACTION).
> +or release (see SET MOUSE BUTTON ACTION).
>  

Applied, thanks.

jon
