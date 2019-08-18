Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC6D991921
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2019 21:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfHRTCN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Aug 2019 15:02:13 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:19662 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbfHRTCM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Aug 2019 15:02:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id EE8A03F5D8;
        Sun, 18 Aug 2019 21:02:10 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=e6ADa6DI;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RtjjeeE_0a0f; Sun, 18 Aug 2019 21:02:05 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        (Authenticated sender: mb878879)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 1F2353F3CA;
        Sun, 18 Aug 2019 21:02:04 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        by mail1.shipmail.org (Postfix) with ESMTPSA id A3EF73600A4;
        Sun, 18 Aug 2019 21:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1566154924; bh=QD74X2zD00rdDP7NXD6PIUVVZJhrV7nnVmg1fgTnvr8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=e6ADa6DIDDmRwVfyARNhvqNHIUop3o0deyShz0BRGoIab9l/bTak3EWDcxIW3V19c
         sQvpEAK1xXK9WCBP6cGjFnukIiPkuecm3ZEu0ccqKqGqnJMAfYa4oMkVQSJTjdHG+e
         CXxZNmk+aWnL9baXCKtpeRqbNeJjWetkOzbQkNzw=
Subject: Re: [PATCH 0/4] Add support for updated vmware hypercall instruction
To:     Borislav Petkov <bp@alien8.de>
Cc:     linux-kernel@vger.kernel.org, pv-drivers@vmware.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <20190818143316.4906-1-thomas_os@shipmail.org>
 <20190818180929.GA29353@zn.tnic>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <c0f32d6b-3b6a-f931-071f-9fb308efba00@shipmail.org>
Date:   Sun, 18 Aug 2019 21:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190818180929.GA29353@zn.tnic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/18/19 8:09 PM, Borislav Petkov wrote:
> On Sun, Aug 18, 2019 at 04:33:12PM +0200, Thomas Hellström (VMware) wrote:
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: <x86@kernel.org>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: <linux-input@vger.kernel.org>
> In the future, when you CC people on patches, pls CC them for all
> patches - not only a subset. Had to fish out 3/4 and 4/4 from lkml.
>
> Thx.
>
Hmm. Ok. I'll keep that in mind.
I was trying to be clever and avoid spamming people with stuff they 
might not care about.

Thanks,
/Thomas



