Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6501CE8E6
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 01:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgEKXNj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 19:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725836AbgEKXNj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 19:13:39 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7132C061A0C;
        Mon, 11 May 2020 16:13:38 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d22so2919419lfm.11;
        Mon, 11 May 2020 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jI7y+bt8aRpRs0SbxC5gQS+fojHmgiIKZwFJuFi59fo=;
        b=IAebR1CmP9C8rf8PdszEc6TwoFAK+Kx26+JvzFnlhMeSWKTvdC7KgJeZx8NuoEPUTO
         Vluti786x2eAUFafQrSnYr2JKo+kWzNlFt144d+gY30g+sVdw/22+0KiIyG0U/QA0laU
         uHYCCEnhtzN8U1oNVF/mzmboYiIAAQKqBvYlcpOOU9GZzDWhHND8kUMW2JgsHa7g+y3K
         38kvNO+I/bT0ui4C5igL2Lqxoe370uJg1VVvRr84iTIbVHuHsEwvTbHUsOR428jOaQ8N
         hfjQ1CK96usL2EY/p2ob5Kq0/PtBPRLhANC2Smggz9eUxs47Lk1WZTURRduX1QU0Wwh1
         AuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jI7y+bt8aRpRs0SbxC5gQS+fojHmgiIKZwFJuFi59fo=;
        b=dcUSJ/ywfOeAf4SmHKOjCcG7lrR6HVADveBBNUJ5tWvYknkt9V6NWpFPjFf2JFmMYJ
         XJN2b9/+nnVycor8yo9fmqwtmw92Ke1K6aj4Vsec+/aXFf+0R/xpQ0xOoETOEY+humRg
         ItWN8DrOzTaMqLKb6F7VqAR4JfF1tMIMN22zhQytqkhCi5V95gPSTNFq4I4AcAZ3tVYO
         UaaJy1FAPorZJ46NUH2dNWZ/Dt6DR7jHjENU2RVZp0l34qdccEunalqXlMyyhK1Vl4TZ
         TDVkoHoU3BNAvzfCTQm9sdT3Ic/PYNpwZV5BwrggYHsZVlYXPPomQba3W9IrUJHbjU1q
         EcvA==
X-Gm-Message-State: AOAM531PY0hcLroAHJjekE7yRsh7jkpPWRXWKkLGxd7bT+p90EPqeNKR
        iQ2tcl7ltx1XWbNARdBQoNOext2w
X-Google-Smtp-Source: ABdhPJzux+Tcpc+G1MlCZmBO7jLElbX4iQ2ajZrWC6lroeOjJ1p6/+mgRf17KBjS5B2O69s9m3aTFg==
X-Received: by 2002:ac2:5ccf:: with SMTP id f15mr12414833lfq.216.1589238817276;
        Mon, 11 May 2020 16:13:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j19sm12116382lfh.19.2020.05.11.16.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 16:13:36 -0700 (PDT)
Subject: Re: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-34-jiada_wang@mentor.com>
 <3a942afa-c047-2c88-1c8e-a90fa018738e@gmail.com>
 <6af23ae6-2f1c-0459-d2b6-1b01ddb0c3dc@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c88d24ef-e0e0-db3b-1000-b21af906eb4f@gmail.com>
Date:   Tue, 12 May 2020 02:13:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6af23ae6-2f1c-0459-d2b6-1b01ddb0c3dc@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.05.2020 05:05, Wang, Jiada пишет:
> Hello Dmitry
> 
> Thanks for your comment and test,
> 
> can you let me know which platform (board) you are using for test,
> and DTS changes if you have added any.

That's this device-tree [1] without any extra changes.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200505022517.30523-2-digetx@gmail.com/

The v10 was working fine. I'm take a more detailed look at the problem
later this week.
