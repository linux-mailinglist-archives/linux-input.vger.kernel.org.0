Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD701B91AE
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgDZQYU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726146AbgDZQYS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:24:18 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F5DC061A0F;
        Sun, 26 Apr 2020 09:24:18 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w145so11766571lff.3;
        Sun, 26 Apr 2020 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1rwgSnwTVJnobIMor+102bHXnC1wPqkfj6KAxAT+DoA=;
        b=uQUuL+cGnRzSkkTGBaXaQude2WmhJRUb1BbC6AwPx2ObLoeSenfug8YbQWWABgjbsj
         BGjMnKRYgwspj+GA/ahMaIF9jWIxdygzqvn8/Xlovvv17kczxBioqQT8qUepsEuvql+G
         54bNZyQPLQRYwUPTDdQWpHWMLGlY663jSPKvLd/UBGWB2iuepmyZWALug/toqilOtB+n
         B63MKljV79LHu4t5Dfklhe5V6jScD6Mo5KgHLYVtQYX3hM6joiGsGzLtnrRKNcKSgDTw
         2PzzrdKC6NwHB4BUYo0+05kp9AIsn1gWaDAwm0oLityScAMEEehWFaz9TrzPhcNjrkgT
         CySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1rwgSnwTVJnobIMor+102bHXnC1wPqkfj6KAxAT+DoA=;
        b=SlQsOjsE8xDLgJDFBu3SVcgFcvHQkxfOxX0YqHPJP9gKyM81S9p8Nlc/gLuny9yQzv
         Kn2y6KvPbeP43glTtRPnOHNL+TpfdYdb70shIp80OdeTYRJ/u7weQBEh5/8Vi/K6bG5F
         CsRsZvODjdj/n6fZiR8ineEaf1C1iJRoms3bA2gGSRMLLrYMsyMsPMJmLu9TcDGsSYeo
         /uwDf4z/12zCRniN1IcIqH9mOR/0Bw1e1j1oBpZXRXi20aVqm1Fr2vdLvjhOQvurnEjX
         qRC2odRjPSq54wZII0UP8FeiRm9o7DrJzhA4Yo4Qiz/D7lWAmtGnHHgs/WIU4ntApyO6
         yncw==
X-Gm-Message-State: AGi0Pub31glLeXtBh8MkYNpxKvo0pfQaNZAYyYFGuvXQK21cVZhCCtqm
        vNUdTOfVuioMM8oov2cNfr5Y7AX4
X-Google-Smtp-Source: APiQypKM7C0pF6ZwQpzWgt7uDDQQApNfqA25SL9MCa4irTNQfjpNpV8b7vDpLy7L9I4+ALxHKc0SjQ==
X-Received: by 2002:ac2:51c9:: with SMTP id u9mr13125082lfm.184.1587918256433;
        Sun, 26 Apr 2020 09:24:16 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id h6sm7882990ljj.29.2020.04.26.09.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 09:24:15 -0700 (PDT)
Subject: Re: [PATCH v4 05/10] input: elants: refactor
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
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
 <4e5bf76e695388d6aeefa00552675c0617c044f1.1587916846.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <127c4cf0-9bf0-60a4-bc48-28988ae24967@gmail.com>
Date:   Sun, 26 Apr 2020 19:24:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4e5bf76e695388d6aeefa00552675c0617c044f1.1587916846.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 19:11, Michał Mirosław пишет:
> Apply some DRY-ing to elants_i2c_execute_command() callers.  This pulls
> polling and error printk()s into a single function.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
> v4: return 0 on success; use %pe for error code
> ---
>  drivers/input/touchscreen/elants_i2c.c | 189 +++++++++++++------------
>  1 file changed, 96 insertions(+), 93 deletions(-)

This patch doesn't apply to the recent linux-next, it needs to be rebased.
