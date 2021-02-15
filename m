Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E6131C325
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 21:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhBOUno (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 15:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbhBOUnn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 15:43:43 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA07AC061574
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 12:43:02 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id i23so7114086ejg.10
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 12:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=ixg1ygQwMAIzmWmi4aZ6baIekeiK3vHVeqFnm5gcUm8=;
        b=SE5zjvVnkBJvIkb/4hUZhvmndPwePnfxd0eQCjH8XNJXkMG+yhk7rl2NoGwFut9mTF
         S3whyBXV44m2btySEZTp86Spaw1TAVtpb7Xs+QTI557U7ivG14WK9KjSpL9unmJZ3c3b
         Oi5WTMolX/Qkrp22y6/DQHZJ61n+YDJ52CFdjroFCMr3YApQJmbsIe0MwitEpKSFM8lW
         UigK0L9RGP+i1ijOpG8xbICpvf0wLnHYpOgrYQZYgF5pc+qisf/9jD1i3nVomIyDTlo5
         sirVKLXg3jCmRNpQrQh7J8v151AajUB+h8cbt0WgRUvZjbqt510CV0HLhimwPL4rQ18J
         8vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=ixg1ygQwMAIzmWmi4aZ6baIekeiK3vHVeqFnm5gcUm8=;
        b=gvJM8xLmxOdh+/9cBqjw4M72jDVIi5JOO8CiPNZCdvFHNFJ+zxwxqslb9oId8sg5QU
         lVGWLP6YxH9C5r6GdT9BLzP6tgWMO7iUqMFJf74CxwHQDfOoDdRvJsw7Yl8NG6JCwu6I
         rjjPwCFUCeWLqUCPR90zKS1Z1QdEPUH1EU4sqj6BJHDfjOQE5FJ+qELoJiSOi/4K4DZt
         8LAZ1N2rz+0UB9EdI/3x7uHd2NyS5axhHN2FTR0cMewQdJ/1TUWIzvdl71KuHUSgiiu7
         a4ISleKrX6UmSImaOFLRyJIO7FGZNEn94SZ4nv/bm1ylPuKUoGN67hFRxjHpm/2LuA37
         OlcA==
X-Gm-Message-State: AOAM530wWmjGpPMxGBpSl17tOq0gWWH6wnzQrnWW2cz7LxOkKxV6XA/2
        zjJwqZ3paJWBbj755boZsq/DxV6xnm0z1A==
X-Google-Smtp-Source: ABdhPJw9I3BtXvBchoKUJV9DtCdgQxiPlz5bYT0XlpivaM4TT14XjdRM2mfNwhCVJWqLmuO4r3cW9A==
X-Received: by 2002:a17:907:78d5:: with SMTP id kv21mr17392346ejc.461.1613421781352;
        Mon, 15 Feb 2021 12:43:01 -0800 (PST)
Received: from [192.168.1.100] (host-87-21-45-201.retail.telecomitalia.it. [87.21.45.201])
        by smtp.gmail.com with ESMTPSA id bn2sm11582154ejb.35.2021.02.15.12.43.00
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 12:43:01 -0800 (PST)
To:     linux-input@vger.kernel.org
From:   Gennaro Cimmino <l0rdg3x@gmail.com>
Subject: HID: 258a:0001 SINO WEALTH USB KEYBOARD
Message-ID: <9152f235-83c2-abc7-0c9f-e07eafa406e2@gmail.com>
Date:   Mon, 15 Feb 2021 21:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Everybody,
someone can take a look to this bug?
https://bugzilla.kernel.org/show_bug.cgi?id=211679

tested with kernel 5.11, not work.

Thanks in advice.

Gennaro Cimmino

