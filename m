Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8BF280950
	for <lists+linux-input@lfdr.de>; Thu,  1 Oct 2020 23:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbgJAVRk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Oct 2020 17:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbgJAVRk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Oct 2020 17:17:40 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9398FC0613D0;
        Thu,  1 Oct 2020 14:17:38 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id q8so348147lfb.6;
        Thu, 01 Oct 2020 14:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zPU8K8mX10SuX1nIiSrp3KwYZ3RHW0pkIeqC3Pyqkok=;
        b=IZ/a9RN3TdKPmV25cFyxFKwqh+FVNslFuOMHaU39uIw4UJYs3Y2xz8RDkwtM723F50
         oZLLO98XxJt/vn5u1Kh/6ymcVJRXS3Th1JacSRA1rMgZWSr6z3jpVEuOQjO1gzx6umws
         UOsszk4i8tRTCalqmk8dYpxuCcdW3ukj1tEbe/Q5A81qZXLUu3Xlblw+yEdwFgT0aJk5
         zCLSCpfoMppasEc4Ja2m1dTCQe2MBR2TLz6DYS0/7Tnn/0Xe4DGFnG6iPjI2T/HuZq5P
         8xgFQV88Cs036VP7FGq0+9eXwxa9QJ8W/9rJz5TE/NeK3ly8t+rxxOunoDMASQr+Ibaf
         pEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zPU8K8mX10SuX1nIiSrp3KwYZ3RHW0pkIeqC3Pyqkok=;
        b=ehciPDjsUU2muDQ9jrdqvhI/TBYGlsGkTUVJAX+rFJgmN3dwQExsy1l8i9fSDojkYI
         KIskhQ4GBo/1sGC+XIkIUEWcX91Q98IyHfLA68ct0kIaU8fNRtktp5Nw+cYBAr2kEYfD
         6X9I+ZJSX2QScKBoC1c7ZvDhl0MCs4Rl1fBuiQmM+c6tWJK/AxEbOEWyZi+bq3+vX6N0
         ce6okKdTZII9hy3w0LCN3dxTvjfM0ZZnTQk/Pnd+kraehAI7zsNp1R29KSfoF+pTfcKD
         tGJt1YYg9s9IxQRhyaq5Emi0WlnLj5JzQDpeo9ufjC0hnZ73rKx+o7NqKg3LZlFB9XsO
         i6QQ==
X-Gm-Message-State: AOAM533jOlaep9sfo1gGSQd2brYALJy5Gh4JGHX7AED3YUMnTyHpNfss
        zbpFaWmo9hG9r40HLfhCZcoyv7OtRV0=
X-Google-Smtp-Source: ABdhPJykYzz6fn4GvWqYoqONjU2/EsYPbVcVjtaYD4deC7pTzwp00Au4rvNcgXE1Hf8N5cBckCNL9g==
X-Received: by 2002:a19:771d:: with SMTP id s29mr3066742lfc.521.1601587056869;
        Thu, 01 Oct 2020 14:17:36 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id f12sm712855lfp.69.2020.10.01.14.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 14:17:36 -0700 (PDT)
Subject: Re: [PATCH v7 0/4] input: elants: Support Asus TF300T and Nexus 7
 touchscreen
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Harry Cutts <hcutts@chromium.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1600551334.git.mirq-linux@rere.qmqm.pl>
 <20200930172841.GB12964@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b4144b19-9a53-1810-5092-acf932be9762@gmail.com>
Date:   Fri, 2 Oct 2020 00:17:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930172841.GB12964@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

30.09.2020 20:28, Michał Mirosław пишет:
> On Sat, Sep 19, 2020 at 11:41:19PM +0200, Michał Mirosław wrote:
>> This series cleans up the driver a bit and implements changes needed to
>> support EKTF3624-based touchscreen used in Asus TF300T, Google Nexus 7
>> and similar Tegra3-based tablets.
> [...]
> 
> Ping? Should I resend? This got only cosmetic fixups and rebases through
> last couple of iterations.

+1 We want to get a working touchscreen on our ASUS devices :)

Please consider merging this series. The upstream Nexus 7 DT is already
preapared, now just need the two-line driver change to get the TS working.
