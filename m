Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B2E7DAE11
	for <lists+linux-input@lfdr.de>; Sun, 29 Oct 2023 20:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjJ2T4d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Oct 2023 15:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjJ2T4c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Oct 2023 15:56:32 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FD7C0
        for <linux-input@vger.kernel.org>; Sun, 29 Oct 2023 12:56:29 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4083f613272so31648525e9.1
        for <linux-input@vger.kernel.org>; Sun, 29 Oct 2023 12:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698609388; x=1699214188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBjaEDFH2L20pCiIDxvatCP6Y3N/isgm8vU1EI+Cv9k=;
        b=mZMy5FL7v4eWKOG7xM+D1+YMg8qx3cN4t9c2DV7n2W0YFN2jyg7KOJp61ZzyZR6OfG
         XMD15AVBEXELLKSDBYK43x2uZocQOZSswHgFdl2GHPqi0wesU/ZVlzVDYqsg3NEuqrRQ
         Je9PwRlPwcTiuVZKuu3ZQT+eXEVqcir+AFINJxy/+B5K9ANAqqbtTKYu+BVfU7pFo+SA
         lPjs8JD79BqU2Myj0exYjuwVxmMocB98uhkW6WdNCj9AAJ91sHcoG2xa2FWf9DE7q1pK
         6jJhnP4p/BzIlE+iSLPx5G+2jQHZKxVWFxz/WpalKEwnfjesS/Mvg+BaUI0dr4WkHGgE
         +/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698609388; x=1699214188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBjaEDFH2L20pCiIDxvatCP6Y3N/isgm8vU1EI+Cv9k=;
        b=cbat5Q1AxvkoZycZLFi1AgxbQhSNKyp49wabmzd5a1NpjixPnl/xFI1f1wfiHZyZgE
         MQueNzveEB7BaosnCZ0xV60tgPERUTtzepYwrpe6Hz7rQU3TQhbj0nX5bwRNp3ocQkLg
         HPCHt0ERHWcN9H863pCaLjOA/W8oWoV0gWsZ+ORG2x9/spWmksdCn9PTRZbAxlv0Pgda
         HWw5NFySIUppjDK7zp1dpYNmddVuQwj7sLtRKtNymVJhFtKNGTruR4DIXitr9ivhQNX2
         205Oe3KMMXvp5XhChkYS8S06QXyg4GuCBrxtGsujQR78WmqQ5cXpRTP3X25wAPo6Xbgy
         s1GA==
X-Gm-Message-State: AOJu0YyaStjohLA5cIoS6R4W0/Ss5qccYfRVcYb5fCOQc6sVl7dNqxbs
        WQUe5FAERJAqdIdQfpkxO54At25tFRK5/DXpTdGv0w==
X-Google-Smtp-Source: AGHT+IEi1Yyfb3UFTgrRlCELfvUo+XrKxRvz3CPs1ECtt3zmTkP2oaRcalosIGlPQTA3Htg7mSge+Q==
X-Received: by 2002:a05:600c:4f81:b0:401:23fc:1f92 with SMTP id n1-20020a05600c4f8100b0040123fc1f92mr6929891wmq.25.1698609387737;
        Sun, 29 Oct 2023 12:56:27 -0700 (PDT)
Received: from [192.168.1.15] (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c138700b003feea62440bsm7385225wmf.43.2023.10.29.12.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 12:56:27 -0700 (PDT)
Message-ID: <298df163-c4f2-4075-a33f-661276b2e657@linaro.org>
Date:   Sun, 29 Oct 2023 19:56:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] Input: synaptics-rmi4 - f12: use hardcoded values for
 aftermarket touch ICs
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org>
 <20230929-caleb-rmi4-quirks-v1-3-cc3c703f022d@linaro.org>
 <ZTzlChOS0OR95Ykp@localhost>
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <ZTzlChOS0OR95Ykp@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 28/10/2023 11:40, Pavel Machek wrote:
> Hi!
> 
>> Some replacement displays include third-party touch ICs which are
>> devoid of register descriptors. Create a fake data register descriptor
>> for such ICs and provide hardcoded default values.
>>
>> It isn't possible to reliably determine if the touch IC is original or
>> not, so these fallback values are offered as an alternative to the error
>> path when register descriptors aren't available.
>>
>> Signed-off-by: methanal <baclofen@tuta.io>
> 
> I guess we should have full/real name here.

I must disagree [1] [2]. These patches have my SoB and are being sent by
me on behalf of the author, who has no interest in contributing upstream.

[1]:
https://lore.kernel.org/lkml/c1bf62a2-e381-c796-2219-17a578987a76@marcan.st/T/

[2]:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d4563201f33a022fc0353033d9dfeb1606a88330
> 
> Best regards,
> 							Pavel
> 							

-- 
// Caleb (they/them)
