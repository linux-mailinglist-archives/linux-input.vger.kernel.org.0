Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DFE1E292A
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 19:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389452AbgEZRgp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 May 2020 13:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388767AbgEZRgp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 May 2020 13:36:45 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3C3C03E96D;
        Tue, 26 May 2020 10:36:45 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 82so12820599lfh.2;
        Tue, 26 May 2020 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6IlskwMTJl7vWoE1K5IAJ/zT8ap+14SXBXEKr3GYl3g=;
        b=KBtcweQRN1Ly2WQUXwXrvirQmEJX3foTZW4k86v96UQeDg49R7AMZtxVtdl7dStIfG
         IOlCXiIk6BMrrP9hy+4NPPbWG9lVAnxpzYs2XH6lPhGDowzhqH9fgUP4WdBnNt51h17A
         7nRgiyUd7mx/Urv3qFgdfQzohn7nx3QizBvWB3xqlyIO6+nSxsHdxU7gu2V3jxLE6pWB
         Twefvt4+3BqjyE1sqCmHa3AeBJXWX5c3fupFEYyvCw1trua85WmeYQsU9roOMhR8SnKm
         /yOudbmkFNlakIR/k3AeccPIH3LybQo1/1GIXzXk36MZhcohCg14V41x/Vp26cFSKkjM
         HTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6IlskwMTJl7vWoE1K5IAJ/zT8ap+14SXBXEKr3GYl3g=;
        b=EwDuP7K71XR6k/M8LoZFqBdgEuc7eXHU5V+8xvkCbeQUZO5XLbH+akV6DwuyTx8/Mv
         S5TuolO8nFi2+V8Mk/6jkxLRKuDZBs0LdxN18eF928RqLRj3sGW4g/3oM/MfYgju5yg+
         zbOymUeF1Q4VRd14ENiatmcRJBDd13EfpvO+Z1CXknXgiq9yIf0X1l9LRu1zRkjbvXOx
         opUjFgyJ7+HZcRd2w9wRnEVmHwTpnXvkyMlc6qq9SwDlieEvrAgki7Iw8EpfCgYEUEnx
         5o+30tfm/M30EITO1VrMrGG9Y7kg3xpepdQ320HvZHqGSue65PteBeSJ50tHt8zDeCWN
         Ktbg==
X-Gm-Message-State: AOAM5336O0GMl7pGrc6nXRErBVa8H1vTa25F0fJlVEn3jErsaENqWDej
        ahG03jfdSUoNMAvjqCaTrzQ=
X-Google-Smtp-Source: ABdhPJyGF8gpzWW7wy42TWKwQTsStej6Qdkik5tTvc30uBtfIRyorLEQTfvl5wF3x3X0+4UMqV4yHw==
X-Received: by 2002:a19:987:: with SMTP id 129mr1035156lfj.8.1590514603702;
        Tue, 26 May 2020 10:36:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-17-204.pppoe.mtu-net.ru. [91.76.17.204])
        by smtp.googlemail.com with ESMTPSA id a6sm90002lji.29.2020.05.26.10.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 10:36:42 -0700 (PDT)
Subject: Re: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     "Wang, Jiada" <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-34-jiada_wang@mentor.com>
 <3a942afa-c047-2c88-1c8e-a90fa018738e@gmail.com>
 <6af23ae6-2f1c-0459-d2b6-1b01ddb0c3dc@mentor.com>
 <c88d24ef-e0e0-db3b-1000-b21af906eb4f@gmail.com>
 <aaf99a11-037e-93d8-93e4-d83e3aa4a42e@mentor.com>
 <63c93fc0-ac09-ec77-c590-08e419734205@gmail.com>
 <8c6f73a2-f613-b402-d727-5cb7fb3e1f09@mentor.com>
 <2e41656c-e7e4-5dcb-1156-bcfcbc8ea595@gmail.com>
 <f5da1587-02e7-5704-a676-1829b915c6f8@gmail.com>
 <0e439df9-ccd4-699f-dbb3-51431d7f0fbe@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b3c1765b-8050-e8f6-b714-18bd40d58ef2@gmail.com>
Date:   Tue, 26 May 2020 20:36:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0e439df9-ccd4-699f-dbb3-51431d7f0fbe@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

25.05.2020 17:51, Wang, Jiada пишет:
> Hello Dmitry
...
> 
> Thanks for detailed information to help me boot ubuntu on acer tab a500,
> now I am able to boot it with ubuntu and reproduced the issue with v11
> patch-set.
> 
> I will start to investigate the root cause,
> from now on, my update patch-set will be tested on both samsung
> chromebook pro and acer tab a500
> 
> Thanks for your help

That's awesome!

I haven't had a chance yet to investigate the problem of v11, maybe
later this week. Please feel free to beat me to it :)
