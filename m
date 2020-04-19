Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534331AF692
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 06:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgDSEVE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 00:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725769AbgDSEVE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 00:21:04 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AEDC061A0C;
        Sat, 18 Apr 2020 21:21:02 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z6so2635885plk.10;
        Sat, 18 Apr 2020 21:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8yQeEQ9FgLIDQT+soQUD4bkSATvz8kUGKhG0/JAsHfg=;
        b=cpR2CWG5H9Qb+rWijnZGzULI/vOnYzewJjWyENqjd5Tj5cJ4KUYRT/MyE8beAwEZr3
         uV0svs7JJz/znSaulqXvlBEtMB/fLeSsEAE7AeEBqn/MrNA/IAzvtSx2fF4/z5SQjoOv
         UWc/oF/DsUTjI1doosheq0Emj2yi5XfjO6+oMEYeWLeGsTUQwV/5x6t6nASisKZNdBVv
         KPB1EykCr1lJqAdFeZFNPSvzqDq5pacdgDcNmRYgSkIydNJB3Rjpc0Gfyv0cXv2hCh8M
         xbgN2ilf+LJ0oylyluhIxWnknjLUHT/b4uqyOej8RbCaxUjTCxcbjvWWNKcnU/jBDlIE
         3k8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8yQeEQ9FgLIDQT+soQUD4bkSATvz8kUGKhG0/JAsHfg=;
        b=l8AYnlaD/2gyHUorYHcC1UxuvsbFxhKQJDdRaO1AatJyZafmKMaP8urYLvs77cKd2j
         NkbRGlUyKOktsletnkL1rG7HC17V8kaCIdsbiaxwp1FK7TI4kRHzZIcOxOGfm/GP8W2b
         EFkDFccErfV4JruFKAK45gpKYcA46TOtY3BfwjTe2Wh5RmtZwzJxkwtSYoV4a3wnogRB
         zvdKKpJgEy7e/JxrWqsYJ/fyly/e0DTgL+ZakYFfmFI1FtQaHFnpj6K0p49FK5NJinOQ
         W+mAm57wTe868FgCYT8hTgoHfQbjrOqhY0a3UqHaagk9Awq08b13Q1995sHwhWeImap9
         tCOA==
X-Gm-Message-State: AGi0Pubm5vsUmB7BZTaZbkCiTlwxgzYLKeUNtK0cA/uajFv5W4ukyseD
        f5tL2yqtR/cnwtJ8OJgxHOQ=
X-Google-Smtp-Source: APiQypLifTu40rSRGZD7sXQ86lI9nWsURx8BIRDpq8ZhJT63HBW+kHmUfrY8rJLchMwqG9jDaj3/nw==
X-Received: by 2002:a17:90b:b08:: with SMTP id bf8mr13745112pjb.158.1587270061458;
        Sat, 18 Apr 2020 21:21:01 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id c14sm22282541pgi.54.2020.04.18.21.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 21:21:00 -0700 (PDT)
Date:   Sat, 18 Apr 2020 21:20:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        groeck@chromium.org, bleung@chromium.org, dtor@chromium.org,
        gwendal@chromium.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Fei Shao <fshao@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Ting Shen <phoenixshen@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [RESEND PATCH] Input: cros_ec_keyb: Use cros_ec_cmd_xfer_status
 helper
Message-ID: <20200419042058.GG166864@dtor-ws>
References: <20200414210434.1534982-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414210434.1534982-1-enric.balletbo@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 14, 2020 at 11:04:34PM +0200, Enric Balletbo i Serra wrote:
> This patch makes use of cros_ec_cmd_xfer_status() instead of
> cros_ec_cmd_xfer(). In this case there is no advantage of doing this
> apart from that we want to make cros_ec_cmd_xfer() a private function
> for the EC protocol and let people only use the
> cros_ec_cmd_xfer_status() to return Linux standard error codes.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied, thank you.

> ---
> This patch was initially part of this series [1]. The other patches in
> the series have been applied and remains this, hence, I send this patch
> alone as a RESEND.
> 
> [1] https://patchwork.kernel.org/cover/11394361/
> 
>  drivers/input/keyboard/cros_ec_keyb.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 2b71c5a51f90..fc1793ca2f17 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -347,18 +347,14 @@ static int cros_ec_keyb_info(struct cros_ec_device *ec_dev,
>  	params->info_type = info_type;
>  	params->event_type = event_type;
>  
> -	ret = cros_ec_cmd_xfer(ec_dev, msg);
> -	if (ret < 0) {
> -		dev_warn(ec_dev->dev, "Transfer error %d/%d: %d\n",
> -			 (int)info_type, (int)event_type, ret);
> -	} else if (msg->result == EC_RES_INVALID_VERSION) {
> +	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
> +	if (ret == -ENOTSUPP) {
>  		/* With older ECs we just return 0 for everything */
>  		memset(result, 0, result_size);
>  		ret = 0;
> -	} else if (msg->result != EC_RES_SUCCESS) {
> -		dev_warn(ec_dev->dev, "Error getting info %d/%d: %d\n",
> -			 (int)info_type, (int)event_type, msg->result);
> -		ret = -EPROTO;
> +	} else if (ret < 0) {
> +		dev_warn(ec_dev->dev, "Transfer error %d/%d: %d\n",
> +			 (int)info_type, (int)event_type, ret);
>  	} else if (ret != result_size) {
>  		dev_warn(ec_dev->dev, "Wrong size %d/%d: %d != %zu\n",
>  			 (int)info_type, (int)event_type,
> -- 
> 2.25.1
> 

-- 
Dmitry
