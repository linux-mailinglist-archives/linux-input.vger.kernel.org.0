Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14926118C73
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 16:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLJP0Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 10:26:16 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39176 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJP0Q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 10:26:16 -0500
Received: by mail-lj1-f194.google.com with SMTP id e10so20358792ljj.6;
        Tue, 10 Dec 2019 07:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EkW/ZXmAjUVot+hyX63O2O1aQiz0okx7C+33P0k2i30=;
        b=spKPGRoi8TTR71hhBmlR3pUm7kjzurA08mPr4Zdc/WZCDP9Re1doQed1786cVgY3Gd
         1IPfGLVSSPUoCDzNXvFf2aQMT6qEMtIHFEf1jPHsLeVENx2TukV89gKsbWaatBX7RFDQ
         OMNb2IZ5Sk2ONLP30yFhJI2POjGHG0gkXcg9fOARqq0KH7M3bJHw7OQ6Y+E59rTk3KvC
         /S1TKEZ85nDPkRZ4C+Qa0kIffUiksBNO1gUa1iVmsa/8jKFq70svoMw4z4SMj8OB/tCN
         ofgUY0juj3QtvJcIC7eZxCSrF5YEm/S3PijWwW3LiKErHwGFivtThf9FUa6lXLI8piQ/
         RhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EkW/ZXmAjUVot+hyX63O2O1aQiz0okx7C+33P0k2i30=;
        b=hb6eI/xzb7NlyCWc66ZFqIaaM4WAqIjomBdUaP8otYykr5zWiVWEsOVtwrCI5iYz05
         pT9/XQiNyvgsj4x8ti0vXMX3SOHYhChJgJt6HZH9lEXch8Y1yNwWBahcQIaezylWkrkZ
         7VAZ/Wua3vSfEk/l+lDzYiN3NWNmcVQhNG5GhrslI5QZjwF8gbc55fvcPcvRFkQl7SCv
         Y4mzn02tKtFgT/X4BUGRDbn67nrClZl0w2y6QQPqyZdvxrNA+hnf78ntrAQH9WAlR660
         5Dy+O2B/Fpta0KYp6BMOj1OkG0/h23NYhdWX946vTkV1Iq5fWaPpmHTF6hJL9/t3pDQv
         j3Fw==
X-Gm-Message-State: APjAAAUhUNScnYkAtGIElgs9Ew1IaVSHDzk2HoL0t8W3YodfXmUbPCTl
        xksEMpfD5HgF88kksULDiqkNTVy4
X-Google-Smtp-Source: APXvYqyvA34fMUiV7hzjyQiY8JA0hDMbqcDAVNBXUYFjBTE1kAJciaBJdPN9gUKuO+7XWCZ9Hqp3lg==
X-Received: by 2002:a2e:84d0:: with SMTP id q16mr20466327ljh.138.1575991573580;
        Tue, 10 Dec 2019 07:26:13 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id y25sm1767028lfy.59.2019.12.10.07.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 07:26:13 -0800 (PST)
Subject: Re: [PATCH 0/6] input: elants: Support Asus TF300T touchscreen
From:   Dmitry Osipenko <digetx@gmail.com>
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
 <8b656670-fd05-57b5-d361-267f3e3c78b9@gmail.com>
Message-ID: <95953e1c-33b7-d002-49d4-3a932c058b19@gmail.com>
Date:   Tue, 10 Dec 2019 18:26:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <8b656670-fd05-57b5-d361-267f3e3c78b9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

10.12.2019 03:59, Dmitry Osipenko пишет:
> 10.12.2019 03:19, Michał Mirosław пишет:
>> This series implements changes needed to support EKTF3624-based touchscreen
>> used in eg. Asus Transformer Pad TF300T.
>>
>> Michał Mirosław (6):
>>   input: elants: document some registers and values
>>   input: elants: support old touch report format
>>   input: elants: support common touchscreen DT properties
>>   input: elants: detect max_x/y from hardware
>>   input: elants: refactor elants_i2c_execute_command()
>>   input: elants: read touchscreen size for EKTF3624
>>
>>  drivers/input/touchscreen/elants_i2c.c | 365 ++++++++++++++++---------
>>  1 file changed, 237 insertions(+), 128 deletions(-)
>>
> 
> Hello Michał,
> 
> Very nice work! I saw these patches couple days ago on the rere git, but
> wasn't sure if you were going to submit them. It's very good that you
> found time to send them out, looks like we're going to have a fully
> supported eKTF3624 in upstream soon!
> 
> It's a bit unfortunate that Elantech firmware writers couldn't maintain
> common commands format for all firmware versions, but not really a big
> deal since it will be one more trivial patch to support Nexus 7 :)
> 

BTW, it could be worthwhile to CC Elan people on the next version of
this series:

Scott Liu <scott.liu@emc.com.tw>
James Chen <james.chen@emc.com.tw>
Johnny Chuang <johnny.chuang@emc.com.tw>
