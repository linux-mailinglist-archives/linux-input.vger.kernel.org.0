Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1219338E29C
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 10:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhEXItq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 04:49:46 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46799 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbhEXItk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 04:49:40 -0400
Received: (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 27FAB1C0005;
        Mon, 24 May 2021 08:48:09 +0000 (UTC)
Message-ID: <3bd72f4181488c0066eee1674afaf26fea1d3a0c.camel@hadess.net>
Subject: Re: [PATCH] touchscreen/goodix.c:unify format
From:   Bastien Nocera <hadess@hadess.net>
To:     mateng <ayowoe@163.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mateng <mateng@yulong.com>
Date:   Mon, 24 May 2021 10:48:09 +0200
In-Reply-To: <20210524024619.1227-1-ayowoe@163.com>
References: <20210524024619.1227-1-ayowoe@163.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2021-05-24 at 10:46 +0800, mateng wrote:
> From: mateng <mateng@yulong.com>
> 
> unify format

This doesn't "unify the format", it adds commas where none are needed.

NAK

> 
> Signed-off-by: mateng <mateng@yulong.com>
> ---
>  drivers/input/touchscreen/goodix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index c682b02..ab12065 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -210,7 +210,7 @@ static int goodix_check_cfg_16(struct
> goodix_ts_data *ts,
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
>                         DMI_MATCH(DMI_PRODUCT_NAME, "TW100")
> -               }
> +               },
>         },
>         {
>                 .ident = "WinBook TW700",
> @@ -230,7 +230,7 @@ static int goodix_check_cfg_16(struct
> goodix_ts_data *ts,
>                 /* YB1-X91L/F and YB1-X90L/F */
>                 .matches = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9")
> -               }
> +               },
>         },
>  #endif
>         {}


