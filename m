Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 388275AE712
	for <lists+linux-input@lfdr.de>; Tue,  6 Sep 2022 14:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbiIFMAh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Sep 2022 08:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbiIFMAe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Sep 2022 08:00:34 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD3E7820C
        for <linux-input@vger.kernel.org>; Tue,  6 Sep 2022 05:00:33 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id bz13so11679151wrb.2
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 05:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=d+tzIwr+5ozDfubPv1VTyibMQFtNJExwnc7cUUpEjik=;
        b=hOWuM85MmSUv2LLk9b405FJAeRCmXoylW9F29cEKOW84Q9xn4wW0Eo0T7ULpkXP70i
         ngGLGQ+IrwTUSd8dhx+2+o+fEr2QQAOGP3qSIc1u4Jp14HZ84voFCtY0jzhUhELTGb0y
         4NucU2AjRUVuNeZxEJ2djRLT47NLygqXfgV9dxotT7N31RTMOndRiygSNe6G8qZ5j259
         0O8W6v9KY8uwcyY4sorNj7B11Id/hH80dGg93ryibqsmj5z0HvFlXi62fFh1/y4rliVS
         ZJZjDWSPgFI0aBKQJHYsDiEynnac8HggQgD8Uy1oONPPo68jmEjDOWFZxLKxYADsSr2Z
         uXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=d+tzIwr+5ozDfubPv1VTyibMQFtNJExwnc7cUUpEjik=;
        b=l6B0yrGr3Gk2OAEPCFx5ZKyjENlI8Uyt/x7j+QolPmegphpccXkA9lS6p9/s9OXccy
         RWjj1xkSvh/5bbTmiAWN5795ts1PR2Vp/8avwzHIraVP9XY8idrilRW+q32j3B8rjqfk
         NBfYwC9OM0iLYxYD34voCf81RyY+DwKXmCOvXW7QHKlTfdI+nQMQ2MsLMoAz/eQa4jHl
         2PCqBRMf/sBqb9THFddkrcTVm+iDlqvM0pXWRTN9tnEq0CdQhttly1FhGZHPaZ7GMlvZ
         j4H1SqBa5FbDmSASvhyujAt5FR5UjkoSolMgAadhKm6rc2F6oXgZ4iCM4xByQ6SxB/1A
         +5MQ==
X-Gm-Message-State: ACgBeo2XlgErij6ClFquhGK6J/wgW0Y3IuLosHxDs+dBhq7JA/yJjIyC
        nFescOeJNA+myEJkuZ53tnzidZ65AnSGhA==
X-Google-Smtp-Source: AA6agR5o5glDTAL8TxKxnciSUDncogkT3kpleTpQqR6QL8AuCHSYn9h5yVO2qHv8Vk2KrmEBgALnaQ==
X-Received: by 2002:a5d:6109:0:b0:228:62cf:86d4 with SMTP id v9-20020a5d6109000000b0022862cf86d4mr7596520wrt.552.1662465631720;
        Tue, 06 Sep 2022 05:00:31 -0700 (PDT)
Received: from ?IPV6:2001:9e8:2239:cf00:ee9c:5302:9a6d:9921? ([2001:9e8:2239:cf00:ee9c:5302:9a6d:9921])
        by smtp.googlemail.com with ESMTPSA id bg15-20020a05600c3c8f00b003a4f08495b7sm23382695wmb.34.2022.09.06.05.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 05:00:31 -0700 (PDT)
Message-ID: <a2d416db-16ce-5d1f-604a-9c194237fc8c@gmail.com>
Date:   Tue, 6 Sep 2022 14:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
From:   Pavel Rojtberg <rojtberg@gmail.com>
Subject: Re: [PATCH v2 0/4] Input: xpad - sync with github fork
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org, hadess@hadess.net
References: <20220818154411.510308-1-rojtberg@gmail.com>
Content-Language: en-US
In-Reply-To: <20220818154411.510308-1-rojtberg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am 18.08.22 um 17:44 schrieb Pavel Rojtberg:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> I maintain the fork of the xpad driver at https://github.com/paroj/xpad.
> This upstreams some changes that have proven to be stable.
> 
> The first patch merely updates the list of supported devices.
> 
> The next two patches improve xbox360w gamepad support.
> I have tested those myself, as I own that device.
> 
> The last patch carries most of the diff and adds support for
> "paddle" buttons found on some Xbox One controllers.
> 
> Compared to v1, this adds the requested tags to the first
> two patches of the series.
> 
> Cameron Gutman (1):
>   Input: xpad - fix wireless 360 controller breaking after suspend
> 
> Christopher Crockett (1):
>   Input: xpad - add support for XBOX One Elite paddles
> 
> Pavel Rojtberg (1):
>   Input: xpad - add supported devices as contributed on github
> 
> Santosh De Massari (1):
>   Input: xpad - Poweroff XBOX360W on mode button long press
> 
>  drivers/input/joystick/xpad.c | 298 +++++++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 236 insertions(+), 62 deletions(-)
> 

Is there anything else to be done for this to get merged?

Greetings, Pavel
