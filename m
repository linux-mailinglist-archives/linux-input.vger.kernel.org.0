Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 297AA153AA0
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2020 23:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgBEWEU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Feb 2020 17:04:20 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41125 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgBEWEU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Feb 2020 17:04:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id h23so3919821ljc.8;
        Wed, 05 Feb 2020 14:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pk8y8L/7fWcEgbfZB0mRm6yQ6lXCoZd8ttkFILQfDTw=;
        b=UlxNIvgBepcrbCFYkZnRtRj55ZBLpR7udvoYROznI72RY9soj51GIm1Tt0bG6pzUqq
         +vBxByBHINDKyOM1JjpfZ/fna9f313H2YIDk0RVhotd/Ult/mjHfhRbgSjMJSkJ8q7cO
         /VCgoTwPJ12UO4D/gPV51xjUu52PNlHVW4Z3fUaKAQ/fQip9NZbim1IF9bCWqeVCNhLD
         gtwqRZ0s603xCwwXLgFmo+5pBhISc0J/bR3H6IFAJQSZl1DGYgtmIXeHTOUBTHYSJ3H6
         qk4YUx4uZaKz+oPq9ii+CnhRlE6WQuCSiE+7WRQXoaPzD5Y0f1aij1LWroJ+uihKivTY
         GHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pk8y8L/7fWcEgbfZB0mRm6yQ6lXCoZd8ttkFILQfDTw=;
        b=DLCzN+WRSha2A0VPiIh7rym3+peYmfNw7ZC5GV9rmwzoSu0xJ9yMmCBzG4odQPzjc6
         cM/DjMLgZik1c2L8Uc7gm2ArK89gvEH+xc2HMRGpJV9BHUxZMt73Jn1Z1Vpda/uR7KT7
         4rYj8dgCFf+V9jTbZrt2ez/flGWhaY6NYw1UcVSY5rHdWae3pOm8OnLvQB3P5ybu5Dfb
         oWtMHHVGAaq7FnMTg/GUGmDin7MlgrEsdBzRGkl0g8vq5SvqsDeQkyj89hwM8xVH1atL
         pRxh6VxTxLLfdQcK2NuZpMVpExIMefAZUWAQpTZxAkJMaOTgr45xyBPI/YjBBXsue5nh
         hXHw==
X-Gm-Message-State: APjAAAVYCEsJCqEJbJPamEICvBfVsyDFS7ca9EhifxF5KQaxBiwYzdvC
        v/Awht1h+EnbbY6xDyTxxtRnAK4Y
X-Google-Smtp-Source: APXvYqx5GIbkh+oqThkktNikrIEdcNqbvRyA97U/iYxplu2VIvQOl3/tD8B82Z6Fp8ERBvrmbrA1AA==
X-Received: by 2002:a2e:b0e3:: with SMTP id h3mr12392ljl.56.1580940257879;
        Wed, 05 Feb 2020 14:04:17 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id d24sm323489lfl.58.2020.02.05.14.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 14:04:16 -0800 (PST)
Subject: Re: [PATCH v2 0/9] input: elants: Support Asus TF300T touchscreen
From:   Dmitry Osipenko <digetx@gmail.com>
To:     "Johnny.Chuang" <johnny.chuang@emc.com.tw>,
        'Dmitry Torokhov' <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?J01pY2hhxYIgTWlyb3PFgmF3Jw==?= <mirq-linux@rere.qmqm.pl>,
        'James Chen' <james.chen@emc.com.tw>
Cc:     linux-input@vger.kernel.org, 'Scott Liu' <scott.liu@emc.com.tw>,
        linux-kernel@vger.kernel.org,
        'Henrik Rydberg' <rydberg@bitmath.org>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <20191212192420.GD101194@dtor-ws>
 <7c67b849-369f-8a20-4f9e-9e0a7caec1cb@gmail.com>
 <000001d5c634$655bed20$3013c760$@emc.com.tw>
 <1451c959-03fc-9493-48f1-404cbd273aa9@gmail.com>
 <9b5b8dd4-0d21-0d1f-cd4a-36d0f9008605@gmail.com>
Message-ID: <3f5a1a99-a147-5796-0b06-7773fc6d54bb@gmail.com>
Date:   Thu, 6 Feb 2020 01:04:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <9b5b8dd4-0d21-0d1f-cd4a-36d0f9008605@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

23.01.2020 22:16, Dmitry Osipenko пишет:
> 08.01.2020 18:37, Dmitry Osipenko пишет:
>> 08.01.2020 18:00, Johnny.Chuang пишет:
>>>> 12.12.2019 22:24, Dmitry Torokhov пишет:
>>>>> On Wed, Dec 11, 2019 at 05:03:18PM +0100, Michał Mirosław wrote:
>>>>>> This series cleans up the driver a bit and implements changes needed
>>>>>> to support EKTF3624-based touchscreen used in eg. Asus TF300T tablet.
>>>>>
>>>>> Johnny, could you please take a look at this patch series?
>>>>>
>>>>> Thanks!
>>>>
>>>> Hello Johnny,
>>>>
>>>> Could you please let us know whether you or anyone else from Elan are going
>>>> to take a look at this patchset anytime soon?
>>>
>>> Hi Dmitry Osipenko,
>>>
>>> I'm sorry to reply late. James Chen will take a look at this patch set. 
>>>
>>
>> No problems, thank you very much.
> 
> Hello James,
> 
> Could you please let us know whether you'll be able to take a look at
> this series? Thanks in advance.

James?

@Dmitry Torokhov, will you be able to make at least a generic review of
the code and then take the patches if there won't be much interest from
the Elan people?
