Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34AA4797E7C
	for <lists+linux-input@lfdr.de>; Fri,  8 Sep 2023 00:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233881AbjIGWAp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Sep 2023 18:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjIGWAo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Sep 2023 18:00:44 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E2A1BC1
        for <linux-input@vger.kernel.org>; Thu,  7 Sep 2023 15:00:40 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 577F05C01D3
        for <linux-input@vger.kernel.org>; Thu,  7 Sep 2023 18:00:40 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
  by compute5.internal (MEProxy); Thu, 07 Sep 2023 18:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sunshowers.io;
         h=cc:content-type:content-type:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1694124040; x=1694210440; bh=IjN7KnI7q/SVA6RL2yYzUmB1k
        QmZWf93ck/31WKLStw=; b=Pbifhn16VrHvb9Ga06SA0esvz4YmYfGD05ARpS6n8
        OyOSm5HDHpG6qODAcaXLX4C25KEVOA6OTxXe+MNsuMYX7h5hAw2AB5VjhBKyBddG
        AA4TTqUq30TdW8H3lOKjyr6JdkfLzGqiZpcHgUkSfkJXpLZNZLhHjBPdkVlUxbI6
        mO6jzXrAunyG5G9d71hDebGWwTCjBEPFP7gUEmK1GbIJRP4GgiPMXaArcWDNz8M1
        Jr54aMgwiAFmWqsa7UAZNPLaWX7rzcn4zF4xwScehHhydXrjbZCjK0w68KE6IVAK
        0pX3W35FaADMRWaemaSKXRTi64hVdc9ZJs0xVSzW6P+2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1694124040; x=1694210440; bh=IjN7KnI7q/SVA6RL2yYzUmB1kQmZWf93ck/
        31WKLStw=; b=PIc/PBvDDHQD9Z2intAScZnG9gWnp50FmHnwpgpQZwWw5AJ/O7u
        yDPcqINBD1miozX2dcQbW1Tut+n50T4d5YonhyZ3dWuKNvLV6ZBmELJKYrdF5m1n
        7ffFNyMLdDzQmwTsf7uiPbFgOT1sDZMKw3vVkJxYsLKVP7WLYsuNhTnwRh0hFFWu
        CJC/G1DSeLJn8b/Y2+/39fMfxf2CISSXOlKAT8XEZPHJzRaGUc1puOY1KMbHxkSD
        UI6UTKViFluLhNxX2MP5R3EHCr45B/ySsHLQI6vqjUY+nZRzgsAvN6QvuEDZbnAe
        Y85ItK6LqqEUWq0Z4SQtEWsLPeSHXoj78hg==
X-ME-Sender: <xms:CEj6ZP4-7YQaSoUp6MKeHq3wbdk9mdtBw13T9dgltxyz6G6wnQNR1w>
    <xme:CEj6ZE4iul143wfiTnZ1x4KeYn-o-mb5cdYDyX1jL6bVLycHhAZhf5_fVy3FFBaPI
    LQNcM7MY8r6FLetEig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehiedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpeftrghinhcuoehrrghinhesshhunhhshhhofigvrhhsrdhioheq
    necuggftrfgrthhtvghrnhepffdtgfduvdehkefhueehhfeuvdehudetieefgffhtdefve
    fffefghfelveeuvedunecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrihhnse
    hsuhhnshhhohifvghrshdrihho
X-ME-Proxy: <xmx:CEj6ZGcHW16OD1w8SKdtly4A1mxJhp3FqNXO5kjpv9vhB8l4Cr0M7g>
    <xmx:CEj6ZAIdQF8w1NV683q0uwwNk-ANrdLcgcDrmX1mzQE-b_3ax7y65A>
    <xmx:CEj6ZDLqd95Q4zgUtCeJh6Rl6ZwGt-XxSO_lv0-_volfNhPEGsenNQ>
    <xmx:CEj6ZIVLu-XREBga6Q-lV3dj2O5X5MadxK77ctUz8il8QYh9LuY4rg>
Feedback-ID: iaa1146ff:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 266F015A0091; Thu,  7 Sep 2023 18:00:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-711-g440737448e-fm-20230828.001-g44073744
Mime-Version: 1.0
Message-Id: <2bbb8e1d-1793-4df1-810f-cb0137341ff4@app.fastmail.com>
Date:   Thu, 07 Sep 2023 15:00:19 -0700
From:   Rain <rain@sunshowers.io>
To:     linux-input@vger.kernel.org
Subject: Missing ABS_PRESSURE/ABS_MT_PRESSURE for SYNA7DB5:00 06CB:CD7E (Acer Swift
 Edge 16 SFE16-43)
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi there --

I have a new Acer Swift Edge 16 (model SFE16-43) I'm trying out and it
looks like on OpenSUSE Tumbleweed, as of kernel 6.4.12, the touchpad
is missing the ABS_PRESSURE and/or ABS_MT_PRESSURE device bits. The
device itself works fine, but without pressure information I think
there seem to be some finger detection issues (specifically, light
enough touches don't appear to register).

I'm not sure if the hardware itself doesn't support these bits
or if a quirk needs to be added to the kernel. I'm happy to help try
and figure this out. My understanding is that all modern Synaptics
touchpads support pressure information, though I could certainly be
wrong about that.)

Some debugging output that might be useful. Happy to provide more
as necessary:

---
# uname -a
Linux cumulus 6.4.12-1-default #1 SMP PREEMPT_DYNAMIC Fri Aug 25 08:26:31 UTC 2023 (f5aa89b) x86_64 x86_64 x86_64 GNU/Linux

# libinput measure touchpad-pressure       
Using SYNA7DB5:00 06CB:CD7E Touchpad: /dev/input/event2

This device does not have the capabilities for pressure-based touch detection.
Details: Device does not have ABS_PRESSURE or ABS_MT_PRESSURE

# dmesg | grep SYNA                 
[    2.034760] input: SYNA7DB5:00 06CB:CD7E Mouse as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA7DB5:00/0018:06CB:CD7E.0001/input/input1
[    2.034865] input: SYNA7DB5:00 06CB:CD7E Touchpad as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA7DB5:00/0018:06CB:CD7E.0001/input/input2
[    2.036331] hid-generic 0018:06CB:CD7E.0001: input,hidraw0: I2C HID v1.00 Mouse [SYNA7DB5:00 06CB:CD7E] on i2c-SYNA7DB5:00
[    2.266243] input: SYNA7DB5:00 06CB:CD7E Mouse as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA7DB5:00/0018:06CB:CD7E.0001/input/input5
[    2.266501] input: SYNA7DB5:00 06CB:CD7E Touchpad as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA7DB5:00/0018:06CB:CD7E.0001/input/input6
[    2.266821] hid-multitouch 0018:06CB:CD7E.0001: input,hidraw0: I2C HID v1.00 Mouse [SYNA7DB5:00 06CB:CD7E] on i2c-SYNA7DB5:00

---

A thing that's a bit strange to me is the separate reporting of mouse and
touchpad devices. I don't know if that's a red herring or a clue.

Reporting this directly here per similarity to [1] which was closed in libinput.

Thank you!

[1] https://gitlab.freedesktop.org/libinput/libinput/-/issues/780
