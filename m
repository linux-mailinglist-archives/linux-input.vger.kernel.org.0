Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080975984DF
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 15:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245365AbiHRNxk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 09:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245363AbiHRNxU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 09:53:20 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542C46612C
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:53:03 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so2817093wmk.1
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=xyClaffZHxlLfYnqJoC1GV1+gqnuiN38pSCyLIEAFRM=;
        b=FEue8c+sxm4Xzh5foNb7Ol9PUMRhQ2kWeFDUrAw6JhtHP8jqb9dd1Bs3SdFaDAxDM2
         yOGN0yH/uo7WeGtgsFXagofKHMlILlu9c7SWhHd2MM7TjCw1QW3PgJUafyxA50P7x3ut
         hWMyjDQ4YENZEwPe3MQMq8v5A0+iwNG82WjtGUP0s7kXtRRcP4sfWkkIEVxOp8ZpRQHa
         hVvPOgkubUFqq0pfiOVRF/IzL5OBuVXC6rccUCeSrVFCAZE/IQcoHFvU4h1YL2c534tM
         8Uhl+3er6ZsR/GP6Z/4gEv9vbN6K9A97+hcCl9dg6KV1X714f40Ijh4hRguqLHk6LCWz
         8p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=xyClaffZHxlLfYnqJoC1GV1+gqnuiN38pSCyLIEAFRM=;
        b=jD1TcgiYyOOwBdQuTMvNxmEwy1uM+BH7p+z23zABMnut3UniDlqE30DObbix2YZu4B
         URnFfapVX8Sm89BxYrTJZC932S/90o3pF/KkiRyzh4DCvGABLVRpXd3kbh3JaEOdKgtC
         9i+QuLDXkwYPmjpnBlw8UAjk+paE5cgSie6go32pIwpOte0yHq5EfCiGbC6cWWNkPRkd
         RMxEXeeS73XYE3YTxJhayo1j4Rgd84GFz5M83/o+tNVyiYYYXAe7xqPBeMSKCpB9CmK5
         t8YHgloqdehi/FV7tj9RcLIGxK8/tYrqyFyaY+XipGF+XvGl7+Weg/OLiONzTj03wk1g
         dUBA==
X-Gm-Message-State: ACgBeo1zqITWWcw7Zp/a2z5a1MHKtWFKJSUfovGw2sbq2QlfYjFj77df
        0bMZZL9HbYMOKegqkPuJc8Y=
X-Google-Smtp-Source: AA6agR5lAzW42xVbWzg894cEDPVtw/ryM7Jfs97OJR/lIMw6hSJnbBFzjtNHQqYupkNf0BG6VZHRhw==
X-Received: by 2002:a05:600c:35d4:b0:3a6:18ba:1585 with SMTP id r20-20020a05600c35d400b003a618ba1585mr4377619wmq.48.1660830782230;
        Thu, 18 Aug 2022 06:53:02 -0700 (PDT)
Received: from ?IPV6:2001:9e8:220d:e00:f78b:3e64:f8af:69ef? ([2001:9e8:220d:e00:f78b:3e64:f8af:69ef])
        by smtp.googlemail.com with ESMTPSA id g13-20020adfe40d000000b0021f15514e7fsm2219953wrm.0.2022.08.18.06.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 06:53:01 -0700 (PDT)
Message-ID: <081aefd6-9f79-a4ca-920d-7ebb7e5f9030@gmail.com>
Date:   Thu, 18 Aug 2022 15:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 3/4] Input: xpad - Poweroff XBOX360W on mode button long
 press
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Santosh De Massari <s.demassari@gmail.com>
References: <20220818130021.487410-1-rojtberg@gmail.com>
 <20220818130021.487410-4-rojtberg@gmail.com> <Yv46iY/C8RH/+UIe@kroah.com>
From:   Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <Yv46iY/C8RH/+UIe@kroah.com>
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

Am 18.08.22 um 15:11 schrieb Greg KH:
> On Thu, Aug 18, 2022 at 03:00:20PM +0200, Pavel Rojtberg wrote:
>> From: Santosh De Massari <s.demassari@gmail.com>
>>
>> Newer gamepads turn themselves off when the mode button is held down.
>> For XBOX360W gamepads we must do this in the driver.
>>
>> Do not use BIT() macro for consistency within the file.
> 
> You can fix the file up to properly use the BIT() macro :)
> 
> thanks,
> 
> greg k-h

That change should be a separate patch anyway, no?
Can we postpone this to the next patch series?

Greetings, Pavel
