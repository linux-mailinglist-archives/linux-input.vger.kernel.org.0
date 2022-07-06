Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6236567E93
	for <lists+linux-input@lfdr.de>; Wed,  6 Jul 2022 08:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiGFGbV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jul 2022 02:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbiGFGbB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jul 2022 02:31:01 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568C5E0BD
        for <linux-input@vger.kernel.org>; Tue,  5 Jul 2022 23:30:57 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id n15so17174458ljg.8
        for <linux-input@vger.kernel.org>; Tue, 05 Jul 2022 23:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I6o/YlbjToGBAtWpsBGYvp0rLy5iXVzmK9kFUlPWtuY=;
        b=f5sBq/5A0nSM0M4UiYJkmFh/flv8uhP9sTRCJstifBuKCIfO1evf0ym8Z9Ef3E2zjJ
         fLdMA9M6Vtr0O3KfSZCMW6QE6RptCm8eoTT2taLF6096rETzXtTmeBAeVFZcWp3nUSQ7
         UBYVOQoQ7Y1qd+ET8RYlHnDHqI+0qVHPMbEfiDhGmyDznvwXRZ0CwMemNxEDPtt/8HXb
         Q82SihlUqh06Tq7vPIXWjqvoeSJ1JmnUbaEtevNuvIDNSVPl+k8q04xxsmGGiOxheY3w
         T+2Wn6jO/ieu/KVEgNYE6/Dg4lUlyOer5tvT3M+kw3zXumePDEDwt2kbO8AxDg0SyecD
         MBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I6o/YlbjToGBAtWpsBGYvp0rLy5iXVzmK9kFUlPWtuY=;
        b=b/A7lJVQV0ppQaAAmPTYx1GlJP2xPJjj9JQ1JJiXXHbFgxl0co1xjhA55rIBRmM49B
         5T+YuM1s5CRVsD8yn71UJtXCVLl2p+1k9wsPvqM1jfTof96wPC2CtovKdf7z46+rzt1J
         ZFrQWuShAyrsko6g4haYCF1df5lMMlezSpSfJmo6owJZyvbutvCrFRSzshxJ50ntIC7f
         AR63IY94u7FZc5u+oa5ug/Z/pmFrGejyu+tHKw3H1emxllP1f7uQHWgFZWd7iTTGhQOV
         GW77JZ0lJrqR4HgXBclHKRmTEuFKszvQHgWWvp9TEQKbtwiS4RYOYGTj1BFYc+O/S9Rr
         bXqQ==
X-Gm-Message-State: AJIora9lbXy4LyxEEpDGtVA0PI1fa+nGC9rb8T6olpbYu4QVJVdWVqAa
        3Exv5ar5KFD37I58x6me1oIzTw==
X-Google-Smtp-Source: AGRyM1vqg2HBwYFkQlr4LhHUUGHWKenUFIl5uciP+Qpy+CLa7wGOsduBv0nrZ7LuPdR32ofsXw52ng==
X-Received: by 2002:a2e:1547:0:b0:25b:ca26:c30e with SMTP id 7-20020a2e1547000000b0025bca26c30emr22078232ljv.329.1657089055625;
        Tue, 05 Jul 2022 23:30:55 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a24-20020a2e88d8000000b0025c05ce1bdasm3069266ljk.49.2022.07.05.23.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 23:30:55 -0700 (PDT)
Message-ID: <352f27e7-0da1-4a4a-83a4-ded370dfbd7f@linaro.org>
Date:   Wed, 6 Jul 2022 08:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND PATCH v3 0/3] dt-bindings: input: gpio-keys: apply via DT
 tree
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220705120356.94876-1-krzysztof.kozlowski@linaro.org>
 <CAL_Jsq+LepF_67SJUqQ5mUO-TZAd-46LB+aYE5rZmnmmwMg=bw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_Jsq+LepF_67SJUqQ5mUO-TZAd-46LB+aYE5rZmnmmwMg=bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 05/07/2022 21:11, Rob Herring wrote:
> On Tue, Jul 5, 2022 at 6:04 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Hi Rob,
>>
>> Can you apply these directly? You already reviewed them, but I dropped
>> the tag so you will see them in Patchwork. It seems these won't go in
>> through input [1].
>>
>> [1] https://lore.kernel.org/all/c2c1cf0c-9462-9ba5-a297-70d13a063de1@linaro.org/
> 
> Will give Dmitry a few more days first before I take both series.

Then let's keep your Rb for entire patchset:

Reviewed-by: Rob Herring <robh@kernel.org>


Best regards,
Krzysztof
