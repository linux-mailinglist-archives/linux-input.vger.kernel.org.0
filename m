Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50D435C978
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 17:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242364AbhDLPNH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 11:13:07 -0400
Received: from smtpcmd0986.aruba.it ([62.149.156.86]:55317 "EHLO
        smtpcmd0986.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241430AbhDLPNG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 11:13:06 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id VyF4lWemPppTXVyF4lrnl4; Mon, 12 Apr 2021 17:12:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618240367; bh=05YH1edc9XK59JPH66Dmvc3mEaxIZz36eNWjd1ZW4Ng=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=LtV4fLVwIXRxBuJ3cFTXmjPo8FLezhN3q4vs+/Rci+m7AJgAT2JYcCVz3W7szGo8o
         IX8Q4XBYohhv6Oh1hFhMNz7prhTWuvIDJssIBa7Cd1LYVFmAVWbr2TVYqzPbu/Stqs
         Ir2jG+XYYQAcB72+uOjAR7LKjsnKzal2iOYF8gJyf0dZFSTx1SSEqr3PaO/5ZZGfNo
         H0n1ZGoRDEDvQui5VikWG8zHaRrsLBkhL59OTipv1aFzqD2G2sAeYo3/48rqdgTyye
         8qkdK6H350rYWSYXbxGaHJtENrtX7BJkXe6kcwraDAZ/+gTOI5j7zy+AMYBnzGfsaF
         ylDMpqYdV88Rw==
Subject: Re: [PATCH v5 1/3] dt-bindings: Add Hycon Technology vendor prefix
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        linux-kernel@vger.kernel.org
References: <20210408202137.GA1890401@robh.at.kernel.org>
 <20210411114804.151754-1-giulio.benetti@benettiengineering.com>
 <20210411114804.151754-2-giulio.benetti@benettiengineering.com>
 <20210412150527.GA3897939@robh.at.kernel.org>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <5ca45a6b-2cf0-cbb5-1f0d-3bf780052951@benettiengineering.com>
Date:   Mon, 12 Apr 2021 17:12:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412150527.GA3897939@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFM4C8SuuIloPGmzhUtjrznkNIWHSHS24nFZk0jEuHifBL11YCf+odWbGZzhK8bLZtJaSZHRol1ElxfIkenw9hFX824gD2zWyPxkOOza+OKzb21ryAUu
 K875Eu+qSKLU2oDSwKZP+sxeVzsicsXBE5KAyydqwWh8Apt1aSsL6u0ldToPXHGJLvhMxl1C3BdogWmoFIL67/q+UzMP0jKRBDWM/7l39GcLYbnfjEKnp3uP
 XHylK2tJ06JFKN4p9o8g1LBUoMMKLlBY5+bCa62EQ1Fi+DUK2E/Rtn3W8rDZ+5dwoD/vcXNEPRl9Qn4W1Riu3I1l6LayWKvnd6ODZGzxj76FbTQwnqEijtyI
 Gwf0P0ZDDQhkHuy40KPCcmbfkSlAY82vkESw40nMIj9CHb4bO/xufzhJ20MjhGgzI4kDSJQF
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/12/21 5:05 PM, Rob Herring wrote:
> On Sun, 11 Apr 2021 13:48:02 +0200, Giulio Benetti wrote:
>> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
>> include "hycon" as a vendor prefix for "Hycon Technology".
>> Company website: https://www.hycontek.com/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

Ok, so on V6 series I'll send only patches 2 and 3 without this one.

-- 
Giulio Benetti
Benetti Engineering sas
