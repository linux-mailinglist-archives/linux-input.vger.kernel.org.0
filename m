Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F06355612
	for <lists+linux-input@lfdr.de>; Tue,  6 Apr 2021 16:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbhDFOHb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Apr 2021 10:07:31 -0400
Received: from smtpcmd01-sp1.aruba.it ([62.149.158.218]:50910 "EHLO
        smtpcmd01-sp1.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232398AbhDFOHa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Apr 2021 10:07:30 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id TmMSlNqy2TIb1TmMSl6TuV; Tue, 06 Apr 2021 16:07:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617718041; bh=qnNqa3PMe4bx15r4Is7WmH19xKZdB1p4g61UEusxWAk=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=TWan4RDaktPxYOxjqxMW8xRiNVl6PcK0FCsdTsCq33PVswVzFFzjMBsgBewEp09LX
         UQqCc7wYOq/8HAboLatFAD5M+2mVABZ4GEv70r67wVD4zjHxnx32qHHIXBYCWvOSIL
         EdvQbl4uuuDgSyFMGwebUO+aH3o02XZ/OEmWcRxad2HG801OA0ceWAjJIoHYED1O1F
         I4A///xHzoB5FJV+sGDpiVlwsH0vU1+p6SfhBFzrupVMnbcHad1/Lyiwd1XLJqy1ru
         mxL4V734WVEWaqDBtbFi7q9xW9d8ccTHi2tcoZicZgoOq72YBr4WHE6viPbcwDVYEK
         yG1fxLe2xEk7A==
Subject: Re: [PATCH v3 2/3] dt-bindings: touchscreen: Add HY46XX bindings
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.ne@posteo.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <YGbc7Qbu6s659Mx4@latitude>
 <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
 <20210402161627.2546145-3-giulio.benetti@benettiengineering.com>
 <YGxkB6icZSJfx/VB@latitude>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <a7b384ac-55f4-931b-d8ce-0c74c70f07cd@benettiengineering.com>
Date:   Tue, 6 Apr 2021 16:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGxkB6icZSJfx/VB@latitude>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJtVFEwfrBGwgWRPXTt+otcGFjg32IsmdB3T+rIy/kGUyznTAvNtJeZ1uKEf+AeS7XWdnur8gLRH8KHyct3H8P44GL6xbRbLEEGcJHYEl2irFYMR+EPY
 PlGJWTZhLl3CLqVvURMXcg3hGC75IuTlHApB0H4Z2C/8gHNRXis8P5oqudvQxrgSpX0EjHMyk9h0CGz7u0jUahNVymk8xXceYPj/g1tFX7paBsEJMCy/OrTd
 2f+PawskwYhBhqlmbOnJa4BVuFcuqosINqDEy+1MbL/Q4NFzhoexLFA512jcEXCAOEbrcqDctvHvZ7DhbAPG19uPId+/5oe1Eew4AXKWxQ2X1H8Ja1APWH9m
 zOKf1zJdvhrAEOP/mR94EeNz8UfimdQG9G1jJeVED/FAOC2ohSe2vqJkZaQRCtVfz33TWd82ppRKFFYt951T/O6STw+3bQ==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jonathan,

On 4/6/21 3:37 PM, Jonathan Neuschäfer wrote:
> In the binding:
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - hycon,hycon-hy4613
>> +      - hycon,hycon-hy4614
>> +      - hycon,hycon-hy4621
>> +      - hycon,hycon-hy4623
>> +      - hycon,hycon-hy4633
>> +      - hycon,hycon-hy4635
> 
> In the example:
>> +      hycon-hy4633@1c {
>> +        compatible = "hycon,hy4633";
>> +        reg = <0x1c>;
>> +        interrupt-parent = <&gpio2>;
>> +        interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
>> +        reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
>> +      };
> 
> 
> Rob's devicetree lint bot detected the mismatch in compatible string
> here.
> 
> I personally think 'hycon,hy4633' looks better than 'hycon,hycon-hy4633',
> because it isn't so redundant.
> 

Thank you, I've realized it after submitting patches and waited for 
other comments. I've already fixed it the way you've pointed.

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
> Best regards,
> Jonathan Neuschäfer
> 

