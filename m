Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFB61077C7
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 20:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKVTCN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 14:02:13 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38077 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfKVTCN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 14:02:13 -0500
Received: by mail-pj1-f65.google.com with SMTP id f7so3416108pjw.5;
        Fri, 22 Nov 2019 11:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rXO9cqEQmTofVcUIhUtd2eNJuGiff/iEv3zoqiv6qHo=;
        b=JVGcKgS9V2ip/SRxOAk03Fht0RCY6Asf7kXy1KRaOcWczzcWUR9yBEdsrXVf1lOz6y
         04H5Bq9Y20bNKdrti7DmVLKFnqaSwl9oNSyZgzRP/BRIH8fJrdidtavACPXt46uQjo/k
         plm33ARALqvWtCTxKcktBDH+w4Tj4eHjlXnCpjcvpB7TW/hN1nybRlSy+2X2IThkczQl
         0+xdWthH+823/yFLAnzV26AG0BiBQIiKhddpUZ6Pk0CpzCXGnkRx+eRPb9TD42c4pPzE
         mFO9GWvyz9dCkAfdJ2oNp5u2HVvg1XtAgxXQ7MQbEZNAu6g9nYLy0vNyyOebfD0r8txr
         olQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rXO9cqEQmTofVcUIhUtd2eNJuGiff/iEv3zoqiv6qHo=;
        b=mmUEmaTvCuiIGMoHPL1onbj/rPdTHVZ3ggurD3A0mGF5vbM20pXnnH+WFp3SqxlEUi
         eyqV2PvWWqobdPOXvqMwvjn7t+SEz5KnkBIts0RcQonB9GkRxDfC2xAVwri9QhAWMyzY
         gXVbeSAmK15j4ZRdKRj8zYkrq2zSc3MI7qc3ouEeVoaZMgEdPE11XH0+IzzK6f4vHuvG
         6WR0pCGkPZtwFA7RzTSU2rqPPLjgDYTv0xWrpoxHIma/vpOxtbY3JfMZqHjMTfryZmGm
         sgnjZOfvNiFJy+X2ZL8+D9Tosv2pizZUkBTMjvlQMs56UNoebFW16AlXILstpeuUUCk1
         bfXg==
X-Gm-Message-State: APjAAAU8RIMVPWWezy+OZe5xgrqruWC+1R5fVo5Ci5YL5J+olFS8EIjP
        Cz2Aiwj5rubGqU68SlxeADY=
X-Google-Smtp-Source: APXvYqxmIeXmYqTAGH5G6KIOCDjlzWl389mvrK8MD9R9K8eUmje6qYAJBh9w3bdvna6APckPqBIq8w==
X-Received: by 2002:a17:90a:db43:: with SMTP id u3mr21080194pjx.56.1574449332145;
        Fri, 22 Nov 2019 11:02:12 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id l21sm3554290pjt.28.2019.11.22.11.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 11:02:11 -0800 (PST)
Date:   Fri, 22 Nov 2019 11:02:08 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        emamd001@umn.edu
Subject: Re: [PATCH] Input: Fix memory leak in psxpad_spi_probe
Message-ID: <20191122190208.GA248138@dtor-ws>
References: <20191121200115.24846-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121200115.24846-1-navid.emamdoost@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Navid,

On Thu, Nov 21, 2019 at 02:01:11PM -0600, Navid Emamdoost wrote:
> In the implementation of psxpad_spi_probe() the allocated memory for
> pdev is leaked if psxpad_spi_init_ff() or input_register_polled_device()
> fail. The solution is using device managed allocation, like the one used
> for pad. Perform the allocation using
> devm_input_allocate_polled_device().
> 
> Fixes: 8be193c7b1f4 ("Input: add support for PlayStation 1/2 joypads connected via SPI")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

This is fixed in the current version of the driver, but you can send it
to stable@gerkernel.orf with my

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/joystick/psxpad-spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/joystick/psxpad-spi.c b/drivers/input/joystick/psxpad-spi.c
> index 7eee1b0e360f..99a6052500ca 100644
> --- a/drivers/input/joystick/psxpad-spi.c
> +++ b/drivers/input/joystick/psxpad-spi.c
> @@ -292,7 +292,7 @@ static int psxpad_spi_probe(struct spi_device *spi)
>  	if (!pad)
>  		return -ENOMEM;
>  
> -	pdev = input_allocate_polled_device();
> +	pdev = devm_input_allocate_polled_device(&spi->dev);
>  	if (!pdev) {
>  		dev_err(&spi->dev, "failed to allocate input device\n");
>  		return -ENOMEM;
> -- 
> 2.17.1
> 

-- 
Dmitry
