Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2EAEB15
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 21:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbfD2Tsm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 15:48:42 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33889 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729054AbfD2Tsm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 15:48:42 -0400
Received: by mail-pf1-f193.google.com with SMTP id b3so5857916pfd.1;
        Mon, 29 Apr 2019 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N/V7CdFbpu/a+zOZD1qat4oM+UjUMN9cNoxkOPcya1U=;
        b=PeHGwjHhTj51j8FK2l3jQnabTd+S8JeTGWf02aHGaiLh2QCwJcmFyjYUqjfHbAXQZP
         3pz5DtwVpYpiEWQ/NEimSHprA9qHFEUfNFVcPKjOZl1BZeVCFd38Uj2Xmt01LT0Hq1SY
         0mmplQnawwDRhJnKCGWFCi8x5n+lW4z1Sfif/lEwmrSEC/pvcmp8D43iR2Mp0nyYtMuB
         WxqW2gZz+ycEZjEwz6bmYKhzv/tLaCxd608FukpgsSbQEJbcqoO4gR0FNAneq2D1LR9b
         Gf+857/sAxxYZEe5XDcxyieg9S92LtgQ9VQe9ZIAdFZLtOtPYJzQTIycCFIsJyTYwtzV
         k9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N/V7CdFbpu/a+zOZD1qat4oM+UjUMN9cNoxkOPcya1U=;
        b=pQv5GCiT0I7c3vAkpNoX6QXYZ49HsqJ+9kOShSccrd4jqSjy1D+ka816w9VLs3CThi
         jbleVi8HjaSS1BGaDcLfdTkKfq/KatDBpx3FoxTJSmBa1Qq1f6HSroy3xFGhZX8N/1k7
         Z13Z6jBiBFt/+pBX3+TWBWs92XZcf3jx0octGobSERpb0OKGdr3Q17fKE2JdTVkTTQkE
         nkQqZ6zU5Z3vL0RXqN81oJ9DLAdGqIEvyCi9KZoPXV/hax+EzLoDWys1vXrUcqpeYfrl
         I+HMaW27b0KtWYCEpCfo7ULLD3evOGqvNCB1rQEmYyQJEYi+rNpT2GQ9Snzh1ZDaDlOd
         XlGg==
X-Gm-Message-State: APjAAAUqgnkRKufNW+tM5xBmeJ6YxrTbspaOBHChNQirnLOe6xe7yPWD
        1nSJRHQ+ePTcMlJOwY/t6rY=
X-Google-Smtp-Source: APXvYqwqzfrSGQi6Qsht6C4hWGGTl2hK0hlytIe3akae7rnMV2BQJFtTi+JepgK68RTTBSXrhKn6jA==
X-Received: by 2002:a63:2325:: with SMTP id j37mr6874152pgj.137.1556567322088;
        Mon, 29 Apr 2019 12:48:42 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net. [24.6.192.50])
        by smtp.gmail.com with ESMTPSA id f7sm45662227pga.56.2019.04.29.12.48.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 12:48:41 -0700 (PDT)
Subject: Re: [PATCH 1/4] mod_devicetable: helper macro for declaring oftree
 module device table
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <1555444645-15156-1-git-send-email-info@metux.net>
 <1555444645-15156-2-git-send-email-info@metux.net>
 <20190419074021.tigbyfezmt4erjms@penguin>
 <fc747fb3-e670-79a2-f4bc-b989dee469fa@metux.net>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <90c8f98d-eabc-c131-aaf5-9ccaec4c9aab@gmail.com>
Date:   Mon, 29 Apr 2019 12:48:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fc747fb3-e670-79a2-f4bc-b989dee469fa@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/24/19 3:48 AM, Enrico Weigelt, metux IT consult wrote:
> On 19.04.19 09:40, Dmitry Torokhov wrote:
>> Hi Enrico,
>>
>> On Tue, Apr 16, 2019 at 09:57:22PM +0200, Enrico Weigelt, metux IT consult wrote:
>>> Little helper macro that declares an oftree module device table,
>>> if CONFIG_OF is enabled. Otherwise it's just noop.
>>>
>>> This is also helpful if some drivers can be built w/ or w/o
>>> oftree support.
>>
>> This should go to OF folks, please.
> 
> hmm, they should be CCed, if my script works right.
> This one is only needed for the 4th patch (skip oftree...).

Your script did not work (BTDT).  I just happened to notice this on lkml.

-Frank

> 
> 
> --mtx
> 

