Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEE415AF3D
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2019 09:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfF3HcY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Jun 2019 03:32:24 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38412 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfF3HcY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Jun 2019 03:32:24 -0400
Received: by mail-pl1-f196.google.com with SMTP id 9so4854628ple.5;
        Sun, 30 Jun 2019 00:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GvaAuf3ENW7rHALWXv/OGbjkqUQYVBOjIQBcNP2D9w0=;
        b=D29UYs8WGSaT9UD0G862oB9t6EVSJ2tSbIEBr3WVCF2EJLj7W/K92FYTE/WObHCqrd
         2iLKGxYVleuWrBpdQn07smql8GrEHaz3aurhw/mBZlQdnyGuAppn8SCJ6+B9ZqlrJbAU
         KnGA410Acig+QWETafsTOrgFmqyI0YrY66htu0ZzWASTY0KzQ/kXGD+DMN5CfaxEF/X5
         UIaDQmdWXfQ8wx2TNRjoYh//MEBGFEqyDebqXSKQkYkL7g+pwFN5Ix4Brkk1U8mMzBA8
         384VvR/nbQZgXmWBr7ZDphsNfWa0mKi7SYBOgk8GKfgoXLvJn/ejaThECXdfPrUV6Y/W
         83HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GvaAuf3ENW7rHALWXv/OGbjkqUQYVBOjIQBcNP2D9w0=;
        b=aIwjgqgkeeGumS97Jq+Md/sW9qZRIQzBodu8xyU23Ha4JrRuOk0EuanzjT1tsAXhxh
         5oJ+OxI8veyaB7X6BZ/w6KDADmKJ3qGqNNxKd1dDt8adzk4nMaVFmpaRgx384gV2CCkT
         jbHTyIf2LXk6ULcZnyobwowjiP7S9hVptipUXl9SdVIP4AYM9eMVFLCRBAy5JlVxOjlC
         Eju1R5hQif0K+61yZz2h7IlixF1yaE9nI4lxekw8EWHkBqyQxrrDNxvE6rj0LPmTC5mx
         mYA5Vg9v8B02DTUyha5yev9ZMcLUw32C6YxZUdNpS7yMaZfbB8vLnLXP+ogmCh6zXa9H
         rj6g==
X-Gm-Message-State: APjAAAUxDHFzbmmZ+dwdgygVqpOKechhYXG6qC9xDq90DVO8hwqMuYl7
        H5xOTOqKs9FRLicKEfMpjaQ=
X-Google-Smtp-Source: APXvYqzBR34pIPsDaGH93zUNqIkH+0e/JtwfapQUAm+4eRXLTs5aNH9muk6DPLwZKc7Leq4caERZiQ==
X-Received: by 2002:a17:902:9a49:: with SMTP id x9mr10390177plv.282.1561879943737;
        Sun, 30 Jun 2019 00:32:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id m4sm11989811pff.108.2019.06.30.00.32.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 00:32:23 -0700 (PDT)
Date:   Sun, 30 Jun 2019 00:32:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexander Tsoy <alexander@tsoy.me>
Cc:     linux-input@vger.kernel.org,
        Thomas Hellstrom <thellstrom@vmware.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: joydev - extend absolute mouse detection
Message-ID: <20190630073221.GF91171@dtor-ws>
References: <20190623234456.4074-1-alexander@tsoy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190623234456.4074-1-alexander@tsoy.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 24, 2019 at 02:44:56AM +0300, Alexander Tsoy wrote:
> Extend event signature matching to catch more input devices emulated by
> BMC firmwares, QEMU and VMware.
> 
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>

Applied, thank you.

> ---
>  drivers/input/joydev.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> index ac21c050fdb0..a2b5fbba2d3b 100644
> --- a/drivers/input/joydev.c
> +++ b/drivers/input/joydev.c
> @@ -808,6 +808,7 @@ static bool joydev_dev_is_blacklisted(struct input_dev *dev)
>  static bool joydev_dev_is_absolute_mouse(struct input_dev *dev)
>  {
>  	DECLARE_BITMAP(jd_scratch, KEY_CNT);
> +	bool ev_match = false;
>  
>  	BUILD_BUG_ON(ABS_CNT > KEY_CNT || EV_CNT > KEY_CNT);
>  
> @@ -826,17 +827,36 @@ static bool joydev_dev_is_absolute_mouse(struct input_dev *dev)
>  	 * considered to be an absolute mouse if the following is
>  	 * true:
>  	 *
> -	 * 1) Event types are exactly EV_ABS, EV_KEY and EV_SYN.
> +	 * 1) Event types are exactly
> +	 *      EV_ABS, EV_KEY and EV_SYN
> +	 *    or
> +	 *      EV_ABS, EV_KEY, EV_SYN and EV_MSC
> +	 *    or
> +	 *      EV_ABS, EV_KEY, EV_SYN, EV_MSC and EV_REL.
>  	 * 2) Absolute events are exactly ABS_X and ABS_Y.
>  	 * 3) Keys are exactly BTN_LEFT, BTN_RIGHT and BTN_MIDDLE.
>  	 * 4) Device is not on "Amiga" bus.
>  	 */
>  
>  	bitmap_zero(jd_scratch, EV_CNT);
> +	/* VMware VMMouse, HP ILO2 */
>  	__set_bit(EV_ABS, jd_scratch);
>  	__set_bit(EV_KEY, jd_scratch);
>  	__set_bit(EV_SYN, jd_scratch);
> -	if (!bitmap_equal(jd_scratch, dev->evbit, EV_CNT))
> +	if (bitmap_equal(jd_scratch, dev->evbit, EV_CNT))
> +		ev_match = true;
> +
> +	/* HP ILO2, AMI BMC firmware */
> +	__set_bit(EV_MSC, jd_scratch);
> +	if (bitmap_equal(jd_scratch, dev->evbit, EV_CNT))
> +		ev_match = true;
> +
> +	/* VMware Virtual USB Mouse, QEMU USB Tablet, ATEN BMC firmware */
> +	__set_bit(EV_REL, jd_scratch);
> +	if (bitmap_equal(jd_scratch, dev->evbit, EV_CNT))
> +		ev_match = true;
> +
> +	if (!ev_match)
>  		return false;
>  
>  	bitmap_zero(jd_scratch, ABS_CNT);
> -- 
> 2.21.0
> 

-- 
Dmitry
