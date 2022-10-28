Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 945DB610C10
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 10:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiJ1IQC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 04:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiJ1IQC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 04:16:02 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027D719E031
        for <linux-input@vger.kernel.org>; Fri, 28 Oct 2022 01:16:01 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id c7-20020a05600c0ac700b003c6cad86f38so5883096wmr.2
        for <linux-input@vger.kernel.org>; Fri, 28 Oct 2022 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNUdT0pPy3cOwelmgfn8Li0duY7pG3zcPFGqUcnDR0I=;
        b=cL7qGw+WZ7oIhsoKvAp/fncO/Powx/3R0gYRYrHXfBqCZMARA06h55UJpiBp1VS/M5
         ckkZFgxPpA1zetD0U8Z3+0E3iH/cM4OqfSddJpjlZwTArXB12hDevrLav4PrYt94mdoi
         H2ywL/n6XnQMdOSDC1BH0uvMi5or7vSikzSAjHZ6WYJWrdc1oA19sktR4yGDlphGweFy
         qa7chU3YL1Zmq/bjuHqNXhzdtiWBJpo53xE1JScUdrlh2Y+fChB6MS8ujMh60OCL1Zo9
         NF8h/EfkGO5DT1ZZQHvPR4nmx20JrET8RJgTTEEfcvVYWINDC7x2U4iZYHy9nnoHa5y4
         OJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNUdT0pPy3cOwelmgfn8Li0duY7pG3zcPFGqUcnDR0I=;
        b=HDi2o/wCOmrDttK0Aiz6ovb0llN7BncasDSSCUNT633/nA5/RGgFvCZrQwBpSOo6ql
         T2LTTQg5VQRt4/6QW4Mzfw4pDEpgYGvEcCgjzXuIJ5ojmvMw0CMR2AomGOmuKC9wsqv/
         mgKxKBzs/wJmVgvspwUI/whBnXYv6FIlbNgJE5ZWWnCfLf9gio8udmw4lcV6TS9AXY1g
         K/0+okmmnYlkz2Jj1hceiq7W2ukB+RvqR+6fxGF2McRwM7H2nDhm+YCVkoRYyfKUaSel
         PwrJ4kd/TFRjVPu+xdYGc5FrUZQAAaPuh8trOyalvV80ydSX8YV7sUDTI5ihRV8lewUH
         f6bA==
X-Gm-Message-State: ACrzQf0rUsXstgvVMuqHNjpRIBv1JPwM2TlSZGuvU21KpdMqldGLdmfQ
        SJXxYEjKHHDRM0zwNTuo7kqV1A==
X-Google-Smtp-Source: AMsMyM5OHXihJsfaY0g3uCEzw4Qk3wyZTMnWLQXTWhLkH4yx/A61d//fGaZJsClTjAWBlUuLbuLXPA==
X-Received: by 2002:a05:600c:4f86:b0:3cc:e010:7a7b with SMTP id n6-20020a05600c4f8600b003cce0107a7bmr8699332wmq.114.1666944959478;
        Fri, 28 Oct 2022 01:15:59 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:98b2:dc79:fe90:6dad])
        by smtp.gmail.com with ESMTPSA id bk17-20020a0560001d9100b0022cdb687bf9sm3974247wrb.0.2022.10.28.01.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 01:15:59 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: Re: [PATCH v3 5/7] Input: iqs7222 - protect against undefined
 slider size
In-Reply-To: <Y1SRXEi7XMlncDWk@nixie71>
References: <Y1SRXEi7XMlncDWk@nixie71>
Date:   Fri, 28 Oct 2022 10:15:58 +0200
Message-ID: <87mt9gtlc1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On sam., oct. 22, 2022 at 19:57, Jeff LaBundy <jeff@labundy.com> wrote:

> Select variants of silicon do not define a default slider size, in
> which case the size must be specified in the device tree. If it is
> not, the axis's maximum value is reported as 65535 due to unsigned
> integer overflow.
>
> To solve this problem, move the existing zero-check outside of the
> conditional block that checks whether the property is present.
>
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
> Changes in v3:
>  - None
>
> Changes in v2:
>  - Rebased to account for changes earlier in series
>
>  drivers/input/misc/iqs7222.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> index a5c08b1d9c9b..6af25dfd1d2a 100644
> --- a/drivers/input/misc/iqs7222.c
> +++ b/drivers/input/misc/iqs7222.c
> @@ -2024,7 +2024,7 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
>  
>  	error = fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val);
>  	if (!error) {
> -		if (!val || val > dev_desc->sldr_res) {
> +		if (val > dev_desc->sldr_res) {
>  			dev_err(&client->dev, "Invalid %s size: %u\n",
>  				fwnode_get_name(sldr_node), val);
>  			return -EINVAL;
> @@ -2043,6 +2043,13 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
>  		return error;
>  	}
>  
> +	if (!(reg_offset ? sldr_setup[3]
> +			 : sldr_setup[2] & IQS7222_SLDR_SETUP_2_RES_MASK)) {
> +		dev_err(&client->dev, "Undefined %s size\n",
> +			fwnode_get_name(sldr_node));
> +		return -EINVAL;
> +	}
> +
>  	error = fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val);
>  	if (!error) {
>  		if (val > (reg_offset ? U16_MAX : U8_MAX * 4)) {
> -- 
> 2.34.1
