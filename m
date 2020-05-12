Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FC01CEC67
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 07:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgELFWp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 01:22:45 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:32873 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725814AbgELFWp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 01:22:45 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 3286F6D7;
        Tue, 12 May 2020 01:22:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 12 May 2020 01:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=I
        5QiT8/SptEqrGzlHkpUfaVlmT8dyNlUizt2eGrMIeM=; b=LEj+hBsttBeV1apMI
        RL7Cju0r3ywTOA5npzviQrOPe0leGhtUocWxjh0dmYLWqfu6aizYYVf7WlwDk041
        0BQ7T0QifUF0L2urRfm0yFdDZGVMy7FobFQaVQEyLlXoBHgyYk08go91jFAdsR1d
        /U5iTunygokJYNYEb833qgW9nZpWGQaf1btURQxCWdMpt199lr1+KGBsILw7ayIV
        y9rONphXubpZkwhmI+hl4GSIuoEbp++zj9fxUpyCL8/d4PyC1hOi+T++QBAi9JLD
        /O8IurzKfgdpNjzrQUB3ILWdE3zu1TamGOqGfZdRGQnrthhis+zWjw5qREK2u0Or
        5cR/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=I5QiT8/SptEqrGzlHkpUfaVlmT8dyNlUizt2eGrMI
        eM=; b=evXoLdp487BTlDKcZKJ3kEyPM3rD78WA33jtuel0A4NjQYCJZS70aIhBl
        xgSLCUl3MCH1kvnelpOMry37SPDv2D07QQZ33rfI2ry50PuarE51eVkJTqVidzm0
        dHTZOC2RRwyZb53oYmCTwKZW3BkGZ0N3YkZIlsOcMlNhwzBRj4iK6EbEiELS/qHW
        ixHW75M3ws0POIjY+anwN//sGvjtnmBPGIRM2DwCn46E+SCUX8CPhLHGtBrfJb2x
        4Vdy5YbDN/Oz07SZGMcfTzGe9oe9MoqoPX1TkQooF4PXDbmXHmJEw/kRE5Be9N9q
        E3vbljrkZBX15RG7Z3Nva8YuHiw6g==
X-ME-Sender: <xms:ozK6XvoegRq9cvVj_VP9uHbh1ercWYXGRBOW4k1a_plNW8s23DBLDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledugdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhepkeevledtjeehleekleevtdfggfffudfgfedvtdetuddt
    ueehkeeluedugeejgfegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepud
    dujedrvddtrdejuddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:ozK6XproPO0T_LGqncApuTsiQahXJtQ7IwEiQogDzYtuYhUu7XsAEg>
    <xmx:ozK6XsO9Qa3P2HK8R5daWBniJ4r3_645GyO0QmBc5UTlTWEuYJz95w>
    <xmx:ozK6Xi5qIiTYURyVhsv9jodbb9_PiyWScj6rJez69OsgQNTQQWxKfQ>
    <xmx:ozK6XkRNXw57c4XBMHqtQrxA10JYnkQgI6v1KCuhtHCqlfUrVZR4Yw>
Received: from koala (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9305E30662BD;
        Tue, 12 May 2020 01:22:41 -0400 (EDT)
Date:   Tue, 12 May 2020 15:22:36 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Siarhei Vishniakou <svv@google.com>
Cc:     Garfield Tan <xutan@google.com>,
        linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jkosina@suse.cz>
Subject: Re: behaviour change for keyboards introduced by "HID: generic:
 create one input report per application type"
Message-ID: <20200512052236.GB48688@koala>
References: <CAKF84v2gWnokoyhRe_feiWJcYOAPUcWwjaX93GkqmXqm8OzmYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKF84v2gWnokoyhRe_feiWJcYOAPUcWwjaX93GkqmXqm8OzmYg@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Siarhei,

On Wed, Apr 01, 2020 at 01:02:03PM -0700, Siarhei Vishniakou wrote:
> Hello linux-input,
> 
> We have noticed a recent behavior change introduced by the commit:
> https://github.com/torvalds/linux/commit/f07b3c1da92db108662f99417a212fc1eddc44d1
> HID: generic: create one input report per application type.
> 
> We have been looking into the behaviour of the Microsoft Designer
> keyboard. Prior to these patches, the keyboard would report as a
> single input_device to the user space. After these patches, the
> keyboard is now split into 2 input devices: “Designer Keyboard
> Consumer Control” and “"Designer Keyboard Keyboard". We noticed that
> this behavior also applies to the keyboard Dell KB216. In the Dell
> case, it is split into 3 devices, which include “Consumer Control”
> (for some of the media keys) and “System Control” (for the sleep
> button).
> 
> In both Microsoft and Dell cases, these are pretty standard keyboards,
> although they do contain media keys and power/sleep keys.
> 
> Could you please confirm that this new behaviour is indeed
> intentional, and that you wanted keyboards to be split in this
> fashion?

Is there an actual issue with the split though or just a cosmetic one? This
is pretty standard for many keyboards (and other devices) but it shouldn't
have any negative effect on functionality.

Cheers,
   Peter
