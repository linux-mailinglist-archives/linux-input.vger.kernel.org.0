Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08DFC67FE69
	for <lists+linux-input@lfdr.de>; Sun, 29 Jan 2023 12:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjA2LHB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Jan 2023 06:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjA2LHA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Jan 2023 06:07:00 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D5D18154
        for <linux-input@vger.kernel.org>; Sun, 29 Jan 2023 03:06:59 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q5so8705515wrv.0
        for <linux-input@vger.kernel.org>; Sun, 29 Jan 2023 03:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJSa3kpwVdk3+5lcEyYOi2+7ejLEgKasfK/40ttA9Pg=;
        b=UwqvLIgTMr008kIuDt9asjEDbSo71JSMZYkBiEtkl2k2S4vObXngo0puPD4CRre9uM
         hCTmN0zbI2oWG0ECxWqLpM46jjOuE+AJ8ju93lADQKPXtyjWaYtnz+8//eZRhyMgTMAr
         vy8mqt0CkT1zB6FcveYMD+0bauCTEGFtQom5AjsWM445O6TYv85lrPkFf4JK8MbhY8SI
         zQK8dP1ycRZFTS+ZISZPU1MDhCIcTTNwV56Fs3BZsfhJ7YV7hglGmmUDTPWIEi6B4F1u
         IU92jvEqXU4hzWMIzYk6teQ2Lk9NWK+wzO7eeHn5Jrg8HaM9adwiPXU7TDj3YgmUautP
         KzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJSa3kpwVdk3+5lcEyYOi2+7ejLEgKasfK/40ttA9Pg=;
        b=M0O/PEl4pm5LY2st4qqnA49ATZevI1mwRHipKv4SAVhzY7gSTviPG08C+3uAUlfxDs
         IfO8LgUmy1VVqWmLELP/j3y3XVa2naVVPNsNQ96hxF0svLgz0OLzZx0e2siUWmFSq4q+
         Tn+A6ue7ewtSDKRcht1F2kspK+CEPYWtS8OV7TikZLzJfRvJS06BTA9q41Lkt7XedvQX
         mxquRKynbfG85pn/eQTCoiBpmlFymtX6atBXji3JeN3QlKrDgrn2GTY8sCN1Ay9XgVql
         LVmMlX8AjH5QRzMA+fcR5GP2KYJFgTgX7cuxIvbbybuDBcIJ0gXdXPA/2WUoEszeuEKb
         0JdQ==
X-Gm-Message-State: AO0yUKWpmOiQz6yvIM9qRTUxUDz4WJ/Q1FDWpjFWqMS0YuqAhV4z8pf5
        sVJUHdUZewz7irQzEok2vgI5JA==
X-Google-Smtp-Source: AK7set+P5Qsjy+bJ2C6UZmPBrB4csJQNKJ1rqzqHKr+OxDKpuxEpM/cydCUmeaFykhooVHcho7Ajmw==
X-Received: by 2002:adf:f3c3:0:b0:2bf:bc0a:361d with SMTP id g3-20020adff3c3000000b002bfbc0a361dmr14130078wrp.31.1674990417759;
        Sun, 29 Jan 2023 03:06:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d50c6000000b002bfc24e1c55sm8906842wrt.78.2023.01.29.03.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 03:06:57 -0800 (PST)
Message-ID: <b3712d74-2276-b7ba-4145-4d9a6d5f3a34@linaro.org>
Date:   Sun, 29 Jan 2023 12:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] CP2112 Devicetree Support
Content-Language: en-US
To:     Danny Kaehn <kaehndan@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
References: <20230128202622.12676-1-kaehndan@gmail.com>
 <20230128202622.12676-5-kaehndan@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128202622.12676-5-kaehndan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 28/01/2023 21:26, Danny Kaehn wrote:
> Bind i2c and gpio interfaces to subnodes with names
> "i2c" and "gpio" if they exist, respectively. This
> allows the gpio and i2c controllers to be described
> in DT as usual.
> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  drivers/hid/hid-cp2112.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
> index 27cadadda7c9..99e8043e1c34 100644
> --- a/drivers/hid/hid-cp2112.c
> +++ b/drivers/hid/hid-cp2112.c
> @@ -1310,6 +1310,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	dev->adap.algo		= &smbus_algorithm;
>  	dev->adap.algo_data	= dev;
>  	dev->adap.dev.parent	= &hdev->dev;
> +	dev->adap.dev.of_node   = of_get_child_by_name(hdev->dev.of_node, "i2c");
>  	snprintf(dev->adap.name, sizeof(dev->adap.name),
>  		 "CP2112 SMBus Bridge on hidraw%d",
>  		 ((struct hidraw *)hdev->hidraw)->minor);
> @@ -1336,6 +1337,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	dev->gc.ngpio			= 8;
>  	dev->gc.can_sleep		= 1;
>  	dev->gc.parent			= &hdev->dev;
> +#if defined(CONFIG_OF_GPIO)

Don't use #if, but IS_ENABLED(). I think it should work here.

> +	dev->gc.of_node			= of_get_child_by_name(hdev->dev.of_node, "gpio");

You leak it now on error paths.

Best regards,
Krzysztof

