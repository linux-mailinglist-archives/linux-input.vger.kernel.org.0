Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497C5246A6C
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 17:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730473AbgHQPfy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 11:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729898AbgHQPfg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 11:35:36 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05CBC061389;
        Mon, 17 Aug 2020 08:35:35 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 17so8403602pfw.9;
        Mon, 17 Aug 2020 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qx0UgAyO31lB16ri2FAAv37Ke5Db93tL9Cirv4pO0kc=;
        b=o431zZI4Z4wYsFST0x2SnXiEPkksHTQ+dOAdm8gRieOnxyyxp01sb1RLR5O38Cu/6t
         H3bEAVxEGlWjyxd0hji+v8UhrBbIGyw+GlUf1BwzgB6Xv3N+ngARXXM16sw3fdfJQWUu
         7BajSr1mWMXSknJElJK3iuffY4hNaWcNN6k8J/9J/La0UsQLAsKscnyV7z/kyNSndyE9
         Bd51eb1uShyDLgvUqmBBpKOdN0dZgXcF8PdKLunnXfmIINRSHli+z5//cbOBNhiKXLJF
         e4+/FQpdVpk9qg5XTc0AvN99KLliacf1/kOTBh3fcYNc+lo4cE2L0rtJ3MxVOYJVNOVt
         oyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qx0UgAyO31lB16ri2FAAv37Ke5Db93tL9Cirv4pO0kc=;
        b=SEbOs87AFNWZqZcZ24nrTw/jqsJgB4VivDY2yPpRwyMSkNnBouUTlpy8VVxLgcgIsu
         5rE2mVZICNh0Zp5NDYD8HNjMiZetTea/kotlklt4fzmao/tfmF+bGqMFUOx2/I4unYRU
         AcnPfTxP1OL0GxXrET/aKN+D7wy2c9bnF3yjXLLUpv10haJMUpWhaJeJU7lsybBSnVgz
         Yn3H6dk+r1Qay2FzwK/KKElpBfG1IcwlKFuanlEQTjT9+fVhOnmlT/FiO7pTT/U9neuc
         rYPlku7ztczDYV8VD2iAjoTEX8A5rx6vuOUz2G3nQP08PI75eBMclA+oToNAa67xWEHD
         92Rw==
X-Gm-Message-State: AOAM532ZHwIjcGXQTdzY2Ka7oaZZeLnYnHgaZ1lJgvcI6cUYdDrs7qgb
        8Ma+KR+Mk0kPnsIe3LbGJtwuccqSB58=
X-Google-Smtp-Source: ABdhPJwVRyGdL6gLtzFuisuLJ1+/NAQhGlfbnRyE0ODAwYYAtuW5w1BFkXs9/iLcFnEYbZXnZeRnPQ==
X-Received: by 2002:a63:615:: with SMTP id 21mr10417354pgg.383.1597678535192;
        Mon, 17 Aug 2020 08:35:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q2sm20745484pfc.40.2020.08.17.08.35.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 08:35:34 -0700 (PDT)
Date:   Mon, 17 Aug 2020 08:35:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: corsair-cpro: fix ccp_probe, add delay [HID
 related]
Message-ID: <20200817153533.GA243558@roeck-us.net>
References: <20200817070040.7952-1-mail@mariuszachmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817070040.7952-1-mail@mariuszachmann.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 17, 2020 at 09:00:40AM +0200, Marius Zachmann wrote:
> Possibly because of the changes in usbhid/hid-core.c the first
> raw input report is not received during ccp_probe function and it will
> timeout. I am not sure, whether this behaviour is expected after
> hid_device_io_start or if I am missing something.
> As a solution this adds msleep(50) to ccp_probe so that all initial
> input reports can be received.
> 
> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>

Let's just ask the HID maintainers. Is this expected, and the correct fix ?

Thanks,
Guenter

> ---
> v2:
> - fix accidentally deleted comment
> 
> ---
>  drivers/hwmon/corsair-cpro.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index 591929ec217a..c04fac1d820f 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -10,6 +10,7 @@
> 
>  #include <linux/bitops.h>
>  #include <linux/completion.h>
> +#include <linux/delay.h>
>  #include <linux/hid.h>
>  #include <linux/hwmon.h>
>  #include <linux/kernel.h>
> @@ -513,6 +514,7 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	init_completion(&ccp->wait_input_report);
> 
>  	hid_device_io_start(hdev);
> +	msleep(50); /* wait before events can be received */
> 
>  	/* temp and fan connection status only updates when device is powered on */
>  	ret = get_temp_cnct(ccp);
> --
> 2.28.0
