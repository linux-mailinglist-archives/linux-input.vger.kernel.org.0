Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C06234FBFCF
	for <lists+linux-input@lfdr.de>; Mon, 11 Apr 2022 17:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347560AbiDKPHw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Apr 2022 11:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347671AbiDKPHs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Apr 2022 11:07:48 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A8220BC6
        for <linux-input@vger.kernel.org>; Mon, 11 Apr 2022 08:05:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B0798CE18F1
        for <linux-input@vger.kernel.org>; Mon, 11 Apr 2022 15:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5250C385A4;
        Mon, 11 Apr 2022 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649689529;
        bh=a10hO7r9qzkEPYzlCXPNa5oht7q0riBmtTn/daDCQ1M=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=IyOoca+QvWyVjp0LvlO7PPxDpQbrkEGruCvhv37VMfPocRdRx/35c6dTiGVnFR/FD
         1H5Iqf8bPWlb6cZoWWdWy1dujMW2++d89WUq5F9zurazbWb2BFSv7HHc/0VwPeur2F
         VtiySzFy9Gp7yesg4V2aVCiOk8KYUubIo6mfV2fY/tMp2IwdqbIeJ0akI9GKUXHUJx
         ONbul6gLPAqzXp/A2HWv12pU9DdBhbsdke3Kb8n296yHot4OuRkCJSIR9xyQaZU6+l
         91uISL8xS80F7UpEajQqRXFaQ72o1QzSyxpMUl46ZGI8AqJOC2/xNZAG7VY/bnPiR2
         REYycrXqeiLYg==
Date:   Mon, 11 Apr 2022 17:05:26 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Nehal-bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>
cc:     benjamin.tissoires@redhat.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] amd_sfh: Remove name  from maintainers list
In-Reply-To: <20220408094717.847209-1-Nehal-bakulchandra.Shah@amd.com>
Message-ID: <nycvar.YFH.7.76.2204111705210.30217@cbobk.fhfr.pm>
References: <20220408094717.847209-1-Nehal-bakulchandra.Shah@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 8 Apr 2022, Nehal-bakulchandra Shah wrote:

> From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> 
> Remove my name from maintainer-ship of AMD SENSOR FUSION HUB DRIVER
> 
> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd768d43e048..864d26404711 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1043,7 +1043,6 @@ F:	arch/arm64/boot/dts/amd/amd-seattle-xgbe*.dtsi
>  F:	drivers/net/ethernet/amd/xgbe/
>  
>  AMD SENSOR FUSION HUB DRIVER
> -M:	Nehal Shah <nehal-bakulchandra.shah@amd.com>
>  M:	Basavaraj Natikar <basavaraj.natikar@amd.com>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

