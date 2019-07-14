Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4165A68142
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2019 23:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbfGNVa5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jul 2019 17:30:57 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43346 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbfGNVa5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jul 2019 17:30:57 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so6485099pfg.10
        for <linux-input@vger.kernel.org>; Sun, 14 Jul 2019 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aqtVMVtdVS+TkiwMdKOOjhpgnsfoFzN0sYEDsFbmrRE=;
        b=WVhxTa4HtXf9TDNKTkWa69Nmea0O1eDfHwtA6r0aUaN5Hk6bGX+PHftpf+5DPb779w
         ZtUpKcDGPzouuDXmor4lk9sL483gXXoJn3t198rs4is2IxcfvE0Q9QBUtzKi2xUB1rS3
         7inFzviS2nK4RasZuHPs7wVqOGFBQNg13HOKIliwxbXFIl+TpMQmXBRoja85uibTNPzI
         R7fzJBe1z9ZonjYvnea7kSnka0ZsY7GCUJtr8Ub1anFbcXgll/xOeGlO3SKFlvw6CeEj
         wRyY4lNicAbDoA53Xy1RDnrOhWNzdeqzRcaiwvwgUp/kx/dYlAjxFGIVq7RhTjAJDzRg
         2sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aqtVMVtdVS+TkiwMdKOOjhpgnsfoFzN0sYEDsFbmrRE=;
        b=WIda1uwcnPQzm9otTYsWZSO+JCisae/MrG0ewQP3gSitrednrwcOqmSaoYhmXdkKQv
         Pp/I6jIiupxJoyhPr7QzZRYFC9Dq/wWYAgW2k3fH+fVXUk8UpFgu+GEFgiKbD8Cb6bKA
         ZfTPWMkvCiMwLf/OvIVZW7UYn0pT0fzCt9+M0BZSjPRquUWGyQsoL6IkzrqI7J/R7Dve
         zCNIgiMxzMQUHr5Rd2e2ynV/qrlewUE7MOmMizLvNfGulx2pA1hxK0h5l8G76+HGrP06
         lJUZp5F23IcO2KBXHgyK/L7gyrQIsbE8r1ZSG6NiCYJqkC2PTjbrp5UsrR//WFGUGNOe
         db6Q==
X-Gm-Message-State: APjAAAVwC10MQ7+XminOahDoY578XHIDF1hMCI3nIPTHo2ywaAFz6XW2
        vbI1uchw+unc7fFyKjb5aqs=
X-Google-Smtp-Source: APXvYqwPilOy11gGXyRMxdJKaUMkQ1DdFQCEPjcFfQs1WB6578z0doOJWgwg1zN7Gba4k25fTl7UXQ==
X-Received: by 2002:a63:e14d:: with SMTP id h13mr23416490pgk.431.1563139856104;
        Sun, 14 Jul 2019 14:30:56 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c69sm18013299pje.6.2019.07.14.14.30.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 14 Jul 2019 14:30:55 -0700 (PDT)
Date:   Sun, 14 Jul 2019 14:30:53 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH][V2][RESEND] input: adp5589: Initialize GPIO controller
 parent device
Message-ID: <20190714213053.GB232696@dtor-ws>
References: <20190614125751.3553-1-alexandru.ardelean@analog.com>
 <20190709135558.4542-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709135558.4542-1-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 09, 2019 at 04:55:58PM +0300, Alexandru Ardelean wrote:
> From: Lars-Peter Clausen <lars@metafoo.de>
> 
> While not strictly required for normal operation setting the GPIO parent
> device allows the GPIO framework to generate more verbose debug output for
> the GPIO chip.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/adp5589-keys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
> index 4c05c70a8cf3..4f96a4a99e5b 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -505,6 +505,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
>  	if (!gpio_data)
>  		return 0;
>  
> +	kpad->gc.parent = dev;
>  	kpad->gc.ngpio = adp5589_build_gpiomap(kpad, pdata);
>  	if (kpad->gc.ngpio == 0) {
>  		dev_info(dev, "No unused gpios left to export\n");
> -- 
> 2.20.1
> 

-- 
Dmitry
