Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEB5CCA1C
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2019 15:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbfJENdM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 09:33:12 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43662 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfJENdM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Oct 2019 09:33:12 -0400
Received: by mail-wr1-f67.google.com with SMTP id j18so9436526wrq.10;
        Sat, 05 Oct 2019 06:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xFY1TtQ4N/cAR/XF/AHGgESvC4XNHdAtS60HnLYR9p0=;
        b=UeP0RNu0h69c6awoOTU/cbjMQkCphoQRZH4ODmzkMSCIuyDPu3dhhH8r6SmEtoLjrs
         CmhGVF/wRVR73/8Q9H6jlhP5A47tH4WUI8JOy6emqPcUrynCpZ6NBVhH4vHmC+lXLWS6
         pS683uo6nzty+iIhee6Odu0Ow+yYO//Een/mLR0YeofRq6ZFmrHOJfTC7JDl81WOQ70/
         l1vBDnE9fImjtkK0V+rxS792RqZrLa1qZw+RI+N5EHQmGAYJbTAGAGWxMq6N7mT+KQ26
         w6sB4KgAejXOOZIAInVhjjRB1kdRCV3SDq6v9bN+qgFUcGz7HzMEmkIHUghRoAadMuav
         3Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xFY1TtQ4N/cAR/XF/AHGgESvC4XNHdAtS60HnLYR9p0=;
        b=jU4UtxoxU2bagHtIRjmj3Nrt8a8QBkuf3NvmhwUKuPdUvsZ5/pHbo0no966AA3qS3c
         CajTfD25jOpMkeXDJrU0RhYv7paJezTEpCPNeeexnq4oRH28uiGsJTDmeyVlbwOOCkJL
         xSqOnFVUiyGwc244GHoY/T10lhZPrQJ0W+hrw4SUGJ8U0BEPnq7h4FruclJMu9AM7nXZ
         2H8BWKTRbHpKJOGzvVSXFTQErZ09OjI2lm8BwM6TfHFBceGF2+PpfidMNWD2crTvujFs
         AHOIPnAOekUU3S8Aqoq96b/g3uTN7imtTpUTATdDud+VKVlyNz9z1M198wJnCGUGpKJp
         DLUw==
X-Gm-Message-State: APjAAAUcGeLbGJ9QV9oNSE2jSaVMZG5JG61+6OLZlXdZcaES96ab1JTB
        E4gD9w3EP0WA7QGCPlBHZ68yBwfw
X-Google-Smtp-Source: APXvYqw2qW4nWDkWwczBXkLfBsztSk2fohEQoFShTTBBsNr1kpZL9KcWhaHz9NCNRMGJZMMkbLkGTg==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr14136617wrr.135.1570282388834;
        Sat, 05 Oct 2019 06:33:08 -0700 (PDT)
Received: from [192.168.2.202] (p5487B13B.dip0.t-ipconnect.de. [84.135.177.59])
        by smtp.gmail.com with ESMTPSA id t123sm16258018wma.40.2019.10.05.06.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 06:33:07 -0700 (PDT)
Subject: Re: [PATCH 5.4 regression fix] Input: soc_button_array - partial
 revert of support for newer surface devices
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191005105551.353273-1-hdegoede@redhat.com>
 <222c364a-bc2b-5960-3fe4-7d1ce222e3e2@gmail.com>
 <96cea5be-d285-8323-1ab2-9c8e87993165@redhat.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <57f77509-12f7-6427-05cd-542204b9f121@gmail.com>
Date:   Sat, 5 Oct 2019 15:33:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <96cea5be-d285-8323-1ab2-9c8e87993165@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/5/19 3:20 PM, Hans de Goede wrote:
> Hi,
> 
> S-o-b is only for patches which pass through your hands, e.g. if
> you make changes to my patch and submit a v2 of it.
> 
> I guess you mean / want one of:
> 
> Acked-by: ...
> 
> or
> 
> Reviewed-by: ...
> 
> 
> ?

I apologize if the s-o-b was misplaced here, it was meant for the
modification proposed below. I can send a v2 if requested, but I felt
this was a change that I wanted to bring up here first, to see if anyone
has any comments on it.

Regards,

Maximilian
