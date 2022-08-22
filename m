Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA9559BA18
	for <lists+linux-input@lfdr.de>; Mon, 22 Aug 2022 09:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbiHVHSn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Aug 2022 03:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbiHVHSn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Aug 2022 03:18:43 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F123DED1
        for <linux-input@vger.kernel.org>; Mon, 22 Aug 2022 00:18:42 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id m21so3968738uab.13
        for <linux-input@vger.kernel.org>; Mon, 22 Aug 2022 00:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=7YCVVdFQuOzA+htvOZeIAOPIGB3CZDNzcDrWzhtiuUw=;
        b=l5nYL87ZqNSgi+T5vCuDcUo9yjL0MnLrGVPE1e04LiSDz/rGdoSZeMHyFyZpGxppW+
         m/+u23ZV5LboyE4RYWg6zDVj/08uLXOj839TZmSsdnHpM/juzQA5JSbjkkX2sJoemBzZ
         Vpe3VOFjVAzDazau9ytFaSiBdZIm2n6Xt0IbyKu6+UMT0s/c1mRqTcir2gyU6euOMXIA
         JARKo6pgreIwBkp1EaAypaO5R6x1NM8o0SYH34tC9oQ/Shx6nThgqPPKBXXmnEop76H+
         m4wgmZG0ZdNQC6KlY2z5q2JcXIn/X7Ua5U9KR2dE6PCaNAifztoHhb2c+AHV1QtKXegE
         45Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=7YCVVdFQuOzA+htvOZeIAOPIGB3CZDNzcDrWzhtiuUw=;
        b=kzROjDTjXwK76p+x/GK0TJ2Jc+5njNEZ+2TY1ZfFYXu9wv5QlLUjpl9MT5o04YKSMa
         bMnSMp/2uyxelkFs7KwH6PwgUMxepKhL26CAbyM2Tpn1N2k86H/Uj7ElmBhu40Om6cwT
         0f++efn0YSU37GeoGHMsOQQwD6WNJp7wEPqpjCu6ycwAzFhqZBKp1MUiMkq+OatqDKUj
         WeFtruGw7sqmIqHwLEiYA5RWSMTa1u3mgKBmrFfTY9DBO1u8bbAD9MJgy8UoQdREVloh
         sFpV2gdymfzNT3wLIuYRMsu4XHHvWfx+Gxkb/3gJRTLJRmHHgINb4evxHvQszCMAiqv7
         mfog==
X-Gm-Message-State: ACgBeo3TMA/zAGcGc3Xeer2KRBc1L4WBL+Tn+jKmYRRaZuWC3H7OMwFy
        gXsUPGKL+1lSJd+snUdD3KHXUqkqy+0UkQj2bBGAUGow
X-Google-Smtp-Source: AA6agR7FsC8duYLtyhteu4dUCOuoMrQ8KG1ygT1H58Vw2Zan/cMn6i5az5FzrCnFJvmhDi2UYfv3p4q3GAGpZusplJY=
X-Received: by 2002:ab0:a99:0:b0:39d:de9a:3d58 with SMTP id
 d25-20020ab00a99000000b0039dde9a3d58mr4693183uak.36.1661152721155; Mon, 22
 Aug 2022 00:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220612225437.3628788-1-pbrobinson@gmail.com>
In-Reply-To: <20220612225437.3628788-1-pbrobinson@gmail.com>
From:   Peter Robinson <pbrobinson@gmail.com>
Date:   Mon, 22 Aug 2022 08:18:30 +0100
Message-ID: <CALeDE9NnaxOhcYrdamzJ1ORKMyxCPDN9T-0-ruSB0x1RxDY2eg@mail.gmail.com>
Subject: Re: [PATCH] input: misc: rk805-pwrkey: Fix module autoloading
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joseph Chen <chenjh@rock-chips.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Any chance someone could review and pick this up please?

Peter

On Sun, Jun 12, 2022 at 11:54 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> Add the module alias so the rk805-pwrkey driver will
> autoload when built as a module.
>
> Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/input/misc/rk805-pwrkey.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/misc/rk805-pwrkey.c b/drivers/input/misc/rk805-pwrkey.c
> index 3fb64dbda1a2..76873aa005b4 100644
> --- a/drivers/input/misc/rk805-pwrkey.c
> +++ b/drivers/input/misc/rk805-pwrkey.c
> @@ -98,6 +98,7 @@ static struct platform_driver rk805_pwrkey_driver = {
>  };
>  module_platform_driver(rk805_pwrkey_driver);
>
> +MODULE_ALIAS("platform:rk805-pwrkey");
>  MODULE_AUTHOR("Joseph Chen <chenjh@rock-chips.com>");
>  MODULE_DESCRIPTION("RK805 PMIC Power Key driver");
>  MODULE_LICENSE("GPL");
> --
> 2.36.1
>
