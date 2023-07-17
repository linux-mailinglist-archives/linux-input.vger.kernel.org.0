Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEB517558C9
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 02:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjGQAQE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Jul 2023 20:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjGQAQD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Jul 2023 20:16:03 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D24BE6B;
        Sun, 16 Jul 2023 17:15:55 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 07B575C004F;
        Sun, 16 Jul 2023 20:15:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 16 Jul 2023 20:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1689552953; x=1689639353; bh=GC
        Tn0BVnsIZ/kr4rEJXZN6H1iUcPCln8l5ob7SgqWEY=; b=YWYQGIi1873g1B5Cw9
        1JUp911HGrF26/Hb8PTGhpJ/L4Ec0MFSacYN53hXWWJrOZT1F7r7Iyhv4X2lkJB0
        Bh71CLSnz9Lw3/BeVqgaEhjQ6+80bNvwF3wgx88mn5FTgG+CsPVt23oVGWml8vgm
        Q9PQlAOnMhudZFk97qQkf6bYbGJLF9hIHmyoHNFaS2KZiNl3dYxWZdw0l3Qi7YGN
        O5i/M0cvA7CqAAptHpKxmbocgbNzKBHy7LD7K1pV9Ay47mSrV/U7UC/it0uozUAm
        kixdcJO04rDHG5Gsvlp5xzMoWUbtVon/378+i/WNS1TjYGYsco9POiEx6VRYxB0n
        7rww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1689552953; x=1689639353; bh=GCTn0BVnsIZ/k
        r4rEJXZN6H1iUcPCln8l5ob7SgqWEY=; b=qhRnvcC7vx4j83sJ2ArYgOj05iaFY
        pVhKEftVV2oCh9TkVw1cuzDZGfX1xg70yKBS4Lo/q2TxrShmb+WHtE7A2HpDjMYY
        hr9rCnj460X1F7iTup8UHM4qCIuJycLLnlevPd3Rs7zEEMWbcCOG0E5QOHd3i4s0
        065SL2mwX0HjemIIb5c1x5K04O9KuNXAVY5CGwBuzwGclbmrQGJFAIoWHgJjjjDZ
        ZgxwdFBhhLq/x4yePp8RAuav7L67Z2F+rOf7ua79Mnpq7L6fNXIbSocFI5YBJTuc
        aGMtK2E9C8IPkjCrOswR+IUP0UZ2qjrspUoL10UAjhSBwk0z1R+CZ1NKw==
X-ME-Sender: <xms:OIi0ZHZzq_31U38cubHm0mcu9kUBsUyZwo2fvKt3zGx47PcHHdJp5A>
    <xme:OIi0ZGZJehjBlYwxGIDQIu0bmiDH3z3b0WZFAuEpHjX-4hHwJpxr3zPcQzHE3cH_y
    xV64LIejGWitSDatMU>
X-ME-Received: <xmr:OIi0ZJ88a1-ejbOYKMtNWM_agfZT1JVCZpODsCVVHOWO7cHRrvJSED7dBlyQ3q9zmM6d9iliWxvBQMeY7EKgrDEWYUUYKSqskdkD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedugdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhepvdevjeetjeejveekveetveetjeejgffgudekleektdei
    hfehieehieethfejffegnecuffhomhgrihhnpehpohhlihhmihdrihhtpdhsphhhihhngi
    dqughotgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:OIi0ZNoVlwJQPx_v_7C-4WCy3HBF2BtWrHv5mRv8pC9L_Ve0KMo_xg>
    <xmx:OIi0ZCruMUUuoUJDpWq6t6PjcsK-WpjC3jKWSvdTJb253Zg6O1qkDw>
    <xmx:OIi0ZDTA2s16R7rRUyF-hIEglGBJ41G92lk0BTawTo2VeOCoVvb2dA>
    <xmx:OYi0ZLk5kke8WAll71FIYfXA211r8_5CGMYNJu-C2pbc-skCz8xDMw>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jul 2023 20:15:49 -0400 (EDT)
Date:   Mon, 17 Jul 2023 10:15:44 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] HID: Add introduction about HID for non-kernel
 programmers
Message-ID: <20230717001544.GA129954@quokka>
References: <70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it>
 <20230627060437.GA726439@quokka>
 <dc79f50c-0539-0d7c-129a-d02d5bbee4d5@polimi.it>
 <20230710021034.GA600582@quokka>
 <2c2a03ac-cd11-7893-4b89-b88845e0f189@polimi.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c2a03ac-cd11-7893-4b89-b88845e0f189@polimi.it>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 13, 2023 at 04:36:18PM +0200, Marco Morandini wrote:
> 
> The current version is with a unique code block, and renders like this
> 
> https://home.aero.polimi.it/morandini/Downloads/Screenshot_20230712_185907.png
> 
> With a unique code block but a newline in between the report and the
> explanation I get
> 
> https://home.aero.polimi.it/morandini/Downloads/Screenshot_20230712_190335.png
> 
> that I find somewhat more dispersive.
> 
> If I interpose multiple code blocks and explanations (as text) unfortunately
> spynx add a colon at the end of every paragraph, as if the text was the explanation of the
> code block below, and not above:
> 
> https://home.aero.polimi.it/morandini/Downloads/Screenshot_20230712_190656.png
> 
> I've not understood how to get rid of that colon, and I would prefer to leave the
> explanation _after_ the corresponding code block, and not move it before.

https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks

This suggests that if you write it as "what follows is a button ::"
(i.e. space before ::) that should render it without a colon.

[...]

> >> +This Report Descriptor tells us that the mouse input will be
> >> +transmitted using four bytes: the first one for the buttons (three
> >> +bits used, five for padding), the last three for the mouse X, Y and
> >> +wheel changes, respectively.
> > 
> > I wonder if here we should mention something like:
> > "This particular device only has one HID report so it may (and does)
> > omit the Report ID. Devices that can send multiple different HID reports
> > must send the Report ID as the first byte of each report."
> 
> The problem is that, with the current document structure,
> Report IDs are introduced later, in section
> "Collections, Report IDs and Evdev events".
> There we have the sentence "A device with only one supporteHID report 
> (like the mouse example above) may omit the report ID."
> 
> Before that section the reader does not know what
> a Report ID is.
> 
> Thus, I could add the sentence you are suggesting, but
> changing it into something like
> 
> This particular device only has one HID report so it may (and does)
> omit the Report ID (see Section "Collections, Report IDs and Evdev events"). 
> Devices that can send multiple different HID reports
> must send the Report ID as the first byte of each report.
> 
> I don't know whether we are clarifying of confusing the matter,
> and I propose to leave things as they are now.

sure, that's fine

Cheers,
  Peter

