Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14719508159
	for <lists+linux-input@lfdr.de>; Wed, 20 Apr 2022 08:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350495AbiDTGq6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Apr 2022 02:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350136AbiDTGq5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Apr 2022 02:46:57 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B85E340F9
        for <linux-input@vger.kernel.org>; Tue, 19 Apr 2022 23:44:11 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id i27so1437394ejd.9
        for <linux-input@vger.kernel.org>; Tue, 19 Apr 2022 23:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lCPDSBuRx99bdPRKV0DA2Ne3h3IqfDww706PlGIaKNA=;
        b=z0lTP7wfOWeks/ETyhcRw5d4t0RYRW95K5a58W0vv1OdzYVwprkSSj4qRhtd1X8+RO
         GDGFKUuGiDCvKdxNLuy0EmgiJRSwVQnZ3sTqNGhRnM0eGo28/32FxjkI4B0FHPy514Xx
         bfSyrLqbr0gCItN8MzAx8A8Gkzy1i/4KsTZHL4dr6FsbsuRMCiWgF1A/pX3zzkHZyo9b
         9vCuJgV77ISLFILolXfnWkEZfrkpkGdp89QmBIKgL6F93d70me8/S0YR2s4uxhO3XJUP
         OtDuMoUiA4q+pTGu176qLEfrG41GTxnjptu+9i9Is5mpZRcmqct+yLoQ+YTJ+glfwa6e
         n/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lCPDSBuRx99bdPRKV0DA2Ne3h3IqfDww706PlGIaKNA=;
        b=WhC3MZiVxqYUUsXhNhsuDQVTYjmDhNYwxOXdlChcme54Dahus+/9Vm0QwCwyWC+cPJ
         7SC8RNPmKmWJHI95hFrzcGMEjBkEQVwcrqvCKBY4cjz6uw2WpQH90FYEzU6hI7tWcrvo
         lEjJYeAtogStNOXPl0qEOfV+XwFw93t47TrXM8sdxZYK8sE1y9gJGNsH/v641FPWvosE
         ePRF6hGeYZLJeqKFFb+sdVdOidaXdQThPGMDUhkYXVMorH5xZZrN/2TQOhizwqxiEv2a
         R7MxKKGZvH8A4fkTwfqptpF5mHe5ddcFOrSXfCnjE1SROo1gRsrlq+AsigPlhIi4Onr4
         JAsQ==
X-Gm-Message-State: AOAM53069q2J98n88OvcQmYg4S+7NmlO0ElNnyc1cpUAOyV6XfhxEb5I
        WdvBwtQHchzLC89CqkzTY/TsRw==
X-Google-Smtp-Source: ABdhPJxFja0g1iU3jiCg+96esLZdek4m4gACGDSOQT0b3hykC6q7EHXs4+tTlgNjRoxz9Fb2YDZa9A==
X-Received: by 2002:a17:907:3f18:b0:6e8:9332:542e with SMTP id hq24-20020a1709073f1800b006e89332542emr16595678ejc.633.1650437049620;
        Tue, 19 Apr 2022 23:44:09 -0700 (PDT)
Received: from [192.168.0.222] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u4-20020aa7db84000000b004136c2c357csm9676471edt.70.2022.04.19.23.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 23:44:09 -0700 (PDT)
Message-ID: <3a84fe50-cef5-8da3-65f5-8f939e07753c@linaro.org>
Date:   Wed, 20 Apr 2022 08:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 4/6] dt-bindings: mfd: sensehat: Add Raspberry Pi Sense
 HAT schema
Content-Language: en-US
To:     Charles Mirabile <cmirabil@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     Serge Schneider <serge@raspberrypi.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Nicolas Saenz Julienne <nsaenzju@redhat.com>,
        Mattias Brugger <mbrugger@suse.com>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, fedora-rpi@googlegroups.com,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, Mwesigwa Guma <mguma@redhat.com>,
        Joel Savitz <jsavitz@redhat.com>
References: <20220419205158.28088-1-cmirabil@redhat.com>
 <20220419205158.28088-5-cmirabil@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419205158.28088-5-cmirabil@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19/04/2022 22:51, Charles Mirabile wrote:
> This patch adds the device tree bindings for the Sense HAT
> and each of its children devices in yaml form.
> 
> Co-developed-by: Mwesigwa Guma <mguma@redhat.com>
> Signed-off-by: Mwesigwa Guma <mguma@redhat.com>
> Co-developed-by: Joel Savitz <jsavitz@redhat.com>
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
