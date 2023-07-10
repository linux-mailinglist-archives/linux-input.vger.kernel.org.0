Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C0274D083
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 10:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbjGJIqc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 04:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbjGJIqK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 04:46:10 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D7F173A
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 01:45:23 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9928abc11deso540746366b.1
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688978722; x=1691570722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J1kpkmX0sgE6nFdKUaA4dAqhfduRWU6fjDfbf+EuPWc=;
        b=phx5kx0qEkacp0UDLoCo0Drikd63crzZ4r+03TyajRfMLouu/oBHo/fspWLY8AVzn2
         MQ2XelLwCq1VMWsJxeNbeFW6zgscT3sXsQGVCUyv+6QgE06oH0l+UR6aOpof1T8QcjMj
         cZ2Z2ebpjIlFRjF+Kn06mM0/6ursQbsnzJ2b2HBXFWwtWf6SNoiITCQR2d0DhsSMDLUs
         9/hwhkum6Apo0ZOSdfqLYjaUiUc8qrDgKF1e3+h/XuK4WbgOR0GxZf5Dn8dVoCqIhVQj
         cymwwCh3ri14snQP5rVDkNBpsjc/MeFAoHLYVIAwHbR29IBxtVjJh3//0lsHNTG0HpoS
         gLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688978722; x=1691570722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1kpkmX0sgE6nFdKUaA4dAqhfduRWU6fjDfbf+EuPWc=;
        b=CoYM4VituZV68hLB9z0lZQqZU3MuV3NG7cNsq89WC/cKaiN8BCHdoqRzMeci1j+BFD
         jIjEIFTubW6OnQ5fAYX1KFk96ibj5faCA3m+PJLF3Zu+I8fqvamzkvAAk6mVhodElT6o
         oGHISriLlW/QIVNTm7YP4AVkRbhS9Scy3QBeo1tOn9QDXUcFYLXeXH6OYcJWkP4HMHJb
         3U7UyRyQ05v8JeEMYQHSQoHUJIC5Ftw0husuekhl8sicl3ZLOm6RRki5ITU2/gafLNwn
         P02ZGysu3FA4Jv2jxugX5NUjjpt1NOtQ6Zk8gbO5TqILIeX6LTO+eOK3ZeyJrnWJx0JQ
         x6Eg==
X-Gm-Message-State: ABy/qLYcxCT+LSrccSds+iKnWj8oYC2M7XseYuEu5VbzxZshd8HCn85p
        oTR7aR6pnhTJbCWaYTVB5uv96Q==
X-Google-Smtp-Source: APBJJlEQa5HQMECel3uzVaxsDwQDsueU6mAxaUxGsraPRC8Bd51Gf8ISI7ENvBW5vO032jU1MO5uYA==
X-Received: by 2002:a17:907:3112:b0:94a:9f9a:b3c4 with SMTP id wl18-20020a170907311200b0094a9f9ab3c4mr10887457ejb.49.1688978721886;
        Mon, 10 Jul 2023 01:45:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id rh16-20020a17090720f000b00988be3c1d87sm5797766ejb.116.2023.07.10.01.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 01:45:21 -0700 (PDT)
Message-ID: <a77cdc48-632e-3d32-2f83-45f996757f06@linaro.org>
Date:   Mon, 10 Jul 2023 10:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/4] dt-bindings: input: iqs7222: Add properties for
 Azoteq IQS7222D
Content-Language: en-US
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <ZKrotyhz7eueujys@nixie71> <ZKrpOdp+rM8gDekw@nixie71>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZKrpOdp+rM8gDekw@nixie71>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 09/07/2023 19:07, Jeff LaBundy wrote:
> Extend the common binding to include a new variant of the silicon,
> which effectively replaces a pair of slider nodes with a trackpad
> node comprising the same or similar properties.
> 
> As part of this change, the if/then/else schema have been updated
> to identify properties that are not supported by the new device.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

