Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAF41B8C70
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 07:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgDZFHX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 01:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgDZFHW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 01:07:22 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D98EC061A0C;
        Sat, 25 Apr 2020 22:07:22 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w20so14102889ljj.0;
        Sat, 25 Apr 2020 22:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bYYfhlVc230cUEQXLUimh3+Fbi6Q5/VVVFCJXS/e1K0=;
        b=dkKLYsBlbtZ2hV8zfc4gt/zlOJ/n1OEoeDDmLcszlBhZfJm2sj7ObGRDY21mFC54RG
         /y4UF2UmG0Ppi2bS2rGhDx1JpL15Snna5zyDoNCwxAFflZN516PmfI6pYFBMd8soxsD0
         g2SzV9wno4alLR39NvmlTa55fp+udqO2MSBV+25Ubn//EO2yERJGjZ09OKBZjtKSR0H2
         OghnKZMfC0k/SlU4jv8Rms8R8VQm3wmV9R80fTPYaiRlWzdLUJSpUCde4mrB3iK2XUhC
         CwJf1LocGz2XMEcEl+JSazH03agK9KN7vkMaGnNLRfGSM6qX/0jvS52zBAzo6Nh4Y009
         aI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bYYfhlVc230cUEQXLUimh3+Fbi6Q5/VVVFCJXS/e1K0=;
        b=uYNgd88PtclN/qdBdQp6CbGMZoks/8nmsx/vSvRDTox6DMMG1pClhOXhJpa70ShwJ5
         WrODzLJLodyTkM9m/NwzQsvTngEyaceKpvHgz1FZdxm/t3YT8ujvabqmeXpP47FEFLlv
         Yzmdg2rupH3s8F05kruv1KRb3SH/azC/pbQPHdlZQDODUMYz5RIHc6f4T0uvYuJffPCs
         kFs15u8yoL+zUVYaB0jvCMN27HB/BjSeTyTuMUyITHVQnmzKkPfDF1oqPIz4B6z7g+TI
         8yCw8cN/457bApv6xIRPNXPokZ/OyF1Z3S2irsAuELbkJm2QGzaspr0m6sMbCNsB2Cu+
         7y3w==
X-Gm-Message-State: AGi0PuYPO/EellOo6CbevEldvDNdyRGdu23Jgi0g86p29VaqvyLk1wdP
        yEHmQGf16oSjn7orGkPMdsXEZqjF
X-Google-Smtp-Source: APiQypIqgtbtJgJApRmtsyeSUhTODKYJQijT+HhroXaWxQr/sBAzQTCyJ/JiqoIFJrQmCRNIpE5+hQ==
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr10780045ljk.134.1587877640551;
        Sat, 25 Apr 2020 22:07:20 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j24sm6388931ljg.60.2020.04.25.22.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 22:07:20 -0700 (PDT)
Subject: Re: [PATCH v3 3/9] input: elants: remove unused axes
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <62e897b0d6f6054dae26c853a9a1f1fb6d3c420b.1586784389.git.mirq-linux@rere.qmqm.pl>
 <20200426045200.GN125362@dtor-ws>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9658bf1f-6339-cf47-9843-a1ac5a0de9d6@gmail.com>
Date:   Sun, 26 Apr 2020 08:07:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426045200.GN125362@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 07:52, Dmitry Torokhov пишет:
> On Mon, Apr 13, 2020 at 03:32:23PM +0200, Michał Mirosław wrote:
>> Driver only ever reports MT events. Clear capabilities of all others.
> 
> This is not true. input_mt_sync_frame() calls
> input_mt_report_pointer_emulation() which does emut single-touch events
> for the benefit of older userspace (or userspace that is not interested
> in multitouch).

That's a good catch, thank you very much for the clarification!
