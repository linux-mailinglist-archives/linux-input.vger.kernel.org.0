Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC8352ABF6
	for <lists+linux-input@lfdr.de>; Tue, 17 May 2022 21:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352732AbiEQTaH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 May 2022 15:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352744AbiEQTaC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 May 2022 15:30:02 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23163506E0;
        Tue, 17 May 2022 12:29:53 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:3d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D3F1077D;
        Tue, 17 May 2022 19:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D3F1077D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1652815793; bh=OBzRUCW8ddO4NPOBKcocR9YkpBA9oZ1Is7paLy2cbE8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=UA/faQw42VSKim4c6CiTATiJ4mLFwO8FFOjo9lpkXjzGizMx0L9twn6wjHUkwKtdl
         POGxT7AXpxjXuKxsUw8n3aIOwrToilcLJf0wkSReaf5pSM7gGhcBewozETHAcbAF+w
         gyO1RXYrcxqRnt7j0KfFAfgF2MNj4OZvmZ9yq30aKfpcQ0DRH7z0zpU4hO+gYM96Zt
         tdzqy1av8SJaBHwCsvJaY20PPFp5CHJCGWy7r77gQj1rhBT+TcyxQEvUySGjX1xgfi
         QpWI0tB7LAQSF/wZaqpqoL7cbX7SsRBLL06Gfa+UMfKrwh94/vezwOLA4TgUMTFxGQ
         xEWC6ZeUNXttg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] input: Docs: correct ntrig.rst typo
In-Reply-To: <20220516002047.11395-1-rdunlap@infradead.org>
References: <20220516002047.11395-1-rdunlap@infradead.org>
Date:   Tue, 17 May 2022 13:29:52 -0600
Message-ID: <87tu9oufdb.fsf@meer.lwn.net>
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

> Fix a typo in ntrig.rst (found with 'codespell').
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/input/devices/ntrig.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- a/Documentation/input/devices/ntrig.rst
> +++ b/Documentation/input/devices/ntrig.rst
> @@ -32,7 +32,7 @@ The following parameters are used to con
>  |activation_height,	|size threshold to activate immediately		      |
>  |activation_width	|						      |
>  +-----------------------+-----------------------------------------------------+
> -|min_height,		|size threshold bellow which fingers are ignored      |
> +|min_height,		|size threshold below which fingers are ignored       |
>  |min_width		|both to decide activation and during activity	      |
>  +-----------------------+-----------------------------------------------------+

Applied, thanks.

jon
