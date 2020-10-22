Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEDC02958D8
	for <lists+linux-input@lfdr.de>; Thu, 22 Oct 2020 09:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505374AbgJVHNP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Oct 2020 03:13:15 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:56965 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2505286AbgJVHNP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Oct 2020 03:13:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 354575C0115;
        Thu, 22 Oct 2020 03:13:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 22 Oct 2020 03:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=D6cmzas/40pUOyRL+9Xln8RSEeK
        tAmcuKo6okhSFr4k=; b=JWftxaiFOrWWOL8lpbvIdTMimk5kmtRc7XIEhNBeZCG
        NKWxpajAhyDDX819dLSvyHI5AQ6JKmt5sduJFuZdGnqDauIDVFSf8fcon0xIZEp0
        4B+ISmMGOV3zarL1xYh01BmrGZ5E2fOxR3BGe4LcxlMsV9JU3yKw9zBFxe8mkEJy
        lrReyZqqbuv2+KLP+QqDWfCD6gyAqKAXl29w3JiIchvBGy24cYy2Y4HGLD4ej6rk
        V5mZnRSuwS4avAuOIN1vDAx4OdoUU/Y9EMB8QL07VgynOkTC7lEO/wCX+eArfNzD
        GrX4dqmH6fh5ApoUMy7gJvTircZCqfbkxrLkowxUZJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=D6cmza
        s/40pUOyRL+9Xln8RSEeKtAmcuKo6okhSFr4k=; b=HYKUbrlauMWQsB8KB+2y4b
        /k6T1vH1xyLkd7qLAQcL0cVTbqBpDjw/N/wiMA1g9kdcmmUe565oBWqtR4S5sCcG
        rh9DV53+MZRQxca3AIrLftlzsuekOZRsAD4Z8KGf7LogxymYmA3tJGcSTaKpGQFk
        e4CqjMYVcKJJ1k4X4Bopwy1Ts86bRjQNy9G5LlM8qJTRY4WZkLmQeZRgrg5hTdUg
        iyKR1OMR3Izhps6FvRfyR6jkyBRMaCjmEKhyUGmSm5UH7uig+iEhYawnAEWbFvFC
        F7vUZmViQsjYSt738OZw+yLwKqV6W1THfR3tN/IhmirKj7Anm85Ntw+U4EU400DA
        ==
X-ME-Sender: <xms:CTGRX1MPu47o8U5GJYkv6EFQP-ItWUaMzMHB2ZU3qfJqYr5g7ZK8FA>
    <xme:CTGRX3805Dd0QpxDk1L47IA9bbGxfXm6jDO8In3_bOK1Y8nl68NdqhbLQSK0Ho7jd
    lfo3wHlHDpuIk_lnRI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeigdduudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhephefhheffgfehleegueduleehgfdvfeevkeduveejveej
    veevgfeggfduudefueevnecukfhppeduudejrddvtddrjedurdejfeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgv
    rhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:CTGRX0TMyFG4TRUg-9J6M5PLf-CRcWuktprTI5VuxNqK75fwAHaQWw>
    <xmx:CTGRXxt9l8UyBoE-VGGkcI2mY-JhyTVMMvDtHldMdkgcH6x6W0P3Mg>
    <xmx:CTGRX9dKDjcPr7zBboYxqVDNJLeUdpwMJOqQcdgkogTx1aIdInGpwA>
    <xmx:CjGRX-o7MRAdSTntKR2Wa0fiDowP37RkqkGlGSnMcTTMH6pnRcDXZg>
Received: from koala (117-20-71-73.751447.bne.nbn.aussiebb.net [117.20.71.73])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6C7793280063;
        Thu, 22 Oct 2020 03:13:11 -0400 (EDT)
Date:   Thu, 22 Oct 2020 17:13:07 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Harry Cutts <hcutts@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Add PID for MX Anywhere 2
Message-ID: <20201022071307.GB460823@koala>
References: <20201021135612.258558-1-hcutts@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021135612.258558-1-hcutts@chromium.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 21, 2020 at 06:56:12AM -0700, Harry Cutts wrote:
> It seems that the PID 0x4072 was missing from the list Logitech gave me
> for this mouse, as I found one with it in the wild (with which I tested
> this patch).
> 
> Fixes: 4435ff2f09a2 ("HID: logitech: Enable high-resolution scrolling on Logitech mice")
> Signed-off-by: Harry Cutts <hcutts@chromium.org>

Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
we have the same PID for this device in libratbag so there must be some
truth to it ;)

Cheers,
   Peter

> ---
> 
>  drivers/hid/hid-logitech-hidpp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index b8b53dc95e86b..730036650f7df 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3947,6 +3947,7 @@ static const struct hid_device_id hidpp_devices[] = {
>  	  LDJ_DEVICE(0x405e), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>  	{ /* Mouse Logitech MX Anywhere 2 */
>  	  LDJ_DEVICE(0x404a), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ LDJ_DEVICE(0x4072), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>  	{ LDJ_DEVICE(0xb013), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>  	{ LDJ_DEVICE(0xb018), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>  	{ LDJ_DEVICE(0xb01f), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> -- 
> 2.29.0.rc1.297.gfa9743e501-goog
> 
