Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CC2410CAE
	for <lists+linux-input@lfdr.de>; Sun, 19 Sep 2021 19:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhISRcB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Sep 2021 13:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhISRcA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Sep 2021 13:32:00 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2976DC061574;
        Sun, 19 Sep 2021 10:30:34 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g1so57452630lfj.12;
        Sun, 19 Sep 2021 10:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=kOSFz2D6+eH9b+3DWsE71fA2DR/exZeFlC9o9EQE9T0=;
        b=ke5n12ahCp2QxEqA0pdymPX69j9zSl68u7SlOzf/4ptxz4dfy6J/lhXOG4hg6bpcQs
         c45eOGeRWQ2eeIDn25T28VSw7+32IPl5ddHZiiN4AAxTcpsjC/+NA7KDp/wCHCfVrd8Y
         NKzXj21l+/XxNSST99p91QMyoIhb4XQF+BCgIsXl2k1MuJ28FLhp7aRVekjIy6W67D2Q
         EMDcRbonA0pONvjDVpPB6x3KBbD+/iYWQ79Gz3Yff9+8L6wgvAHbQPoGqqwBwEXE2Cv1
         xoQ61Ks9KEaZ8ZosGlK3+MJ0GIAsrAnEcYNI6Lhq7eEUIldc0HC19QDRvXdl67zebRcD
         12PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=kOSFz2D6+eH9b+3DWsE71fA2DR/exZeFlC9o9EQE9T0=;
        b=YvSzPtLa2SqF1+kXJha66ZUOzPDJWyBJxJm1nsBpun5b+SLDs5rfGpCmNgi+IxTlu9
         OCNFaEaxw0cPK5GnOiOVPzbgzVMx4k8KVZVNs0busEHtztM9+3MKSO4qJogJ5R56EYU2
         /8Pt/t8Sk3UFGM5Jbkc1J0Uzop3JjY+V4E4fNjhj1qWIMLjuSNLqB4vAD/YQDD6tFWj1
         eSB/cP9F0CxKxVAvutWfOI0ZnI6yxc83zAbbHs1RMaTUpADHbATjIzsFFWEsj4zhD9HO
         tGgsP2ebLVMI9pmGxhxlbO1LgsWdIYv6gLl8PYK1Z9mOeZLolJHvokznj4BxqZBtV7SD
         18/g==
X-Gm-Message-State: AOAM530d+LxHKCpqQ5e8PT3BJ0NCvkopqhCDqY6WLg5rNiB93H7QMUQ7
        XOFBOzSZdgcSc78Z88c7L6k=
X-Google-Smtp-Source: ABdhPJxtISb8vCLb7fFcByCn/Badi4I34lO+aCwKa4ertrRuF1rCbjqFbRFIefX0cb7jeKn4FmhxjQ==
X-Received: by 2002:a2e:5442:: with SMTP id y2mr17534810ljd.436.1632072632206;
        Sun, 19 Sep 2021 10:30:32 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.49])
        by smtp.gmail.com with ESMTPSA id v7sm1063931lfq.192.2021.09.19.10.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Sep 2021 10:30:31 -0700 (PDT)
Message-ID: <e537c6bf-df7f-0364-c883-39cf695d0714@gmail.com>
Date:   Sun, 19 Sep 2021 20:30:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH] input: cm109: fix URB submitted while active
Content-Language: en-US
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     dmitry.torokhov@gmail.com, aeh@db.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com
References: <20210804145801.2762-1-paskripkin@gmail.com>
 <19948c76-fa3c-26bb-7604-6de392ad9d49@gmail.com>
In-Reply-To: <19948c76-fa3c-26bb-7604-6de392ad9d49@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/18/21 14:07, Pavel Skripkin wrote:
> On 8/4/21 5:58 PM, Pavel Skripkin wrote:
>> Syzbot reported, that dev->urb_ctl was submitted while active. The
>> problem was in missing validation check. We should check, that dev->urb_ctl
>> is not pending before sumbitting it again.
>> 
>> Fail log:
>> 
>> URB 00000000cfeee59c submitted while active
>> WARNING: CPU: 1 PID: 8459 at drivers/usb/core/urb.c:378 usb_submit_urb+0x1271/0x1540 drivers/usb/core/urb.c:378
>> ...
>> Call Trace:
>>   <IRQ>
>>   cm109_urb_irq_callback+0x44f/0xaa0 drivers/input/misc/cm109.c:422
>>   __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1656
>>   usb_hcd_giveback_urb+0x367/0x410 drivers/usb/core/hcd.c:1726
>> 
>> Reported-and-tested-by: syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com
>> Fixes: c04148f915e5 ("Input: add driver for USB VoIP phones with CM109 chipset")
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> ---
> 
> 
> Gentle ping :)
> 
> 

Hi, Dmitry,

did you have a chance to review this one? Thanks :)




With regards,
Pavel Skripkin
