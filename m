Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A111D3DCE
	for <lists+linux-input@lfdr.de>; Thu, 14 May 2020 21:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgENToG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 May 2020 15:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727794AbgENToG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 May 2020 15:44:06 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44754C061A0C;
        Thu, 14 May 2020 12:44:05 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 202so210523lfe.5;
        Thu, 14 May 2020 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BMdjGqJJ8ssmFnmYzHxNscWHpY/RONcr7JQJoulgYjI=;
        b=KZYUKUu/8Tkdkzh69ywETAYQUBPnp9MPKTcz+dyyV+ArC3oijPVh2o5ZJ/mmUhIajq
         cmO+Lpav++xun9s8fNG1Exb1bSETkJw5jKfVEv0KGtHFJBAqkz8yuZ4nPMwdL6PYb8cH
         HKpr8RhBdGaJsSCAMEvcaeu0NuJidn4djo6PCjQSr1uY8Vf+2pHj7nZLfIsh2z8wnWIq
         kCZF3kDM1NQ/8RemewbQsGG0uUxNl8hvy5MMjeriRqEomiprDwMaKoD1+6Gs8jqlyI+b
         /NFoplWonx+XNCumbv9vWSHBA2W3W53xR1pVqJDDOeTS3qBDq6GNf6RvIG5l//GY+ivc
         gRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BMdjGqJJ8ssmFnmYzHxNscWHpY/RONcr7JQJoulgYjI=;
        b=ED2qHzifLur5m8PhtAbc9wbxudZBUoyMFUMV8pfVlJolwWzvLPfxMt58djpeUw0zhP
         zNRyz1Azd3ajMcWWpk50O6W3/Jao80/WFxoNwHnecTI82MlKOl8EomPK/QTH/RNT08EG
         iPfESK7Sv3YYBVSWXa0a/EeylrNkAVDFG5Ojt2ebQDP4+MdiiOdA1f/GsOS/5Ogw81B5
         NubNUAnb2whDRvmmeryQCS0poq7XN1t8jRGEIMayJqzBXy04YYmTjCJkwn+XhQfcFapT
         KjEiu7GQgP2DHq0Fl5zAKirotHlRZLXy3tU+tbKzHJ0kmwFey7APovo9ZjcFEv65K28k
         9w/Q==
X-Gm-Message-State: AOAM531e5eyBffeZy1mM5KSJ/H8muoBi/L5IQX1bhRemfut2VARjY3ri
        XhGHb0AcCS+Q22CzGV7dnPkvQRe7
X-Google-Smtp-Source: ABdhPJyu22xVU0I89ReSZT3aNK9UsV93o7/8h2UhjxQWejmC0P0POzC4pPB2E137f99YjKU4Cq0jdg==
X-Received: by 2002:a19:bc4:: with SMTP id 187mr2547325lfl.211.1589485443545;
        Thu, 14 May 2020 12:44:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 192sm1995664ljj.41.2020.05.14.12.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 12:44:00 -0700 (PDT)
Subject: Re: [PATCH v5 05/10] input: elants: refactor
 elants_i2c_execute_command()
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
 <6c576f688b385235c65b461410a917080d27e825.1587923061.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4d99b640-6e22-7a81-62ef-4097c43c5bbc@gmail.com>
Date:   Thu, 14 May 2020 22:43:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6c576f688b385235c65b461410a917080d27e825.1587923061.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 20:47, Michał Mirosław пишет:
> Apply some DRY-ing to elants_i2c_execute_command() callers.  This pulls
> polling and error printk()s into a single function.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
> v4: return 0 on success; use %pe for error code
> ---

Hello Michał,

This patch needs to be rebased on a newer linux-next once again :)
