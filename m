Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63236C0AD0
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 07:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjCTGoy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Mar 2023 02:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjCTGov (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Mar 2023 02:44:51 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20DA93C4
        for <linux-input@vger.kernel.org>; Sun, 19 Mar 2023 23:44:49 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id o12so42485010edb.9
        for <linux-input@vger.kernel.org>; Sun, 19 Mar 2023 23:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679294688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XQ/44SVMF6PVhqp8JRzrRSom5gDvmcAC54oohF5Cmg=;
        b=p3NiWSDX9TZ5CVCYBQY8rbhPkoCpYHw7MIyjWaWla8eriloqvYLtG8K1cxQrPbRW9I
         baw5AuwOdaTQyva0gaGzngw86HaWprJ1kgN95PZAghKvk6JsOBvvJTuHl0RnfpWoXHjh
         /UPQBt1zPavYqbtyId1O4qabWywJz3kh9sBZ0Nkw0w3RVxJ86WVmxMiE/yNVvSBqTcWQ
         /0f3lSsxNSoA5fc3owzZbaqwLDdAz+Jq7iYa3HpuHwtbYvJdJY50m6ShP9RFHeSn3D8J
         iCV5F0ENaKoSxi2MwL+x1MBJSrSOKEevWxlGrId5IYETa8CoKwaV22wyJwQipaTzdYo+
         A5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679294688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XQ/44SVMF6PVhqp8JRzrRSom5gDvmcAC54oohF5Cmg=;
        b=eczCvwh1NTDHy1ucpBi/VXbLYi0KqyAC9brzMDXQO+hO1Lu5ZNA2oYOMDivp6LdozS
         VhmqthvIPuBOxuynT8E/0/VHvbiRWbWtwmc2M7/Il4ZRD4u3AgT9sM4ycRs1oKJqFdvF
         1yqgxOSUwgnHEg3tnMMrmBlxrwH2cP9G7zldOpqWxndDmznxNCKjAewJ5WVxTZeVgDnQ
         Qix8wz6fFr9Y67zyDIOw8en5ODrWf7FVTnaHR0alBkRh4RbfNapYWxDQmc9YOzPYIq6X
         M1Sz7QUkozkE0rc3WPb/9iT2hFxHBq5NEX77KvZVNilEfIz8cBGX5mXcYrmWaSNOSCqg
         LKpg==
X-Gm-Message-State: AO0yUKXbQy3zbUncH+tPYAQssGcLkOUB3aw3643dkjJcahzF7b+IZMPM
        8PX0BuJfZQRqvwntL0XLk0xl2g==
X-Google-Smtp-Source: AK7set8L6sR8ICbfNdfbrkqUX/UHpBHvI+yXcfnT0YuZBLUaRpDjfwkShM3G6cxM2tU1Ig03wEdE4w==
X-Received: by 2002:a17:906:57d1:b0:92f:e7e2:b7b3 with SMTP id u17-20020a17090657d100b0092fe7e2b7b3mr9071456ejr.5.1679294688321;
        Sun, 19 Mar 2023 23:44:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992? ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906289700b00922547486f9sm4056539ejd.146.2023.03.19.23.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 23:44:47 -0700 (PDT)
Message-ID: <a7a20a06-5a06-e196-07a5-c5f62fc7c065@linaro.org>
Date:   Mon, 20 Mar 2023 07:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Content-Language: en-US
To:     Danny Kaehn <kaehndan@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com,
        Rob Herring <robh@kernel.org>
References: <20230319204802.1364-1-kaehndan@gmail.com>
 <20230319204802.1364-2-kaehndan@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230319204802.1364-2-kaehndan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19/03/2023 21:48, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

From where did you get it? There was no such tag at v7:
https://lore.kernel.org/all/20230223213147.268-2-kaehndan@gmail.com/
nor at v6:
https://lore.kernel.org/all/20230217184904.1290-2-kaehndan@gmail.com/

???

Best regards,
Krzysztof

