Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9782CF9CE
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 06:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgLEFlw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 00:41:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgLEFlv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 00:41:51 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28503C0613D1;
        Fri,  4 Dec 2020 21:41:05 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id o24so9019469ljj.6;
        Fri, 04 Dec 2020 21:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tFFN9OthtG3s15AHxeiBR63PMNTLPenNPFQnjwT721I=;
        b=DvnAhDEWUEjCxE53owa2c/jNrzCfK94iECTQ8m1FizMap58zTTLMkH6wNFkyyCXoDZ
         qdnVW6XoO7CRpUrJGkAJtWA1tx3hdyLhO1BvFK43JmfeIOINqcYmjXuDfjNYcxVOgSxd
         14j2TyU7sJ42bVrFPfUCq1PjXdyvHC0N2+5q+BNnr9yMLX8Dw52hFK/RSVys9GPdQ0oA
         xfajd3iCt7ie10YgvVN2CAaG7Cfj4g2IvirlVrkswwPJRpoP4j7mgO05G3GKctd6oG0t
         Ld6/D6c/JBc0kVkZ14ZcsqG3myi4nTg/32JR5OEjKk1IvVuQZw7ztPcdEWc5qoIMN5xe
         Hjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tFFN9OthtG3s15AHxeiBR63PMNTLPenNPFQnjwT721I=;
        b=e+GctS1tNH2putu1L9+K1RLROYEsZsYkaCXQiDvqyGfEzZMcz57WhwiW/SVyjKxh9+
         zxfFN3q4PCxPaljEGDKefVS92wTqtpT5DR0fxKGgSz3QXabzIV0FsrtbiDXBf2Ot13aN
         8etY8E4pxP0nM89KjEcgkQn29isAAnyvRRI7qjO1XDPSOpaoPy+a9UZixPXzZLPxNSIb
         BCBKJyXYz+Jsv5dh6riesRoxRRFZfXTJ8d0MvD8haj9fhD/SNJ1WvsqKoQSpmd84X1TB
         PDl1+TPVk5dN1dmOOoTUKPcuqXE1C89h+4xcrwnygGpYJaVdRPIOut2mcbBE0oJOUZnf
         gRiQ==
X-Gm-Message-State: AOAM5330viTzSNnXVAjWRL8ODv/Q5LvXR14cDzLuSbKbh1TyqeWSF85B
        TuXT+ebeONOLlzbjIh/yeZ5M7lG+08c=
X-Google-Smtp-Source: ABdhPJwZr/PLgdyaFse8UiYwtQKJpIbgrvFG4qMwXEq7zaulKfSUQifXJcxn5G4yUJhXWtjDOjDD9g==
X-Received: by 2002:a2e:330d:: with SMTP id d13mr4802538ljc.463.1607146863419;
        Fri, 04 Dec 2020 21:41:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.googlemail.com with ESMTPSA id l16sm2263238ljb.69.2020.12.04.21.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Dec 2020 21:41:02 -0800 (PST)
Subject: Re: [PATCH v1 2/3] Input: atmel_mxt_ts - support wakeup methods
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201205053328.9535-1-digetx@gmail.com>
 <20201205053328.9535-3-digetx@gmail.com>
Message-ID: <db507b04-03d6-4db5-101a-b5ed1918e68e@gmail.com>
Date:   Sat, 5 Dec 2020 08:41:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201205053328.9535-3-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

05.12.2020 08:33, Dmitry Osipenko пишет:
> +	/* Request the WAKE line as asserted so controller won't sleep */
> +	data->wake_gpio = devm_gpiod_get_optional(&client->dev,
> +						  "wake", GPIOD_OUT_HIGH);
> +	if (IS_ERR(data->reset_gpio)) {
> +		error = PTR_ERR(data->reset_gpio);

Woops, I missed this copy-paste error. Will send v2 shortly.
