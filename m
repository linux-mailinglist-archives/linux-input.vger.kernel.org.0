Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 238025F97BF
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 07:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiJJF3c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 01:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiJJF3c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 01:29:32 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9C750725
        for <linux-input@vger.kernel.org>; Sun,  9 Oct 2022 22:29:31 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id x6so9416278pll.11
        for <linux-input@vger.kernel.org>; Sun, 09 Oct 2022 22:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rexsDu72mKCMkEsW4GYF9e108nkCN14G2NLwe2ZDaTE=;
        b=aDUCf2GzeEDDsoVZMhz9i0KlVuL5VYNjxamxQHM68HZyfJqP3N8Toz36o6RGoD+FnU
         K4koysG8HIWl0Pwb94CKuWZPVWSneuZSr6wJguQyleATKebh/pfuEKdlKtdCPvWfTwJ0
         oPzge1pbyKwNn2vSc1KaLE2y0z6NWNMUhPUApGJfpWTbSGwoasUdEuoexXsZ7TvAfnta
         KOiO30NP8Yu/BLcwULSb1MtVLjafP3LopvVzM+fQMcMzEnoWU2gctRbSGX6QJbe1Uau5
         sUH9PwObj55HTy0nc4/9vwH/LOl7gw2mCs1moqUD7f4VdwcHHye7kQL86u+renwVoS9q
         DTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rexsDu72mKCMkEsW4GYF9e108nkCN14G2NLwe2ZDaTE=;
        b=D58m9t3TeUR1zzBtQmgTzdjp6fxIyP+y7Hx5ztvTx+hFbidox9TUVZKkkPLSBhNdwq
         NBYQ+imcwCg+17sks2KLdlCiuVG0SfKXKDeBfaW74nqMo5UY76GoRR6Bfm7/33jrpJ6v
         suybgU5pASh8zf2uq5+Z9n19ETV9ydl7roMrlRCDxlW+YoJ9w+6zMUgYmkFU+7W9dbtC
         oZK1PVXIpuzRWk+ukJBMxl8Dl7AzbDOZfS42w12hGXyMFIqbSvZbT+Pf8SW/DC3HqmNR
         OuLWUWDq3af3Vf9TyYy9LkArPATnTDxQe8Xwh+6tep4rr6/4AHCdpos6m0szFugdcN2X
         tU7A==
X-Gm-Message-State: ACrzQf2gsykRg5YTbjf7AgO0o3uz7FkqzEkv90eM6t4MIJDwVUtrLsO8
        78OIeBlnhLxpsK/+ExCbJKDO/C0Wni4=
X-Google-Smtp-Source: AMsMyM7fj677FclFazpG5uCrnDl/5hkMnV9MBAm3C66Lsc/XYHQvle4AJ1AW66pYO5i2aCruszeL/g==
X-Received: by 2002:a17:902:f707:b0:179:daf6:87bc with SMTP id h7-20020a170902f70700b00179daf687bcmr17474603plo.27.1665379759557;
        Sun, 09 Oct 2022 22:29:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1bd8:541a:735e:92d5])
        by smtp.gmail.com with ESMTPSA id u21-20020a627915000000b0053e468a78a8sm5929037pfc.158.2022.10.09.22.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 22:29:18 -0700 (PDT)
Date:   Sun, 9 Oct 2022 22:29:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-input@vger.kernel.org, samuel@sholland.org
Subject: Re: [PATCH -next] Input: pinephone-keyboard - fix error return code
 in ppkb_probe()
Message-ID: <Y0Otqy4LuTcAPqQQ@google.com>
References: <20221009025459.38193-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009025459.38193-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yang,

On Sun, Oct 09, 2022 at 10:54:59AM +0800, Yang Yingliang wrote:
> Fix error return code when devm_request_threaded_irq() fails in ppkb_probe().

Thank you very much for letting me know of this issue.

> 
> Fixes: 0f8ef9709408 ("Input: pinephone-keyboard - add PinePhone keyboard driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/input/keyboard/pinephone-keyboard.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/pinephone-keyboard.c b/drivers/input/keyboard/pinephone-keyboard.c
> index c1b291428f36..06ff614dbb88 100644
> --- a/drivers/input/keyboard/pinephone-keyboard.c
> +++ b/drivers/input/keyboard/pinephone-keyboard.c
> @@ -440,8 +440,8 @@ static int ppkb_probe(struct i2c_client *client)
>  	ret = devm_request_threaded_irq(dev, client->irq, NULL, ppkb_irq_thread,
>  					IRQF_ONESHOT, client->name, client);
>  	if (ret) {
> -		dev_err(dev, "Failed to request IRQ: %d\n", error);
> -		return error;
> +		dev_err(dev, "Failed to request IRQ: %d\n", ret);
> +		return ret;

The intent was to use the "error" variable, so instead I changed the
assignment and the test and rolled the fix into the original commit.

Thank you.

-- 
Dmitry
