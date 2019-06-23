Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC144FA8C
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 09:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfFWHCw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 03:02:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36425 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFWHCw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 03:02:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id f21so5400370pgi.3;
        Sun, 23 Jun 2019 00:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+lsxWwYMTDZ/8niyjvkYyNKECPnsLXZWoUHb7zKfR/A=;
        b=S0F9y0Eu8oh5fhW8NFNWHy+aioK8pXr8y9WSeQ5O2ESquJvM/4FPovntXzU0d0iiuu
         2FgzqN51FY/WzM5ShIXbvxI613tK9yPYdScR1CfpOzcAK922V6urAbtFv+R8aEcROwQE
         /VJyw6UvblRPZw8YrUmgR/y2NIdKJ3p7s9EcM3IyB1AgsQk4ec/X4U4VXfDBMtxKZ9bf
         cXs29UomBSQqKbkNN2bylU9X4k680/+2VuYP689croXSShiBv8jgzPN0eVfrB9oLHVFA
         2jnp25uTt0HIGTh0efyn7QDtW8JSzN07mMq01GYZLFzgCpEl1FNb5Sd79RZNN//W0hSK
         vuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+lsxWwYMTDZ/8niyjvkYyNKECPnsLXZWoUHb7zKfR/A=;
        b=trmX6hj/CJut1c1TcQja4yI/6nBYJmla1jgMVFZ/wTlR9x9bveLgNDxuOEAhDt5vXJ
         0Ua++2S4irpOBu6JD9ffh020UILRMEJidlrVSKLPguhkk3lNdxckNM9EsCppJ2a+vkjo
         0cZtLkvwToZ4Tw3rK3ln3yZmYW++YQ/as4CFhtgvW42Bu68h3OSP92xWMlZ4hXa618dQ
         6B5TojfLElsqw1UJOI4yJvEwDrACu418o6Ep8oXl+ecJMcZlF+G78FJSBiGsrfpgIIfq
         dpkCY3SiS54gv37DglBgj5pyeGxRUAf8bLtKbJFyc2xIpyE1wNfHbkUPoEl9lCYG0G53
         0igw==
X-Gm-Message-State: APjAAAVRu/tvKXzspwNxFGALTff/sPOsQ3YQrzIbZf5I3L3R/QUBBmhW
        Nrscz9Cz9IdP/WMurt3eDrvnHBF9
X-Google-Smtp-Source: APXvYqyfKcWx/YzKALeB3aza/MmeQhjboZJyLpGKhsLzbTmIuW6eEYytA7EIDWvj6slAscRow2+yhA==
X-Received: by 2002:a63:dc09:: with SMTP id s9mr27194667pgg.425.1561273371482;
        Sun, 23 Jun 2019 00:02:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u5sm6891502pgp.19.2019.06.23.00.02.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 23 Jun 2019 00:02:50 -0700 (PDT)
Date:   Sun, 23 Jun 2019 00:02:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "luhua.xu" <luhua.xu@mediatek.com>
Cc:     Rob Herring <robh@kernel.org>, Marek Vasut <marex@denx.de>,
        Nick Dyer <nick.dyer@itdev.co.uk>,
        Richard Leitner <richard.leitner@skidata.com>,
        Martin Kepplinger <martink@posteo.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        weiqi.fu@mediatek.com, wsd_upstream@mediatek.com
Subject: Re: Kernel touch Kconfig consult
Message-ID: <20190623070249.GD204275@dtor-ws>
References: <1560509239.24963.25.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1560509239.24963.25.camel@mbjsdccf07>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Jun 14, 2019 at 06:47:19AM -0400, luhua.xu wrote:
> Hi Dmitry,Rob,Marek, Nick,Richard,Martin,
> 
> In our  customer support experience, many smartphone have two or three
> touch vendor mixture , and customer use one load to support all touches.
> For easy to config touch driver  we use kernel config like this down
> below,
>  
> We change the config type from 'bool' to 'string'.
>  
> config TOUCHSCREEN_MTK_TOUCH
>   string "Touch IC name for Mediatek package"
>   help
>     Set touch IC name if you have touch panel.
>     To compile this dirver for used touch IC.
>  
> 
> And we config touch driver like this：
> CONFIG_TOUCHSCREEN_MTK_TOUCH="GT9886 GT1151 TD4320"
>  
> I only use one config to support  3 touches, while we have to use 3
> config to support 3  touch drivers if we set the config as 'bool'.
> 
> So can I use Kconfig like this?
> I do look forward to receiving your reply at your convenience .
> 

I really do not see why having a sting is easier to have than 3 bools,
especially if they pertain to different touch controllers. You must also
have some custom processing of the config above as I am pretty sure our
standard build tools would not work for it.

Thanks.

-- 
Dmitry
