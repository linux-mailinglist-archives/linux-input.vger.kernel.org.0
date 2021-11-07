Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E9A447327
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 14:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235440AbhKGN6O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 08:58:14 -0500
Received: from smtpq1.tb.ukmail.iss.as9143.net ([212.54.57.96]:56902 "EHLO
        smtpq1.tb.ukmail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229679AbhKGN6K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 08:58:10 -0500
Received: from [212.54.57.110] (helo=csmtp6.tb.ukmail.iss.as9143.net)
        by smtpq1.tb.ukmail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <gareth.randall@virgin.net>)
        id 1mjidp-0002WK-4y
        for linux-input@vger.kernel.org; Sun, 07 Nov 2021 14:55:25 +0100
Received: from [192.168.0.10] ([94.175.123.86])
        by cmsmtp with ESMTPA
        id jidomciup24zojidpmuFr5; Sun, 07 Nov 2021 14:55:25 +0100
X-Originating-IP: [94.175.123.86]
X-Authenticated-Sender: gareth.randall@virgin.net
X-Spam: 0
X-Authority: v=2.4 cv=K8YxogaI c=1 sm=1 tr=0 ts=6187dacd cx=a_exe
 a=mwdPpgLduwvwBeoi1XfOCA==:117 a=mwdPpgLduwvwBeoi1XfOCA==:17
 a=IkcTkHD0fZMA:10 a=vIxV3rELxO4A:10 a=f6pUZMUfAAAA:8 a=qsNWos9tGE8nN0yM_qkA:9
 a=QEXdDO2ut3YA:10 a=eZImKStj3dtCS-zw9-0K:22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgin.net;
        s=meg.feb2017; t=1636293325;
        bh=At6jo9YpfsdHSsdeZ2+dydcmt8Eyh5MnpCGfulD85qY=;
        h=Date:From:Subject:To:References:In-Reply-To;
        b=UD83caO7NpPxhpULwqB+ltqBuIGNHiiOyTTdx09sxVlYMNZfSVRv093hQa4TXFanQ
         ggUw8pgas4Bf0BKKY8LQwcudeuCTjPCdXCz+dKfJYLxvI9kPrgXw9hc4g2xGkuoG/6
         ZUwMnpx6o0G+A3cQIF/evA7wDLPxAoMlh0TTVQezBnCrslz922bsKpITKp86eUVqVl
         GP4BkyfE8eRBg1iLNCoD1cJd93YC/xRGyCw3ZJCegOVp6Q2HiWigIwlBB4AdtqHGzE
         phiTWPWw+t8YsKD6szv/u1ekrVrBo2pyBopPa3ws8C/PSqLtPVvVYda9oDc1c6DKXr
         mDTd5Z3rnT/iQ==
Message-ID: <e57b034a-4057-0781-32af-cc921aaa63f0@virgin.net>
Date:   Sun, 7 Nov 2021 13:55:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
From:   Gareth Randall <gareth.randall@virgin.net>
Subject: Re: [PATCH RESEND 1/1] Add support for touch screens using the
 General Touch ST6001S controller.
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
References: <b7687459-1665-eb1c-b8ad-2bb37b7136ac@virgin.net>
 <3083b553-38f1-7061-a8cb-8bbd423913a3@virgin.net>
In-Reply-To: <3083b553-38f1-7061-a8cb-8bbd423913a3@virgin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHnDXYNXWiZnefs4rluqFPFiWD/14CA30aALXh1jsFGjdAMtsHw5QE2pPFntdJnHIJZjAiDaQTvHnAhvgNCRdbYDwvR970SkHQXavP9LBZ0mAjYRbQls
 culxmhTPHmrGvGFyMVAEhQsfDLmS+c72C6GE1pu5MKeht8Nob8JpQ+Ih9T2asVJHVB3hJveOdkl5slqdJNbKPIf9Ce5oIPJizx5Z2w7OcxHsQ02A4rq4NKPD
 ieHuCMPPLucZ2mOkQLFhvg==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Dmitry,

I wonder if you have had a chance to look at this patch. It was 
originally sent on 26 Sep 2021, then resent on 3 Oct 2021 to try to make 
it come out in Patchwork properly. This is my first patch submission so 
any feedback on both the patch and whether I'm following the process 
properly would be very useful. Thanks very much.

Yours,

Gareth

On 15/10/2021 10:04, Gareth Randall wrote:
> On 03/10/2021 22:54, Gareth Randall wrote:
>> Add support for touch screens using the General Touch ST6001S
>> controller, as found in the GPEG model AOD22WZ-ST monitor.
>> This controller can output the ELO 10-byte protocol,
>> but requires different initialisation.
>>
>> Signed-off-by: Gareth Randall <gareth@garethrandall.com>
>> ---
>>   drivers/input/touchscreen/elo.c | 58 +++++++++++++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
> 
> Hi,
> 
> I'm seeking feedback on this patch. I just wondered whether I have made 
> any mistakes in the submission, or whether the maintainers are just very 
> busy (most likely explanation!)
> 
> I know that this does not appear properly in patchwork even though I 
> have attempted to recreate the exact format of a [PATCH] email, but I 
> don't want to send duplicate attempts. I've checked that there are no 
> wrapped lines in the email message. Is there a test suite that is 
> failing that I'm not aware of, or conventions I'm not following?
> 
> Thanks for any feedback.
> 
> Yours,
> 
> Gareth

