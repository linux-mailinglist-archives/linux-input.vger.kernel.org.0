Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB5B313A37E
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 10:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgANJHt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 04:07:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44497 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725820AbgANJHt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 04:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578992868;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aLFnYP8rZuEnfnaJL3rq9IwFEwWNuaUrudw5TYNZZzQ=;
        b=GHwkshybsBPt5XDr/S/Mef6pAbBBKA8zDz45RaAjHOeZyhyaUiJ0dPs9qNRHUP1OoEIIzL
        MiZ3BY7Uugiu2VLpRLgSkHJPeAg8KIYSDuhfseFm1KbtB6+iczjNC3TVNXDRkjJFqE9iJi
        aMnNLZBpOpAAueV81uq3oRE0GOpvBLI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-pz2zjoOxNvibzKkmEWcU1A-1; Tue, 14 Jan 2020 04:07:44 -0500
X-MC-Unique: pz2zjoOxNvibzKkmEWcU1A-1
Received: by mail-wr1-f72.google.com with SMTP id y7so6240511wrm.3
        for <linux-input@vger.kernel.org>; Tue, 14 Jan 2020 01:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aLFnYP8rZuEnfnaJL3rq9IwFEwWNuaUrudw5TYNZZzQ=;
        b=N6DJhrOk07M5aX0nuMgxo4my71LL9CuMWliCttQfDFp5xlqvXCo1U20etie+f5p3vi
         418qmghHPzankbeumb7PkUoC/OqrVYXuIs8225MxLwzwQmZIUGnUNj4IMNm09b5FDuSI
         /tXfyqGOGyhJZwwfjSwIQ24CjjCLmTWPlyUHGEvoZJSl9+yM01jZhzaZ3EaXB8QFgEEC
         b2iFYrutNvHih46TxyA9fr5geXz1qJ8BXjI3PrU2Pl5jeqCRmVqKoG3SYvXZyh+pXDpB
         RGiovPdW8O34Cz9K2ecP9d2IDA4FBi9m2oM+/9/ZDUyedyjhoS8aXMuDtJValFv+a7lR
         spig==
X-Gm-Message-State: APjAAAWyzx2tJMX12RzoKN+t5xa/4n5U42lebpqhVl5ITcS34eAPElnf
        QrG72i1WzOKqL/9T9ad6/SyYkFcUQxLbzJ4PT7Cbq0I1/+pK38ku/4qBDKypkKM1XRBcm2HH8QN
        qqsYPie/TaNVvbqJ/4fn9k2E=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr23029144wrt.110.1578992863682;
        Tue, 14 Jan 2020 01:07:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyticYHbd0lvdqSRmgWirb8Z584H59+dRskdZoKh5DUAd/tCDgi1oL7WWR+bD+oBaj/VEQiUA==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr23029117wrt.110.1578992863453;
        Tue, 14 Jan 2020 01:07:43 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id w19sm17296005wmc.22.2020.01.14.01.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 01:07:42 -0800 (PST)
Subject: Re: [PATCH 3/3] Input: axp20x-pek - Enable wakeup for all AXP
 variants
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
References: <20200113032032.38709-1-samuel@sholland.org>
 <20200113032032.38709-3-samuel@sholland.org> <20200113212654.GA47797@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <df608e7c-a0bd-5077-c8e4-db661353e076@redhat.com>
Date:   Tue, 14 Jan 2020 10:07:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200113212654.GA47797@dtor-ws>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 13-01-2020 22:26, Dmitry Torokhov wrote:
> Hi Samuel,
> 
> On Sun, Jan 12, 2020 at 09:20:32PM -0600, Samuel Holland wrote:
>> There are many devices, including several mobile battery-powered
>> devices, using other AXP variants as their PMIC. Enable them to use
>> the power key as a wakeup source.
> 
> Are these X86 or ARM devices? If anything, I'd prefer individual drivers
> not declare themselves as wakeup sources unconditionally. With devic
> etree we have standard "wakeup-source" property, but I am not quite sure
> what's the latest on X86...

The AXP288 variant is X86, the other PMIC models are for ARM
(to the best of my knowledge).

Regards,

Hans

