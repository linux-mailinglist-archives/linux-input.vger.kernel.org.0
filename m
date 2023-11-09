Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF1C7E6E52
	for <lists+linux-input@lfdr.de>; Thu,  9 Nov 2023 17:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjKIQNV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Nov 2023 11:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjKIQNU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Nov 2023 11:13:20 -0500
Received: from csmtpq3-prd-nl1-vmo.edge.unified.services (csmtpq3-prd-nl1-vmo.edge.unified.services [84.116.50.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280EF324A
        for <linux-input@vger.kernel.org>; Thu,  9 Nov 2023 08:13:18 -0800 (PST)
Received: from csmtp5-prd-nl1-vmo.nl1.unified.services ([100.107.82.68] helo=csmtp5-prd-nl1-vmo.edge.unified.services)
        by csmtpq3-prd-nl1-vmo.edge.unified.services with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <gareth.randall@virgin.net>)
        id 1r17ed-002wga-Ax
        for linux-input@vger.kernel.org; Thu, 09 Nov 2023 17:13:15 +0100
Received: from [192.168.0.10] ([94.175.123.86])
        by csmtp5-prd-nl1-vmo.edge.unified.services with ESMTPA
        id 17ecrBiz2owqL17edrjjOo; Thu, 09 Nov 2023 17:13:15 +0100
X-SourceIP: 94.175.123.86
X-Authenticated-Sender: gareth.randall@virgin.net
X-Spam: 0
X-Authority: v=2.4 cv=F7RRdLhN c=1 sm=1 tr=0 ts=654d051b cx=a_exe
 a=mwdPpgLduwvwBeoi1XfOCA==:117 a=mwdPpgLduwvwBeoi1XfOCA==:17
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=f6pUZMUfAAAA:8 a=LNJ0kZsZub98i_LgeWYA:9
 a=QEXdDO2ut3YA:10 a=eZImKStj3dtCS-zw9-0K:22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgin.net;
        s=meg.feb2017; t=1699546395;
        bh=gmnvDjIbX2Ox/XpwVyc0KVOve5gGtQGoQgwCwwzMXog=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To;
        b=gilMQAjOnk9iAairnwhNU9bzMj05RUsNOMDkNkBWSjpfGDCRrzlSRL+rqz69P1QsY
         KUg2+q1n8QSfN7yd0P1Se1XfaRNAkQpLAXVwLHKDf8egAQ6JmROcEaOLgMcs0fjzbe
         Hg+peWWhnQLpUyCQ4WNtnUvYuMg+DI+Fwcoggglp58TLQqwbSNMp9Sceliaoi+3Yth
         m4T5y2//f6B68JP1ofXKXfCjQV7JoX7cwgEQNNyqUo+v5AKE4B0FStCPx+myLlQOPb
         NRGDAzTwFfv6EOJKr4VXQYJD6wuJ7wdcLMMnmQoeqTtiEvdN1JL4zArpc/7VOk16wq
         kPybfSMpgw3dg==
Message-ID: <c5140a73-a2d6-4a64-aedc-115fb01342c0@virgin.net>
Date:   Thu, 9 Nov 2023 16:13:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add support for touch screens using the General Touch
 ST6001S controller.
Content-Language: en-GB
From:   Gareth Randall <gareth.randall@virgin.net>
To:     Benjamin Tissoires <bentiss@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <4c792c2e-9de3-4faa-9948-47ddae77640e@virgin.net>
In-Reply-To: <4c792c2e-9de3-4faa-9948-47ddae77640e@virgin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBN+C1Us9tjvpo+qS+zC5vIMGbAacp6G8Z+9FewpCo8Mn7YEpLXcHpVWYxpOXYBdcAh8CSmoq8+csu/wspXyjYq5xVgJWSyE3zZnNWtJW9M7SkHTq1RN
 Z4U4gjP3TYPRJWG0ywFWILTGsWVrneJYK/N5XnH1Ybiji8V9HrGo4BQSXEu/1Y+cwbrbFtODrEV8RJzFaAMYn2oADH8o9yXgGXgGITheN/Ure+Ff4WX7h421
 /R+4K+Fqb2zfWQsYz57uWTmv9VMDi3AT5rp052Q1x5U=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Benjamin and Dmitry,

I wonder if you have had a chance to look at this patch. It was resubmitted on 3rd Oct 2023 then 
again to make it appear in Patchwork properly. This is my first patch so any feedback on both the 
patch and whether I'm following the process properly would be very useful.

Thanks very much.

Yours,

Gareth

On 25/10/2023 16:51, Gareth Randall wrote:
> Add support for touch screens using the General Touch ST6001S controller,
> as found in the GPEG model AOD22WZ-ST monitor. This controller can output
> the ELO 10-byte protocol, but requires different initialisation.
> 
> Signed-off-by: Gareth Randall <gareth@garethrandall.com>
> ---
>   drivers/input/touchscreen/elo.c | 81 ++++++++++++++++++++++++++++++++-
>   1 file changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/elo.c b/drivers/input/touchscreen/elo.c
> index 96173232e53f..b233869ffa2a 100644
[snip]

