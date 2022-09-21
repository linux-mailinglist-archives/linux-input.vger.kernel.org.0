Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CD25E5654
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 00:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiIUWrb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 18:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiIUWra (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 18:47:30 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AE0A3D68
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 15:47:29 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id c198so7409109pfc.13
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 15:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Pcz11eFkt/h96/nw5hJxf7tj0D0x+KriuJN35XYTOp0=;
        b=csbDz7St4xkyORu52cCAXjgJ5XAWBnf5zp0+0TX21mnv1wLDAnK4kphuq7KkJ4gevm
         LDqXZBjj/vNMEHSu9J7+BowN9gRk/e94j6cyOq4Q6WYQpN0D+4vmTEqwBMsQ6UQwlLWm
         prly4XDdPox3ZSLy6l7msiP87U4skbj1GmJejTc/hTM1KpLhchkIT6hhiMibQJLdYU9S
         DbDHvBsO60Bgt7S6xvTAtpncJ1lF0lguflyVeaTp66lFZvcMDfK4boxOtwmGgKvASb8a
         cSZ9L1Z24a6TDDdnIHlWSASMGjL/B1yl464nuC2t1eQJUG4EYJ3v5q/i+hZ76Z0gM+rL
         W4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Pcz11eFkt/h96/nw5hJxf7tj0D0x+KriuJN35XYTOp0=;
        b=OXmPECMlRCMaqBxDiKxgb0DSocpfAn+PD+Quk8uHEttKhQT79Vw7yM5DJIfE9+ONax
         VVlD4g1VQf5sPLOOFieBxNNgn9Zs8cW+h1XEwrcw6GzV+mXGvug/edJ6UDGeQoAL2Szi
         NTvvjNdBhSFbF+lY0lU1nErRapNZkdKzcABMP+0kRoI+u3aE8gIestAV0Q8dIm3ptzul
         rIdqlNoybU16Jc6quYJHfX/Nze37aJW4AS9GzJukD2RXHRElZ3MZ/GaherO6gPCK261E
         84kBYljJ+AMph3jLDLNWjOVJtAkptGgqoA7S8aNkajLTWIsRqaw1igALdZCtPU3AfU5p
         Ha0Q==
X-Gm-Message-State: ACrzQf2hkdPRmFl+R9wCxL1VGVA7jenTFzyNPD/3OH6Qu+HzFH89dWiU
        UK8rR+oYEAFbMWhtvhLVrNQ=
X-Google-Smtp-Source: AMsMyM7cT40XNh4IIf+W9oCa07CwzjrGka0zhDbk7z/1KM/0auR8F07YFAcW7WCNRbH1NRYkqti/gA==
X-Received: by 2002:a62:3347:0:b0:53d:f935:9f01 with SMTP id z68-20020a623347000000b0053df9359f01mr511013pfz.8.1663800449048;
        Wed, 21 Sep 2022 15:47:29 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:24df:bb59:8f79:12a6])
        by smtp.gmail.com with ESMTPSA id y72-20020a62ce4b000000b00540c8ed61ddsm2656886pfg.150.2022.09.21.15.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 15:47:28 -0700 (PDT)
Date:   Wed, 21 Sep 2022 15:47:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Li Zhong <floridsleeves@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v1] touchscreen/88pm860x-ts: check the pm860x_set_bits
 return value
Message-ID: <YyuUfZ7sDlwuvZsk@google.com>
References: <20220921203706.1635298-1-floridsleeves@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921203706.1635298-1-floridsleeves@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Sep 21, 2022 at 01:37:06PM -0700, Li Zhong wrote:
> pm860x_touch_close() got the return value of pm860x_set_bits() but
> didn't check it. However, pm860x_set_bits() could fail when writing the
> reg map fails.

Under what conditions would the write fail?

> Since pm860x_touch_close() cannot return an error value,
> we retry the bit setting in the error handling.

What guarantees that the repeated write will not fail again? What is the
failure mode if write does not succeed?


> 
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>  drivers/input/touchscreen/88pm860x-ts.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/88pm860x-ts.c b/drivers/input/touchscreen/88pm860x-ts.c
> index 81a3ea4b9a3d..043520d1ff26 100644
> --- a/drivers/input/touchscreen/88pm860x-ts.c
> +++ b/drivers/input/touchscreen/88pm860x-ts.c
> @@ -106,10 +106,13 @@ static void pm860x_touch_close(struct input_dev *dev)
>  {
>  	struct pm860x_touch *touch = input_get_drvdata(dev);
>  	int data;
> +	int ret;
>  
>  	data = MEAS_PD_EN | MEAS_TSIX_EN | MEAS_TSIY_EN
>  		| MEAS_TSIZ1_EN | MEAS_TSIZ2_EN;
> -	pm860x_set_bits(touch->i2c, MEAS_EN3, data, 0);
> +	ret = pm860x_set_bits(touch->i2c, MEAS_EN3, data, 0);
> +	if (ret < 0)
> +		pm860x_set_bits(touch->i2c, MEAS_EN3, data, 0);
>  }
>  
>  #ifdef CONFIG_OF
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
