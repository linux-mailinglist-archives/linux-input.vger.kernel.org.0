Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9C82A218F
	for <lists+linux-input@lfdr.de>; Sun,  1 Nov 2020 21:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgKAUfV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Nov 2020 15:35:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbgKAUfU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 Nov 2020 15:35:20 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD32FC0617A6;
        Sun,  1 Nov 2020 12:35:20 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id m13so3559539oih.8;
        Sun, 01 Nov 2020 12:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=k/JgIluGw9/vnp3nF6qz9z+aAuXI1wiQifL465zBsr8=;
        b=mkhc4yXnnoV1Cuyi+9uy40ld+eDSqzbQnDXFVs6WDGkgOXhNsLFJzsnU/BpXzMsHtU
         m0d7v75JO7wYZVzx588DjcxIqa38U6dVzQMpgSHv1z3Uj4bvdyEiJv2CwfHpkGjyCWxV
         hBgDbyrgQlPOGFcD6abMPp+ijgDZ7AuyaoThgVfy7KXB+jk7aJaP3VvsdM8driydprAe
         aw9OgERGQpZTN4r1QyLUtaI72VAxz/wgFGL8wLVsfwQwPPOqaj/4mEquzSCUsHB7kIGS
         oSMItUdXv4HQtcdRRcbSz0Grr7GiR5g/GOC+iksiqd5ou3y/Fh2gt8Miz8bGpf7QvDhz
         6+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=k/JgIluGw9/vnp3nF6qz9z+aAuXI1wiQifL465zBsr8=;
        b=NZGHcrSOW9CUpeN83kq+9HaTVgAsPHnEfTeCRdPaLFcqNR6U7oFj63i5FJ0lAy6/N+
         1bPmMc7GE8uG90yKwJPhEZ5EepRxfWsp+fWM4oW4ucjcyoF4pMs0PrN5tj/uMxyF/M8n
         qeHR7CRTY28RlJnToACu+MEAZaJrw+PCP5kVAIlh/45R2uiTUQmM+SVm+oJFK1oOnn3p
         h99ZzMdEY42QP/xOlQ53yIWhM4LtzkceY/3/0Jx9nNIXSxrzS35KPJVNnszt/pJRJHx7
         hnfZNdzMf7L9Xh9lAZY/4ZDTGBshSrEX580D8E8MQ5GZoMqMLI/uwgWGcRF0ZHrdptp3
         o1eg==
X-Gm-Message-State: AOAM53376rOWdDqW8/X2lrXQ3hdhC9yrHZ5yDbIPrmPg6ZYNtcE0RbUU
        OeRTUf/vEjmfRbNnkJ1nCB3vD9UZkR6k94df
X-Google-Smtp-Source: ABdhPJxbAFq34ZR7gkTPTums+zhenLBeu9eSEayc97DN8dVNrASgRXy3UQsO9Pra0r+8GrXoKyo1Xg==
X-Received: by 2002:aca:2111:: with SMTP id 17mr7865543oiz.139.1604262919903;
        Sun, 01 Nov 2020 12:35:19 -0800 (PST)
Received: from ?IPv6:2600:1700:4a30:eaf0::41? ([2600:1700:4a30:eaf0::41])
        by smtp.gmail.com with ESMTPSA id g25sm3107500otr.35.2020.11.01.12.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2020 12:35:19 -0800 (PST)
Subject: Re: [PATCH] Add devices for HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chris Ye <lzye@google.com>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        trivial@kernel.org, linux-input@vger.kernel.org
References: <20201029194714.1613308-1-lzye@google.com>
 <20201029203954.GF2547185@dtor-ws>
From:   Chris Ye <linzhao.ye@gmail.com>
Message-ID: <1a7a70c1-cd8e-4ce4-78d2-2096ace34501@gmail.com>
Date:   Sun, 1 Nov 2020 12:35:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029203954.GF2547185@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Dmitry,  I just sent out the v2 version of patches, to 
maintainers of HID core layer, Benjamin and Jiri.


On 10/29/20 1:39 PM, Dmitry Torokhov wrote:
> Jiri Kosina<jikos@kernel.org>
