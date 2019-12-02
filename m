Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB83310E88F
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 11:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfLBKQi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 05:16:38 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37917 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbfLBKQi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 05:16:38 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2972920009;
        Mon,  2 Dec 2019 10:16:35 +0000 (UTC)
Message-ID: <99ff833f27ce999e334d43ac511b6032f2668dc6.camel@hadess.net>
Subject: Re: [PATCH] Input: goodix - Add upside-down quirk for Teclast X89
 tablet
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Date:   Mon, 02 Dec 2019 11:16:35 +0100
In-Reply-To: <20191202085636.6650-1-hdegoede@redhat.com>
References: <20191202085636.6650-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2019-12-02 at 09:56 +0100, Hans de Goede wrote:
> The touchscreen on the Teclast X89 is mounted upside down in relation
> to
> the display orientation (the touchscreen itself is mounted upright,
> but the
> display is mounted upside-down). Add a quirk for this so that we send
> coordinates which match the display orientation.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks good

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/input/touchscreen/goodix.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index fb43aa708660..0403102e807e 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -128,6 +128,15 @@ static const unsigned long goodix_irq_flags[] =
> {
>   */
>  static const struct dmi_system_id rotated_screen[] = {
>  #if defined(CONFIG_DMI) && defined(CONFIG_X86)
> +	{
> +		.ident = "Teclast X89",
> +		.matches = {
> +			/* tPAD is too generic, also match on bios date
> */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
> +			DMI_MATCH(DMI_BOARD_NAME, "tPAD"),
> +			DMI_MATCH(DMI_BIOS_DATE, "12/19/2014"),
> +		},
> +	},
>  	{
>  		.ident = "WinBook TW100",
>  		.matches = {

