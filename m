Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250761D5003
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 16:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgEOOIF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 10:08:05 -0400
Received: from mout-p-102.mailbox.org ([80.241.56.152]:17500 "EHLO
        mout-p-102.mailbox.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgEOOIE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 10:08:04 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 49NqxY6pWBzKmcq;
        Fri, 15 May 2020 16:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-language:content-type
        :content-type:in-reply-to:mime-version:date:date:message-id:from
        :from:references:subject:subject:received; s=mail20150812; t=
        1589551673; bh=qv1xNIRxXTkvkBNyyMVAn5b8Ba07+r3xwLtiauKCVTs=; b=x
        7FsSMeRd62wU+YsfopNMCegjFBHtJ7kJ3eNOwzjhpT8yolYlJhLaBTzLvNikJnnc
        kd4UdHWCocKdVIxTFKxKClv7D3NFs8XcVcSAiX7N11PvFGbpKcdp8gI67aZBbEl4
        qv/gpK1wCUp/s8MXKZ8rQoCOkFKIzS6J5E5wmyqRpJFWfAA49MJLXBhUbzgHUbh3
        +KTuxjV6T80Zn/WGPBMKqwmKRLoacEJslXkH78tCcJ+6vkmqJRxLMPU0zNXF2w0B
        RA/4PnPj258OpnN/D/LlAui3/ehRIpChHKQl62r+sqwkuNmKV+Mp5rFudN7Yq8eJ
        ezQqzSNG40SlnuEJ6eNBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1589551677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rb+uR4nJRc2QwiNLGPRwPBQIIOQwboa4xHyF3v/J6GE=;
        b=yXZ59Xkm/AR/Ooe4/n6DdvX+QWTLzpR4RD1cTDWYWA/vY2tDQt7XDEGHJRYROB0KEp5c82
        shwwhXdcwO5sg7OGwo3WkIoKxjrO6PwgF65Y7jDJDrZOOU7cDZ2RoAXxtmffw5JGVQeqe1
        5FSLrhsJFuJcpD9srQTmkFHPlbDlNNwNdQO686ZgZnqi77RCFrUpWB3sL0f6pzOBzw2coU
        A+qTAMa239QWvW8obaamD+/pFR6zxy0fhjM/w1E5LXXLw9AfYjZobN3dqmDzwd9Ghvxypj
        f73LvVKAXNw7aOxLeNCzzDBXRxPGCoOjO0pXpubcq66VM0D+nALv1O7N03wotg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id JoIvjFjp25qn; Fri, 15 May 2020 16:07:53 +0200 (CEST)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor
 Yourbook C11B
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Otmar Meier <otmarjun.meier@nexgo.de>
References: <20200512204009.4751-1-bernhardu@mailbox.org>
 <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
 <CAHp75VejzaZL26ztQMFGjAAMC3B8mkSnXSvGhyFeiHUbUUpp=w@mail.gmail.com>
From:   =?UTF-8?Q?Bernhard_=c3=9cbelacker?= <bernhardu@mailbox.org>
Message-ID: <4787d347-b761-6283-7f9d-34c1a11b909f@mailbox.org>
Date:   Fri, 15 May 2020 16:07:52 +0200
MIME-Version: 1.0
In-Reply-To: <CAHp75VejzaZL26ztQMFGjAAMC3B8mkSnXSvGhyFeiHUbUUpp=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8BA321778
X-Rspamd-Score: -4.91 / 15.00 / 15.00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Am 13.05.20 um 19:17 schrieb Andy Shevchenko:
> On Tue, May 12, 2020 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>> On 5/12/20 10:40 PM, Bernhard Übelacker wrote:
>>> Add touchscreen info for the Trekstor Yourbook C11B. It seems to
>>> use the same touchscreen as the Primebook C11, so we only add a new DMI
>>> match.
>>>
>>> Cc: Otmar Meier <otmarjun.meier@nexgo.de>
>>> Reported-and-tested-by: Otmar Meier <otmarjun.meier@nexgo.de>
>>> Signed-off-by: Bernhard Übelacker <bernhardu@mailbox.org>
>>
>> Thank you, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> This doesn't apply to our for-next.
> Please, rebase, add Hans' tag and resend, thanks!


Hello Andy,
I am not sure against which git tree I should rebase?

I tried to rebase against the branch for-next in the git tree below.
And tried to apply the patch saved from my
thunderbird and got no error.

Is this the right git tree?

Kind regards,
Bernhard


$ git clone -b for-next --single-branch --depth=10000  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
$ cd linux-gpio-intel
$ LANG=C git am ../'[PATCH] platform_x86: touchscreen_dmi: Add info for the Trekstor Yourbook C11B.eml'
Applying: platform/x86: touchscreen_dmi: Add info for the Trekstor Yourbook C11B
