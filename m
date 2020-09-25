Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620712792D4
	for <lists+linux-input@lfdr.de>; Fri, 25 Sep 2020 23:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbgIYVBa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 17:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgIYVB3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 17:01:29 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4B2C0613CE;
        Fri, 25 Sep 2020 14:01:29 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y17so4264045lfa.8;
        Fri, 25 Sep 2020 14:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BQyjYQtCtuhPAPId7Dby+jJP67H0xH2ESF6/ISlNnrw=;
        b=Q5iekE0AKzfUpBVn2rJiiGCVa7/I+zPMJYdiL0rhnMo3rBpek/0PCeD/xBHtnfaUlw
         x7AKwYb8bREktorxywDmtUm1AJh4qfj3qYYxyOMI+cxc42t0vnLxBeBtxfHRidHWMrFf
         OpDdoFl/WoH9ihHFd7slMMTbZENaShBKKdOOMZNEk2Rrev4Q1/pqr3SkxMWLX5PytUDW
         XnPlLXJ38Rudc5FldX8L3eIalEIkI8zach+ps/PO2YmHuaPnN29P1qZnJihk8R9MVVwW
         kg0yLe3rFO0TEZ3FTlplzxeuFlDCQJczmWMyPgnaKNqp5b0B/G+SX8ci32ccFMkJR/LM
         sTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BQyjYQtCtuhPAPId7Dby+jJP67H0xH2ESF6/ISlNnrw=;
        b=UfAhEsvvDacY4wT2MtswgbTNjjTR6VQqtmr78EiNRoGgDIazlWdbz+bDu7tC8qjgvf
         vhiFtfB+fwj3DICul7l92gisCYav8qDmBJ0NfxuU6rC4iOeizzNC+7dRyjKKWLz8LS5m
         iJp3kV2Xe1fWHdntdI8T/yRfhjQuEzoEbEIiJ2LJ3D7enAsMOyCHP3Vsma7Qju29HBEC
         NLo0/3k8y1C90/d9OcYlEKy8G4HlwGmhHfBkqLMzAFE2zqMYe7aBlr4cNaTjL6s+aown
         MANe2tVt9Nxc1R80VUASAvUFV6USNhdIdiEkKPASr6Yj4vtWV91Kiz6Lus/XvyAlyKxV
         1yEQ==
X-Gm-Message-State: AOAM533Zyc+/rzJplO3AGHgFVv2sBvPDgz2XsULHygwIGeRcyYip+Dw0
        T3zDIIGhPHAD2J3490nXEdE=
X-Google-Smtp-Source: ABdhPJwUPO/Vngdisdk70i0bnv2Bd1fzwhekUzf6tGl3zNph4reGBpo3XbOqN6ZIz78woCcxgrhAOQ==
X-Received: by 2002:a05:6512:34d3:: with SMTP id w19mr114456lfr.418.1601067687468;
        Fri, 25 Sep 2020 14:01:27 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 80sm180958lff.61.2020.09.25.14.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 14:01:26 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] Input: atmel_mxt_ts - implement I2C retries for
 mXT1368
To:     Jiada Wang <jiada_wang@mentor.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        erosca@de.adit-jv.com, andrew_gabbasov@mentor.com
References: <20200925135257.21138-1-jiada_wang@mentor.com>
 <20200925135257.21138-3-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <285f5b25-820c-4402-0ebf-5bac87c95d84@gmail.com>
Date:   Sat, 26 Sep 2020 00:01:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925135257.21138-3-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

25.09.2020 16:52, Jiada Wang пишет:
> According to datasheet, mXT1386 chip has a WAKE line, it is used
> to wake the chip up from deep sleep mode before communicating with
> it via the I2C-compatible interface.
> 
> if the WAKE line is connected to a GPIO line, the line must be
> asserted 25 ms before the host attempts to communicate with the mXT1386.
> If the WAKE line is connected to the SCL pin, the mXT1386 will send a
> NACK on the first attempt to address it, the host must then retry 25 ms
> later.
> 
> This patch adds compatible string "atmel,mXT1386" for mXT1386 controller,
> when I2C transfer on mXT1386 fails, retry the transfer once after a 25 ms
> sleep.
> 
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 62 +++++++++++++++++++-----
>  1 file changed, 50 insertions(+), 12 deletions(-)

Hello, Jiada! Thank you very much!

Will be nice if this patch could land to v5.10 :)

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
