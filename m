Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E945233EEB
	for <lists+linux-input@lfdr.de>; Fri, 31 Jul 2020 08:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731152AbgGaGO6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jul 2020 02:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbgGaGO5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jul 2020 02:14:57 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40578C061574
        for <linux-input@vger.kernel.org>; Thu, 30 Jul 2020 23:14:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f7so26929974wrw.1
        for <linux-input@vger.kernel.org>; Thu, 30 Jul 2020 23:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/swEnG7J5TkoW6G40EYjoMgEWSrTyz/ACRz5wYk3IHU=;
        b=UM5QgzYnmrBV/MQ96aXk+m122iC6ZKbG0v0ZfgEv3YvDIkGUwLhi37z5LO/yVVJkvk
         UQ88GUOS231EIzJUagFHHXCeFYBacGNkAYVqDeG/XzDu2zPTqRo18osxOVN6OSw3vf54
         26VFfXt3vkJxzb8KRxL4hz9LHEq2pxc0jTUe9f46WAnp+DB03qO8zIKzeybGV8uo8u78
         ir8uNh7WnoYZECoi7lPoWkJXU5aN1vH/m6fYWZTzSO0hEEJwMEmxRTJa1TC1xZsV+713
         7KGYLB2STUnNiUFMEMIDOS2nQSWA910p/Tm0OW033S/ALJz41xyAwjamSjgXKdSu4B0e
         xM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/swEnG7J5TkoW6G40EYjoMgEWSrTyz/ACRz5wYk3IHU=;
        b=XXkKadImC2wKjNnAgz5sSQl9fHVHlauDmXsExAfGM0EaypyiEjOcNb3ua4Bi61Jcfr
         7P52iLCnyHdc27mHFXAZANLSfeCf1YQzMV6fnKvxyY1J4Tr0vL/DCpuG/nITFCsgayng
         2De0ZqdoKCFK369RBV8acqiSEzKAvQ4WGgoXgidi65Bp6/Xa9BVPAxGOxvizwzLB+shv
         Sw+Za8uvDbDIvukuWcrRmvnOJyw8HbzQL1aq/krKu5p9r4E4LrEGnzO/qUJzGdvEnR9H
         WAw9mbBZOv6jxcmc+S3a69omipuCUK3LKBxn3dhq4zFHllh9ruDbFFj+sxcnpPVTYdOk
         7UBA==
X-Gm-Message-State: AOAM532Csxcw4290ckJkKkin0LooKOzxD0st1lt29kEoeKyJwULyVCar
        AXb2/BizCTYarzS0TcWLNiU=
X-Google-Smtp-Source: ABdhPJx31bZBusZ4N2OCJfTLQW5W0k7w8HyfF43tmNm5yyTgMXX1jFcvugSC397cbdNO/X9jvuN8cg==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr1865399wrt.315.1596176095764;
        Thu, 30 Jul 2020 23:14:55 -0700 (PDT)
Received: from 168.52.45.77 (201.ip-51-68-45.eu. [51.68.45.201])
        by smtp.gmail.com with ESMTPSA id l7sm2751914wrf.32.2020.07.30.23.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 23:14:55 -0700 (PDT)
Subject: Re: [PATCH] Input: xpad: Remove a conflicting Razer Sabertooth using
 the VID/PID for the Razer DeathAdder 2013 mouse
To:     Cameron Gutman <aicommander@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Benjamin Valentin <benpicco@zedat.fu-berlin.de>
References: <b9e7cb27-1866-83bb-b453-ae265ab6bde6@gmail.com>
 <a66472a1-b07a-169c-20dc-6d5e51d4d3bc@gmail.com>
From:   Swyter <swyterzone@gmail.com>
Message-ID: <a6fd180e-a915-1eef-5d8d-8e260cb3c709@gmail.com>
Date:   Fri, 31 Jul 2020 08:14:52 +0200
User-Agent: nano 6.4
MIME-Version: 1.0
In-Reply-To: <a66472a1-b07a-169c-20dc-6d5e51d4d3bc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 31/07/2020 7:54, Cameron Gutman wrote:
> On 7/30/20 8:44 AM, Ismael Ferreras Morezuelas wrote:
>> -	{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
>>
> 
> The list here doesn't actually affect which devices that xpad will attach to.
> xpad_table[] is what determines the devices that xpad's probe() will be
> called for. It does this using the VID + vendor-defined interface subclass
> and interface number, not the VID+PID combos. xpad_device[] just provides a
> friendly name and quirk flags for some supported gamepads. Gamepads that
> aren't in the list will just show up as "Generic X-Box pad" with no quirk
> flags applied.
> 
> If 1532:0037 is actually a mouse, it's unlikely we'd even reach the probe()
> in the first place. The device would lack the expected vendor-defined Xbox
> interface that is required for xpad to attach to the device.
> 
> All that said, I'm definitely not opposed to removing the entry if it isn't
> a real gamepad. Given the difficulty you had finding information about this
> device, I take it you don't have any 'lsusb -v' output for this device, right?
> 
> Regards,
> Cameron
> 

Hi, Cameron. Yeah, the main idea is to clean the list, even if as you say it hasn't
caused mouse issues and that's why probably nobody has noticed it before.

Because, for some reason, everyone assumes some kind of correctness even when most of
these are community-sourced and self-reported, everyone copies these lists from
somewhere else. Hopefully the fixes will trickle downstream.

So yeah, I know for sure that (for example) the internal list Valve uses comes right from here:
https://hg.libsdl.org/SDL/file/7d94464f10f7/src/joystick/controller_type.h#l246

(It's commented out)

Actual change referencing this kernel issue:
https://hg.libsdl.org/SDL/rev/29809f6f0271

For more information of the device, take a look here:
https://github.com/xboxdrv/xboxdrv/pull/59

You can see a lsusb dump here: https://github.com/xboxdrv/xboxdrv/files/76581/Qa6dBcrv.txt

So yeah, let me know what you guys think. This has been a weird tangent for me. :)
