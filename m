Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F24B5027
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 16:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfIQOQv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 10:16:51 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:39726 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbfIQOQv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 10:16:51 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id B9B5DA0782;
        Tue, 17 Sep 2019 16:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1568729808;
        bh=26ULHVdLw4mMiJNu6T4YmXbO9stl3BMJSTkuys/RJcY=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=U9Q32iVd/Ip9mYFyMCl9+bH74KqQasMWKgGDuXTuiayojM78GLB2/EdPWU477SkRn
         +omwwRwkTfdNVLFzSrd8WbKUG3XKG/9GPy/VBUAjFZpI61nJvcSnZS43y304okE9W7
         3KcuGziwd/ZbTI5PQ/0dsaZAI4+z1Jwl7kGREaNA=
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH input-next 1/4] dt-bindings: input: Convert mpr121 binding
 to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
 <1567424417-3914-2-git-send-email-michal.vokac@ysoft.com>
 <20190903065615.GA17646@bogus>
Message-ID: <29307819-fcac-cbf8-0439-23c831d87278@ysoft.com>
Date:   Tue, 17 Sep 2019 16:16:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903065615.GA17646@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 03. 09. 19 8:56, Rob Herring wrote:
> On Mon, Sep 02, 2019 at 01:40:14PM +0200, Michal Vokáč wrote:
>> Convert the mpr121 binding to DT schema format using json-schema.
>>
>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>> ---
>> Hi Rob,
>>
>> I will appreciate your help converting this binding. Currently
>> the scheme is not valid and the error output of dt_binding_check
>> is not really helpful.
> 
> What's the error? I don't see anything obvious.

After some trial & error attempts I found few issues:

  - Wrong placement of description for wakeup-source. Solved.
  - Missing coma between <KEY_4>, <KEY_5> values in the example. Solved.
  - DTC complained about invalid reg property length in the example.
    Solved by placing the mpr121 subnode into i2c {}; node and adding
    #address-cells and #size-cells properties.
  - The linux,keycodes property also requires type definition. Unresolved.

    What type should be used? Neither uint32-array nor uint32-matrix work.
    The linux,keycodes list is not correctly validated against the maxItems
    value. When I set maxItems less then the number of keycodes, it does not
    complain.

>> Also, who shoud be the maintainer of this binding?
>> I put Dmitry in there as he is the input subsystem maintainer but
>> I am not sure it is correct.
> 
> My preference is the author or driver maintainer.

Then Dmitry seems to be the best match here I think.

>>   .../bindings/input/fsl,mpr121-touchkey.yaml        | 64 ++++++++++++++++++++++
>>   .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 ----------
>>   2 files changed, 64 insertions(+), 30 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt

