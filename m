Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96705154312
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 12:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgBFLag (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 06:30:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52757 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726538AbgBFLag (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 6 Feb 2020 06:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580988635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aV7oYYEOy702zQd3tUOTvOGNVsWk9qgOCq9fn+qYpGA=;
        b=N2rgieF/gEYeyInfKUjRGUKVVGo0w+pwtqyUDEJTlvlVythgHQ/bSAOIaxTdPG4fqj3m/d
        TVzKJwDmvQN8afOPSscxAGbV3YvqClvXOiswZWbB3Y5i4DvQb7FLPKCsVZjxxIvnddkucb
        aNswIAe6pAVyihnfqi7/6Zt+NVi0wLA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-bVrfsdPXMLmRopxPQ8I1zA-1; Thu, 06 Feb 2020 06:30:34 -0500
X-MC-Unique: bVrfsdPXMLmRopxPQ8I1zA-1
Received: by mail-wm1-f69.google.com with SMTP id o24so2657505wmh.0
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2020 03:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aV7oYYEOy702zQd3tUOTvOGNVsWk9qgOCq9fn+qYpGA=;
        b=q/cAGbEpbX38GCmMq+m/jtyz2afXQSQZOwdtmwB07e0fT6dCiDibpeSQGav2fi3QM/
         oksZFLIw6qIeFp1NUqNvbjKFeb5WeX+6KFaNTjBUKvxGrip6NrPrfWePXGOYDAUFEfVJ
         tYu5UeVTgP/j0sq05BkIQxIPZhrfB5EuEaDLO9nKpPrmN96RCKBiq3rub7yPE7tjN/eK
         ueu/GgFqoPP9NFepkn5boz2LxXWqA+j/sfxzHqXBHf+4goRDP6aV0vrxFWf70VisMsyX
         /OqHNRNLSaUG2f3fJqUtCz3V7sMdiEPcjUeLh08cIR1Prbs7SKtDUm+W6wYkh64ystOL
         4iqw==
X-Gm-Message-State: APjAAAWWZJJXo8inD0jx1NsZ919Rt+1CoheoW0bRxVkNSRMR7a6BbF2F
        +Uy8GHXczICQx4J1+HaM9avpaN8sWweFnySXs0x5S1M3k+Jfz1CZnzUKv9ViERAiHZWCPRbX7Ew
        wEU5iMP1KDNU6U7R0abl5Vzc=
X-Received: by 2002:a05:6000:1205:: with SMTP id e5mr3544859wrx.55.1580988633190;
        Thu, 06 Feb 2020 03:30:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1+R5wkQJVliauZAR3UC67+2xqdlxlCuXv2ObdeZfmPlfwDoHG3TsHvYSS9Rbvd+rx6es10g==
X-Received: by 2002:a05:6000:1205:: with SMTP id e5mr3544836wrx.55.1580988632974;
        Thu, 06 Feb 2020 03:30:32 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id w22sm3128934wmk.34.2020.02.06.03.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 03:30:32 -0800 (PST)
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when the
 device disconnects
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        linux-input <linux-input@vger.kernel.org>
Cc:     Benjamin Tissoires <btissoir@redhat.com>,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Julien Hartmann <juli1.hartmann@gmail.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
Date:   Thu, 6 Feb 2020 12:30:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI,

On 2/6/20 12:14 PM, Filipe Laíns wrote:
> Hello,
> 
> Right now the hid-logitech-dj driver will export one node for each
> connected device, even when the device is not connected. That causes
> some trouble because in userspace we don't have have any way to know if
> the device is connected or not, so when we try to communicate, if the
> device is disconnected it will fail.

I'm a bit reluctant to make significant changes to how the
hid-logitech-dj driver works. We have seen a number of regressions
when it was changed to handle the non unifying receivers and I would
like to avoid more regressions.

Some questions:
1. What is the specific use case where you are hitting this?
2. Can't the userspace tools involved by modified to handle the errors
they are getting gracefully?
3. Is there a bugreport open about this somewhere?

> The reason we do this is because otherwise we would loose the first
> packets when the device is turned on by key press. When a device is
> turned on we would have to create the device node, and the packets
> received while we are creating the device node would be lost.

I don't believe that this is the reason, we only create hid child
devices for devices reported by the receiver, but some of the non
unifying hid receiver send a list of all devices paired, rather
then the ones which are actually connected at that time.

> This could solved by buffering those packets, but that is a bad solution as
> it would mess up the timings.
> 
> At the moment the created node includes both normal HID and vendor
> usages. To solve this problem, I propose that instead of creating a
> single device node that contains all usages, we create one for normal
> HID, which would exist all the time, and one for the vendor usage,
> which would go away when the device disconnects. >
> This slight behavior change will affect userspace. Two hidraw nodes
> would be created instead of one. We need to make sure the current
> userspace stacks interfacing with this would be able to properly handle
> such changes.
> 
> What do you think of this approach? Anyone has a better idea?

The suggested approach sounds fragile and like it adds complexity to
an already not simple driver.

It would be helpful to first describe the actual problem you are trying
to fix (rather then suggesting a solution without clearly defining the
problem) and then we can see from there.

Regards,

Hans

