Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA3033A442
	for <lists+linux-input@lfdr.de>; Sun, 14 Mar 2021 11:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbhCNKtU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Mar 2021 06:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbhCNKsw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Mar 2021 06:48:52 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FF1C061574
        for <linux-input@vger.kernel.org>; Sun, 14 Mar 2021 03:48:51 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id p8so61453805ejb.10
        for <linux-input@vger.kernel.org>; Sun, 14 Mar 2021 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OupAmYA/GL3hAOUDVuWDdqpt7UjUwt2JofY2u3zP3Z0=;
        b=eZ5P/T7Ngjs5Nl6H8CTELN4k0sT5z+UTEzgSQT4Awx/xm4wmFe+fiRDpg++bvpLTHx
         Znj26ExiXK1W3dVdWBfr6MEZdDhvDptfUgplDmpLZ7f/6ALo0L3c57Cjb96prDrC81us
         n5hADpaHTrYQJDe3tuOJrjmpmLXG41U+eUqL2Ne9W3viSwMKXkkIUM79X9HOGr5suyMJ
         DkIhD/Hd4UvHBiUhe9u0kNMvufyzNpWVVl7q75GjqO7IjNvKAUwEl+4PE0xpx0+iUfWD
         mva+kl+wq6isYrFdnG24q8CHKoqDAHg1Df59SSwbiGV/x3HSRzbZJQG7aV0eAcp697gM
         mVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OupAmYA/GL3hAOUDVuWDdqpt7UjUwt2JofY2u3zP3Z0=;
        b=C4lRxS9UAi8parA44zAKGyk/Pwt0f9QnmsX+n+Aqx2u5baUiBBvTGFGc1HdhR97xpm
         rHYuKT4VE3mrADl1Gx3F4i4jbD3f43mTzKj/JwuYgy3SKBYoE1DjKUqT/8u2yP9nv19l
         TFAlrHvKSKUgBL3LvVeXtGzNyQwyL/UWuD+QPxxKJi6o9TNgAxPqiuBJFzZL4QDxH4jr
         sA2w9y6/7dCFdedDVFUC+SGAEF2SnvlmdP1n/j6SXnamMkdvLZrai8C+h1LYF32srhL/
         DcDQ6mNd0CDdq4/LjLu7hpGrt9wWhvJL4zx//GePSELe4IqjetZcQ2J4fdyd4UVWsxft
         f0Ag==
X-Gm-Message-State: AOAM533J+fJajsw63cCVo/A/iB/dar/i1Gqh1aOHXSpqs4yvsgL5CSGn
        nMxHaXpe31R9WFkP30epcVY=
X-Google-Smtp-Source: ABdhPJwua0tRxRB2ryu1AMHqBIvm3CW2okuDCZhF5mxZr3EnNe754vc+7/XdUIw/IU2ae+3T+KXbKA==
X-Received: by 2002:a17:906:b6cc:: with SMTP id ec12mr17959933ejb.520.1615718930114;
        Sun, 14 Mar 2021 03:48:50 -0700 (PDT)
Received: from [192.168.1.240] (62-11-162-96.dialup.tiscali.it. [62.11.162.96])
        by smtp.gmail.com with ESMTPSA id e18sm5392917eji.111.2021.03.14.03.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 03:48:49 -0700 (PDT)
From:   Dario Pagani <dario.pagani.146@gmail.com>
Subject: Re: [PATCH] HID: support for initialization of some Thrustmaster
 wheels
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, kimi.h.kuparinen@gmail.com
References: <20210131090045.10636-1-dario.pagani.146@gmail.com>
 <nycvar.YFH.7.76.2103081458550.12405@cbobk.fhfr.pm>
Message-ID: <665a7a24-bc18-46e2-dee6-cb08f4a7b973@gmail.com>
Date:   Sun, 14 Mar 2021 11:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2103081458550.12405@cbobk.fhfr.pm>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Il 08/03/21 15:00, Jiri Kosina ha scritto:
> - I don't think we need to have this in a separate driver, is there a
>    substantial reason why it can't be folded into hid-thrustmaster proper?

I didn't add the init code to the hid-tmff as the ff stands for force 
feedback and hid-tminit does a completely different job.

However there are no significant reasons to avoid folding the two logics 
in a common module hid-tmff or hid-thrustmaster.

> - Looking at what the code actually does, it seems like this could
>    completely be done in userspace via libusb as a hook in udev when such
>    device is plugged in, can't it?

Yes indeed Kim wrote a python script 
(https://github.com/Kimplul/py-tminit) that does the same job via libusb.

One can argue that when the joystick is attached and appears like a 
"Thrustmaster FFB Wheel" is, as far as we know, useless as the hid 
descriptor is broken for the axis and some features, like changing the 
range via LEFT|RIGHT + MODE button, seem to not work at all. So with a 
kernel driver built-in one could just plug a supported wheel and have at 
least a semi-functional joystick correctly identified by its model name 
out of the box without installing anything else on the system. (I say 
semi-functional because without force feedback support for the specific 
joystick the wheel remains stiff to steer)

