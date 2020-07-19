Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E79B225498
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 00:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgGSW45 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Jul 2020 18:56:57 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:35049 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726156AbgGSW45 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Jul 2020 18:56:57 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.west.internal (Postfix) with ESMTP id C49B062D;
        Sun, 19 Jul 2020 18:56:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 19 Jul 2020 18:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmh.eng.br; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=IwtTVMIULxX/8K188g/bQylmehW
        oNdWkoM/BtdvK8s4=; b=McO54vqPKpp3i4TymYJyPzHE6suA/Ha+Gtm1pcuPyKd
        OmzBb4cSbP2aLZvpWhSAit3VyKsiZk+iYAqV71kN26mOZmJLxIXMRcvX4gT/1l0K
        D78xO72NkOcblsZuCLl3SYNR2Zpncbkp0ZJjxza8yVZCF9uKGgSizqNjKjVqC5lC
        3QpGKistYD4Ws8D9e+tc9XE3vFWpgE9DeXMApyMClpwfQxIsNzM0/M7FBTBd02QW
        1Gda/v+80dlESKRds6msxIlRT3TAfdd7cV2RFoWSl1SfF3868TuuYZHvO7ZofTzt
        u4f/cC/DgEQOM05ucNFNfgnFDarwoAPl96IgakfE3Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IwtTVM
        IULxX/8K188g/bQylmehWoNdWkoM/BtdvK8s4=; b=p9REiXXDrvECxf/4tEloLp
        +yuLotcZLXqfLuaBQhPWvR4UNITcmu5L70JHSvVPZYuRxSClmE4G2JCRoq7nZXvw
        dPREyoLrEabJZFZCkJ3o2chv/aSCm3HtJTKrRy9wVN5Z9dJOnXFRdshMGlwa4gmC
        CIU8PF7BIJckdvBqrbKv4fq6bTSqByPKp0mihB4u7mjntHWb3tolfLaVYg0+xti8
        31qokuKawvnbkvYLJjmgmjPHmKI3Sst9CRTyf9iDtAGmSjuLTaGb3mC9pXQKGaaQ
        GD2oqWeB6pMIbfgBYYf9s+ZpYG9OFRFdSJpliHbrq5NtAtzNpbhEm6CJ9fYRtIJg
        ==
X-ME-Sender: <xms:ts8UX57DyB59CZO1_9wfWwhpU55JAa_RpVhMKctuwGvDdAg__4fmyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgedvgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttddttddtredvnecuhfhrohhmpefjvghnrhhi
    qhhuvgcuuggvucfoohhrrggvshcujfholhhstghhuhhhuceohhhmhheshhhmhhdrvghngh
    drsghrqeenucggtffrrghtthgvrhhnpeevudetjeegiedufeeugfeiheeljeekfeduhfej
    feegkeehkedvvdehheelgeevieenucfkphepudejjedrudelgedrjedrfedvnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhmhheshhhmhhdr
    vghnghdrsghr
X-ME-Proxy: <xmx:ts8UX25a2Rxv-l3E6odDrb-GSpKcVCyBDi2uqt2zGT2VW3WWO5fcSg>
    <xmx:ts8UXwetkkhLpObLgZj48LpI3rARhmNQ_4IZXJFFzMl6jRkvKkrKgQ>
    <xmx:ts8UXyJiP4eB8UMlKJ9Le1lcloefVKc4KrMA5UpdwCbHqBypAmkTvA>
    <xmx:t88UXypcJjK3c-SYqoOp-TZJnpATrawdAtCDUHUJ7X3xQmkqxYO57J672lA>
Received: from khazad-dum.debian.net (unknown [177.194.7.32])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6CBD330600A3;
        Sun, 19 Jul 2020 18:56:54 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by localhost.khazad-dum.debian.net (Postfix) with ESMTP id 8C2603400161;
        Sun, 19 Jul 2020 19:56:52 -0300 (-03)
X-Virus-Scanned: Debian amavisd-new at khazad-dum.debian.net
Received: from khazad-dum.debian.net ([127.0.0.1])
        by localhost (khazad-dum2.khazad-dum.debian.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id HREs72AK_48Y; Sun, 19 Jul 2020 19:56:49 -0300 (-03)
Received: by khazad-dum.debian.net (Postfix, from userid 1000)
        id D1B3D340015F; Sun, 19 Jul 2020 19:56:49 -0300 (-03)
Date:   Sun, 19 Jul 2020 19:56:49 -0300
From:   Henrique de Moraes Holschuh <hmh@hmh.eng.br>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        linux-input@vger.kernel.org,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on
 new Lenovo Thinkpads
Message-ID: <20200719225649.GA4341@khazad-dum.debian.net>
References: <20200717114155.56222-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717114155.56222-1-hdegoede@redhat.com>
X-GPG-Fingerprint1: 4096R/0x0BD9E81139CB4807: C467 A717 507B BAFE D3C1  6092
 0BD9 E811 39CB 4807
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 17 Jul 2020, Hans de Goede wrote:
> This is a simple patch-series adding support for 3 new hotkeys found
> on various new Lenovo Thinkpad models.

For all three patches, pending an ack for the new keycodes by the input
maintainers:

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  Henrique Holschuh
