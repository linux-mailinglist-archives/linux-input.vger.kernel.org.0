Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B429708F2E
	for <lists+linux-input@lfdr.de>; Fri, 19 May 2023 07:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjESFI1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 May 2023 01:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjESFI0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 May 2023 01:08:26 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA40BE45
        for <linux-input@vger.kernel.org>; Thu, 18 May 2023 22:08:22 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id B68895C00B6;
        Fri, 19 May 2023 01:08:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 19 May 2023 01:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1684472899; x=1684559299; bh=x7
        PTZCCZ/z8wDI8lOlbDcWLsPldCkllVhFePRYxWqO0=; b=0886cnJ6Yky++G/ILk
        x4dL7YlJoblldT/IsVZ6vx850GgLzXm4PxlCe+BdMTSzdHdAHZKqZRHGoKUuVdqJ
        h6yqBqoUGjYW3FuZWilup9GD5tlwrrVmKLbKvymAgEsftWsrR5jCByMb59jX8dLB
        objLhNaFFSpa7apyF4tMuFPXOhUOCzkOLN7ofArRpkV86MYbg08LHQ0Sxyny/crV
        MYTLDYBcYaVifZG1x05EsGSwpt1e1GeuW+WyXvkTqXapiabOlECqLlcfIazBKDJC
        dlYnpkZNzOE0HRPHh28sDicbZqKo38UDZw0vA/Ll4PH5GpIV9Rh368GH3+DgQFTh
        VYZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1684472899; x=1684559299; bh=x7PTZCCZ/z8wD
        I8lOlbDcWLsPldCkllVhFePRYxWqO0=; b=y5GJi2JPZt3mfSt9IfTMpWfgigdeZ
        4U0DqoWnzE0bH/K7UnuoWRCo5lQxLQHyCLer0Zpe+N/obvY5P7k0JWm+DIaIVlvo
        n2JgzfCq34Ru7vda068lPR9iXgqSTmpB7qgFiTbQVazrlyWKJ0rCbrWP7N4le2mf
        0srEVs+e7m5Ne0zpzkGlYmbwfQHeo8ZX3RQvY13aBXQGQLw6aDK5UKMKiGmklgQe
        xX5Vw3ZF7BWiqQlPO23sgx6XR6lAneGfenennpGYqIHAMygZPkCZWkKQlL/CZAzg
        0s/yeL9AoSfHS55ShKCusfWVKwtENttkTqrIN63znVYx5VG0oqe9VpXaA==
X-ME-Sender: <xms:QwRnZOPXefe8uas8NxhWtkwsJlPxmDUcZO7d4TT3Qqjv3mnJLIb8Mg>
    <xme:QwRnZM_5EP5CwfGgSJuOXdpMGwTJfxaAyvaNBIsITuXHsnLcFxjZ8pv42giwQV47O
    wf8vB3KK3EuVM47QXk>
X-ME-Received: <xmr:QwRnZFSv3jFznUPwkcWxzRv8EnV3zHK1TWwxytjvHcDAFlFvQhbz-cFDpsrx6iKFF7xbNOXw48ExtNmHrnKNB9Kktb29P_-rpmbk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeekvdekgeehfeejgfdvudffhfevheejffevgfeigfek
    hfduieefudfgtedugfetgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:QwRnZOuKqQty7Pa2KQIVtST-xw-9l_ZfS7NCvvsE6x6GFVF-ocRZWQ>
    <xmx:QwRnZGcM52DdHoc21-zubbj9uMoDGu8JJn1VBAtu_PCx6wDSsHMGhQ>
    <xmx:QwRnZC1uXxl18tKhsBbkH6TWeo5mwWizrYv0n0mzc65W5_4BI6VeEw>
    <xmx:QwRnZKHocPL33nvWFWGtpLMTWlyWn5PogQGhgc07OEPDC2W_xh7Drg>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 May 2023 01:08:17 -0400 (EDT)
Date:   Fri, 19 May 2023 15:08:12 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: novatek-nvt-ts - fix input_register_device()
 failure error message
Message-ID: <20230519050812.GA432263@quokka>
References: <20230513131712.259057-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230513131712.259057-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, May 13, 2023 at 03:17:12PM +0200, Hans de Goede wrote:
> Fix input_register_device() failure logging "failed to request irq"
> as error message.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>

Cheers,
 Peter

> ---
>  drivers/input/touchscreen/novatek-nvt-ts.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
> index 3e551f9d31d7..e7f30eeb91ca 100644
> --- a/drivers/input/touchscreen/novatek-nvt-ts.c
> +++ b/drivers/input/touchscreen/novatek-nvt-ts.c
> @@ -272,7 +272,7 @@ static int nvt_ts_probe(struct i2c_client *client)
>  
>  	error = input_register_device(input);
>  	if (error) {
> -		dev_err(dev, "failed to request irq: %d\n", error);
> +		dev_err(dev, "failed to register input device: %d\n", error);
>  		return error;
>  	}
>  
> -- 
> 2.40.1
> 
