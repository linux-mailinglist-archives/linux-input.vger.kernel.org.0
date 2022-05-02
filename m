Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5197551735A
	for <lists+linux-input@lfdr.de>; Mon,  2 May 2022 17:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239572AbiEBP7H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 May 2022 11:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386058AbiEBP7B (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 May 2022 11:59:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802EBC6E
        for <linux-input@vger.kernel.org>; Mon,  2 May 2022 08:55:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E8CAB61255
        for <linux-input@vger.kernel.org>; Mon,  2 May 2022 15:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEC8C385A4;
        Mon,  2 May 2022 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651506931;
        bh=I0c9Yhy+1S6JiGu+RQ1pNZCKfjiqcVZunHxQ3N4SMgg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LP5OnDXf0lz23IffbCHUCKC06WbMBEK57pdVG3QGSUkZOzVCk86hQkYe1nAkwHSIw
         8cft1md5sEOkwY9m9EvFqzvcNKdUjtlgeKM5G+5slMANH57TfUGLspfr1G7yUn43OI
         XvGvgQvHcfPWf018mKI9ve9EtckapT4mmrUbP/yRBPL6LIMMnoRX9iKCic94vNRcRO
         W+jXaGTy1ZPSdhWHOQ4MsFK21Kox2/5azXbh19j8wRqcr2Oupl9YNkyhb6teUAZh0J
         Z6oqF2iTb21+0JlG3IJ3d0/bLxL+L9AgnzG966Wd4CdTzeyDFMzucjKk2eISGG+0xf
         Ggjd4OGmlFaKQ==
Date:   Mon, 2 May 2022 17:55:27 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ping Cheng <pinglinux@gmail.com>
cc:     linux-input@vger.kernel.org, hadess@hadess.net,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] MAINTAINERS: Add Wacom driver maintainers
In-Reply-To: <20220424053658.62328-1-ping.cheng@wacom.com>
Message-ID: <nycvar.YFH.7.76.2205021755210.30217@cbobk.fhfr.pm>
References: <20220424053658.62328-1-ping.cheng@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 23 Apr 2022, Ping Cheng wrote:

> As suggested by Bastien and Jiri.
> 
> Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5e8c2f611766..3d387a11ea36 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8749,6 +8749,14 @@ F:	drivers/hid/hid-sensor-*
>  F:	drivers/iio/*/hid-*
>  F:	include/linux/hid-sensor-*
>  
> +HID WACOM DRIVER
> +M:	Ping Cheng <ping.cheng@wacom.com>
> +M:	Jason Gerecke  <jason.gerecke@wacom.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hid/wacom.h
> +F:	drivers/hid/wacom_*
> +

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

