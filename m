Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302E5598492
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 15:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237404AbiHRNqf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 09:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233053AbiHRNqd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 09:46:33 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90748B56D0
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:46:32 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id u14so1788988wrq.9
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ze1/HtRLDdnYY+V4D6+yRyatJ2d6Hl6cPlIzGM/A2NY=;
        b=lyRMplAoK6kHhSVhwYYiYrfDPtaqyBWhjR6Yub+e74//24VXKZ5SWESIrWjTLAJidQ
         TFynPnBriCd8fCNDq2ms9wNG1oJg1N7tuzn9wPGwaaQF0N3Z/MIGcYEsmONzmeOLxLVC
         UsuZ5+/m6gW2+KgGAuAjX1NaDXeY7M6PgybAHjdqui/Al4PVMJVIvmbVEaOZ0k4Y1Xuo
         MhXVhBSHAshE1pJqDLE9Y6mHVB3IT9O7eKRqjMx/BHArrKGMwwu+xAU+JtFEA+TlY7zK
         BG6boSjmTqxpzFnyC0SqyKXkfGr7vrGFgoguDkItZWi85eS2gVOHqOb6LGfeJXlR8a38
         ugDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ze1/HtRLDdnYY+V4D6+yRyatJ2d6Hl6cPlIzGM/A2NY=;
        b=LRmeicqrPGrAczaqyaKAbYPKEZoUrhqP4D48OecxVcL5rgWkZlzjhSOn6p+23KAp7/
         HR03BwdMqt2Y4+2CPYJvL7KtuQzmx9CUXtCASf12Dtid2+lCox/DccwcPSwmJdAG04qG
         AqBe9Dc4FNfQdx2rfQQEcodWsJU6NmCaEOnh/fNVrsZQdOjcGLl0W8c1sSXohJolGZdi
         +EhStSw6CTPH1EQ7D7vwm/xHoAnMPfJVDgUFDwHKWbCiiMSP+9/xdg2+ujermnkdg+E3
         Ule7z58X4p5nyczJiFk3TWVFU5yprCauAmOEH5hJdWxxUNCufg3EUaJzkTT5fjopKaXv
         cvvQ==
X-Gm-Message-State: ACgBeo1Tr7lGCXkuK+7cJN0DS3MfrEJo/6CTzPx0hrn7YHidiLLgALYv
        n0ZKhNvidwaVGBFNImF+5oOgfnS+vAprOw==
X-Google-Smtp-Source: AA6agR4zynHq+EeJ578JxAWQOlmo0UneJa6V9C/7U1D7By+ln5KB3xqoEmOGZiX6KQA0C3HjFyHpHw==
X-Received: by 2002:a5d:43c2:0:b0:225:2d8a:ad25 with SMTP id v2-20020a5d43c2000000b002252d8aad25mr1685147wrr.208.1660830390926;
        Thu, 18 Aug 2022 06:46:30 -0700 (PDT)
Received: from ?IPV6:2001:9e8:220d:e00:f78b:3e64:f8af:69ef? ([2001:9e8:220d:e00:f78b:3e64:f8af:69ef])
        by smtp.googlemail.com with ESMTPSA id k13-20020a7bc30d000000b003a5c75bd36fsm5558109wmj.10.2022.08.18.06.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 06:46:30 -0700 (PDT)
Message-ID: <c174669d-8dbe-7849-59af-595f4a16288d@gmail.com>
Date:   Thu, 18 Aug 2022 15:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 1/4] Input: xpad - add supported devices as contributed on
 github
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Jasper Poppe <jgpoppe@gmail.com>,
        Jeremy Palmer <jpalmer@linz.govt.nz>,
        Ruineka <ruinairas1992@gmail.com>,
        Cleber de Mattos Casali <clebercasali@gmail.com>,
        Kyle Gospodnetich <me@kylegospodneti.ch>
References: <20220818130021.487410-1-rojtberg@gmail.com>
 <20220818130021.487410-2-rojtberg@gmail.com> <Yv46RSWwQDaHqE6f@kroah.com>
Content-Language: en-US
From:   Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <Yv46RSWwQDaHqE6f@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am 18.08.22 um 15:10 schrieb Greg KH:
> On Thu, Aug 18, 2022 at 03:00:18PM +0200, Pavel Rojtberg wrote:
>> From: Pavel Rojtberg <rojtberg@gmail.com>
>>
>> This is based on multiple commits at https://github.com/paroj/xpad
>>
>> Signed-off-by: Jasper Poppe <jgpoppe@gmail.com>
>> Signed-off-by: Jeremy Palmer <jpalmer@linz.govt.nz>
>> Signed-off-by: Ruineka <ruinairas1992@gmail.com>
>> Signed-off-by: Cleber de Mattos Casali <clebercasali@gmail.com>
>> Signed-off-by: Kyle Gospodnetich <me@kylegospodneti.ch>
>> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> 
> Why not just submit the individual commits?
> 
> Also, should this be backported to stable kernels?
> 
> thanks,
> 
> greg k-h

I thought it would be easier to review them in bulk instead of many one-line patches.
Nevertheless, I lost the individual commits while rebasing and it would be
a PITA to reconstruct them from github.
I will keep this mind for the next patch series though.

The changes are safe for backporting.

Greetings, Pavel
