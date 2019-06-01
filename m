Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF5EB32078
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2019 20:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfFASa5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 1 Jun 2019 14:30:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:51868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbfFASa5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 1 Jun 2019 14:30:57 -0400
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 057F12474D;
        Sat,  1 Jun 2019 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559413857;
        bh=HSgGLFq3fEc8YBB9xEgB/l5k4SXsHO42a0ii8gC4JXc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GVjO5psE/XIedhvkcjXSxQM4FsBsNDQhdOW9vJ6pD4fRGMS9agUyfWWVrhFnlZltt
         tAN4VH0SCY4lw4G5v2ZFfqm2xUx3/Lx9d9Wx3WpGrZoS6ezaXYgbNJx52BKWBWIFN+
         80pXpGVYE7SATH4QyT2PkaYpxHWXZQHIBmoiZnx0=
Date:   Sat, 1 Jun 2019 14:30:56 -0400
From:   Sasha Levin <sashal@kernel.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Joseph Salisbury <Joseph.Salisbury@microsoft.com>
Subject: Re: [PATCH] drivers: hid: Add a module description line to the
 hid_hyperv driver
Message-ID: <20190601183056.GO12898@sasha-vm>
References: <20190530173720.17994-1-sashal@kernel.org>
 <nycvar.YFH.7.76.1906010018310.1962@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.1906010018310.1962@cbobk.fhfr.pm>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jun 01, 2019 at 12:19:11AM +0200, Jiri Kosina wrote:
>On Thu, 30 May 2019, Sasha Levin wrote:
>
>> From: Joseph Salisbury <Joseph.Salisbury@microsoft.com>
>>
>> This patch only adds a MODULE_DESCRIPTION statement to the driver.
>> This change is only cosmetic, so there should be no runtime impact.
>>
>> Signed-off-by: Joseph Salisbury <joseph.salisbury@microsoft.com>
>> Reviewed-by: Michael Kelley <mikelley@microsoft.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  drivers/hid/hid-hyperv.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
>> index 704049e62d58a..d3311d714d359 100644
>> --- a/drivers/hid/hid-hyperv.c
>> +++ b/drivers/hid/hid-hyperv.c
>> @@ -614,5 +614,7 @@ static void __exit mousevsc_exit(void)
>>  }
>>
>>  MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Microsoft Hyper-V Synthetic HID Driver");
>> +
>
>Is there a reason why you didn't CC Joseph on this submission?

Hm, no, I just went with my usual get_maintainers.pl + whomever git
adds. Sorry Joe!

--
Thanks,
Sasha
