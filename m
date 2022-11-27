Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 583B4639BA5
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 17:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiK0QOM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 11:14:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiK0QOM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 11:14:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89CCBCB0
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 08:14:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D24460DD7
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 16:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956E9C433D6;
        Sun, 27 Nov 2022 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669565650;
        bh=Yfnru+ngYd5IAPFV/iB+8H0i+Oxh9nndiG25JkVjV1Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EoiIWkZGwi2E+1a9uqmlCk81hHabDBkzTegMHKjgxXERJ0I58ghQHD2/U303EU33V
         FJ08l6+WfX6O2m8nhYldrck+TC+FXo1tiFCGRIfoF0VEOszTN/QRQoIBfxRA+kUjkC
         zzVXgNO9Qv0nPr23u9ypBKjeEzNr4NGBi9LwrhojkMKQeCyoMnI3Nk/t3U5TskVMUr
         +ZpmB0WCA33NhWUqJSad3VRV7JlIuBF/AR8e1KdyglLLG2mHe6HwmItLiexRUokbWj
         0HS6YPlJ2Ufcx7iEo9M51NK6f4ZDKujJJm3u/T99At5PDnQSUaCbrIZ7ayVmVlH7lu
         LfztLXbhnYVig==
Date:   Sun, 27 Nov 2022 16:26:48 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 6/9] Input: surface3 - Fix padding for DMA safe buffers.
Message-ID: <20221127162648.258144cc@jic23-huawei>
In-Reply-To: <20221127144116.1418083-7-jic23@kernel.org>
References: <20221127144116.1418083-1-jic23@kernel.org>
        <20221127144116.1418083-7-jic23@kernel.org>
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

On Sun, 27 Nov 2022 14:41:13 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> On some architectures (e.g. arm64), ____cachline_aligned only aligns
> to the cacheline size of the L1 cache size. L1_CACHE_BYTES in
> arch64/include/asm/cache.h  Unfortunately DMA safety on these
> architectures requires the buffer no share a last level cache cacheline
> given by ARCH_DMA_MINALIGN which has a greater granularity.
> ARCH_DMA_MINALIGN is not defined for all architectures, but when it is
> defined it is used to set the size of ARCH_KMALLOC_MINALIGN
> to allow DMA safe buffer allocations.
> 
> As such the correct alignment requirement is
> __aligned(ARCH_KMALLOC_MINALIGN).
> This has recently been fixed in other subsystems such as IIO.
> 
> Presumably this part is little used on boards where this could actually
> matter so this is mostly about removing code that might be coppied
> elsewhere.
> 
> Fixes: 4feacbc24eea ("Input: add new driver for the Surface 3")
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Sigh. Sunday afternoon incompetence on my part...

Dmitry, if everything else is fine with this series I can resend this
or if you are feeling generous feel free to fix it up whilst applying ;)

Jonathan

> ---
>  drivers/input/touchscreen/surface3_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
> index 1da23e5585a0..6c884fc2b332 100644
> --- a/drivers/input/touchscreen/surface3_spi.c
> +++ b/drivers/input/touchscreen/surface3_spi.c
> @@ -32,7 +32,7 @@ struct surface3_ts_data {
>  	struct input_dev *pen_input_dev;
>  	int pen_tool;
>  
> -	u8 rd_buf[SURFACE3_PACKET_SIZE]		____cacheline_aligned;
> +	u8 rd_buf[SURFACE3_PACKET_SIZE] __aligned(ARCH_KMALLOC_MINALIGN;

Missing bracket.

>  };
>  
>  struct surface3_ts_data_finger {

