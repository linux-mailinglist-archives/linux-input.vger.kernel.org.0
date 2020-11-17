Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306C92B6835
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 16:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgKQPFN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Nov 2020 10:05:13 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:48011 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728819AbgKQPFN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Nov 2020 10:05:13 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6CE611C001E;
        Tue, 17 Nov 2020 15:05:11 +0000 (UTC)
Message-ID: <672ddee0a276be7d34e01c665df20d1c8ad2b7d0.camel@hadess.net>
Subject: Re: [PATCH] Input: goodix - Add upside-down quirk for Teclast X98
 Pro tablet
From:   Bastien Nocera <hadess@hadess.net>
To:     linux@simonmicro.de, linux-input@vger.kernel.org
Date:   Tue, 17 Nov 2020 16:05:10 +0100
In-Reply-To: <20201117004253.27A5A27EFD@localhost>
References: <20201117004253.27A5A27EFD@localhost>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2020-11-16 at 19:42 -0500, Simon Beginn wrote:
> The touchscreen on the Teclast x98 Pro is also mounted upside-down in
> relation to the display orientation. I added it also to the list of
> those devices. Verified it works on my device - this has not been
> tested with more users than myself...

Looks good to me, thanks.

Signed-off-by: Bastien Nocera <hadess@hadess.net>

> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index f8dd416c89b2..7668174b62ed 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -136,6 +136,16 @@ static const struct dmi_system_id
> rotated_screen[] = {
>                         DMI_MATCH(DMI_BIOS_DATE, "12/19/2014"),
>                 },
>         },
> +       {
> +               .ident = "Teclast X98 Pro",
> +               .matches = {
> +                       /* Only match bios date, because the
> manufacturers bios
> +                        * does not report the board name at all
> (sometimes)...
> +                        */
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
> +                       DMI_MATCH(DMI_BIOS_DATE, "10/28/2015"),
> +               },
> +       },
>         {
>                 .ident = "WinBook TW100",
>                 .matches = {


