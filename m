Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449461F8B63
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 01:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgFNX5s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jun 2020 19:57:48 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59037 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728034AbgFNX5o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jun 2020 19:57:44 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 7A2FC5C005F;
        Sun, 14 Jun 2020 19:57:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 14 Jun 2020 19:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=aAUf8ZWtRuKYcWh/bNGV7WxxMMD
        6waNEhYXD401M6pE=; b=NGW8bXCUSlx9FV1XlDsAtNbSPVjuPl/0AGvYVYKosU4
        qUiZls7nxrcqTbY5ICbVcjOXnWs64zGxlKzt+7PV69NxiXB5jRz7Kp6xBuXq2V+R
        29x9P/4xS7pdoSOLERDJH+N+WHdNpwZIscWmoOmzCi94lNFFRzi961CqcJ99IkYK
        l+cTudEqi3MQUZKPTB6eOpTMqsSobHN3IHJUJcFULCPvCHLmBem3eduJHKOgf9Cc
        AZF/83SKJAXLWCG+5VZ9t9axZbOWcnu1FHqionSWbOoteH8vbizj956zrEXFpU4o
        fhUsZOCWQcjpHOBf/+VUBYof9ZO5edfZbdMNjzcWjeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aAUf8Z
        WtRuKYcWh/bNGV7WxxMMD6waNEhYXD401M6pE=; b=o1lG4zhJGIqjCytJytfuIU
        LcPCFkDBgkSKtXAE7iEAqSPkjByhIkiEVnlH0iljY1Xkgt9+lucrw5CCbxRGHkUy
        6MFPiPSrYibg1DFpQExJRW1Ab7uW5PtT8LkDD3asp8NzYo1u1xaXKRO+/P7JZV5L
        cHYwjzJvx4uOqiBbHZa/a/sFX7HL/BbcXfOJBlUjJ+C1FE41rAPB3tCD/W7nJ2fZ
        FkhFMbdWmiY5LQpa5rYdqMOxxdSklTKJQxX3m7reGYGCPQfS8hediEFZuX2Wdem4
        CS6k8NdTl2QA8RuRaf5Fsd6//KTIEKoa/nIGHaAPBXPw5PFgTiqrOmq4+/7/d1jg
        ==
X-ME-Sender: <xms:drnmXkC3lE_7-MAYC2SiyzVwt9186hDB3MrYKTeKR69mA2JqQxY6LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeijedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhephefhheffgfehleegueduleehgfdvfeevkeduveejveej
    veevgfeggfduudefueevnecukfhppeduudejrddvtddrieekrddufedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthht
    vghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:drnmXmii6zX1AqXMT3ItVL5bmOZZA141DwGZ6joX5Ng3_3l4LH6Avw>
    <xmx:drnmXnnufYjcXBIxG_WcTCIbAjJpcTto6E-iMnEpP0yPhiwjl3iRnw>
    <xmx:drnmXqyrTkwAdzOBF_14BW2ajzU0TFv42Anb1tTmnIUoOPR8JrAJ5Q>
    <xmx:d7nmXrchMwPcGFoKkwXJQsK6d3FBlBlVE_UZvV269Piv9Y0sCTZ_Ow>
Received: from koala (117-20-68-132.751444.bne.nbn.aussiebb.net [117.20.68.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 60ECB3061CB6;
        Sun, 14 Jun 2020 19:57:40 -0400 (EDT)
Date:   Mon, 15 Jun 2020 09:57:35 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andi Shyti <andi@etezian.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org, Javi Ferrer <javi.f.o@gmail.com>
Subject: Re: [PATCH] Input: mms114: don't report 0 pressure while still
 tracking contact(s)
Message-ID: <20200614235735.GA11069@koala>
References: <20200606035017.7271-1-GNUtoo@cyberdimension.org>
 <20200606181806.GR89269@dtor-ws>
 <20200612194619.0ac97cf2@primarylaptop.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612194619.0ac97cf2@primarylaptop.localdomain>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 12, 2020 at 07:46:19PM +0200, Denis 'GNUtoo' Carikli wrote:
> On Sat, 6 Jun 2020 11:18:06 -0700
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > Hi Denis,
> Hi,
> 
> > Could you please post longer sequence from evtest leading to the
> > packet with 0 pressure?
> 
> Here's the full sequence, of a slide from the botton to the top, I hope
> that it's not too long:

[...]

> > Properties:
> >   Property type 1 (INPUT_PROP_DIRECT)
> > Testing ... (interrupt to exit)
> > Event: time 1585880998.920994, type 3 (EV_ABS), code 57
> > (ABS_MT_TRACKING_ID), value 0 Event: time 1585880998.920994, type 3
> > (EV_ABS), code 53 (ABS_MT_POSITION_X), value 400 Event: time
> > 1585880998.920994, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
> > value 1262 Event: time 1585880998.920994, type 3 (EV_ABS), code 48
> > (ABS_MT_TOUCH_MAJOR), value 6 Event: time 1585880998.920994, type 3
> > (EV_ABS), code 58 (ABS_MT_PRESSURE), value 90 Event: time
> > 1585880998.920994, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
> > Event: time 1585880998.920994, type 3 (EV_ABS), code 0 (ABS_X), value
> > 400 Event: time 1585880998.920994, type 3 (EV_ABS), code 1 (ABS_Y),
> > value 1262 Event: time 1585880998.920994, type 3 (EV_ABS), code 24
> > (ABS_PRESSURE), value 90 Event: time 1585880998.920994,
> > -------------- SYN_REPORT ------------ Event: time 1585880998.943145,

sorry, but this is completely unreadable. Please make sure it's in the
originally formatting that evtest/evemu/libinput record spit out. Thanks.

Cheers,
   Peter

