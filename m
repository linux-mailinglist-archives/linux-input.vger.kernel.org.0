Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 957C773BB64
	for <lists+linux-input@lfdr.de>; Fri, 23 Jun 2023 17:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjFWPRl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jun 2023 11:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbjFWPRY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jun 2023 11:17:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82C635BD;
        Fri, 23 Jun 2023 08:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=N3smy6Zp96zb/56FOleD7t4iHGn3m5ujv35yRmbmja8=; b=AWAHdqhKgpBNeh1ReecXi/vhOV
        1WwGGujDC1g8Xml0ppCQz4gJqANGq3FtnuI0hqTMRgpAOSixr4UCLdW07EfHlMFQJI+XElH34CUuB
        A+MBTpdSTmxoUKIoQxqKl1RDvajc2fUp3g8lYP5JAhvlejRget3/5tugFA+pqg269n4Q3kFxQ9yGy
        P1yTNtdtNvJYhtLiHYgmsEHqqkSkq2znDHYOiDomfP12A4YbpcRZlKLvlE2cdE9oknpZQZq49YgHF
        rmLfJt1EzZqn0ZEZUsF5Mr8R1TrmkIzJuqgiDDQWMgBIvJNn8JslZKbzRS8YJNvORHWA72xjZDDjV
        fkFiJgLw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qCiWH-003uYG-1H;
        Fri, 23 Jun 2023 15:16:17 +0000
Message-ID: <f53e756f-7c81-1c79-23ea-b9009fdd2ef4@infradead.org>
Date:   Fri, 23 Jun 2023 08:16:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] HID: Add introduction about HID for non-kernel
 programmers
Content-Language: en-US
To:     Marco Morandini <marco.morandini@polimi.it>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it>
 <d34eae36-0d43-6cd5-f8c0-57e1bd30f338@infradead.org>
 <45d68dcb-7625-8592-fde6-60c9fbd5eaca@polimi.it>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <45d68dcb-7625-8592-fde6-60c9fbd5eaca@polimi.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

On 6/23/23 03:45, Marco Morandini wrote:

>>> +The format of HID report descriptors is described by two documents,
>>> +available from the `USB Implementers Forum <https://www.usb.org/>`_
>>> +at `this <https://www.usb.org/hid>`_ addresses:
>>
>>        these
> 
> Not sure about this.
> "this" here was meant to be https://www.usb.org/hid , while the two documents are listed below.
> 
> Would 
> 
> The format of HID report descriptors is described by two documents,
> available from the `USB Implementers Forum <https://www.usb.org/>`_
> `HID web page <https://www.usb.org/hid>`_:
> 
> be ok?

Yes, that's good.

>>> +    # 0x81, 0x02, 		     //	Input (Data,Var,Abs)		   24
>>> + it's actual Data (not constant padding), they represent 
>>
>>     its
>> ?
>> "its" is possessive. "it's" means "it is".
>>
> 
> -> these bits are actual data 
> 
> ok?

Yes.

>>> + This time the data is Relative (Rel), i.e. it represent 
>>
>>                                                   represents
>>
>>> +An HID devices can have Input Reports, like
>>
>>    A HID device
>>
> 
> -> HID devices that are not ....
> 
> as suggested by Peter
> Ok?

Sure.


thanks.
-- 
~Randy
