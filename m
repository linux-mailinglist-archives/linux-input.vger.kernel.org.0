Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CAE26648D
	for <lists+linux-input@lfdr.de>; Fri, 11 Sep 2020 18:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgIKQle (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Sep 2020 12:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgIKPKu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Sep 2020 11:10:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562DDC061757;
        Fri, 11 Sep 2020 08:10:40 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z19so6198575lfr.4;
        Fri, 11 Sep 2020 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kv9oMQQFyLAZk1SItD7ecip/eYagD8o/JxuoFQE0OoQ=;
        b=YwFZrLxEEvRdg2NhApHcQg4xFnmm2xoIOA2btQCY2882iW09CG5O6Qztv5mU8dm9hm
         vFOUulAFD/55SkmKDyZQlX1idzqhY211NPAROG6hpUGi7XAX4+Yjiu1Vml1XtpmpRPaG
         KdOyHOKgW5ODx/YdV5HI8M2B1LySYpmiAD0fco7EyayBjIwfFA1nAs4arDLNZVgUAfUo
         RtMipJ5GGEjynewXmSEnjhs05a4cUXfa8iPhgn/c/vrxGMeqOkebh4IJ4yh3m4v78Ys8
         SYg9lI4gzAtWffjOxivLYyRSKJSSL8qziJca8GTXJz7Kzz0WA5d1yvpOxm3/Rfo2Hgix
         hJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kv9oMQQFyLAZk1SItD7ecip/eYagD8o/JxuoFQE0OoQ=;
        b=KoFAKkhaEI9ySDXaZP7ktw/hM4Dj+L32lnDamCzajAvhGVoFMfanN+3z9K9kfye0J/
         /owGONs7MW2+3osAct2x4xccel9SpRZWs/2+UOpWjpywC5zGV2VXRHQNRQVRvbmedk/x
         SlTTj+kfeHWYEoi0sXOmQN3CQbkft+XMRJ14l4P8ObQ1fQ+yBAmm8AGqDl8jqxbCk9CV
         wF5nqbo0UNzIvm0MsGKXksYaoAmUhNF/+ecC2LJiY9feh+cZmO2+wePZATQW82RgrAxg
         9pXWfj6kgycfkIySsm++QZTSUx1avCNL+rC9g51jWlsMrBZ/vj9NSPTigx2+G8lz2RuX
         OMSg==
X-Gm-Message-State: AOAM533lSoDqoeIngFzW/mRFe13JCyZ0/rnkq2RVDr30/D1rm0HlXD3z
        YNwQ16/i8PpC0NsgAraIEyE=
X-Google-Smtp-Source: ABdhPJzccNXoF0TS9Rv7GinnsHNZqtZT9JD1LRXkodmJIUt3mQ92dWXjPb+iQwBcJBhilh9HIiggqw==
X-Received: by 2002:a19:ad46:: with SMTP id s6mr457284lfd.576.1599837038689;
        Fri, 11 Sep 2020 08:10:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id a3sm557263ljk.6.2020.09.11.08.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 08:10:38 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] Input: atmel_mxt_ts - implement I2C retries
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew_Gabbasov@mentor.com, erosca@de.adit-jv.com
References: <20200908151617.12199-1-jiada_wang@mentor.com>
 <6041c677-592b-388e-2eb6-3287a3d92e4b@gmail.com>
 <ec77e42c-ea72-bbae-e1b8-1e11cca17f87@gmail.com>
Message-ID: <0cd9055e-3ad5-f573-be39-3f999d9d461c@gmail.com>
Date:   Fri, 11 Sep 2020 18:10:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ec77e42c-ea72-bbae-e1b8-1e11cca17f87@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.09.2020 18:05, Dmitry Osipenko пишет:
> 11.09.2020 17:50, Dmitry Osipenko пишет:
> ...
>>> @@ -626,6 +627,7 @@ static int __mxt_read_reg(struct i2c_client *client,
>>>  	struct i2c_msg xfer[2];
>>>  	u8 buf[2];
>>>  	int ret;
>>> +	bool retry = false;
> 
> Andy suggested to write this hunk like this:
> 
> 	struct i2c_msg xfer[2];
> 	bool retry = false;
> 	u8 buf[2];
> 	int ret;
> 
> This is not a mandatory request at all, but it will make this particular
> piece of code to look a bit nicer.
> 
> There is also an opportunity to improve formatting of all variables by
> sorting them by-length across the whole driver, this will improve
> readability of the code. But of course it should be a separate patch.
> Please note that I'm *not* saying that you should create this separate
> patch!
> 

I'd also recommend to rename the "retry" variable to "retried", which
will be a more logical name (more proper English).
