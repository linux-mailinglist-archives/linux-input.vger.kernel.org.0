Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5AB9131F57
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 06:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgAGFdO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 00:33:14 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38412 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgAGFdO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jan 2020 00:33:14 -0500
Received: by mail-lj1-f193.google.com with SMTP id w1so31395426ljh.5;
        Mon, 06 Jan 2020 21:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=veUZeWQZbFotsYKfqCj5Y1xDEGG7Ogankt+eKInlDDg=;
        b=MMfH6XnxLwcfhqY5ZYFKRsc3ald9qks2waZ+5mhHbxfbPDldlzeHEyFnWC32mjlXiD
         nv5uIdsSajiXc6qMcPW+thKv2TdmQxMyY+KSy0o2fyGK91cU93LX0jr8dTipdjZEisxa
         n92MWUnqgs+nXMqghBgQrTgDdj9/4KyBOGOOK+ftTLiwW96rgYuiA0ye296hJCljaHKk
         bS8T8oyQai1Im75g3knKsixURKV1ZaFfm/fzitEejbyMebTkXFfMGS1vFF1HJJpsQYMP
         FYiPRWPQ+N0sW95n1immb1Q1q4u1FFcuWp31D9cM+7DsZGTBOSb+AWGP9WkopSZPfBhw
         8JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=veUZeWQZbFotsYKfqCj5Y1xDEGG7Ogankt+eKInlDDg=;
        b=bXr3C7oya5CfXPs9LQ8oxzcLO1AzrP5BgIH9PFl6gUQYnrxYOncxf/txR/CblRwQwS
         U8+DDP/C6c8/x6ZGHoaaZ3RC2YrtJSZVM+LRhCAqBt9aPYDv0YhezI3OW10uwcVYSqIj
         bjDDFmBa7iIACbp2TyAAqu+7CY4DJlps93+7/WjJiJwikzKH5zee2urVz/h9Z3Q7Q3Mz
         UzjiSih8AyRxz9Py0digkOVE1BGFPcRJTUUqupj4jXM8PrR94FJJXojvowidnHSgaOsx
         AatVB3Sg+hoMseapFzzZxVysIDH33cFqprdZ4dMXkVd6B5uVwOlHKAm7ZgVpsat37VhQ
         NPLA==
X-Gm-Message-State: APjAAAWFnVu3ZAlKBI46ufBWB8nwCMcizsJjSqF7fzt/u2oEeu1WdrNq
        SJKwmi9WWEDtVnO+OZoExSQ=
X-Google-Smtp-Source: APXvYqwQuxl/nNc1WZx6Hq7z8hwzhuGnyiQkFsUMBIML9+phR645Yvg8qHIcxH0R9Etz+2+hei6HEw==
X-Received: by 2002:a2e:7e05:: with SMTP id z5mr48052335ljc.99.1578375191537;
        Mon, 06 Jan 2020 21:33:11 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id m21sm29860754lfh.53.2020.01.06.21.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2020 21:33:10 -0800 (PST)
Subject: Re: [PATCH v2 0/9] input: elants: Support Asus TF300T touchscreen
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Scott Liu <scott.liu@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <20191212192420.GD101194@dtor-ws>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7c67b849-369f-8a20-4f9e-9e0a7caec1cb@gmail.com>
Date:   Tue, 7 Jan 2020 08:33:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191212192420.GD101194@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

12.12.2019 22:24, Dmitry Torokhov пишет:
> On Wed, Dec 11, 2019 at 05:03:18PM +0100, Michał Mirosław wrote:
>> This series cleans up the driver a bit and implements changes needed to
>> support EKTF3624-based touchscreen used in eg. Asus TF300T tablet. 
> 
> Johnny, could you please take a look at this patch series?
> 
> Thanks!

Hello Johnny,

Could you please let us know whether you or anyone else from Elan are
going to take a look at this patchset anytime soon?
