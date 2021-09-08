Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23E64032A7
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 04:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347334AbhIHCau (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 22:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347294AbhIHCar (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 22:30:47 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC53CC061575;
        Tue,  7 Sep 2021 19:29:39 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id y128so1175470oie.4;
        Tue, 07 Sep 2021 19:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gb3Rer3/NJHyGTkfNKWCGKxYeiRxOy1QXnqjsA5j1wk=;
        b=pYTDbDPBFl0PZkhJREk2lnA0QmsHmZ4TNmozlhuYyravnjw7ICuNTnuTC5M6j7iQ2B
         cEUdRAd5d7i0jbRGit1YltI2FQ4X+YhgrYFKElWQtxS7gvikoqPgxKbh/nKMJm8s2myX
         8tR4aA4GAacR2NevCUTFtSIx7kQyVc80I4JhVxWKM87HH3pxlBFzTjPL4lCMifrnphHx
         n+fdt7k+4lLupAsvLHTCyTPbYk1bHovwwG+kung36Edx1hjWXpSibU3zp30U5IsJeaYe
         cXUwVC3oHeMp7mUaTFOd/7VPEvgJEgCT4rDh4uPddA1wS0+aJU6sMZkvmjXweYvleyA7
         wwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gb3Rer3/NJHyGTkfNKWCGKxYeiRxOy1QXnqjsA5j1wk=;
        b=luFqlYWDrB1Ecca9Q6S/ydxT16ZUY7j2TOYgwqie0/L3AmyPEoQY+l9CqzFBtxwJAf
         0Lu5kdmQ8LkfbyJl93IaQfp3Ys/h6nRc8UNeb1Wfos7U3EQwaCK/qo7t0kogix93ExHS
         2hTEXIueVal6GTib7n40GxPgmpixWVM40ZhHfCVj//Fh3cCJ7Hh2ssWAAC0m5k8o4QgD
         I/C2JxKlLp+Ee8/o8Gyx2uetTl6SKASKipTwYaQwi3cJa/ZKpgS8VNeU0ijEuAOg6nEh
         wAzwUinnAPmNDDPWbLcESFVHj3n9vOR+XWsmrNZ4FpMLlSGZjigI9wmMHq6ghQ3ccq2U
         CG9A==
X-Gm-Message-State: AOAM5324swpUkj76cHymCH44M/boPL3fDOA6WXMfBvtOw/BbpVV+G5r/
        7Xj/w2qREYmgqQVf9MRCbTiJrfFYRNM=
X-Google-Smtp-Source: ABdhPJzOwCZ0vbJAGqDblbjkwqIlC7sfTl4eHXZctaI38F2XwAmlw5G4/V0vNcfUKp/azlAE9WRbnw==
X-Received: by 2002:a05:6808:56a:: with SMTP id j10mr846748oig.79.1631068178852;
        Tue, 07 Sep 2021 19:29:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v16sm164196oou.45.2021.09.07.19.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 19:29:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3] Input: analog: Always use ktime functions
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907123734.21520-1-linux@roeck-us.net>
 <YTgVUWzFSOg/I4C+@google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a07d3486-ab7e-24c1-63f9-b1566636015c@roeck-us.net>
Date:   Tue, 7 Sep 2021 19:29:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTgVUWzFSOg/I4C+@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/7/21 6:43 PM, Dmitry Torokhov wrote:
> Hi Guenter,
> 
> On Tue, Sep 07, 2021 at 05:37:34AM -0700, Guenter Roeck wrote:
>> @@ -241,11 +176,11 @@ static int analog_cooked_read(struct analog_port *port)
>>   	int i, j;
>>   
>>   	loopout = (ANALOG_LOOP_TIME * port->loop) / 1000;
>> -	timeout = ANALOG_MAX_TIME * port->speed;
>> +	timeout = ANALOG_MAX_TIME * NSEC_PER_MSEC;
>>   
>>   	local_irq_save(flags);
>>   	gameport_trigger(gameport);
>> -	now = get_time();
>> +	now = ktime_get();
> 
> There are time[4], now, etc variables above this block that are u64. I
> think they can be make ktime_t. I can do it myself if you agree.
> 
Sure.

>> @@ -378,35 +313,19 @@ static void analog_calibrate_timer(struct analog_port *port)
>>   	u64 t1, t2, t3;
> 
> I think these should also be ktime_t.
> 
Ok. Do you want me to resend or are you going to make the changes ?

Thanks,
Guenter

