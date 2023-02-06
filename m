Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C50D68B6FE
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 09:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjBFH7p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 02:59:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjBFH7m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 02:59:42 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289CF10AB0
        for <linux-input@vger.kernel.org>; Sun,  5 Feb 2023 23:59:40 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so2769800wmb.2
        for <linux-input@vger.kernel.org>; Sun, 05 Feb 2023 23:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DSm9Ay4XlRZFRwb18NhVGDIWLjhmEsNz6SxLYGo1DJg=;
        b=k144OYj7Z3j8Rbua7YR9ByBsZQqVXg1E3wNhll3jgFVoILBzxwh5oBA8F8Hs3EZ0px
         SKtkAO6+cYmrrHW2wGeuXWqeK/b2h+tCy52jpIqVTweZtVEg/u5haLWicdP9aolAE/hN
         850aGjYaA1mMz4KRvp2lhlvNcnaHfnKOoVd4LiuMFlWlgaE43L4utG4RykEZmjVK/9aP
         2inqFzL1CvZcYvTALOd7c8ksum7g0+400bXVXlPFube8EiNMZUb1HabwnEu6PbdPa2Sj
         lueQbWyqWYeiqyvu8Wxk6hBRgI+bxhTAlpMJ0lsvnTQAHWapupCLUbZebl5tpcX+icnp
         vVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DSm9Ay4XlRZFRwb18NhVGDIWLjhmEsNz6SxLYGo1DJg=;
        b=uRJbHmdzVFH9P5E12vHxC13k0xJeEv5+f5tiKilxn8yk/yA+fvct+/wU93+tNkyVRj
         POXuOZDqxbbaXA0c/6E5mIhngwJXMRwYzzogXPRcBjbQI9kEUTzCTNjh7rwrZ9gaUZ67
         PvGxP/lax/rNOXfshkvw0jc8Gz7GG/t7goQGKjjVXDfILe7iiCWx4gyCI+ShLzFa+D3C
         3yrShcnLj2EXiyHA4dwWNoi9uBmCF7zpJR/2xlklg1+2FSx7o4iSYsm3VH8d4rhTzcYX
         YenI5pu/TkzDfPtWtaajwWgX4kYrL/jigVYmoa0lsCCY8TY9l4tluOyjsQ+UnMLMnLPm
         Jx1A==
X-Gm-Message-State: AO0yUKWiC7DFNDSMkVAAC9wbHP9pOOIdjCePyFeDGZ6MspJ6CVQRv03J
        Yq48ueFJD+z+Li0NT2NXmYabpA==
X-Google-Smtp-Source: AK7set/yewnChTnudhLpLjOmrr/sR43e27X6+8tcsXvXqynd5LXzJ+FIW06nmIvRZ0CYfzk5TqlcnQ==
X-Received: by 2002:a05:600c:4ec7:b0:3dc:5e0d:4ce7 with SMTP id g7-20020a05600c4ec700b003dc5e0d4ce7mr17805330wmq.11.1675670378710;
        Sun, 05 Feb 2023 23:59:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c358a00b003db1d9553e7sm16488388wmq.32.2023.02.05.23.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 23:59:38 -0800 (PST)
Message-ID: <8eadde99-28b5-5d21-7c15-119797f11951@linaro.org>
Date:   Mon, 6 Feb 2023 08:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/4] dt-bindings: input: Add CP2112 HID USB to SMBus
 Bridge
Content-Language: en-US
To:     Danny Kaehn <kaehndan@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
References: <20230205145450.3396-1-kaehndan@gmail.com>
 <20230205145450.3396-2-kaehndan@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230205145450.3396-2-kaehndan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 05/02/2023 15:54, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.

I actually wonder - which part of CP2112 is input or HID related? The
manufacturer advertises it as USB to SMBus bridge, so it is an I2C
controller, thus should be in i2c directory.

> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.


Best regards,
Krzysztof

