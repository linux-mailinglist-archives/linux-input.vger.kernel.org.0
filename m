Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF4E6B6CDF
	for <lists+linux-input@lfdr.de>; Mon, 13 Mar 2023 01:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjCMAol (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Mar 2023 20:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjCMAok (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Mar 2023 20:44:40 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BCD24BC3
        for <linux-input@vger.kernel.org>; Sun, 12 Mar 2023 17:44:38 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id E26F6320027A;
        Sun, 12 Mar 2023 20:44:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 12 Mar 2023 20:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=undef.tools; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1678668275; x=1678754675; bh=Uw7OnYkfDUMV30FRwyoXt3ygKUIdUif73ri
        2WYK6kkY=; b=e/SGDv9xBcrz+7CylSL5Wx4v0x4vbHsK7BpcQvA0JCSOOCjhvBK
        xRO5P3LBc04lxpzwVvOE8yOYMEk5mcSIUhDdJ+uebEQZpZbTDvECRvT6uy+YlcYG
        8FOc4LLuNRNc8gGsmLk5EC494WMiMwKRDvRehTeyQ+Y1aCXqwjOkuZWYBuw55Z5e
        SSuVwQgSjAVE/IhXvpbOCntMQT92kogIHnjKkWmkzWn2NEVMWhBlh3npwi3f17c9
        b5/nDm2PCUZA7fZ30+TptX4cpxf/JrBLqHGfsAZKyb4byGl8V7Ejo9e7DinOenky
        ETOZ2ELqAae/xE96+KNJ8ZwgKCrwoTqT+FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1678668275; x=1678754675; bh=Uw7OnYkfDUMV30FRwyoXt3ygKUIdUif73ri
        2WYK6kkY=; b=mR9wfnB27ecs40F7ISX8ma1InUDwjBr2C3Ni1G5m/Jm+mMKgQvA
        AKv9SaVOS0dBxfyy9RArlYSG5lgo1+qGwqEErLD1VKjpIh7PCkmdIAyY+Gp6K+iJ
        Y+0QEZrfTYn+FDfcCS0w3Flp67Co0hGfZHsD1B86XDScyQHp4H+iFfU75vDBF1sE
        jM79KurF2G7gOk4gMdTwZhJ8xPDzy9Xu+sJXvbAMj0sKOXE0s2Aboq4lx4A0NsBZ
        qYkWrigSf405r88FOAegis0+5pVtuCTnpIasBiEQwvyNPe4cr0CpZnycyOH+b6Rp
        RR8MTw6AoVrg0XaxMNQ0GtwTRRjuYcIIxBQ==
X-ME-Sender: <xms:83EOZH_5NqG2k1hTAPxggNd5_LS-ESPbDA27_onaTaCKV1UXKTO27Q>
    <xme:83EOZDtxmnPRiGzW18-dxmQO6tKyXcD8rdxZhtvUQFvD7Izq96zzLB1qvCzPwwTJl
    VIzcJx1vYwHklZ9pYM>
X-ME-Received: <xmr:83EOZFCQQX6FZHhjxJAE_LLGAh5vHGF40djj16wHirx7qZo6IbOiG69IYkV-SALtU7DfxI2DVR7Pt3jl3g-2yGuGmHgQfWBLXWMvsM8eKmMKHz4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvfedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflrghr
    rhgrhhcuoehkvghrnhgvlhesuhhnuggvfhdrthhoohhlsheqnecuggftrfgrthhtvghrnh
    epteelhfeiudegfeejgfekleeghffguefgkefgleekkeejtedufffgieekudekfeeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhgvrhhnvg
    hlsehunhguvghfrdhtohholhhs
X-ME-Proxy: <xmx:83EOZDe-NViPe8sy0bzNW59YBzMaA36ekQC0xQ3Fzg-8Lv5c9encwA>
    <xmx:83EOZMMrvyCBfEA4LWYFJjxqMt3a9L5vxAiUGZgXHBzcVkQ8uTbE6A>
    <xmx:83EOZFlwYaXcQBJYtOFYmVBMABVT04Ve9w97RjXYlfX8OWBI97Armw>
    <xmx:83EOZG25W4Kkn5iR31g0mU42WaDv8qVJhgoOgUX3AcT1VEFRSjaddQ>
Feedback-ID: id76147eb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Mar 2023 20:44:33 -0400 (EDT)
Message-ID: <ec69989c-3fba-cf82-5238-476b85c49aa9@undef.tools>
Date:   Mon, 13 Mar 2023 11:44:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] input: touchscreen: goodix: Hold controller in reset
 during suspend
Content-Language: en-US
To:     Jan Jasper de Kroon <jajadekroon@gmail.com>
Cc:     linux-input@vger.kernel.org, megi@xff.cz
References: <20230310170026.415739-1-jajadekroon@gmail.com>
 <20230311131534.484700-1-jajadekroon@gmail.com>
From:   Jarrah <kernel@undef.tools>
In-Reply-To: <20230311131534.484700-1-jajadekroon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 3/12/23 00:15, Jan Jasper de Kroon wrote:
> From: Ondřej Jirman <megi@xff.cz>
>
> The Goodix touchscreen controller used in PinePhone is not properly
> suspended during system sleep, leading to high power consumption. This
> commit modifies the driver to hold the controller in reset during
> system sleep, reducing power consumption by around 40mW.
>
> The original patch also disabled the regulators during system sleep, but
> this could cause issues with other peripherals attached to the same power
> supplies. Hence, this commit only holds the controller in reset during
> system sleep and does not attempt to power it off.
>
> A separate commit adds a new device tree property "hold-in-reset-in-suspend"
> to control the hold-in-reset behavior of the controller during system sleep.
>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>


Tested-by: Jarrah Gosbell <kernel@undef.tools>


Thank you for upstreaming these,

Jarrah.

