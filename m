Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B65965BE34F
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 12:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiITKeU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 06:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbiITKdy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 06:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184E272FF6
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663669954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m2Z85nnT6jRG76duZBvmb+k2OKXeIArfGfFllZ9EDFg=;
        b=BD1Yi6ECSA+mtLvranKqjaZpIfXaY2L1NETy2PX6n6PXFYI7IW0aihbuT9mngH47NIRTJo
        5rQuxBfSjbkmKDHBjaUcdeDt0leCC99q0y9Wpgx3+2XoCZp3Y4ZLvfJlBCnW1+k/knVl4d
        c6KKcf6IevjLwTfBcqbvhS1cg/phDvM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-b3kitqq8OnOUz1oupdH4Mw-1; Tue, 20 Sep 2022 06:32:32 -0400
X-MC-Unique: b3kitqq8OnOUz1oupdH4Mw-1
Received: by mail-pg1-f197.google.com with SMTP id s68-20020a632c47000000b00434e0e75076so1387861pgs.7
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 03:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=m2Z85nnT6jRG76duZBvmb+k2OKXeIArfGfFllZ9EDFg=;
        b=CeutTdVbSXsmtsU8seiCn7k4roUhdR3w1bth72Ip/gAWetO7iRWs/QqR0ks/dQ7X7i
         znnKz/0sl2PbDm0q5+1usHm3keI3tfkdmeZeATGnlobRCbS5aMBv3vJDe3VlddN/29A+
         IaAcusf/X/nGIJunoAOkzVD13tgkxnxZr9fknH857Mu626ZoKTJOUvid7yNIigJrqF6F
         Em0U00E92srg4SdmoUcNox+f35dbnOwRPdLUjErzeIkzw6K1ZzLgK2t4LcX0t0kh4U1U
         ATh72kIcjbzvkOs8RcJxa2/OJ+BC9AkzVor65eAJoLra5EPsL4lQdONepk84JqbW0rnb
         ve0w==
X-Gm-Message-State: ACrzQf3KChKAc84Dl2Pl5eVqh82wRiX/hUeaqp5CWyysdPeMFEtueh/R
        Q4kE7haDkScbqijlLO/oJI5B22vixLA7dD7eHNwWVA+bS45cuDBJ5q70QVQu8Jg7hFapytgki0l
        +Ons75N8Wl4jbnm40M9Kq2hhXnaJ6XqRsJyusxa8=
X-Received: by 2002:a17:903:3014:b0:176:e498:2340 with SMTP id o20-20020a170903301400b00176e4982340mr4279285pla.119.1663669951557;
        Tue, 20 Sep 2022 03:32:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4m8Wf54Zgy/KmdFCfQYUJKcwWsCKi4SuHoMqFIizDtokQ4+qG2a2Sed0PH/05+DIZJC7b1OMgoIfbU4tVfn30=
X-Received: by 2002:a17:903:3014:b0:176:e498:2340 with SMTP id
 o20-20020a170903301400b00176e4982340mr4279261pla.119.1663669951231; Tue, 20
 Sep 2022 03:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220904154515.25143-1-dengshaomin@cdjrlc.com>
In-Reply-To: <20220904154515.25143-1-dengshaomin@cdjrlc.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Sep 2022 12:32:20 +0200
Message-ID: <CAO-hwJ+hP8ab63OXEi95VP+A9iJR2X4Bu9vwouAzqWFTqVqFEQ@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: Fix double word in comments
To:     Shaomin Deng <dengshaomin@cdjrlc.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Sep 4, 2022 at 5:46 PM Shaomin Deng <dengshaomin@cdjrlc.com> wrote:
>
> Remove the repeated word "not" in comments.
>
> Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
> ---

Applied, thanks.

Cheers,
Benjamin

>  drivers/hid/hid-sony.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index 60ec2b29d54d..03691cdcfb8e 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -368,7 +368,7 @@ static const unsigned int buzz_keymap[] = {
>  };
>
>  /* The Navigation controller is a partial DS3 and uses the same HID report
> - * and hence the same keymap indices, however not not all axes/buttons
> + * and hence the same keymap indices, however not all axes/buttons
>   * are physically present. We use the same axis and button mapping as
>   * the DS3, which uses the Linux gamepad spec.
>   */
> --
> 2.35.1
>

