Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE10543006C
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 07:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236557AbhJPFgh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 01:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhJPFgg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 01:36:36 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDECC061570;
        Fri, 15 Oct 2021 22:34:29 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 66so10493944pgc.9;
        Fri, 15 Oct 2021 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4CrEqgAufz2diBZFjCMkZibQ9hBmn7hbMG1d+GIZLCI=;
        b=YB+r4935l23vZCAX9eCeoSsrGYb3PGI9JlHJzMydFyE6ZNdgA1bT54enPAVsowz7kd
         2VrPtIzhWO0hLf6KgK9XqpEsePbmhSXJ/IOxUJTXhmlp+VAhjQdVsvlUpGPXlo/gmoIv
         arQNzY9E3nwG71wXjShUS9uXAl8qpkEM/yDlSS3E81//AIcMBDaV+aCyIgYUFq+w6FAl
         m9deDw0Al7mUqex2rRSql7Q70vyL+c+Ov0urAX+54IQg4r5SN4JuM/pPE2crb1aJwvvP
         8uQ0mQ2Rh5EirgGVc1DuHTx7khAJEQMyoLLcK9x4WkxKIT/4ZwzRCUbv5sZwUtfrggwx
         CZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4CrEqgAufz2diBZFjCMkZibQ9hBmn7hbMG1d+GIZLCI=;
        b=kSf1pcRARIgPf/mqRohrKFWNT9IftnDiL20lkqDef+EaV2X9BiO8eO4ICYSmISdG+R
         SF6Zocbrw4AoySqZYyT82iSHdRs3lWBfgLRJ37ZIz8pBbzCUZkwbqAeV96ltfSB05fPj
         KAdF/7Kq4v6cfr4PqgzG4qjqieS0Ac1BOKhV12yMUlh0JB9arn+tpVAMonqHbvn0SoSU
         IF7Ef2QBbDUMYQj0AQgVG9abO29y+/iwSz1uXJ1EMqRKP4pjJeRZOhEfclyfqlFjAlpw
         A72NtjcG9iXoZDTlBjCeD0v7zIRPoH007Aaxd7chgV3/4e+H2sPSD1tDgb6VzxMiyU9s
         AiXg==
X-Gm-Message-State: AOAM531bPHb8+QhvbQ4azNvHlu3P9ZDXEDxGZwGykHA0oEG2fvg8ZAzI
        Wx7KQjOqTNQ6ry33OLg5B6FizfUv3Ek=
X-Google-Smtp-Source: ABdhPJziuKfnBhNBnSEVM2dC5KZKAqWvf8WNjpqeRg6XMsQa4Z1QiTxWpCMnQT96XniYj7HliVZE/A==
X-Received: by 2002:a63:b349:: with SMTP id x9mr12412545pgt.139.1634362468631;
        Fri, 15 Oct 2021 22:34:28 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6a02:4736:3b83:a269])
        by smtp.gmail.com with ESMTPSA id d15sm7084484pfu.12.2021.10.15.22.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 22:34:27 -0700 (PDT)
Date:   Fri, 15 Oct 2021 22:34:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gpio-keys - print button label in IRQ button
 error messages
Message-ID: <YWpkYWCFMtR40A6m@google.com>
References: <f1728883a5bf4481eb1d45e7b7a71005e29e259a.1632467859.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1728883a5bf4481eb1d45e7b7a71005e29e259a.1632467859.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Geert,
On Fri, Sep 24, 2021 at 09:18:02AM +0200, Geert Uytterhoeven wrote:
> When an error message related to IRQ buttons is printed, no clue is
> given about the actual button that caused the failure.  Fix this by
> including the button label, to make it more obvious which button has an
> incomplete or incorrect hardware description.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/input/keyboard/gpio_keys.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index 0f2250c6aa4978d5..fc706918d7b103cb 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -617,14 +617,16 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>  		}
>  	} else {
>  		if (!button->irq) {
> -			dev_err(dev, "Found button without gpio or irq\n");
> +			dev_err(dev, "Found button %s without gpio or irq\n",
> +				desc);

I do not believe description is mandatory, so we may end up printing
"gpio_keys" here. I wonder if it would not be more reliable to print the
index of the problematic key?

Thanks.

-- 
Dmitry
