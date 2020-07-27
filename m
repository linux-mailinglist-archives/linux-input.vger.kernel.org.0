Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1698C22E38C
	for <lists+linux-input@lfdr.de>; Mon, 27 Jul 2020 02:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgG0AvA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jul 2020 20:51:00 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44805 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726636AbgG0Au7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jul 2020 20:50:59 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.west.internal (Postfix) with ESMTP id B47175A4;
        Sun, 26 Jul 2020 20:50:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Sun, 26 Jul 2020 20:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmh.eng.br; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=ZtQn8yLFnvpuWiPUdYB8nDbJbBW
        6fIQDoysVL7HWuWk=; b=QhUErVKMpv+jPIdqIi9/vX5k1/mcrPCw7u8m3H7W5Uk
        mTJHe9PqHtlx4amUHi97vzhdKS0CZVX3jxnp+tyjwn24IvwuPxs78v4y9p0fZS1T
        MBDXJOMGXioKUntI1UtfrAclWszzMqZa6IJUmQMgUbtANjZq1LI7dw+2Mw9B75Ue
        h/8Sai9uR9ibYEVKV6a7ZVUY0X2SUW7WE6OTvRqT0AhXBROySmpNshTSdxZYCrf2
        l+WQ+DrfUZouiNjI+6xgfh3CHTcIoiPKKPtTAaoCtUn8e2OrN2CivO8ty0O3uKYL
        +TOTo7JuOf0ajezvthWKyMTA+Fy3cOFG4DDnZAGB8Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZtQn8y
        LFnvpuWiPUdYB8nDbJbBW6fIQDoysVL7HWuWk=; b=U8e0cz/s8FOaKCC/9QxYXm
        5logn0z4mUtRSC6Oax1aysgVyRdQPSSRDvhfdKV4rNqjyn0Clg+GKbVlNjOabx4p
        Mctv399SPloF4L/QG0PqnrwWwN13hQjV/DQdaf1mZoQzgx/F4N/9oMmzwC3QuoRK
        xsAPWN2zhqhJGrjD3O9Sc/YEP1el6h2trdOkctycN1qLI4R5IpRlDPKOZ1A+/plp
        pK66T9PIWEcExViRPvpGb7xrU7yMmSBCkO2kIlfTxj63ADZ9Jn/KWPJcH16/erX+
        LNmwQvg+76TemvtvLcqOyxp+HIE11P5V5EtUv4NpIJvlbWwckLxXUiocBRm44aHA
        ==
X-ME-Sender: <xms:7SQeX1WZuFZXT7JEs7j6vqKoo0UEpE7t9Uq8_n2eRc9hweR9n-ie9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheekgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttddttddtredvnecuhfhrohhmpefjvghnrhhi
    qhhuvgcuuggvucfoohhrrggvshcujfholhhstghhuhhhuceohhhmhheshhhmhhdrvghngh
    drsghrqeenucggtffrrghtthgvrhhnpeevudetjeegiedufeeugfeiheeljeekfeduhfej
    feegkeehkedvvdehheelgeevieenucfkphepudejjedrudelgedrjedrfedvnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhmhheshhhmhhdr
    vghnghdrsghr
X-ME-Proxy: <xmx:7SQeX1nDrR44ulqPqGEU_8ppahj9l2A55-PBU127zsY0Sk3EC6Wfog>
    <xmx:7SQeXxZ76mhRCULo9phroZa1EGRTxJwGRxbh4HARuVIjDAaNeRe53A>
    <xmx:7SQeX4WYlydY5OgvaCNO4L4ao-lEijIa8aXEklcozxu0tLdQC1BvyA>
    <xmx:8SQeX9XVYvzRlKKlvu_5EhIqaKNeM08xsie9-3t5y-zg7nQzFKcaeZKetMg>
Received: from khazad-dum.debian.net (unknown [177.194.7.32])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6B3E0328005A;
        Sun, 26 Jul 2020 20:50:53 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by localhost.khazad-dum.debian.net (Postfix) with ESMTP id D1679340016B;
        Sun, 26 Jul 2020 21:50:51 -0300 (-03)
X-Virus-Scanned: Debian amavisd-new at khazad-dum.debian.net
Received: from khazad-dum.debian.net ([127.0.0.1])
        by localhost (khazad-dum2.khazad-dum.debian.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id WS3yir_GiUqn; Sun, 26 Jul 2020 21:50:50 -0300 (-03)
Received: by khazad-dum.debian.net (Postfix, from userid 1000)
        id 0325B3400169; Sun, 26 Jul 2020 21:50:49 -0300 (-03)
Date:   Sun, 26 Jul 2020 21:50:49 -0300
From:   Henrique de Moraes Holschuh <hmh@hmh.eng.br>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input@vger.kernel.org,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on
 new Lenovo Thinkpads
Message-ID: <20200727005049.GA10254@khazad-dum.debian.net>
References: <20200717114155.56222-1-hdegoede@redhat.com>
 <20200719225649.GA4341@khazad-dum.debian.net>
 <20200722054144.GQ1665100@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722054144.GQ1665100@dtor-ws>
X-GPG-Fingerprint1: 4096R/0x0BD9E81139CB4807: C467 A717 507B BAFE D3C1  6092
 0BD9 E811 39CB 4807
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 21 Jul 2020, Dmitry Torokhov wrote:
> On Sun, Jul 19, 2020 at 07:56:49PM -0300, Henrique de Moraes Holschuh wrote:
> > On Fri, 17 Jul 2020, Hans de Goede wrote:
> > > This is a simple patch-series adding support for 3 new hotkeys found
> > > on various new Lenovo Thinkpad models.
> > 
> > For all three patches, pending an ack for the new keycodes by the input
> > maintainers:
> > 
> > Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> 
> Do you want me to merge all 3 through input tree?

Hans, Daren, Andy, what do you prefer?

-- 
  Henrique Holschuh
