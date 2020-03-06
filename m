Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B46017C504
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 19:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgCFSFk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 13:05:40 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51070 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgCFSFk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 13:05:40 -0500
Received: by mail-pj1-f65.google.com with SMTP id nm6so1385023pjb.0;
        Fri, 06 Mar 2020 10:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UziHqWjFJ6dviuOOmNK8JN5WhevDMAOA/6piNcbDHIw=;
        b=Lb3flTd5Jr/nNF03mi0ctFHUNEQfwNZidnVwDcMWUYMNeBQyob1RcSaxATmycXdWiq
         NvIZCCjV8MBnE2uBIkdkElpwIvVxckoIfgWHqXZ///nG4JAoKfYFLcULVwvi7q3DlSF3
         aZmQShoY4leujkVLzwncDm3SijQrn/jCqvwsyUH5AOqnPBnb7jO4kid5kbwplo3/7G0H
         ANzEoxegQmin+yPhvjWfppm9T8/Og5ofksC+pnVmXGwwJoyp1btbCYyIRvAC+yoch9vR
         ouj8Y+zu+15Yx32RGejeb1B8gSerSP2hS4qIyyDLHQvw9xttqPs5MLiHmIs8SZ3nCzPD
         5Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UziHqWjFJ6dviuOOmNK8JN5WhevDMAOA/6piNcbDHIw=;
        b=XNDT7eGH6Pta3wyQEPujoOd7bKGvPpvoLb0WJG8cfaMQDYWumn5U+lvNwmE6ZzinNy
         hgAkUOR8ZGRtDlkiynHLi6V7DV+JfwkYiIynnbzlwWUgycV4JAq3V0W/3ZRE7+5UmPe0
         FhtV2+6ANIZtM5VVM/H0kfJrFWevX0R2F54hLH3WMDUmEBCyxOotyVUw9rZGzB0lFaFe
         Zj1uUzxHiHDQVqvHttKi4MWlWNwwK/GOK7vaPZS0MQFiOBWea8EWqvTM0/eQLRkCyiRI
         NSMY8CtnVZ1QDc0xRn1nA/9K7UK9LojJkiPS0Rkotmd1oMI4pB/LlGP/g7oRjTT6sXgs
         N5Pg==
X-Gm-Message-State: ANhLgQ0gQwNUpWabp/gXWKCIEFm7zPyoj+0EOeH1oqZTh8s6/5loyvUG
        L6av07id56JBBfBNXCfEGtgw0kP8
X-Google-Smtp-Source: ADFU+vtJAO1fvWLHfB5OBsJTVgb89IS/0sAesFFda6P5CVncXzX7SW/6sOFIG0jfuuKBiDek2UiSYA==
X-Received: by 2002:a17:90a:a416:: with SMTP id y22mr4833791pjp.114.1583517939060;
        Fri, 06 Mar 2020 10:05:39 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id u126sm36342127pfu.182.2020.03.06.10.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 10:05:38 -0800 (PST)
Date:   Fri, 6 Mar 2020 10:05:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH] Input: elants_i2c - Report resolution information for
 touch major
Message-ID: <20200306180536.GE217608@dtor-ws>
References: <1582766000-23023-1-git-send-email-johnny.chuang.emc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582766000-23023-1-git-send-email-johnny.chuang.emc@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 27, 2020 at 09:13:20AM +0800, Johnny Chuang wrote:
> From: Johnny Chuang <johnny.chuang@emc.com.tw>
> 
> This patch supports reporting resolution for ABS_MT_TOUCH_MAJOR event.
> This information is needed in showing pressure/width radius.
> 
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>

Applied, thank you.

> ---
>  drivers/input/touchscreen/elants_i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 4911799..14c577c 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1309,6 +1309,7 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
>  	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
>  	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> +	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
>  
>  	error = input_register_device(ts->input);
>  	if (error) {
> -- 
> 2.7.4
> 

-- 
Dmitry
