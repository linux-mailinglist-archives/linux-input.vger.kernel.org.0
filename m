Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394ED262DF
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2019 13:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbfEVLTW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 May 2019 07:19:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:34832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728690AbfEVLTW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 May 2019 07:19:22 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21D0A217D9;
        Wed, 22 May 2019 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558523961;
        bh=/AKyGN8KWcutdIxpXABJOkz4oB4ti4xuTlwdnt+/TxQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=DxzaGHu2mf9Jf05Y9S+oGJH3pjICdrbitHsYAIhWEBXVGIAfS55kKn9cKyC0uWs7n
         Y20IpAccTl4Nyxaa3bvP416pRuJaoW2/+wdsjAfp+5IHbMJs6fatBtgJQngwIVp860
         pSWhO/lgBYHOpcGJoI4NTq/NJQWe7VIrOCYPFVW8=
Date:   Wed, 22 May 2019 13:19:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: make const array template static
In-Reply-To: <20190510131039.4675-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.1905221319120.1962@cbobk.fhfr.pm>
References: <20190510131039.4675-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 10 May 2019, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array template  on the stack but instead make it
> static. Makes the object code smaller by 10 bytes. Also reformat
> the declaration.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   29376	   9360	    128	  38864	   97d0	drivers/hid/hid-logitech-dj.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   29270	   9456	    128	  38854	   97c6	drivers/hid/hid-logitech-dj.o
> 
> (gcc version 8.3.0, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/hid-logitech-dj.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index b1e894618eed..72d0ab05401f 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1111,12 +1111,14 @@ static int logi_dj_recv_send_report(struct dj_receiver_dev *djrcv_dev,
>  
>  static int logi_dj_recv_query_hidpp_devices(struct dj_receiver_dev *djrcv_dev)
>  {
> -	const u8 template[] = {REPORT_ID_HIDPP_SHORT,
> -			       HIDPP_RECEIVER_INDEX,
> -			       HIDPP_SET_REGISTER,
> -			       HIDPP_REG_CONNECTION_STATE,
> -			       HIDPP_FAKE_DEVICE_ARRIVAL,
> -			       0x00, 0x00};
> +	static const u8 template[] = {
> +		REPORT_ID_HIDPP_SHORT,
> +		HIDPP_RECEIVER_INDEX,
> +		HIDPP_SET_REGISTER,
> +		HIDPP_REG_CONNECTION_STATE,
> +		HIDPP_FAKE_DEVICE_ARRIVAL,
> +		0x00, 0x00
> +	};

Applied.

-- 
Jiri Kosina
SUSE Labs

