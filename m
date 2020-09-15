Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA59026AB62
	for <lists+linux-input@lfdr.de>; Tue, 15 Sep 2020 20:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgIOSBx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Sep 2020 14:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbgIORkS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Sep 2020 13:40:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8C1C061788;
        Tue, 15 Sep 2020 10:40:14 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z17so3970566lfi.12;
        Tue, 15 Sep 2020 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zlAmHb9HL54jsqOVV+1i9RxMc2GJne7GZI48ziJLexg=;
        b=Jc1RcChmw+Gyl64rx6q9kMXFAT9w5o2M/H7elLYUgMxAHV/S/1pa+Jn6eFJHI0uhj8
         gc/4HlG/OTtEYrXnhSlqu7wfj1UEwJlpX5w79a7rL/yE7dF62wjqKCeldzN/chc5ZLN/
         reNcSPwQsc+zGBQ5Fu3Vrme1QCE30LB6+PlVwo7Q/T7OIpk8yG2O+nSt40Jozq5aIP4o
         0XdqimKK0YlkObJybxVn5428DNaWjbBsWy++FzIgkKw4RRSGwP0eZAnLyhB+5Yg5yvVK
         zQhw1srxjT+pL6+SXTHe0FewXmc1xjQIt5BhhmfoPkvAyXzeNq0EQuvByy66SmPTpLgT
         TNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zlAmHb9HL54jsqOVV+1i9RxMc2GJne7GZI48ziJLexg=;
        b=T4gtI7P9xhYtWdwhIG7DPiQwvx1PZ8WlmcjWx4/sLbL563eX5Yy38WJAB3f5pKI0fS
         5ZiQlJkL+PpHmfyJ0gUsl1QY4F0/Q4ihNyd1tUxlt8LE8yyDdBzJlI/zYJcUM7159zZp
         9gLcZLhnQ+Ddqr7h6kKgh7bgpMZdvRIhjFpU3Y/WfTxtGNy8kJ03sO4ZQ7wk8zG/vTQS
         toeKBCtfPVxLu6iFPkVztUG3x77m5eJeGVB4iiS8H0r3/TjbtUqja1fPZBkTvT/6j6Xk
         5mVlR4tr5ctpERdIkU0c9/iG1IMnP1De4EdYsdd/rxxY4fx1lEExP00F2hVj/JLKU61O
         3e6A==
X-Gm-Message-State: AOAM530iViQ8OlZsrBpjX2qxpswxmQ+OnYnGG/hhJz+YnzKRMop/P73J
        TaxJFk1XDYnvlYGG/JMnaUg=
X-Google-Smtp-Source: ABdhPJzxhZpATZ4LGPX1t2pU+/CYy5nIIVPWDTyWhTEqL9g6o0APB4JwEjPwlOFAS4L1JCeC5nw0pQ==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr6258057lfi.58.1600191612474;
        Tue, 15 Sep 2020 10:40:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id k205sm4418834lfk.19.2020.09.15.10.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 10:40:11 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     "Wang, Jiada" <jiada_wang@mentor.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <20200913165644.GF1665100@dtor-ws>
 <65d1b9f2-a8e3-6398-712d-41d8067d06a1@gmail.com>
 <20200914193340.GV1665100@dtor-ws> <20200914193603.GW1665100@dtor-ws>
 <e3dca702-7489-be94-9eee-46024f988372@gmail.com>
 <b451e91a-ed9f-51cb-1765-e68867e0a86f@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e4acf85a-e9cb-8c6a-1161-65617d93649d@gmail.com>
Date:   Tue, 15 Sep 2020 20:40:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b451e91a-ed9f-51cb-1765-e68867e0a86f@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

15.09.2020 18:55, Wang, Jiada пишет:
...
>> Jiada, will you be able to re-work this patch? Please note that the new
>> "atmel,mXT1386" DT compatible needs to be added into the
>> atmel,maxtouch.txt binding.
> 
> Yes, I can re-work this patch, and add one more change to dts-binding.
> 
> to summarize long discussion in this thread,
> I think what I need to do are:
> 1) since the change will be different from current one, I will need to
> start a new patch
> 2) call mxt_wake() in mxt_probe() and mxt_resume()

in mxt_initialize(), mxt_load_fw() and mxt_start()

> 3) update atmel,maxtouch.txt binding
> 
> please correct me if I am wrong.

sounds good
