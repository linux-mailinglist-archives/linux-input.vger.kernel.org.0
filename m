Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7BD5F0731
	for <lists+linux-input@lfdr.de>; Fri, 30 Sep 2022 11:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiI3JIr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 05:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiI3JIp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 05:08:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D42B7EF
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 02:08:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 98A1262256
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 09:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332A5C433D6;
        Fri, 30 Sep 2022 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664528924;
        bh=0CRGGFF7pXLcSJsG/PpRhb9g52hGBaokNSD+dc0E534=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=RSWq84sjsgu01RXgrM3oygdXrnxP410i4ZLrqBUunKzK2+FmN9qckmAK3nZqKM6KA
         RdJu3WGpfJosYk7Ys5yT1UO3GUshTSe8hcxbGRS3gkjG/rFy9Ptoxpocr60dIavj5Q
         QDZRFCxr/auYQR3nnlQzRo5qM3ZvUVYHeCWvKmzWI8e00qfyiuBvc1p96uSqjAdGZ8
         LqcjpKiMH6VObZB/PtTaxa8d4T5mpHxRYW/D3X7XW3M3EGcjphs3cOrsaxgRLY4NZm
         fknVqhI1PIwydNdfzZtF9KZkTgB6ALKmS0G+mK//WXyLKqg1QLCmMHl0yBae5G3E4o
         ZED9ywX5q3RFQ==
Date:   Fri, 30 Sep 2022 11:08:40 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ping Cheng <pinglinux@gmail.com>
cc:     linux-input@vger.kernel.org, Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: add three styli to
 wacom_intuos_get_tool_type
In-Reply-To: <20220928204929.56157-1-ping.cheng@wacom.com>
Message-ID: <nycvar.YFH.7.76.2209301108330.16823@cbobk.fhfr.pm>
References: <20220928204929.56157-1-ping.cheng@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 28 Sep 2022, Ping Cheng wrote:

> We forgot to add the 3D pen ID a year ago. There are two new pro pen
> IDs to be added.
> 
> Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
> ---
>  drivers/hid/wacom_wac.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 4fc64bd..a04f66a 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -723,11 +723,14 @@ static int wacom_intuos_get_tool_type(int tool_id)
>  	case 0x802: /* Intuos4/5 13HD/24HD General Pen */
>  	case 0x8e2: /* IntuosHT2 pen */
>  	case 0x022:
> +	case 0x200: /* Pro Pen 3 */
> +	case 0x04200: /* Pro Pen 3 */
>  	case 0x10842: /* MobileStudio Pro Pro Pen slim */
>  	case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
>  	case 0x16802: /* Cintiq 13HD Pro Pen */
>  	case 0x18802: /* DTH2242 Pen */
>  	case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
> +	case 0x80842: /* Intuos Pro and Cintiq Pro 3D Pen */
>  		tool_type = BTN_TOOL_PEN;

Applied, thanks Ping.

-- 
Jiri Kosina
SUSE Labs

