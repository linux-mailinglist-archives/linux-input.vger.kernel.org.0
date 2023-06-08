Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2371F728330
	for <lists+linux-input@lfdr.de>; Thu,  8 Jun 2023 17:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236735AbjFHPBe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jun 2023 11:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236637AbjFHPBc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Jun 2023 11:01:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C202680;
        Thu,  8 Jun 2023 08:01:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8F8464E54;
        Thu,  8 Jun 2023 15:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D05EC433EF;
        Thu,  8 Jun 2023 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686236490;
        bh=22g8nyDGkskW66MeIsFK+H2HRcvm8EdnUsXzJG+5AGM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=EjKuZOtZo0FRQ3qJ84elBsiLULDmUiePoPxYVkG9Pd8OtSITlFmNBgMaoubBUl+b7
         T9HL5bmIbxpiU3B7wgaBTM4l+V8faHeklyVzSMWDvlgTRc0HXKlnzLydYtbV/AXm0Y
         EVfydc6iXK/dNBjTqqNSxpfLVSd925ayYd0Y9+2B04rIwda3TzmLcwjUYpUmur3trI
         notddP7TnStpLcSf5FhANefRiKcwDh1tUcmfNZ6ZLJkRNVYQLmHZBwYZG6/Gj9ITzU
         Fsmic/vp0ymj1Qst4fivzcHRN7OoQF7Nl/5piYdxq9XZDgs0CW5+fHWaPGwQNR2PuL
         ilk0oJNWX9prQ==
Date:   Thu, 8 Jun 2023 17:01:26 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: fix an error code in hid_check_device_match()
In-Reply-To: <ZH7sZv4PEovkMxNP@moroto>
Message-ID: <nycvar.YFH.7.76.2306081700580.5716@cbobk.fhfr.pm>
References: <ZH7sZv4PEovkMxNP@moroto>
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

On Tue, 6 Jun 2023, Dan Carpenter wrote:

> The hid_check_device_match() returns true if we find a match and false
> if we don't.  But here it returns -ENODEV which becomes true instead
> of false.
> 
> Fixes: 207733f92661 ("HID: split apart hid_device_probe to make logic more apparent")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hid/hid-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 4b7062dcefec..8992e3c1e769 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2593,7 +2593,7 @@ static bool hid_check_device_match(struct hid_device *hdev,
>  {
>  	*id = hid_match_device(hdev, hdrv);
>  	if (!*id)
> -		return -ENODEV;
> +		return false;
>  
>  	if (hdrv->match)
>  		return hdrv->match(hdev, hid_ignore_special_drivers);

Thanks for checking this! Applied.

-- 
Jiri Kosina
SUSE Labs

