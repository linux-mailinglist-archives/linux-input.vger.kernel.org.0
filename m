Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720251D6F91
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 06:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgEREHO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 00:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgEREHO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 00:07:14 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151C6C061A0C;
        Sun, 17 May 2020 21:07:13 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u22so3666670plq.12;
        Sun, 17 May 2020 21:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vn0pCsD2eFefj2+fTs7XzO6u3jKtlDfOwmx3cRoRly4=;
        b=cHMhIaCkX3pXQFq2PIJmAuFIdrTtnL9laAO0yFzZFD9I/GFu3a6nzCXko9DFFSlca/
         nrVBlyHWY8rYNJ1lytwIYw09VMG/S8Lgd641oFvcafcs15272Zj/GDyECezRyoeJk6Sr
         oQnEQhPPt6uolmfY10YNkdXprLaaADn1T2B0G4QsdFX60uo7KQDcw9ApqicxNmrgbvCc
         iDu92Iwus6M2dnH5rVXgOpqyClmQyxAFuC55FFZlJ/aptu2jfrZNagBq7HRc+3YtMpHy
         DIM7R2Hc07ymEU1nCgI6tkWa6EHR2wrdNlPtsyz9NKIaxOq+duaFwKbv8TefUM1af7Hs
         2VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vn0pCsD2eFefj2+fTs7XzO6u3jKtlDfOwmx3cRoRly4=;
        b=l7hEN6rvme//K3SaHFQymn4RjpoK1qbBq2bA8XPQG0L0CMNZv7VaQsMSFAFW/jQ4Ux
         4tboMUZ2vmkp2qQ9L6h6I1TNEkLSzc4T829mI5ORNLNb3YiwUkiPs18yL6v3a5Bx+kGj
         kn88ku6yVODfOyLI9Gxk1gGIE4fiNpX0lAGSTB4S43pWCU4k07Ej45jeqSULwoVc4vvB
         DvuTJe4MSbizvDk5fClQxUezXctHwJHpNji8oeKgG5gN+aQ09V398SYnn6xeVXIV+7us
         WHdhnb4jFzkaUpqxQEIpPbJCGvg2M/Y2++tIpoOyrIZMoWpTIi1bwCqsHJwqD5KNk54D
         2lrQ==
X-Gm-Message-State: AOAM531kwKkwd4lCrJgXxqLqZgT/WeBJePMIHIDUVwTQGhdoE3f7A7AO
        WzhAAyk6IUdaa+HvQfSclFM=
X-Google-Smtp-Source: ABdhPJwP0PBNC2vfOxKjBQo6BDkblLwCXLnx/SPsb48qHcgzGpZ4WAnJ6e70pMImWPHGc+lqVQPgXQ==
X-Received: by 2002:a17:90b:f8c:: with SMTP id ft12mr17610396pjb.127.1589774832490;
        Sun, 17 May 2020 21:07:12 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id r21sm7114392pjo.2.2020.05.17.21.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 21:07:12 -0700 (PDT)
Date:   Sun, 17 May 2020 21:07:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/10] input: elants: document some registers and
 values
Message-ID: <20200518040710.GQ89269@dtor-ws>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
 <a8c17a4c804ad5c429269cc0468d8cb4c0783a47.1587923061.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8c17a4c804ad5c429269cc0468d8cb4c0783a47.1587923061.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 07:47:49PM +0200, Michał Mirosław wrote:
> Add information found in downstream kernels, to make the code less
> magic.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 29 +++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 2289f9638116..d2175fb6209a 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -81,7 +81,11 @@
>  
>  #define HEADER_REPORT_10_FINGER	0x62
>  
> -/* Header (4 bytes) plus 3 fill 10-finger packets */
> +/* Power state */
> +#define PWR_STATE_DEEP_SLEEP	0
> +#define PWR_STATE_NORMAL	1
> +
> +/* Header (4 bytes) plus 3 full 10-finger packets */
>  #define MAX_PACKET_SIZE		169
>  
>  #define BOOT_TIME_DELAY_MS	50
> @@ -91,10 +95,21 @@
>  #define E_ELAN_INFO_BC_VER	0x10
>  #define E_ELAN_INFO_TEST_VER	0xE0
>  #define E_ELAN_INFO_FW_ID	0xF0
> +#define E_POWER_MODE		0x40
> +#define E_POWER_STATE		0x50
> +#define E_INFO_X_RES		0x60
> +#define E_INFO_Y_RES		0x63

I would prefer if we introduced these in the patches that use them.

>  #define E_INFO_OSR		0xD6
>  #define E_INFO_PHY_SCAN		0xD7
>  #define E_INFO_PHY_DRIVER	0xD8
>  
> +/* FW write command, 0x54 0x?? 0x0, 0x01 */
> +#define E_POWER_MODE_BATTERY	0x40
> +#define E_POWER_MODE_AC		0x41
> +#define E_POWER_MODE_USB	0x42

What is this for?

> +#define E_POWER_STATE_SLEEP	0x50
> +#define E_POWER_STATE_RESUME	0x58

Thanks.

-- 
Dmitry
