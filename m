Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 797C6101835
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2019 07:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729654AbfKSFeY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Nov 2019 00:34:24 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:52532 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbfKSFeY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Nov 2019 00:34:24 -0500
Received: from mail-pg1-f200.google.com ([209.85.215.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iWw9e-00070M-Be
        for linux-input@vger.kernel.org; Tue, 19 Nov 2019 05:34:22 +0000
Received: by mail-pg1-f200.google.com with SMTP id p188so14910448pgp.15
        for <linux-input@vger.kernel.org>; Mon, 18 Nov 2019 21:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=jusLe6eRW9S01oAaldUJb/F5NSqPDxkFugLOtbNZF6k=;
        b=ioa31MYmfyN9NoLo6SkjqCyohvcMhex/Kvdtgpo5PbqqfFoHV3waNjY626MkN3ABDl
         l/OWH9dMPt//9yQVDJq5fHYHBZJMsrnpWL1rtiy4MVcSfZtARRQXWSAWTeSFEesQrUky
         u5ghUY1jHG5Uyln4GW9xTCNSdXjkrOkHccGlDYLPdnwFL/HRHIPw5xAO6qV9+eThD5si
         Sb30JsaO2UWB2NqALy2sEMwomDmy/1gdhfr9+i8wy1h0RlKJzssBczM4X50lhFSzmQ3d
         Y1+F6YzUFkmkWXw8/ju6JWtERIJjOZ0bxD+U6kGPRV4cx340n2xkJvKrh/zOCCyRuLMC
         YYWg==
X-Gm-Message-State: APjAAAX0+/k81EdluVJcK0vSXhrCTpdC47PwIyGlVFBKXgP1Xjb6/rG1
        TLiysoUApGk4x9peMVMrabr1uMcEECQ/G47p6N2GAtDqYFTI+fpp5gGxzVFNqg7hX8mGf8otmhm
        gBVquoQytohAHxCuxokzRoyawzPhoG3tdSWSxpikT
X-Received: by 2002:a17:90a:6505:: with SMTP id i5mr3838067pjj.36.1574141660900;
        Mon, 18 Nov 2019 21:34:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3WmZjeKQxzxHHa/AxPTyXq45+6LekFE+w8NKygfXAW2Bw76jJ/WXvbY4tY2IwvbPVF3uyww==
X-Received: by 2002:a17:90a:6505:: with SMTP id i5mr3838043pjj.36.1574141660626;
        Mon, 18 Nov 2019 21:34:20 -0800 (PST)
Received: from 2001-b011-380f-3c42-d02c-da56-2d00-ce2a.dynamic-ip6.hinet.net (2001-b011-380f-3c42-d02c-da56-2d00-ce2a.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:d02c:da56:2d00:ce2a])
        by smtp.gmail.com with ESMTPSA id e8sm22516084pga.17.2019.11.18.21.34.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2019 21:34:20 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH 1/2] Input: synaptics-rmi4 - clear irqs before set irqs
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <189fc7c3-d0f7-a25e-9d4d-446b095e853f@canonical.com>
Date:   Tue, 19 Nov 2019 13:34:14 +0800
Cc:     Aaron Ma <aaron.ma@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        Cheiny@synaptics.com, aduggan@synaptics.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Transfer-Encoding: 7bit
Message-Id: <E08F41E2-8708-49AE-813D-6079561F876F@canonical.com>
References: <20190220164200.31044-1-aaron.ma@canonical.com>
 <20190609165551.GB90002@dtor-ws>
 <7da443d0-f433-c5a5-5194-707362eb2ee5@canonical.com>
 <20190611173545.GE143729@dtor-ws>
 <189fc7c3-d0f7-a25e-9d4d-446b095e853f@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

> On Jun 14, 2019, at 12:26, Aaron Ma <aaron.ma@canonical.com> wrote:
> 
> On 6/12/19 1:35 AM, Dmitry Torokhov wrote:
>> On Tue, Jun 11, 2019 at 12:55:58AM +0800, Aaron Ma wrote:
>>> On 6/10/19 12:55 AM, Dmitry Torokhov wrote:
>>>> Hi Aaron,
>>>> 
>>>> On Wed, Feb 20, 2019 at 05:41:59PM +0100, Aaron Ma wrote:
>>>>> rmi4 got spam data after S3 resume on some ThinkPads.
>>>>> Then TrackPoint lost when be detected by psmouse.
>>>>> Clear irqs status before set irqs will make TrackPoint back.
>>>> Could you please give me an idea as to what this spam data is?
>>>> 
>>> It should be some data 0 during suspend/resume.
>>> Actually I don't know how these data 0 is produced.
>>> Not all synaptics touchpads have this issue.
>>> 
>>>> In F03 probe we clear all pending data before enabling the function,
>>> Yes we did, but not after resume.
>> Yes, I understand that. The question I was asking: if we add code
>> consuming all pending data to f03->suspend(), similarly to what we are
>> doing at probe time, will it fix the issue with trackstick losing
>> synchronization and attempting disconnect?
>> 
> 
> I just do some test via adding code in suspend or resume.
> But they didn't work out.
> 
>>>> maybe the same needs to be done on resume, instead of changing the way
>>>> we handle IRQ bits?
>>> This patch is supposed to clear irq status like it in fn probe. Not
>>> changing IRQ bits.
>> What I meant is changing how we enable IRQ bits. I would really prefer
>> we did not lose IRQ state for other functions when we enable interrupts
>> for given function.
>> 
> 
> Not only F03 with problem, F12 too which is touchpad .
> User verified this patch fixes problem of F12 too.
> Clear IRQ status before enable IRQ should be safe.
> 
> Or we can add code before enable IRQ in F03/F12.

Users reported that  patch [1/2] alone can solve the issue.

Do we need more information before making this fix merged?

Kai-Heng

> 
> Thanks,
> Aaron
> 
>> Thanks.
>> 
>> -- Dmitry

