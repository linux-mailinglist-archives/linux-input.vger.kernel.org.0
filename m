Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB89E0F38
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 02:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731217AbfJWAa6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 20:30:58 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37460 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbfJWAa6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 20:30:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id y5so11722844pfo.4;
        Tue, 22 Oct 2019 17:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5oxnSNQHQFeYV0UsIIwvbFJNUuX8LHvVFO8Sr+wl/BM=;
        b=swV0escK/orz3y+AekbcFYzEiTZQ8ZQzTQBtEqEfRPWAQDPS+w1ndI6JHIq13pGL0s
         eBr1PmvcL6fQL5yydIJ7QB+jA8Qraxc/BYzwRJguohOVQ0VyoC7vamSAoog0bjdntozZ
         79hBS6smAq0zyj6i+FdRdJT1H4X6cLWdw7x6Pwtj+JaK2h9a9AYCOrm3jcGF7NejEptW
         04EfIaJQWqt/xbo5uyo8CJ8A5N7EBL5jfoHZ3bZLMdzOLnFPbfvQW0m6hnKDL/50XmOs
         B+BgirCITjB0UZtOQPT/nr5o83KWjlVwchrsohmVcq9MRLPR5B6TmzlXuuubDL2BslaB
         FYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5oxnSNQHQFeYV0UsIIwvbFJNUuX8LHvVFO8Sr+wl/BM=;
        b=fZ9eYsr6kOFIKRjGwpU0pZWeu1UyiSJlMaYT9sk+h0vBn7lypqobrZ7PoxTxoz/UFd
         H4DlmHdaDKm2ew5z2988+jL04i3JhiDoz66/RHt4OMW25hdZieZ8iuSmdEC+3Ddp9b8L
         PuuhiSontJ/YQBR2OCKI+C101O3f3IU3cFeU9eth6SKimEwTyvAHfvOLJR8CrUdjM3ag
         UAYObY0p8hYFYIlQ250qV3SMhGnJoqQau8LhKJlY4TXfV7P/4A+IGnnqJiGthh98ACOr
         VUM/D+nnVfGm9W9NtZHMzXlM8ncr+2fpRLt93NsqsyIUIHBE9u/ZSl27qOqoQsQ7/7hm
         7gFw==
X-Gm-Message-State: APjAAAW2ZtLLWKhAUCk0guGtbdGvGxogDR7e4gESYbs2Y9wWXV0vCNkA
        99tQfhq5H9pp2CfPbvIexQxK4ECR
X-Google-Smtp-Source: APXvYqyjIanCBYTND7scHT1k/bkgTaf4UkJyDEnZHW4SAUBW/bacOa/L8z+H3KjUjozKzHmvFTS2Jw==
X-Received: by 2002:a63:7356:: with SMTP id d22mr6710137pgn.230.1571790657426;
        Tue, 22 Oct 2019 17:30:57 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o64sm45783084pjb.24.2019.10.22.17.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 17:30:56 -0700 (PDT)
Date:   Tue, 22 Oct 2019 17:30:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>
Subject: Re: [PATCH v2 2/2] HID: google: Add of_match table to Whiskers
 switch device.
Message-ID: <20191023003054.GY35946@dtor-ws>
References: <20191021030233.32592-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021030233.32592-1-ikjn@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 21, 2019 at 11:02:33AM +0800, Ikjoon Jang wrote:
> Add a device tree match table.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/hid/hid-google-hammer.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
> index 84f8c127ebdc..b726f8a15044 100644
> --- a/drivers/hid/hid-google-hammer.c
> +++ b/drivers/hid/hid-google-hammer.c
> @@ -17,6 +17,7 @@
>  #include <linux/hid.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
> @@ -264,12 +265,21 @@ static const struct acpi_device_id cbas_ec_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id cbas_ec_of_match[] = {
> +	{ .compatible = "google,cros-cbas" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, cbas_ec_of_match);
> +#endif
> +
>  static struct platform_driver cbas_ec_driver = {
>  	.probe = cbas_ec_probe,
>  	.remove = cbas_ec_remove,
>  	.driver = {
>  		.name = "cbas_ec",
>  		.acpi_match_table = ACPI_PTR(cbas_ec_acpi_ids),
> +		.of_match_table = of_match_ptr(cbas_ec_of_match),
>  		.pm = &cbas_ec_pm_ops,
>  	},
>  };

-- 
Dmitry
