Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A100FE2F57
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2019 12:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392729AbfJXKrf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 06:47:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59138 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391340AbfJXKrf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 06:47:35 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id AB8B383F3F
        for <linux-input@vger.kernel.org>; Thu, 24 Oct 2019 10:47:34 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id s17so6968888wrp.17
        for <linux-input@vger.kernel.org>; Thu, 24 Oct 2019 03:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z3THzyvAb/FfHQZTX3UMtVVjF7LzjaWQiK7ZYPxL3nA=;
        b=swJWBK2QiBrPuYwytArhHyhomuEbM1OH9EYA/BZ90vw70rZrQPY+UpN0gEMxy6T0Lw
         GkWMlpe8+I/LbhU6FSYB72Oclc0FiFpUboED428xHLQueNYj1tZ4hJ9Ae382bgKk4SKj
         fsprgOnIK3QrdWybFvIxfsV5AsjaiDEzuZhdIgRa6fGW7UjCOoHr1ocB0E4vT63QNqny
         6MFImPRAG/Kx970p3hW+fJjjCAbM7BX/lffAc3mY21P0lgYL12AiamcDueVoCfxBXRvo
         iuaG37VHWbyYjG8QHBZNBNImlHIowlu8j1OXkXwLos99r+hPd+OpcX5b5/xNf7A2wGgl
         NA/A==
X-Gm-Message-State: APjAAAXZ139SaMHTpFFGtySyXl15JAnb5tvHdtlF9cPbR2v1wZF5XCRc
        fwQJiLAyom1TObgiJT56r24MXOnLfLcSS2nqRGx48kd0+HBP7hyHD1BssxyhtKs9gW5W7s4HNA7
        tH9hItBl/nWHHDXIpcaJTvZ0=
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr4433388wml.142.1571914053346;
        Thu, 24 Oct 2019 03:47:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyQK6XofhG6HgBar4MDG+J33MA8PaoeB/z6dhymHFG/pa0RTvXxpL7kBKmN1YdRTQSaRQknQ==
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr4433368wml.142.1571914053116;
        Thu, 24 Oct 2019 03:47:33 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id p15sm24324555wrs.94.2019.10.24.03.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 03:47:32 -0700 (PDT)
Subject: Re: FocalTech Touchpad (v2) PS/2 Reverse Engineering
To:     Hamza Farooq <hamza.farooq15@yahoo.com>,
        linux-input@vger.kernel.org
Cc:     Peter Hutterer <peter.hutterer@redhat.com>
References: <83FB8611-5EFC-4215-B190-52D43B814D0A@yahoo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cc242dbe-2734-99cc-ef96-780e5ef6f943@redhat.com>
Date:   Thu, 24 Oct 2019 12:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <83FB8611-5EFC-4215-B190-52D43B814D0A@yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 24-10-2019 12:37, Hamza Farooq wrote:
> Got an error by yahoo mail (as usual), trying again.
> 
> Hi,
> 
> Earlier this week I was thinking to get it merged, but I don’t think it’s ready yet.

Ok, if you can let me know (and mail me a copy) when you have a version which
works well under Linux for you by replacing the current FocalTech code, then
I can integrate it into the kernel in such a manner that it can co-exist with
the existing driver.

Regards,

Hans




> 
> There are 2 issues that need to be fixed first.
> 
> 1st: Laptop keyboard have a built in Key to disable/enable touchpad that works on windows. While on Linux/macOS pressing it once disable device as expected, and if I press it second time then device is back online and works Fine. But the thing is if I use the touchpad after 1st time pressing button while it is disabled (place finger/press button etc.), in that case it doesn’t work and device is dead. On linux I can reload psmouse module that resets device and fix input (sudo modprobe -r psmouse).
> I have checked EC Quries to make sure how that button disable device in first place, it isn’t EC Query and I don’t see any ps2/adb code on macOS (other button generate key specific code, this one doesn’t); I don’t know how to check this on Linux. So I want to know is there some other method/protocol that I’m missing here. I can use some other button as a replacement on macOS to reset device whenever it’s pressed manually(also I really don’t need this disable functionality at all, but just in case I disable it accidentally then I won’t have to reboot just to get Touchpad working again. And I’m 
> not aware of modprobe alternative on Mac so this is best option right now until I figure out what that button does and how it disable the device) But I’m not sure what to do on Linux. And I would like to try something that might help understand this scenario.
> 
> 2nd: touchpad finger movement is not uniform in both axis (x-axis, y-axis), it has something to do with touchpad size (2272 x 992 ; 85mm x 37.1mm according to my approximation, I’m not sure about actual physical size). With y_max = 992 movement over y-axis is pretty fast (accelerated) as compared to x-axis. Right now I’m using y_axis = 1360 this make the movement a little better but should make horizontal edge scrolling unusable (I use 2 finger scrolling though). I tried injecting input_abs_set_res for both x and y, but that didn’t change anything.
> Also I remember seeing wrong touchpad reported by kernel in mm, I don’t remember the command now. But It wasn’t 85x37 (may be that is the issue). On the other hand I though this was related to touchpad somehow it self (back when I first got it working in July), but a few weeks ago I got It working on macOS (via. VoodooI2C MT2 Simulator, and I’m using 85mm x 37.1 mm as physical size)  and guess what pointer movement is uniform there. I want to know how I can fix it on Linux with y_max = 992
> 
> Thanks.
> 
> Regards,
> Hamza
