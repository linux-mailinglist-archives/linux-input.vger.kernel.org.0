Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06A4A97F58
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 17:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbfHUPsa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 11:48:30 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:29549 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbfHUPs3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 11:48:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 319A93F6FD;
        Wed, 21 Aug 2019 17:48:26 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=ecCdMDUX;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5_BESL_KmbX2; Wed, 21 Aug 2019 17:48:25 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        (Authenticated sender: mb878879)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B41E23F6DC;
        Wed, 21 Aug 2019 17:48:24 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        by mail1.shipmail.org (Postfix) with ESMTPSA id EB2EA3602D6;
        Wed, 21 Aug 2019 17:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1566402504; bh=fcgSl5DKVkYug+EcSMguajG35Q4SWrsZPSDglOO5M/I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ecCdMDUXP+o2fIzs4cRai9GmFjJWyqXjqO7bcLjHnOTjhjkzH167yNCB8CYywNbMi
         iEf4XMgEk9k4bQsljRIdtpdEucWmIkckNcA7e1O+aDpOe82ub7qGTfMIyfPepJB51+
         OIn5udOtHF0ggr4ekNoMg9EaTOS+dRcgZCrPxZFE=
Subject: Re: [PATCH 4/4] input/vmmouse: Update the backdoor call with support
 for new instructions
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, pv-drivers@vmware.com,
        Thomas Hellstrom <thellstrom@vmware.com>,
        linux-input@vger.kernel.org, Doug Covelli <dcovelli@vmware.com>
References: <20190818143316.4906-1-thomas_os@shipmail.org>
 <20190818143316.4906-5-thomas_os@shipmail.org> <20190821050925.GA566@penguin>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <027a55d6-ab26-ef9c-bd89-93a38f96160b@shipmail.org>
Date:   Wed, 21 Aug 2019 17:48:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190821050925.GA566@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/21/19 7:09 AM, Dmitry Torokhov wrote:
> On Sun, Aug 18, 2019 at 04:33:16PM +0200, Thomas Hellström (VMware) wrote:
>> From: Thomas Hellstrom <thellstrom@vmware.com>
>>
>> Use the definition provided by include/asm/vmware.h
>>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: <linux-input@vger.kernel.org>
>> Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
>> Reviewed-by: Doug Covelli <dcovelli@vmware.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> Please feel free to merge with the rest of the patches introducing
> VMWARE_HYPERCALL.

Thanks, Dmitry!

I have a version 2 of the patch were the only difference is that edx is 
initialized to zero which is default for vmcall / vmmcall. Can I use 
your ack for that one as well?

Thanks,

Thomas


