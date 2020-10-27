Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E422729CB8D
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 22:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374520AbgJ0Vwm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 17:52:42 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46836 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2902336AbgJ0Vwl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 17:52:41 -0400
Received: by mail-lj1-f195.google.com with SMTP id 2so3437882ljj.13;
        Tue, 27 Oct 2020 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EOfn+rTY41ZPk98ImlWCzM2uVjjLkgWeTbnbpRiwx94=;
        b=B4QspCpfrLoBxm8nbt/nY6Vc6pvrNIWz0XoyVAv6U5qDKlIhEpSOmL5MULuDcdRz4J
         NdVU97JPLEFFINpxs1bR7kXaAKKRc5t1LCYjmSEpeV3k25tRxIfa+w5hulTco0XoPAL5
         NuYRujrqdYbq/2dROB5gt/BTZEUgllml+clfdS5r0UrbBpE1TBOBE+/PavDPL2xwqXQC
         X3UQBo8IKouDxrYKv17oC5H+7ff5WfzODsT8VtCHUrF6PnvPf8QBTXbyxtNZxLCHJioF
         z5+/59liqD8IS9SzzLvJrOgdyLJ3wnvNbwVfCnJVNKk24nRT7n3gjTF0PfTy6hhJpJeE
         /YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EOfn+rTY41ZPk98ImlWCzM2uVjjLkgWeTbnbpRiwx94=;
        b=gaNuYylAcbUkjyS2Zztvxv351HMaLvo1yTeBHmjOJojSB+4cD95r6bFbrAqTN9bgFY
         J1xtPZ2TTmwvMqZbaOEipVz36C2o76Fsc6XJIg4YNkdgSB9vn7mvYVXBkNzz0WlUE1Ut
         z4/VZjpXYvheBwJrgjjnvhy9h2BLjjeOR/SXEtSlbZ21Q1e0Q7QWQR0bGG4GlNlxnrMi
         YUsoruxdjl9SVhZjdqP+N7eKsHy5pTBv/5JyP9avxgeVd2mLh/5KfiDvvkdq8ckVexdm
         3De2tGah4SbDhbCRF3XOKMidqMvzMa2duv0+IrNUI4Eez64RUo1G3kqyG9zoodnU6e+L
         yuJg==
X-Gm-Message-State: AOAM530Z3fhEcSBKEWndZ53RHz0F4BiSnKxn95Vusw0y+eqXa3RXCr35
        cFKKeKOCIj6710yJQ1EEWWo=
X-Google-Smtp-Source: ABdhPJxqwwB2L+NAENWqofO9hI5lVEPJjt9KYwjz/a5RXKvfYnoEDFODsN2229mWTIkaTH7zqrcUAw==
X-Received: by 2002:a2e:8985:: with SMTP id c5mr2100186lji.406.1603835559052;
        Tue, 27 Oct 2020 14:52:39 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.googlemail.com with ESMTPSA id v16sm303423lfq.68.2020.10.27.14.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 14:52:38 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] implement I2C retries for mXT1368
To:     "Wang, Jiada" <jiada_wang@mentor.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        erosca@de.adit-jv.com, andrew_gabbasov@mentor.com
References: <20200930151259.18119-1-jiada_wang@mentor.com>
 <653c24a4-704a-4d65-2622-49c55a82c901@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <082b9b1c-5f89-7deb-728b-3de4339ac131@gmail.com>
Date:   Wed, 28 Oct 2020 00:52:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <653c24a4-704a-4d65-2622-49c55a82c901@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

21.10.2020 04:14, Wang, Jiada пишет:
> Hello Dmitry and all
> 
> Kind reminder on this patch-set

Hello Jiada,

Thinking a bit more about these patches, I'm coming back to the variant
with the atmel,wakeup-method property. There are three possible wake-up
variants for mXT1368:

  - NONE
  - GPIO
  - I2C-SCL

and this series covers only the I2C-SCL.

I was also skimming through datasheets of other maxtouch touchscreens
and noticed that the retries aren't unique to mXT1368. For example
mXT3432 controller also needs exactly the same retrying logic.

Hence I think it should be better if we could generalize the
wakeup-method in the device-tree. What do you think?
