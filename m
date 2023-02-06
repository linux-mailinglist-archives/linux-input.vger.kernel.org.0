Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4947E68C2CF
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 17:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbjBFQRV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 11:17:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbjBFQRT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 11:17:19 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3EA30E5
        for <linux-input@vger.kernel.org>; Mon,  6 Feb 2023 08:17:18 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i5so3724433wrc.0
        for <linux-input@vger.kernel.org>; Mon, 06 Feb 2023 08:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvsQg5hopymKYI6TwCEhKVKDnasl7lVKNyCHsOPnOzQ=;
        b=yolgoyXnDSFXm9JQ8Ir2FBExFrJHCj+B4bO+TpHQ/8SvHv0oE38PgPqxU6RBbEqmpp
         7/ZjAOZdT9LoOZ8F07gNEW87KCbcxh7FkIkjWw8MtZGeFZkMBDdGlYnEcPAbjoeZWX9k
         N8IwWTZfeuews6ZfPU4MRQfXv08fTY+hfE5CvnV822Qv4q9jYMuYKOKqFkVr5dlEOZ55
         IDLueMY/++FYtb550YUwApmSu8KWqz9nIHWtlT+m1v5LsIb2nokP1fg/Sjzvo2uz4C2G
         5svlnwTnJIUuhZ3+tQQ/X8vcAhspEHb9sG58XZOjDUdzpV4P1J/74Jycb4rTbtkyxH9n
         UEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvsQg5hopymKYI6TwCEhKVKDnasl7lVKNyCHsOPnOzQ=;
        b=e9X7LkTPJb9JezkPTUI/ZwFt+b94RUxvSpmNqNNlkAPcUadCDdoI53z/jTOu3L4LR0
         F/BoPT77phvrgcJvytqt8nl6SNXsz632u4xpw7uh02uoUlJFxzQCYU9PtDniHGF5sJvw
         YpYaFqFmAv/r1u16bULRfDQCtApU9ZpLFeM+l043dsB62PUpI/at5WOAWSDIHF9Xi4nb
         j9iiqGvI46Tc/WcqAKUBNRSgr2quji+AvCTB+Iz3xU3B4/8jzP03LMN4Qv7ZmiUpIGvX
         +vwRGneIgwAILKTQRvc81jOXd8ltiRsOj4Gr0HymFTr/8GV6poyoAJIy9z/zSxCMaO2r
         CNNA==
X-Gm-Message-State: AO0yUKWvRFTfV0p1gah7sRPnmIv8uJ8WLN5rsLE1tc8RrtQquxK2k8df
        X7h1jJssdDuzKnDoNaKrBSbHhQ==
X-Google-Smtp-Source: AK7set//GaEdUR5L6ccOz5rvyg+VGgazV560JY5oZNjN2GHlcuAgChLcoKRC4JthkAGT7Eaad+QHlQ==
X-Received: by 2002:a05:6000:12c6:b0:2bf:f4f7:be9c with SMTP id l6-20020a05600012c600b002bff4f7be9cmr17595266wrx.14.1675700237069;
        Mon, 06 Feb 2023 08:17:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c089400b003dc41a9836esm11107554wmp.43.2023.02.06.08.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 08:17:16 -0800 (PST)
Message-ID: <c999c387-401a-e3a1-f431-2770930c5ecc@linaro.org>
Date:   Mon, 6 Feb 2023 17:17:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Content-Language: en-US
To:     Danny Kaehn <kaehndan@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
References: <20230206135016.6737-1-kaehndan@gmail.com>
 <20230206135016.6737-2-kaehndan@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206135016.6737-2-kaehndan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 06/02/2023 14:50, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

