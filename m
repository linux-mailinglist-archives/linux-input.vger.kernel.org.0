Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A592D53AA
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 07:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgLJGPV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 01:15:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgLJGPN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 01:15:13 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28C0C0613CF;
        Wed,  9 Dec 2020 22:14:33 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id c12so3043434pfo.10;
        Wed, 09 Dec 2020 22:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gny1Tk/NkzCkucCgjQAN08t8L5tKNABHVyy0fWYIoTE=;
        b=Hc3wBayCQAuK3LKCJ98WVvLPf0kuUuIO2auwdmWliQLVAugrsQEPrD/JXcnzyQejC1
         VGWR+8FGvgkI3W9gSoS660Osoinxc0YED93ImslSnY1j/KuyRqLuGfs8GV2hQ/J3aKN3
         3heDHaSCRo8Yzw3P0SwGhuTUF5DzIOOL1xhw/fHd04HgDC6tXr6RUmAwSnBpvqZYwgBS
         kyon6+uIcUXxk3IbEeM2yZSo0OXlrodwHqR4yqkaF3E8fu3rHeMhFUg0qav22AupaugU
         tkFW32v+apowQkLZzAWMbtyZ0sNY7oKduEyRdVTyMzFiG11b4rKS6pcxy4uGF0htVjl/
         bIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gny1Tk/NkzCkucCgjQAN08t8L5tKNABHVyy0fWYIoTE=;
        b=Sw26AjBwE/DsuQHPlhF6n/IXrKJ+W75ENJ8yKKP4vXfHQwyeYQeeE9LM6qertvAZOl
         6pv8hl6xdLlr+e0lOqsvK3pKatkJMQulNpOO5M/aqpE1RodpgNDdFWJwLost6fGRSZBB
         x8zmhEZ4PUKL31vjM8k0Pu0mrm1kMWJ0EfYJoD3kEbaN6VcNr0KEw0FuTHaVX7GE5hFc
         dZXnopvhHA2/H4sEt415GhHGuQ+uJjCKVeO/84uxumBJOypRV0nM0HGvMB0nmjIK4gQV
         rso8DP50f4tItydebvN5Zb87e8AP90eddj7YjaP9fwb5xLJKYMzub8Dkg3eGC6GLCQpn
         1yRQ==
X-Gm-Message-State: AOAM530BNtkasqQitfvhonKklZxcoGUbH+e6Kxj412+tLr0zuQeMC4qR
        oKw+hsGI4JnTASUSsJJNS9I=
X-Google-Smtp-Source: ABdhPJxAVkoQ3DkDktC5MbHG//Tj6qoVAxtoBbB1lyi8uqEp4AVoBEpUpobqjlK79YHzu08kZORvCQ==
X-Received: by 2002:a17:90a:bf86:: with SMTP id d6mr5902040pjs.212.1607580873231;
        Wed, 09 Dec 2020 22:14:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id iq3sm4495095pjb.57.2020.12.09.22.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 22:14:32 -0800 (PST)
Date:   Wed, 9 Dec 2020 22:14:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw
Subject: Re: [PATCH 1/2] Input: elan_i2c - Add new trackpoint report type
 0x5F.
Message-ID: <X9G8xUk/QvcxsNWi@google.com>
References: <20201207090751.9076-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207090751.9076-1-jingle.wu@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Mon, Dec 07, 2020 at 05:07:51PM +0800, jingle.wu wrote:
> The 0x5F is new trackpoint report type of some module.
> 
> Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
> ---
>  drivers/input/mouse/elan_i2c_core.c  | 2 ++
>  drivers/input/mouse/elan_i2c_smbus.c | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index 61ed3f5ca219..8f0c4663167c 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -52,6 +52,7 @@
>  #define ETP_REPORT_ID		0x5D
>  #define ETP_REPORT_ID2		0x60	/* High precision report */
>  #define ETP_TP_REPORT_ID	0x5E
> +#define ETP_TP_REPORT_ID2	0x5F
>  #define ETP_REPORT_ID_OFFSET	2
>  #define ETP_TOUCH_INFO_OFFSET	3
>  #define ETP_FINGER_DATA_OFFSET	4

I think we might need to move this into elan_i2c.h so that we can
reference it from elan_i2c_smbus.c.

> @@ -1076,6 +1077,7 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
>  		elan_report_absolute(data, report, true);
>  		break;
>  	case ETP_TP_REPORT_ID:
> +	case ETP_TP_REPORT_ID2:
>  		elan_report_trackpoint(data, report);
>  		break;
>  	default:
> diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
> index 1820f1cfc1dc..1226d47ec3cf 100644
> --- a/drivers/input/mouse/elan_i2c_smbus.c
> +++ b/drivers/input/mouse/elan_i2c_smbus.c
> @@ -45,6 +45,7 @@
>  #define ETP_SMBUS_CALIBRATE_QUERY	0xC5
>  
>  #define ETP_SMBUS_REPORT_LEN		32
> +#define ETP_SMBUS_REPORT_LEN2		7
>  #define ETP_SMBUS_REPORT_OFFSET		2
>  #define ETP_SMBUS_HELLOPACKET_LEN	5
>  #define ETP_SMBUS_IAP_PASSWORD		0x1234
> @@ -497,7 +498,7 @@ static int elan_smbus_get_report(struct i2c_client *client,
>  		return len;
>  	}
>  
> -	if (len != ETP_SMBUS_REPORT_LEN) {
> +	if ((len != ETP_SMBUS_REPORT_LEN) && (len != ETP_SMBUS_REPORT_LEN2))  {

I would prefer if we validated report length versus the packet type
before accepting it.

>  		dev_err(&client->dev,
>  			"wrong report length (%d vs %d expected)\n",
>  			len, ETP_SMBUS_REPORT_LEN);
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
