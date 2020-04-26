Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927251B92D3
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 20:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgDZSeo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 14:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726152AbgDZSeo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 14:34:44 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF844C061A0F;
        Sun, 26 Apr 2020 11:34:43 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id l11so11933142lfc.5;
        Sun, 26 Apr 2020 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IJA3egWUkcH53DSGZF3Rx64iad0H2gjWQyiaH0PngKM=;
        b=W5t38MuoqcCRHvRZgnRc+03hf99DZKM/CjB28LEFGDDAkrxqZtYGCsPP0l7Rts9pG1
         lB2rkzANukrWyLQ/T8ClmqVEZ6rIj8Y+fG/5ZwK4fh14Ul7CaRaYWKFIu3dqqimjKaFq
         nx4CvyEbsWPfKAwKMhuG7OShQB+P8iqXpnbhPqOq0BBqKeCOG5YxFAeQXsqdWuiGw9TR
         /x+J1xZzLAdVK0DCQgpOCy6kkq44aZteNP+KljlNQ1KIAitsHAULZZA/H8Biyt1fX3qI
         ZRQ3g1j08QALhSfUZL6O9ZAMoMU8M53OI1VMq14VicBOycO9fbhZQ4UkoIfbFaWhj6Fk
         qosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IJA3egWUkcH53DSGZF3Rx64iad0H2gjWQyiaH0PngKM=;
        b=N1Ej0qaoa6ADxN/fwooMQjnEMzKvj4o7B77g0voSftUrEeLqgjyhwBmCJoTP4c+v7H
         lIJkhqtOqo1GLGVVekFngfL650Wb0mqfKIhtdw70sAPgw2zpwNj2PlIYsiwaEqTdKDwC
         ban72ILhrPsfkmqST4iqYIgQaV8zcxHtX+3jLIt6HkMxGDGR5lKFV00zzhHZ0LhZDQMk
         C6/daApYcyaPADxpvs6dzlgbepRwdNTpyH2WSKXyNC3+VylR8OE5GbTjhW6B2zkTlOQ+
         YaT6Ebo8wrjtjaShmwSJhlgx9p5DCp5/eyy3ioFUiYQTRJQ5xQNrZeReYIPa6NN6x2Ey
         5DYQ==
X-Gm-Message-State: AGi0PuYzYIhF6GRs52KSSDT89H3p2RWECc4FMQ8E2aG69mqJ88n5cqYE
        6ZC38lWg39D5UPTzJVS5qNCGpwHZ
X-Google-Smtp-Source: APiQypJ9SO+wBsO9oo2kvUbxzl/+VZq/cDoh9Dqpv7hTZ1BI6T9ubAy3+aiBoq3RPNVRjwXuP/HR2w==
X-Received: by 2002:ac2:4187:: with SMTP id z7mr13046308lfh.113.1587926082198;
        Sun, 26 Apr 2020 11:34:42 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b25sm8180281ljp.105.2020.04.26.11.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 11:34:41 -0700 (PDT)
Subject: Re: [PATCH v5 03/10] input: elants: remove unused axes
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
 <d5eee8cd305adb144a11264d70da94f7b6570366.1587923061.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <72732d30-f915-8189-9ab1-9def5b7d0721@gmail.com>
Date:   Sun, 26 Apr 2020 21:34:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d5eee8cd305adb144a11264d70da94f7b6570366.1587923061.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 20:47, Michał Mirosław пишет:
> Driver only ever reports MT events and input_mt_init_slots() sets up
> emulated axes already.  Clear the capabilities not generated directly
> and move MT axes setup, so they are visible by input_mt_init_slots().
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> v4: reword commitmsg; reorder axis setup
> ---

v5 applies cleanly to the current linux-next and everything working fine
on both Ubuntu 12.04 and 20.04! Thank you very much :)
