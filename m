Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78E53115E84
	for <lists+linux-input@lfdr.de>; Sat,  7 Dec 2019 21:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLGUdV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Dec 2019 15:33:21 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42574 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfLGUdV (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Sat, 7 Dec 2019 15:33:21 -0500
Received: by mail-pg1-f195.google.com with SMTP id i5so5065190pgj.9;
        Sat, 07 Dec 2019 12:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SSICCxMKpl+JKm7rALii5MzV3zKZnjOifrusG4t7hjE=;
        b=WTVbDqKWHLJYH8D4DY5H7+gbxExUgvDgcu01y+aBFNoWL1GQEEgo6H1MBD6rw5g/qC
         +9g0/j5l6sFjrOiTSSrUubdVVXxuDgdU7rq5xfKjNUjyfKyUOxzhOwafcVyMcCNVY7vB
         WPVTym3IEapcsPMn98Ldd6j+vM0cAvwn3XdEqFFc/gyocjaxqpJbULcXjypqRFhNcAFh
         ZRXm85IZ73SIpomAfzPHj5yYNpw3sV2lx48Usnv5r0S69Qj20gftkXA6iEqa3kVLcGdz
         VqiEg8vsrUgU0RJ3U7G3itFHiuJKyXOL5zJyh8bD2/twpiIbhB/R1oOdKdi3uCs8Xdg0
         vt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SSICCxMKpl+JKm7rALii5MzV3zKZnjOifrusG4t7hjE=;
        b=SAU3qfzv6zHmYi9RQ6jPvOAmQ2klNrXGiF+Z7wu0MSmDdDeBVdQcrwOF89PyqjGy7d
         UW1gOGNZr1XICeuv9khe0sF4UyulfW8s8dLkKn4sxXBpX7TwFEA8UO9HqDyQM4/Gq3UL
         Z07xF5qngMj2Y0lqKfnSOPKnF7FxNeoMAvB+vAoI49b7UE642L/aOnqxRNsW5EX4ajZq
         X0S3SJw9nPTrd+DPCBc/0mKH8M2e09bsNuFkBdkYDKzEn46W7UqL2G19pT+S6WbqjghA
         nfE7OrPOLGcjejaW86uuPSAuAYSwTYa6J+ik8+IGusETvT2JA9WZcbbVFAnUQFc+d7EN
         Ua0g==
X-Gm-Message-State: APjAAAWHwkx6QnMRXJQMTCz/nor3hnVvEUFloaZBS2TciCktOI7G5HJq
        FDMK7cd3A7LuQKu/axnzJIPMekli
X-Google-Smtp-Source: APXvYqyXYIe8pIikK+9XAVjHrHQJ/Cyw2cslJNmKp77dR5WvXV2+kLsEVr0paXf5GhiRuipy0sHCBQ==
X-Received: by 2002:a62:7b86:: with SMTP id w128mr21910246pfc.189.1575750800779;
        Sat, 07 Dec 2019 12:33:20 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s18sm21701400pfs.20.2019.12.07.12.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:33:19 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Google-Original-From: Dmitry Torokhov <Dmitry.torokhov@gmail.com>
Date:   Sat, 7 Dec 2019 12:33:17 -0800
To:     "Dave.Wang" <dave.wang@emc.com.tw>
Cc:     Linux-kernel@vger.kernel.org, Linux-input@vger.kernel.org,
        'Benjamin Tissoires' <benjamin.tissoires@redhat.com>,
        "'Josh.Chen'" <josh.chen@emc.com.tw>, jingle.wu@emc.com.tw,
        'phoenix' <phoenix@emc.com.tw>
Subject: Re: [PATCH 1/6] Input: elantech - Add the pattern for firmware into
 elantech_device_info structure
Message-ID: <20191207203317.GS50317@dtor-ws>
References: <000101d5abdc$61acff60$2506fe20$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000101d5abdc$61acff60$2506fe20$@emc.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dave,

On Fri, Dec 06, 2019 at 10:25:09AM +0800, Dave.Wang wrote:
> Add the conditional expression to distinguish different patterns regarding
> 0, 1, 2. Different pattern has its own location for device information.

Your patches came in as line-wrapped by your mailer. Could you try
resending with "git send-email" please?

And could you please also add Kai-Heng Feng
<kai.heng.feng@canonical.com> to the CC as they were looking at the
bunch of laptops with Elan parts.

Thanks!

> 
> Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
> ---
>  drivers/input/mouse/elantech.c | 11 +++++++++++
> drivers/input/mouse/elantech.h |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index 2d8434b7b623..1f0d914acd78 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1557,6 +1557,17 @@ static int elantech_set_properties(struct
> elantech_device_info *info)
>  		}
>  	}
>  
> +	/* Get information pattern for hw_version 4 */
> +	if (ver == 15) {
> +		if ((info->fw_version & 0x0000ff) == 0x01)
> +			info->pattern = 0x01;
> +		else if ((info->fw_version & 0x0000ff) == 0x02)
> +			info->pattern = 0x02;
> +		else
> +			info->pattern = 0x00;
> +	} else
> +		info->pattern = 0x00;
> +
>  	/* decide which send_cmd we're gonna use early */
>  	info->send_cmd = info->hw_version >= 3 ? elantech_send_cmd :
>  						 synaptics_send_cmd;
> diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
> index e0a3e59d4f1b..0aae6a9de8f0 100644
> --- a/drivers/input/mouse/elantech.h
> +++ b/drivers/input/mouse/elantech.h
> @@ -140,6 +140,7 @@ struct elantech_device_info {
>  	unsigned char samples[3];
>  	unsigned char debug;
>  	unsigned char hw_version;
> +	unsigned char pattern;
>  	unsigned int fw_version;
>  	unsigned int x_min;
>  	unsigned int y_min;
> --
> 2.17.1
> 
> 

-- 
Dmitry
