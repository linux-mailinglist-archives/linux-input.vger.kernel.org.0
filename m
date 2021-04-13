Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6072935E2D3
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 17:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbhDMP1a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 11:27:30 -0400
Received: from smtpcmd15177.aruba.it ([62.149.156.177]:54656 "EHLO
        smtpcmd15177.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbhDMP13 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 11:27:29 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id WKwUlnaxTLwkNWKwUlK0tu; Tue, 13 Apr 2021 17:27:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618327627; bh=eHQ7oMwhKAzY0bMH6NRyd7uaxv2qIxO2vq5jkgp4Xa4=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=nOcZ7PfCmRMBgVsJBIO2K5lc/aQtdZINMsPM4IzWiZzKNckxxNXM/mzfoTQ/qr7f1
         RDM7CC21WlsX3GL0CJ3ovBMXSVoABD0pwwj8Q47SrWcx4O0QMBF0g4mpYrtTs9sSRX
         KwJZ3opbTE9t/FV59dnegsogVzkh2W37IMLxKHtrxY7w+KEOfpJ923n7bHOaNCplkK
         lsjTAteYNw2ClF6f2F+lH3gXG81Fz9byK67kmSGDetO30xG+A7qbv7XS4xq6pTwIjm
         t2ydYZOZLvu9G57VKKcvi0JOm0fFWzTnOtStETf23XHQ3mKvm/lSCt5jdySxsmwTT/
         gNHvFmnFmfPBA==
Subject: Re: [PATCH v6 1/2] dt-bindings: touchscreen: Add HY46XX bindings
To:     Rob Herring <robh@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        linux-kernel@vger.kernel.org
References: <20210412144624.GA3868831@robh.at.kernel.org>
 <20210412152400.1587623-1-giulio.benetti@benettiengineering.com>
 <20210412152400.1587623-2-giulio.benetti@benettiengineering.com>
 <20210413150710.GA1683048@robh.at.kernel.org>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <3bf86aaf-bfad-0615-44c7-3a89417af56a@benettiengineering.com>
Date:   Tue, 13 Apr 2021 17:27:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413150710.GA1683048@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLKEA42qwuNUsmqgoxEOl28wb9B9Iz58/E9S+weKlL7saASpLU98VdRGhOBsgnZ+Q+B6KesynCwfAL0aenbumu1qiNP0+tVWViJtpx7KxnZm1G/raSFc
 cBHqMoQpAA0BOzDV7tNvQdhoKalhd2mUN+TxkFvYxmKxousjC/kWr3n6agMz1fBWmNumU7Ww2ND8Pu1EdYUuHzOmY47zNf/7lCMW2iDjDXsHplahJ9NgtVlD
 s95Gx/1mgQGOkpwLkDTu+tioCv20NA4JqZR/NlQ6Cd1slcKYn+n1LwoCt3uZK0Rgw0NYHBr8UmumZLdZACaBw3K3c1preN3r8kTnsI+o68stnsP2N+kHyTjs
 pYc2qbWElWcthZbETqKfCQ+GjUPbpfK5cJwDiEJNwQlprnNFPUddpNhm+T/Id6PbK0ITw35r2s5Th0VABUE7e687Ep6BLw==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/13/21 5:07 PM, Rob Herring wrote:
> On Mon, 12 Apr 2021 17:23:59 +0200, Giulio Benetti wrote:
>> This adds device tree bindings for the Hycon HY46XX touchscreen series.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> As suggested by Rob Herring:
>> * fixed $id: address
>> * added "hycon," in front of every custom property
>> * changed all possible property to boolean type
>> * removed proximity-sensor-switch property since it's not handled in driver
>> V2->V3:
>> As suggested by Jonathan Neuschäfer:
>> * fixed some typo
>> * fixed description indentation
>> * improved boolean properties descriptions
>> * improved hycon,report-speed description
>> V3->V4:
>> * fixed binding compatible string in example as suggested by Jonathan Neuschäfer
>> V4->V5:
>> As suggested by Rob Herring:
>> * drop hycon- prefix from compatible
>> * use Hertz unit suffix for hycon,report-speed instead of u32
>> * set hycon,report-speed minimum to 1Hz, 0Hz make controller to do nothing
>> * change hycon,power-noise-enable property name to hycon,noise-filter-enable
>> * improve hycon,filter-data property description
>> * use generic touchscreen node name in example
>> V5->V6:
>> * changed report-speed property name into report-speed-hz according to
>> Rob Herring's suggestion
>> ---
>>   .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 125 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

I've sent v7[1] before receiving your Reviewed-by.
Do I have to re-submit it once and if I receive a Reviewed-by from you 
as a v8 with all your Reviewed-by's?

Sorry for the noise.

[1]: https://patchwork.kernel.org/project/linux-input/list/?series=466405

-- 
Giulio Benetti
Benetti Engineering sas
