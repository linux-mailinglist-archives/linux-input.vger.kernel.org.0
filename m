Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9425D542C9C
	for <lists+linux-input@lfdr.de>; Wed,  8 Jun 2022 12:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbiFHKHJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jun 2022 06:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236141AbiFHKGV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jun 2022 06:06:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0F519D612
        for <linux-input@vger.kernel.org>; Wed,  8 Jun 2022 02:49:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6920E61A33
        for <linux-input@vger.kernel.org>; Wed,  8 Jun 2022 09:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31130C341C0;
        Wed,  8 Jun 2022 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654681771;
        bh=nG89wg4Axm9sdW8bp5ZAjk7awQ9c6cush852w/GcgLk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Hytes4j+QFFUXfmP+/oexOpthvfzZWoXXA6ighu5fMlVvoEeTrWrJuyH6LqStnqZY
         Ma4USYW5ieplB3T3PzwI2QQlBR14CxTJBxO6atmJ0+3EYrtdjy+uyzvevlf1PmfKwu
         +Ag1sADTcAvsStaw88kwo8LP/PL+LGaZxchZF8F5nLzSYbnRs6b3urRSwgZA0qjepA
         yyWdYVQFsVWxe4SSzGgGNzv23jHx0OB0K53McusYLcZB1W+cx1hLYIL3p9C0zEif+G
         lvOCR1W1q6D9EYCwolBizj+lVghlASsqNgYgSnHDlG35oZyVnWlrgbv2KDyKCSK2zg
         GguPUCCAfisIQ==
Date:   Wed, 8 Jun 2022 11:49:28 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: fix unused const warning
In-Reply-To: <20220528212331.3460905-1-djogorchock@gmail.com>
Message-ID: <nycvar.YFH.7.76.2206081149230.10851@cbobk.fhfr.pm>
References: <20220528212331.3460905-1-djogorchock@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 28 May 2022, Daniel J. Ogorchock wrote:

> JC_RUMBLE_ZERO_AMP_PKT_CNT is only used when force feedback support in
> the driver is enabled. Place the declaration in the CONFIG_NINTENDO_FF
> ifdef to avoid a warning when compiling without rumble support.
> 
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 2204de889739f..dcd0f16de7b51 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -292,6 +292,7 @@ static const struct joycon_rumble_amp_data joycon_rumble_amplitudes[] = {
>  };
>  static const u16 JC_RUMBLE_DFLT_LOW_FREQ = 160;
>  static const u16 JC_RUMBLE_DFLT_HIGH_FREQ = 320;
> +static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
>  #endif /* IS_ENABLED(CONFIG_NINTENDO_FF) */
>  static const u16 JC_RUMBLE_PERIOD_MS = 50;
>  
> @@ -402,8 +403,6 @@ struct joycon_input_report {
>  #define JC_RUMBLE_DATA_SIZE	8
>  #define JC_RUMBLE_QUEUE_SIZE	8
>  
> -static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
> -
>  static const char * const joycon_player_led_names[] = {
>  	LED_FUNCTION_PLAYER1,

Applied, thanks Daniel.

-- 
Jiri Kosina
SUSE Labs

