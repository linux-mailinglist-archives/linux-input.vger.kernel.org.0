Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A502A9044
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 08:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgKFH0f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 02:26:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgKFH0f (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Nov 2020 02:26:35 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEC6C0613CF;
        Thu,  5 Nov 2020 23:26:34 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id u4so261028pgr.9;
        Thu, 05 Nov 2020 23:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yX6K1j3rhfrIMCgxyHm+s66STbKqMz13p1Fd9YNZ4jc=;
        b=gx+7D5fqwVkVg4hdOWhBZ1CCnXS0GGjYAvN1mIlh8evXCAvguMou7a8fR9hT3uvZAI
         o6UX7pdAt6g8uY8Lwne7lqwdjUFlT0gdH/ziIMcHSH/DgEN3JN537/4ezUFnZN18U1Be
         bIeHPuM5UJNR+x60/tjR79R2P5hrh9pX6T1oB/Db6WuSMV9TaWoRlvB+mfoZFmh02rDh
         TLKu0YlF1IxbY3ZlizbDiny+f6ymQNfiHxxNO6oNS032U53eSDJGUrIlzqG7tSPDDNq0
         OnT+FQXCBctCoH0qkmrU38j6Qo8+a4uD7/0cQKRtyWw4vpiTUMyc8Dtwzk7XyPW6aKef
         WT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yX6K1j3rhfrIMCgxyHm+s66STbKqMz13p1Fd9YNZ4jc=;
        b=RIDQo2Ib8Y42pFbJQT1gVUfitSwKkgEYS7TjEnqF3LtwT7NiVfY2TlMG4phHFf2b5Y
         +lPokNPr/gNrCL6Vw2RuFKKbos+iQCN3d5HeaWJKutQ6q23UdsAQc0srxazS4lmyEmCx
         UtGgCHen3QiNhO+jn+HkbXEE648/OoU+hk7OSTMueu7ty3/7k9Dmxoch0wHK2La3vBDM
         SAA3ZoA4iLTnRfJxdwR+gICmy1Ic+v+3Z2SA0xWcqV4bpeM3g0wKJP6cflyJwB/RbrN1
         1pu+sqmXZ242gEwbhgxRPtWO7QMk8ybiPJaB7dBzLuyV0X//3o7Z1hKOsGUq2og/UP1h
         VVvg==
X-Gm-Message-State: AOAM530TWl+12p1kOGowQrEW63fqiUPWRfmQGsExbtaXV3GCIrIfsvwA
        fXXGpUiZdSk/8hdPPd+xMPU=
X-Google-Smtp-Source: ABdhPJzcWk/a2KAbSZO6t4y1iS6BZK0KvnMWWOBmhNjIn3bi61DPZQl8Qr5XzE0hw+0xXl21rq92nA==
X-Received: by 2002:aa7:86c9:0:b029:18b:b0c:53e5 with SMTP id h9-20020aa786c90000b029018b0b0c53e5mr816784pfo.57.1604647594467;
        Thu, 05 Nov 2020 23:26:34 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id e23sm1063669pja.25.2020.11.05.23.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 23:26:33 -0800 (PST)
Date:   Thu, 5 Nov 2020 23:26:30 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, joe@perches.com
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Peter Osterlund <petero2@telia.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Bruce Kalk <kall@compass.com>,
        this to <linux-input@vger.kernel.org>
Subject: Re: [PATCH 10/20] input: mouse: synaptics: Place braces around empty
 if() body
Message-ID: <20201106072630.GD1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-11-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104162427.2984742-11-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lee,

On Wed, Nov 04, 2020 at 04:24:17PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/mouse/synaptics.c: In function ‘synaptics_process_packet’:
>  drivers/input/mouse/synaptics.c:1110:6: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Peter Osterlund <petero2@telia.com>
> Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
> Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
> Cc: Bruce Kalk <kall@compass.com>
> Cc: this to <linux-input@vger.kernel.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/input/mouse/synaptics.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 82577095e175e..07835939d83b9 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -1106,8 +1106,9 @@ static void synaptics_process_packet(struct psmouse *psmouse)
>  					num_fingers = hw.w + 2;
>  				break;
>  			case 2:
> -				if (SYN_MODEL_PEN(info->model_id))
> +				if (SYN_MODEL_PEN(info->model_id)) {
>  					;   /* Nothing, treat a pen as a single finger */
> +				}

This gives me:

WARNING: braces {} are not necessary for single statement blocks

from checkpatch.

Thanks.

-- 
Dmitry
