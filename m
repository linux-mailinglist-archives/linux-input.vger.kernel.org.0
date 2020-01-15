Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14B7F13B8B6
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 05:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgAOEpM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 23:45:12 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41009 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728880AbgAOEpM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 23:45:12 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 8054B2213D;
        Tue, 14 Jan 2020 23:45:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 14 Jan 2020 23:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=z
        /38VYvRZwGKy73EQYi7l9oGVAzE/Cqnj0myZCLtIL8=; b=ipGVRDctsb791mIM/
        SIPvMN6ivQCuh0upYZ8v5voq3XGScxloGJz5xyEURlwkTCfvCY19mus35Od65pqz
        kosDz64id9ShD3/88b6/skfjDCguomNPaHwele15EBHinl5r6wlHi5Cwaa73J+eW
        2JhsYxD7MqYssFKpyH2wvP6nHlytsDeW5uNStGPXBiHz2wXLQ/kxiXG9mH/GJnzp
        65mxj/RQI9zZF0aX5GFBy5vXJiXWp1zmLiKtuf7tfrJgx9OXr9Ffna5xK/dksN6X
        RCNoj5dcsmlOgwALmna6ID7pOzr4Uj89h2rNeHcojQk5neT5ojBSnxDRMh5wJRoc
        POugw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=z/38VYvRZwGKy73EQYi7l9oGVAzE/Cqnj0myZCLtI
        L8=; b=ytbNs62kas1GkJtFVaKroMht2Mk/ZcE4ztbfiXXNeXbStj6U+BsWfZqqD
        RAdcZ/9IGDyxJzVql4LOYIPfAGMaHS4Rhn0wv8ynyrTYG2pzZSSYL7LaGqYer2/0
        6AxMlaBaVM4r7CcVqtE8B2zU8esUjyUootCVTKaHhFSke52UjGGuYSGEWxfBx5xJ
        2O0SWpGza1rv6t4m7tg/udTqfsWZkPK67K0Wpe5b5ecyHa7kY5PtaxPGFq0xCgvh
        qwQIqzgEzkZAzMXyknuAKZvd9G5SQ39foZMV8XO9LRVq4FV8ZoZ58kG+zEUIcIrq
        ZqFRkEpn7HgKSE0/iqNl7qXNzQMVw==
X-ME-Sender: <xms:15geXqun7_lr4Sd2qYOTAryyMnAPoGIB_9yF9uZ-JnWRm_4LXgYOSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
    epjedtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghm
    uhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:15geXlFVLLc6X3TeGn0pLD3bzrNBGU7iHHSIRRKmhsEsAVhdLbCw7w>
    <xmx:15geXk8MxRfCVpZo4aYvRtEtipIAxmdF-A6rN2iNHi0VSPmvhit-rQ>
    <xmx:15geXjLEG-qPMqqW5FJe28f-EyWByMEw_hrT3wEiQxIcHdtpqgLKJQ>
    <xmx:15geXj0z9iwZrmrduFkH-cr3ljwa8FPS0gidyvL82jFaL14tjieGdQ>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id AC5F08005A;
        Tue, 14 Jan 2020 23:45:10 -0500 (EST)
Subject: Re: [PATCH 3/3] Input: axp20x-pek - Enable wakeup for all AXP
 variants
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
References: <20200113032032.38709-1-samuel@sholland.org>
 <20200113032032.38709-3-samuel@sholland.org> <20200113212654.GA47797@dtor-ws>
 <df608e7c-a0bd-5077-c8e4-db661353e076@redhat.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <5fe8673b-99d7-c8ca-8457-503cb7f8adb3@sholland.org>
Date:   Tue, 14 Jan 2020 22:45:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <df608e7c-a0bd-5077-c8e4-db661353e076@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/14/20 3:07 AM, Hans de Goede wrote:
> Hi,
> 
> On 13-01-2020 22:26, Dmitry Torokhov wrote:
>> Hi Samuel,
>>
>> On Sun, Jan 12, 2020 at 09:20:32PM -0600, Samuel Holland wrote:
>>> There are many devices, including several mobile battery-powered
>>> devices, using other AXP variants as their PMIC. Enable them to use
>>> the power key as a wakeup source.
>>
>> Are these X86 or ARM devices? If anything, I'd prefer individual drivers
>> not declare themselves as wakeup sources unconditionally. With devic
>> etree we have standard "wakeup-source" property, but I am not quite sure
>> what's the latest on X86...

Currently wakeup is unconditional. After patch 2, even though it's enabled by
default, the wakeup source can be disabled by userspace:

-		enable_irq_wake(axp20x_pek->irq_dbr);
+		device_init_wakeup(&pdev->dev, true);

This is a platform driver for an MFD cell. It does not have its own device tree
node.

(I see a lot of drivers in drivers/input/misc that generate KEY_POWER, and zero
of them reference "wakeup-source". It's a driver for a power button. Being a
wakeup source is half the purpose of its existence.)

> The AXP288 variant is X86, the other PMIC models are for ARM
> (to the best of my knowledge).

That's also my understanding.

> Regards,
> 
> Hans

Regards,
Samuel
