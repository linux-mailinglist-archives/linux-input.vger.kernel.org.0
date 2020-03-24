Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E26BA191CFE
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 23:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgCXWph (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 18:45:37 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:52317 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbgCXWph (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 18:45:37 -0400
Received: by mail-pj1-f67.google.com with SMTP id ng8so184144pjb.2;
        Tue, 24 Mar 2020 15:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PKMeyRQ3YhSpQkcTyPShJRWuaaPt570DhD0K201i24Y=;
        b=VT4HeMXe1pYBCyO/8Jj2xQWubBmwbFGeXo5JKCqPHd5xsx2F+XgRd8MnWhxf2IswLL
         PDRWkHUnGh7q4MRz3XYE4vUHSYo8iBArgYFXR3Uhz68F7vTTmSlGRa5lyU9yFT0qQrGa
         5j5OtxLnMQ6Y/0/YIFr2Wqoq+nKccPSP9eC7XBdQTvbY6euDPwNw7lReUsh1I88mmPco
         o5OO9pyyJDOODvk7BaXjfRs6QpXgz3DRYdse2sNJgLHvY//oHir1Nbtk0GLIuF5Zbz/0
         1+kLIe+cEP7aUdUQSZaq9U2bGVY+RFC7LHAZv9eQmDosh3neklP1+FbqMhHM63nmNZq9
         GcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PKMeyRQ3YhSpQkcTyPShJRWuaaPt570DhD0K201i24Y=;
        b=EIL6SYTBlBcW3VtwDjKOFv+kIa5PERQqXdPeX9YIsbtIoPsTk42dSKh92Bl99OqyRw
         gfP3N0A2KRyVPNf6HJzZLtEkIwE72GhW0H9H39B6e9OvdwvQHK4XrYM9NkpXYmlcqXCc
         ZQi0V4qkXUyh0dLQYfiePHUKqtXOoezT/u7/gHLqy4NtDyx69fCpAJp59PZecHp10s2d
         tbjSdpY4fjqIvfu8nSKXnUia7VwQNnnMbYr1ovwCJv4L62apSKYojuyTu5arZWgPCyrZ
         Y7xIug7LH8gFzvfGDPoR1DIVvhbO7968GFO5BuHA3qzgtU+9ofzA0kWlDemQFh59O4Tt
         gV9g==
X-Gm-Message-State: ANhLgQ0LVKtf0F0Vvnkj7i+MV9XtInHw1yMA051I6lgEUEUHnFhRERf/
        ltcNnXdagL+SVpYeRKBBRxhaKSom
X-Google-Smtp-Source: ADFU+vunt3Lf+DyFnjTw2mxQvuShMhU0fET7IsfLN9BexNWtrvdwbkM6MrM9WUkCTrOT9kDJpeHZfw==
X-Received: by 2002:a17:90a:1f07:: with SMTP id u7mr247434pja.24.1585089935907;
        Tue, 24 Mar 2020 15:45:35 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id u18sm17162622pfl.40.2020.03.24.15.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:45:35 -0700 (PDT)
Date:   Tue, 24 Mar 2020 15:45:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrew Duggan <aduggan@synaptics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Hollinsky <phollinsky@holtechnik.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Lucas Stach <l.stach@pengutronix.de>, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH] Input: synaptics-rmi4 - Do not set reduced reporting
 mode thresholds are not set by the driver
Message-ID: <20200324224533.GF75430@dtor-ws>
References: <20200312005549.29922-1-aduggan@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312005549.29922-1-aduggan@synaptics.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 11, 2020 at 05:55:49PM -0700, Andrew Duggan wrote:
> The previous patch "c5ccf2ad3d33 (Input: synaptics-rmi4 - switch to
> reduced reporting mode)" enabled reduced reporting mode unintentionally
> on some devices, if the firmware was configured with default Delta X/Y
> threshold values. The result unintentionally degrade the performance of
> some touchpads.
> 
> This patch checks to see that the driver is modifying the delta X/Y
> thresholds before modifying the reporting mode.
> 
> Signed-off-by: Andrew Duggan <aduggan@synaptics.com>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_f11.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f11.c b/drivers/input/rmi4/rmi_f11.c
> index 6adea8a3e8fb..ffa39ab153f2 100644
> --- a/drivers/input/rmi4/rmi_f11.c
> +++ b/drivers/input/rmi4/rmi_f11.c
> @@ -1203,8 +1203,8 @@ static int rmi_f11_initialize(struct rmi_function *fn)
>  	 * If distance threshold values are set, switch to reduced reporting
>  	 * mode so they actually get used by the controller.
>  	 */
> -	if (ctrl->ctrl0_11[RMI_F11_DELTA_X_THRESHOLD] ||
> -	    ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD]) {
> +	if (sensor->axis_align.delta_x_threshold ||
> +	    sensor->axis_align.delta_y_threshold) {
>  		ctrl->ctrl0_11[0] &= ~RMI_F11_REPORT_MODE_MASK;
>  		ctrl->ctrl0_11[0] |= RMI_F11_REPORT_MODE_REDUCED;
>  	}
> -- 
> 2.20.1
> 

-- 
Dmitry
