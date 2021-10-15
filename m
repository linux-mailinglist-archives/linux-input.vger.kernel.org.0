Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995CA42ED13
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 11:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235730AbhJOJGo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 05:06:44 -0400
Received: from smtpq2.tb.ukmail.iss.as9143.net ([212.54.57.97]:52932 "EHLO
        smtpq2.tb.ukmail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236176AbhJOJGn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 05:06:43 -0400
Received: from [212.54.57.105] (helo=csmtp1.tb.ukmail.iss.as9143.net)
        by smtpq2.tb.ukmail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <gareth.randall@virgin.net>)
        id 1mbJ8l-0001ol-VY
        for linux-input@vger.kernel.org; Fri, 15 Oct 2021 11:04:35 +0200
Received: from Gareths-MacBook-Air.local ([94.175.123.86])
        by cmsmtp with ESMTPA
        id bJ8lminNoCNEAbJ8lm8NWt; Fri, 15 Oct 2021 11:04:35 +0200
X-Originating-IP: [94.175.123.86]
X-Authenticated-Sender: gareth.randall@virgin.net
X-Spam: 0
X-Authority: v=2.4 cv=FJJ4e8ks c=1 sm=1 tr=0 ts=61694423 cx=a_exe
 a=mwdPpgLduwvwBeoi1XfOCA==:117 a=mwdPpgLduwvwBeoi1XfOCA==:17
 a=IkcTkHD0fZMA:10 a=8gfv0ekSlNoA:10 a=f6pUZMUfAAAA:8 a=pxEa-ggxQuoDI8LJs2gA:9
 a=QEXdDO2ut3YA:10 a=eZImKStj3dtCS-zw9-0K:22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgin.net;
        s=meg.feb2017; t=1634288675;
        bh=Z9EnhiqfIYwYOKEtKwn0TGY7w2/AkExMFyl7fsRLUUI=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=k9qq9bBKozzudsrYXZ6DHx+sfGRpvVLBXPcKKtZ3PH2e+7ep9eHs7jqZ+PfYdQMDO
         ZzUUbMeMrvXEJei+tJA1Yg7Sp9H4B7PwDfa6psSEOWB+8rUI5yik43cWrFi1X11m0Y
         OKEwva4Jjl5NXSQWj3uWJFAu2QkzXlkeJqHcI0OAZEMAlIpCtmatLrpgHzhQ2Ed9R8
         xrUIz62acxuK9EFuXWHEnycnvXWCYhWppDwkQjJHO4f7ICVKduFksIj5DFrV1GkD4D
         EXB8NiStQlktmDYSLlt2DhV+oP7gu0H6ksoAZAaOZXaRJYTqmcKQdBTFXkLWAdIQnU
         h5bEwrcuUbgLA==
Subject: Re: [PATCH RESEND 1/1] Add support for touch screens using the
 General Touch ST6001S controller.
From:   Gareth Randall <gareth.randall@virgin.net>
To:     linux-input@vger.kernel.org
References: <b7687459-1665-eb1c-b8ad-2bb37b7136ac@virgin.net>
Message-ID: <3083b553-38f1-7061-a8cb-8bbd423913a3@virgin.net>
Date:   Fri, 15 Oct 2021 10:04:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b7687459-1665-eb1c-b8ad-2bb37b7136ac@virgin.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfB+HRc249w01V0b9A4xVNgBSP+FQmyUaVstra8+Kyzs/5U7rWXq7hScqZwxXi8N/SURqe7mw+U09uR7+FLLNdzDCUNg6WNw7WPDY19zGvKjrVl0XYaxX
 5pYirnayt7lIeFyD8jUkyKWya9SXODk+AZ64B3kDpoXGM8Z217ILXedoCbxvj1JqTTE4PtwlONG5AHm6QODmhzLXKy5uM5zE/hMY5C4r3HS+8bt7dZ5dEukm
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 03/10/2021 22:54, Gareth Randall wrote:
> Add support for touch screens using the General Touch ST6001S
> controller, as found in the GPEG model AOD22WZ-ST monitor.
> This controller can output the ELO 10-byte protocol,
> but requires different initialisation.
> 
> Signed-off-by: Gareth Randall <gareth@garethrandall.com>
> ---
>   drivers/input/touchscreen/elo.c | 58 +++++++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)

Hi,

I'm seeking feedback on this patch. I just wondered whether I have made 
any mistakes in the submission, or whether the maintainers are just very 
busy (most likely explanation!)

I know that this does not appear properly in patchwork even though I 
have attempted to recreate the exact format of a [PATCH] email, but I 
don't want to send duplicate attempts. I've checked that there are no 
wrapped lines in the email message. Is there a test suite that is 
failing that I'm not aware of, or conventions I'm not following?

Thanks for any feedback.

Yours,

Gareth
