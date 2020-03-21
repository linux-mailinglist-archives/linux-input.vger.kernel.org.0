Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9F0818DC79
	for <lists+linux-input@lfdr.de>; Sat, 21 Mar 2020 01:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgCUA3O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Mar 2020 20:29:14 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:46393 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726955AbgCUA3O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Mar 2020 20:29:14 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 688DF6AC;
        Fri, 20 Mar 2020 20:29:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 20 Mar 2020 20:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=WKm8vmhWsw9PHcu6TsETEz7oSvo
        Db47LobmLHOphtxw=; b=nuXLQyUZGyiKwniABky14rKZBBGsmotrob+k3fOnddD
        b9BoTe7uUnK+fYWjDqWK3N7QltLxrlQPm5rUlB8mJc5OGpuKis0wzuBOmt0umgC4
        ZFm2sEH9LGGh35ATR9Svg4XWLWYxYYwD324jdJTBdHi6UviXc7FbX0N+GFbTgYOO
        jilxbJfLVGQk7ecQ0PhBnqI/hnEpLpJSAkBB6yge3Am+DbItovp4OzWHIP5IdIR5
        1lVhlpLjHBQGbnPUcIerYdH0L+SWR99QIGurL3K+hUt36VWFF4Lhp6OzZR5BQyMU
        IUemSXDayxJxqbWuHNE8obiX9buYGNKKDgNqVR7ZIeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WKm8vm
        hWsw9PHcu6TsETEz7oSvoDb47LobmLHOphtxw=; b=dWFZ+dnLSlqyThAqnCng6+
        6t1KBmJB81GTIwjgrmz8reDMo4A6mExrL/V33xMcX2x30IPnXPYdpAbQ/rr6WmFy
        w5v+Ys7gFaaNqR964cojjd8X95YDSmofzYccn6rFseD47VQ7jQPJg/qNmrGd7WfN
        2knHh5SGqH5JS7wlqyTmzyIyEbYzhIAbqfK6/qaRgQU5jeQlA28p17m93CuO50qz
        DJ+wBvD88S7drLJxrO9/0rh2NywTxW8HeJ0MJanuuAQUaxGTW4Zd2aKXbdtVAe23
        H9IhazL6hPulBeLVVLbZAzGnBzqEAiZnHAipVPwYF0QqhDXL5Me2Ld6EXf+8hpLw
        ==
X-ME-Sender: <xms:2F91XgN0pa65bMSNNScQeqaab1c1MQafjbBEHp_eVED6Hp_42MxT7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegvddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecukfhppeduudejrddvtddrjedurddutdelnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqd
    htrdhnvght
X-ME-Proxy: <xmx:2F91XqpY4oZ9FMboqHnlzgT58zMsz9GdNZs9XWV7kMDsDfLVF0Eopg>
    <xmx:2F91XhHXgzt8n0QencuXS2SPqXJ7MqRSxYNvK_zSLJdjhA-4tQGVrg>
    <xmx:2F91XvpH9a8QOmJKFN7l9SFar4PRvR7KCBKk8BU6ufaVlI1EgfRyuA>
    <xmx:2V91XscFkTKBpG7WgNK-5z4x1Ud8zGhympmy5fpFCrxgtbZ9L_zZwA>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8AB5C328005D;
        Fri, 20 Mar 2020 20:29:09 -0400 (EDT)
Date:   Sat, 21 Mar 2020 10:29:04 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Mario Limonciello <superm1@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@archlinux.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: issue udev change event on device
 connection
Message-ID: <20200321002904.GA2472393@jelly>
References: <20200318161906.3340959-1-lains@archlinux.org>
 <CA+EcB1MoTXMaueJfRHf51A5PU4oiKSJXrHazfTEvifZK54OrLQ@mail.gmail.com>
 <e8ea0c2e-445f-21e2-a248-3368f26bf391@redhat.com>
 <20200319022331.GA2384843@jelly>
 <nycvar.YFH.7.76.2003210103540.19500@cbobk.fhfr.pm>
 <CA+EcB1P0qW4hdWG1YAYkD6X8jL1OaXZn4Lfu7aCmGBqwOPrJyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EcB1P0qW4hdWG1YAYkD6X8jL1OaXZn4Lfu7aCmGBqwOPrJyA@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 20, 2020 at 07:15:38PM -0500, Mario Limonciello wrote:
> On Fri, Mar 20, 2020, 19:06 Jiri Kosina <jikos@kernel.org> wrote:
> 
> > On Thu, 19 Mar 2020, Peter Hutterer wrote:
> >
> > > > Then we would need to support that attribute forever. IMHO the best
> > > > option is to just make a uname call and check the kernel version, with
> > > > the code marked to be removed in the future when kernels older then
> > > > $version are no longer something we want to support.
> >
> > Oh, this doesn't work *at all* with distro kernels backporting everything
> > that passess by to kernels with major versions looking years old.
> >
> > I (as one of the "guilty ones" with my distro hat on) am not at all saying
> > it's perfect, but that's the way it is.
> >
> > --
> > Jiri Kosina
> > SUSE Lab
> >
> 
> Another "solution" is to use module versioning bump as part of this patch.
> At least when distros backport then you can look at module versioning to
> tell the behavior of the driver.

tbh, if there is no good solution in the kernel to communicate this,
userspace can make do without knowing about it ahead of time.

long-term you can just assume you'll get the change event and handle the
error case just as you'd have to do now. Sure it'd be nice to know ahead of
time but it's not the only thing we don't know until we get the first event.

Cheers,
   Peter
