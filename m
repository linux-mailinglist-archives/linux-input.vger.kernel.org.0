Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1C07A4C77
	for <lists+linux-input@lfdr.de>; Mon, 18 Sep 2023 17:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjIRPeQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Sep 2023 11:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjIRPdp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Sep 2023 11:33:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DA41B5;
        Mon, 18 Sep 2023 08:30:46 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C757C3278C;
        Mon, 18 Sep 2023 14:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695048299;
        bh=HnWHofl56uMOWkel1GBsK33pMrtP9vXMM6pW1ImAREc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pImtC92CDoUQZx4XteeJzi39c01SzUmEPiJIWPm0wWPJCQ23Grx8EafuPOc0AdTXO
         a2tvornwy2jB/XusJpS0MaP6EmSNkU8dyBwSz2PtPMJrmqx53c/MB3C4FcE7hwqHuk
         rozga6cy1vfQ+5wsHzK2IYW6P+Ljv3Ch6nFP6uoBdGKt57wbW9epFPuIWtCCyt+Drd
         Sb0mHH8/lRjJGp7OUTiimLp0c8hfGl6vJv5RwkFreSpdHNR+QEr6gVG+jFIRmrTDdX
         b2/4Im3nQ/HNuGnLKaGeFVlWAOOcKveueUHbox7vJbsVob4AQnfGytJv30n61cIpdE
         F5D0tacd770vw==
Date:   Mon, 18 Sep 2023 16:44:56 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
cc:     Bastien Nocera <hadess@hadess.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
In-Reply-To: <6e0a33e3-1564-419a-9946-b2d0afa0f98d@moroto.mountain>
Message-ID: <nycvar.YFH.7.76.2309181644500.14216@cbobk.fhfr.pm>
References: <6e0a33e3-1564-419a-9946-b2d0afa0f98d@moroto.mountain>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 15 Sep 2023, Dan Carpenter wrote:

> The hid_hw_raw_request() function returns negative error codes or the
> number bytes transferred.  The problem is that when it returns negative
> error codes and we check if "ret < sizeof(arctis_1_battery_request)",
> then the negative values are type promoted from int to high unsigned long
> values and treated as success.
> 
> This was detected using Smatch:
> 
>     drivers/hid/hid-steelseries.c:393 steelseries_headset_arctis_1_fetch_battery()
>     warn: error code type promoted to positive: 'ret'
> 
> Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1 XBox")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Re-word the commit message.  Add the Smatch warning.  Use a cast
> instead of an explicit check for negatives.
> 
>  drivers/hid/hid-steelseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
> index 43d2cf7153d7..b3edadf42d6d 100644
> --- a/drivers/hid/hid-steelseries.c
> +++ b/drivers/hid/hid-steelseries.c
> @@ -390,7 +390,7 @@ static int steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
>  	ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
>  				 write_buf, sizeof(arctis_1_battery_request),
>  				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> -	if (ret < sizeof(arctis_1_battery_request)) {
> +	if (ret < (int)sizeof(arctis_1_battery_request)) {
>  		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
>  		ret = -ENODATA;
>  	}

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

