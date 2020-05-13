Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C491D1FD1
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 22:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733135AbgEMUGH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 16:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733117AbgEMUGG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 16:06:06 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC639C061A0C;
        Wed, 13 May 2020 13:06:06 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id u190so216424ooa.10;
        Wed, 13 May 2020 13:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ic/KC2PZHSoSr/4yTt3SjhrODYKmA61GrYsRQnNMY88=;
        b=QG73rjQv+99PSxiDQCsGvDtChV0poRpYrwl7TfePom5D6n1n0SDb8r5eV2NFsTY95z
         DywghU75XGYRQNn7vtcuYNIDW/ic9L48XVqbBhBAgtLWohYaQ1+8SMLciJPoxzD/Nvoq
         lVtwiwVy/IEQcsfoRT7vlmVLXhEZ0JC52bDxkWWBp4fnsz+WFesc2YspoZ4a5bBgOWDz
         Bko+AHGeW+/bqcpqGAkHa2+k9GnK88bA/3zT8r0WgR7VmI3H3ba56bdvAKjeZNkNF3Lr
         xSkbeWDcqVIRiOFZQu1Gq1OiGtan19ZTb4hlqaHgVFS7M/B55b61/TJ/lkDM4+D1PeZI
         xt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ic/KC2PZHSoSr/4yTt3SjhrODYKmA61GrYsRQnNMY88=;
        b=iThHruqRItYYmiy9wKtFHWLfWz4zNMJp6FMvRbLRloWtF401y6gfF3j5e8ZG5FQbsM
         +4/GX76kH0XnklRxWmzBkndELzOXACh3EmxbyNmQxWbolu7sZdOj1/+SkSxZx9t0N5HO
         JFRn+AiRU7zCMzk45tsl3N3fnVfAFLHEjLMBzb2IdDENdmWaL2WMwVbmZJO0hxgh+IBY
         xHxw/Ez93bIuNMCUbZRonzMKM6wbUNL9oY/b1aDnlPgpKpksvjggMtVneiiLx0YT6LQk
         RxgOL9PsEZj1BNUWUPOKY69FydFuT9CqqkuSI/HMiAWu8r4Lh2Ch4VAtDMvcGigmrViX
         74DA==
X-Gm-Message-State: AOAM5313USdMinQA3nQOrwrkeENZSeyRBtnfDsLlEwpb4la9ITxxNvKr
        nMRud0kjORQu1FSytnQPMB3gL6IRM658fA==
X-Google-Smtp-Source: ABdhPJyX83NwfUDx1Ekh/EwNhQytocQl8G8fmDy2SVEoRQMcwonW8M3b7ncHD99KIwZkbEdeZZlkDg==
X-Received: by 2002:a4a:d64f:: with SMTP id y15mr876714oos.90.1589400365771;
        Wed, 13 May 2020 13:06:05 -0700 (PDT)
Received: from [10.0.0.10] (cpe-70-112-70-240.austin.res.rr.com. [70.112.70.240])
        by smtp.gmail.com with ESMTPSA id r10sm188379otn.70.2020.05.13.13.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 13:06:05 -0700 (PDT)
Subject: Re: [PATCH] HID: sony: Fix for broken buttons on DS3 USB dongles
To:     "Colenbrander, Roderick" <Roderick.Colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <46c1ab66-62d7-5dae-2f4d-7e722f1aff3a@gmail.com>
 <BY5PR13MB38264B60014D43193C53B38798BF0@BY5PR13MB3826.namprd13.prod.outlook.com>
From:   Scott Shumate <scott.shumate@gmail.com>
Message-ID: <e3496a04-3a96-f833-955f-69912a76bdac@gmail.com>
Date:   Wed, 13 May 2020 15:06:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR13MB38264B60014D43193C53B38798BF0@BY5PR13MB3826.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Roderick,

The official DS3 has a Report Count(19) instead of Report Count(13) in the exact same offset.  I 
have no idea what the silicon vendor for these dongles was thinking but it's suspicious that the 
official count of 19 (0x13) turned into 13 (0xd) in the knock-off.  It makes you wonder if the 
engineers confused the decimal/hex numbers.

As buggy as all of these third-party devices are, I'm afraid relying on the HID parser to get it 
right is only going to worse over time.  I do like your idea of having each device register 
themselves.  It would be nice to have each device provide a callback to decode its own report rather 
than handle a bunch of special conditions and quirks in a unified report decoding function.  The 
drawback of course is that its going to be a little more effort to maintain.

Cheers,
Scott


On 5/13/20 2:41 PM, Colenbrander, Roderick wrote:
> Hi Scott,
> 
> Thanks for sharing this patch. Do you know if for these controllers the data is at the same byte offsets in the reports as an official DS3?
> 
> The reason I'm asking is that I have been considering for a while to redo some of the button / stick handling code and the issue you just pointed out could be another argument towards doing that. Basically we learned that also for the official Navigation controller there are apparently a few different revisions with different report descriptors (yah!).
> 
> I have been tempted for some time to get rid of this fixup / mapping logic altogether and e.g. have a "sony_register_gamepad" and do it all ourselves and put more logic into the sixaxis_parse_report call. With many buggy devices of which we don't have most it feels fragile to have the HID parser do the work.
> 
> Thanks,
> Roderick
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> From: Scott Shumate <scott.shumate@gmail.com>
> 
> Sent: Wednesday, May 13, 2020 10:05 AM
> 
> To: Jiri Kosina <jikos@kernel.org>; Benjamin Tissoires <benjamin.tissoires@redhat.com>; Colenbrander, Roderick <Roderick.Colenbrander@sony.com>; linux-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> 
> Subject: [PATCH] HID: sony: Fix for broken buttons on DS3 USB dongles
> 
>   
> 
> 
> Fix for non-working buttons on knock-off USB dongles for Sony
> controllers. These USB dongles are used to connect older Sony DA/DS1/DS2
> controllers via USB and are common on Amazon, AliExpress, etc.  Without
> the patch, the square, X, and circle buttons do not function.  These
> dongles used to work prior to kernel 4.10 but removing the global DS3
> report fixup in this commit exposed the problem:
> 
> commit e19a267b9987 Author: Roderick Colenbrander
>   <roderick.colenbrander@sony.com>
> Date:   Tue Mar 7 15:45:08 2017 -0800
> 
>      HID: sony: DS3 comply to Linux gamepad spec
> 
> Many people reported the problem on the Ubuntu forums and are working
> around the problem by falling back to the 4.9 hid-sony driver.
> 
> The problem stems from these dongles incorrectly reporting their button
> count as 13 instead of 16.  This patch fixes up the report descriptor by
> changing the button report count to 16 and removing 3 padding bits.
> 
> Signed-off-by: Scott Shumate <scott.shumate@gmail.com>
> ---
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index 4c6ed6ef31f1..2f073f536070 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -867,6 +867,23 @@ static u8 *sony_report_fixup(struct hid_device *hdev, u8 *rdesc,
>   	if (sc->quirks & PS3REMOTE)
>   		return ps3remote_fixup(hdev, rdesc, rsize);
>   
> +	/*
> +	 * Some knock-off USB dongles incorrectly report their button count
> +	 * as 13 instead of 16 causing three non-functional buttons.
> +	 */
> +	if ((sc->quirks & SIXAXIS_CONTROLLER_USB) && *rsize >= 45 &&
> +		/* Report Count (13) */
> +		rdesc[23] == 0x95 && rdesc[24] == 0x0D &&
> +		/* Usage Maximum (13) */
> +		rdesc[37] == 0x29 && rdesc[38] == 0x0D &&
> +		/* Report Count (3) */
> +		rdesc[43] == 0x95 && rdesc[44] == 0x03) {
> +		hid_info(hdev, "Fixing up USB dongle report descriptor\n");
> +		rdesc[24] = 0x10;
> +		rdesc[38] = 0x10;
> +		rdesc[44] = 0x00;
> +	}
> +
>   	return rdesc;
>   }
>   
> 
> 
> 

