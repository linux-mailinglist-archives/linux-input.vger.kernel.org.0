Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7195E67D397
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 18:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbjAZRyI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Jan 2023 12:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbjAZRyH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Jan 2023 12:54:07 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A86599A5
        for <linux-input@vger.kernel.org>; Thu, 26 Jan 2023 09:54:04 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ud5so7225667ejc.4
        for <linux-input@vger.kernel.org>; Thu, 26 Jan 2023 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tprbwGPjhGXrOs+yXtzbe6lAynkBJ02POiohC8Qq3WQ=;
        b=X1hFwRsM2lS5WJq8Fiz7fSQwhew91espYjfFsyZepnk9Xgtxt5yhJQaiVTdVeG5jyz
         D+26hoDFvH1qR311FBK4CfskRzB2+EYB7Bn70+TOnMm9Zgvo2tJWXBJ3EhYTHw3rqo9N
         dzsSHeatOQP7PiWobEzlkU6eZ+dIUHW25JGtQl2LOutQqzEX5aACZQ3tnH/PUyQ/HVuu
         dKvE8Ml6UPhXPgAGSJeEd3/BZlg3FUqrja5b4CGIVN/Z48e60X/TL5C3Q74FXxbrxKtt
         WhjYCX3Akijl81bogGTS3dhkFqnW4wq85043B2LR10w6N0XltvqzBPgyVG6HW6PnpvCF
         kjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tprbwGPjhGXrOs+yXtzbe6lAynkBJ02POiohC8Qq3WQ=;
        b=40VEQImD36TFl1K0esr1gWMgKpDTJPXofD+y6rCe27i7aRT1czU0FMVqI7McXwQy6f
         h0gLkeS9CW93YqRJ3vPUGjtDhazknIG9o9qFb4e2nX8dLrKhVYDEWLTiwVURy7JtAJa0
         vF/2VCuT+F+YpYdHwCoRi5RtITs3THCGQWgC2nnrO2oi+Ulb7RALwvD+wpvPP2jD+3p1
         PkyJJCwOaIAN/d9TrvzB6bbemCaimgdVjihEoRHtoL3dwNsBLRHYKGeeXJUuK8xCemw/
         aSimgTYBiT3VWK1OAxoD7TzzHjT5jXcfsjjmGt4cypYtcOBiFTBSnD1W7YZd3hKEmlqe
         FvAQ==
X-Gm-Message-State: AFqh2krweaOQvu+N0G9jkDxZkVhEEgOujAtXIKeeiVDuh/pGzDw57NLf
        vasTxq10UtNPbLrO0XeyF85ldhgMOW8=
X-Google-Smtp-Source: AMrXdXvDn6Ek2/HCvBcCIZ5TdxZSMPt3pwLqqPqEAgWLtIY1D+rZVoZB7SkgXNjFpByM+XLq2q8E7w==
X-Received: by 2002:a17:906:8d08:b0:86f:e30c:72c1 with SMTP id rv8-20020a1709068d0800b0086fe30c72c1mr41920288ejc.8.1674755642979;
        Thu, 26 Jan 2023 09:54:02 -0800 (PST)
Received: from [100.65.234.5] ([213.55.221.106])
        by smtp.googlemail.com with ESMTPSA id n5-20020a1709061d0500b0084d420503a3sm903091ejh.178.2023.01.26.09.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 09:54:02 -0800 (PST)
Message-ID: <29dc5667-8e6a-9953-5598-79d39f245f23@gmail.com>
Date:   Thu, 26 Jan 2023 18:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Jeff LaBundy <jeff@labundy.com>
References: <20230125105416.17406-1-hdegoede@redhat.com>
 <20230125105416.17406-3-hdegoede@redhat.com> <Y9IG6zQtGWWwhyLW@nixie71>
 <1b118a84-5758-0045-509f-322bac5b0375@redhat.com>
Content-Language: en-US
From:   Gregor Riepl <onitake@gmail.com>
Subject: Re: [PATCH resend 2/3] Input: silead - Add a settings
 module-parameter
In-Reply-To: <1b118a84-5758-0045-509f-322bac5b0375@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> Having this is actually useful, because users do need to check if
> they actually have a home-button:
> 
> 1. Always setting this may lead to false-positive home button presses
>     on some models (IIRC, this has been around for a long time)
> 
> 2. The home button typical is a windows logo printed on the front of
>     cheap windows tablets below the screen. Recently I was adding info
>     for yet another such cheap tablet and I asked the user to test
>     the home-button since the windows logo was clearly there visually.
>     But on this specific model touching the windows logo does not do
>     anything.

I vaguely remember that some users also reported Android-targeted 
tablets where the surface covering the soft-touch buttons was simply an 
extension of the whole touch surface, and not send any explicit key 
press events.

But I may be mistaken, or it was a bug in an older driver version that 
didn't support touch buttons well.
