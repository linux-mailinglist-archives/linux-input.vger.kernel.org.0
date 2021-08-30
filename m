Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4C73FBD6A
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 22:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbhH3UYk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 16:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbhH3UYj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 16:24:39 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5ECCC061575;
        Mon, 30 Aug 2021 13:23:45 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id ot2-20020a17090b3b4200b0019127f8ed87so612003pjb.1;
        Mon, 30 Aug 2021 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h+3mX84nFnAyClKOUYMDJFGqUg+wKBWo2M4YAm5KDeE=;
        b=HkQRX6YAZLsaUi38EWhsB24kcuq1aHXtuE0Rxwe/j5/TaRphVrzGkHhlla2pEeZTBb
         aoQ6ZYfK3S9WgLByBLi5X7MpO2x27iqqG505NFkjWuQOhUbr2HNnzD2jqZImIs77vxIZ
         cZXCp7Wj8cGp4rGk27QasIpYOPu4hnBNFLnlLkHyjIOpXjwwNljVDX+gC7s59/Ez0gym
         +srHPt3zgCefNNVdveChYizrbJwAQq20c7a41ace8U1QvV0OlXEF+fQMyUj1XgY4FW5k
         WwTefeHfz9rhg2fMCfgGcttIC4Www3v/lZ9KXbWsPR/XFIH/KWLbI08PAmLmDMkbZliy
         QUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h+3mX84nFnAyClKOUYMDJFGqUg+wKBWo2M4YAm5KDeE=;
        b=WzaUTk6r+Ig+Ua40/olDyTYl+hYMsn4rsKa0fkqZ29tLoOYDk4bWJ027N25jQlquFO
         Ya4BiDMCHq3PSPi/TbF/P7b8DtJadhAHifDHRUNFHiStdyX98iOVVlG6H76DAponch9m
         uh/UeUDnwKjgbkVppqqSTo/Ua5zSShhhgawnlZBLIeBpmWUoXborAHq3Aml1jNebkQSI
         61O6RJkVEIlSlA6nZ6IBYEbZ/EGb9NMF95QWT9uxJUog9hvOyFv/aFJA/k7c+5Z2wpJA
         gVaRWvNHI7u1Y49KzIFBDjvCjcsxpK8ygOvVrrXc2RWKhIerffzwnNoOdKC9O8D8p5F8
         5o3A==
X-Gm-Message-State: AOAM530VnIqPx7A6wRvUgq3nMzEJqjegcN1jGmN/QKrIDwUucqUuTR4Q
        iF3oGFL4f5VUd0/TLtStKqM=
X-Google-Smtp-Source: ABdhPJxHmgQYkJFj5bbpFOtlXZui63pW8/vSQPJjJ8wBem06ht10W47cL3+3RzVQ97Qo0JMXaxWufw==
X-Received: by 2002:a17:90a:4204:: with SMTP id o4mr928331pjg.199.1630355024962;
        Mon, 30 Aug 2021 13:23:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id s20sm14915497pfe.205.2021.08.30.13.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:23:43 -0700 (PDT)
Date:   Mon, 30 Aug 2021 13:23:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     phoenix <phoenix@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        jingle.wu@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw
Subject: Re: [PATCH] Input: elantench - Fix the firmware misreport
 coordinates for trackpoint occasionally.
Message-ID: <YS0+TU21/nok6Ge9@google.com>
References: <20210729010940.5752-1-phoenix@emc.com.tw>
 <000001d79d99$53762dd0$fa628970$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001d79d99$53762dd0$fa628970$@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Phoenix,

On Mon, Aug 30, 2021 at 08:19:48PM +0800, phoenix wrote:
> Hi Dmitry,
> 
> Would you review this patch, thanks
> 
> Best regards,
> Phoenix Huang
> 
> -----Original Message-----
> From: Phoenix Huang [mailto:phoenix@emc.com.tw] 
> Sent: Thursday, July 29, 2021 9:10 AM
> To: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org;
> dmitry.torokhov@gmail.com
> Cc: jingle.wu@emc.com.tw; josh.chen@emc.com.tw; dave.wang@emc.com.tw;
> Phoenix Huang <phoenix@emc.com.tw>
> Subject: [PATCH] Input: elantench - Fix the firmware misreport coordinates
> for trackpoint occasionally.
> 
> Signed-off-by: Phoenix Huang <phoenix@emc.com.tw>
> ---
>  drivers/input/mouse/elantech.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index 2d0bc029619f..07e1098f2d31 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -517,6 +517,17 @@ static void elantech_report_trackpoint(struct psmouse
> *psmouse,
>  	case 0x16008020U:
>  	case 0x26800010U:
>  	case 0x36808000U:
> +	
> +		/* This firmware misreport coordinates for trackpoint
> occasionally.
> +		* So we discard these packets by pattern to prevent cursor
> jumps.
> +		*/
> +		if (packet[4] == 0x80 || packet[5] == 0x80 ||
> +		    packet[1] >> 7 == packet[4] >> 7 ||

I think this will reject X coordinates in range [0, 127]. Is this really
what is needed? What kind of patterns are you observing when firmware
misreports coordinates?

Thanks.

-- 
Dmitry
