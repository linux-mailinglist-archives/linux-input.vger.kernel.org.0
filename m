Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B42233ED9
	for <lists+linux-input@lfdr.de>; Fri, 31 Jul 2020 07:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731396AbgGaFy7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jul 2020 01:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731235AbgGaFy6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jul 2020 01:54:58 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FE4C061574
        for <linux-input@vger.kernel.org>; Thu, 30 Jul 2020 22:54:58 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id o1so16417500plk.1
        for <linux-input@vger.kernel.org>; Thu, 30 Jul 2020 22:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L45JyfB4WBiaEgI6mJel51FketlP3JwE+VVu5/DReqk=;
        b=UuArT4XRYgXZpaOi8i8UP8++ykp/2PBe4llUpKnStgUCJKwafEpNBlN7nFrTNAzwWp
         dg+DtK9kqf1xoNStgDUPvfciBsiDjDCzK/NPYMUaufrszQM2LMl5MigSVLd+kZi31oHE
         XGxkZ66EHWeKVogzuhzj4LZ0rgjUmeC2GI4p9hxgZljaWKrdqn7Td9vfgvV1ApbGJW4R
         ubWYN6iIU4aBPKh9NmvymRLrcJMTfwd9vO4QochJkV0vk3l9Wjih9LzsTujxEL/weCgO
         b2KYx1fYf4lCua82bcBxjTpI3sqWkE8vgJ+aIRM+1tWnkETGSn4PTcVliLe+HNyHZJKi
         6r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L45JyfB4WBiaEgI6mJel51FketlP3JwE+VVu5/DReqk=;
        b=tzs6Uri8BbhExP1zqm+2WRGx6MQr4GMH0Pon80SDZW+lfsC2CJL4SIdJoMcn+yNQ1P
         bNxCapPc9lFl74RlogweS5mALeY5nF+zGCdc+42mAsUVQvztbWgr05DN9BlGwvRYoEQn
         MZE0z9GQHFQLYf7asfJQBRCeedVgHA7Qopss2AQrjv0ehTPjlUeoEib/zfCts9qn8n5o
         oIz2nNuIGfE3zEL3Hb2e9nQcN0yOBws1q/ONnY80vLMmgYVzgSMnCaqY+hQDyCnlqu8O
         g52QAP/jEouqJX6HGC532mc9qQstym0B7qjMo0N0a4aFSpu5ejfp9+WjRxMrCUZd5bhz
         hDlA==
X-Gm-Message-State: AOAM533yOEwQasb0tpAEFc2R5wtgsa3PCa+RfnYGAbWmgT0T7uFsb8mY
        84gmj4HsljO4fNBkWsVCwzVZO78f2MU=
X-Google-Smtp-Source: ABdhPJwGJiaKnRh6JMfWuu7+q/FG1yG/qRMaGSUrkyRluRTYItsNfM+v+Wppg1wEnG3PTTkyOJLcTw==
X-Received: by 2002:a17:90b:2083:: with SMTP id hb3mr2535537pjb.234.1596174898114;
        Thu, 30 Jul 2020 22:54:58 -0700 (PDT)
Received: from ?IPv6:2604:4080:1012:8d30:d41e:852f:649b:7856? ([2604:4080:1012:8d30:d41e:852f:649b:7856])
        by smtp.gmail.com with ESMTPSA id u21sm7650189pjn.27.2020.07.30.22.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 22:54:57 -0700 (PDT)
Subject: Re: [PATCH] Input: xpad: Remove a conflicting Razer Sabertooth using
 the VID/PID for the Razer DeathAdder 2013 mouse
To:     Ismael Ferreras Morezuelas <swyterzone@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Benjamin Valentin <benpicco@zedat.fu-berlin.de>
References: <b9e7cb27-1866-83bb-b453-ae265ab6bde6@gmail.com>
From:   Cameron Gutman <aicommander@gmail.com>
Message-ID: <a66472a1-b07a-169c-20dc-6d5e51d4d3bc@gmail.com>
Date:   Thu, 30 Jul 2020 22:54:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b9e7cb27-1866-83bb-b453-ae265ab6bde6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/30/20 8:44 AM, Ismael Ferreras Morezuelas wrote:
> While doing my research to improve the xpad device names I also noticed
> that the 1532:0037 VID/PID seems to be used by the DeathAdder 2013,
> so that Razer Sabertooth instance looked wrong and very suspect to
> me. I didn't see any mention in the official drivers, either.
> 
> After doing more research, it turns out that the xpad list
> is used by many other projects (like Steam) as-is, this
> issue was reported and Valve/Sam Lantinga fixed it:
> 
> https://steamcommunity.com/app/353380/discussions/0/1743392486228754770/
> 
> (With multiple Internet users reporting similar issues, not linked here)
> 
> After not being able to find the correct VID/PID combination anywhere
> on the Internet and not receiving any reply from Razer support I did
> some additional detective work, it seems like it presents itself as
> "Razer Sabertooth Gaming Controller (XBOX360)", code 1689:FE00.
> 
> Leaving us with this:
>  * Razer Sabertooth (1689:fe00)
>  * Razer Sabertooth Elite (24c6:5d04)
>  * Razer DeathAdder 2013 (1532:0037) [note: not a gamepad]
> 
> So, to sum things up; remove this conflicting/duplicate entry:
> 
> { 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
> 
> As the real/correct one is already present there, even if
> the Internet as a whole insists on presenting it as the
> Razer Sabertooth Elite, which (by all accounts) is not:
> 
> { 0x1689, 0xfe00, "Razer Sabertooth", 0, XTYPE_XBOX360 },
> 
> That's it. No other functional changes intended.
> 
> Fixes: f554f619b70 ("Input: xpad - sync device IDs with xboxdrv")
> Signed-off-by: Ismael Ferreras Morezuelas <swyterzone@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index c77cdb3b62b5..1510438c5578 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -249,7 +249,6 @@ static const struct xpad_device {
>  	{ 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
>  	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
>  	{ 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XTYPE_XBOX360 },
> -	{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
>  	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
>  	{ 0x15e4, 0x3f00, "Power A Mini Pro Elite", 0, XTYPE_XBOX360 },
> 

The list here doesn't actually affect which devices that xpad will attach to.
xpad_table[] is what determines the devices that xpad's probe() will be
called for. It does this using the VID + vendor-defined interface subclass
and interface number, not the VID+PID combos. xpad_device[] just provides a
friendly name and quirk flags for some supported gamepads. Gamepads that
aren't in the list will just show up as "Generic X-Box pad" with no quirk
flags applied.

If 1532:0037 is actually a mouse, it's unlikely we'd even reach the probe()
in the first place. The device would lack the expected vendor-defined Xbox
interface that is required for xpad to attach to the device.

All that said, I'm definitely not opposed to removing the entry if it isn't
a real gamepad. Given the difficulty you had finding information about this
device, I take it you don't have any 'lsusb -v' output for this device, right?

Regards,
Cameron
