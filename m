Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F9623542F
	for <lists+linux-input@lfdr.de>; Sat,  1 Aug 2020 21:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgHATnu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 1 Aug 2020 15:43:50 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:44463 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725939AbgHATnt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 1 Aug 2020 15:43:49 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.west.internal (Postfix) with ESMTP id E6134C18;
        Sat,  1 Aug 2020 15:43:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sat, 01 Aug 2020 15:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmh.eng.br; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=tHKDE1Y2PpmdsfuJ9iiPoAeslyc
        vidfTfqXrtYPUbi4=; b=23iR1+LCg/+h2u7RUcKVZESBr5CcbHFfESfRkc5HKgG
        5vUZhC8lAaI8oYJFHakuCTYKKua7+b867naBlyb/kQ4WJqyH5hzTJA9B/yy50wfy
        ctblZN055PEJIhxLB4WOcDeiGzBFGVOqaYcavAUFYcvuYmXiB3ELaqO22FnKqWk2
        RVU31oUUzKvbeQz+ddf442I89/mlO2XkPZ/ZCL8gV00as3pyJBrUOWW9Nxwy0qF8
        XFD1DwMPQ/VVnmMQgpZhDNmbT9vJQIl1Nh+tqW/jaHKxvnhyHY5SfNh8iy4Rdcan
        fKgiU71kDl4hNUfgqPTQLjTfKQ1hS9qNkMfod9R16mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tHKDE1
        Y2PpmdsfuJ9iiPoAeslycvidfTfqXrtYPUbi4=; b=S5bQhytbObH6T8occOCzn8
        ps99E6RyKeeNOzYmINIPb2fhsvg8bTrQunI2a2KQqunPM4hhg/knpWfE2/ERsoyh
        6U+gtpC1txgxU6gFQCr1r1TH5QJxx0BirCEaO4h8nby3vhujPolhGlJNAuZW2qm7
        3XkNm3XNvPgQJPNvcTzwiDn4VToC/xk00AE9eFOWyUX84iHRYI85oMFQHm+vouzO
        OBbZsYGK3A3TWP8CIE0X9Kq93g7W5woJvCN56Rysj3BfB7ifq4ojcrqdNJeFpcqH
        FD9COw8QzMdcixxl0jnhBeq/L9T2xxfNbqV3/EJfZNckAXzHmZ+YOiqAS/G6PbFA
        ==
X-ME-Sender: <xms:8sUlXyqoBxDm-ibvZPN6YxIZcE6IcpM0gmadJqEr2lyerCOTFERqVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrjedtgddugedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdttddttdervdenucfhrhhomhepjfgvnhhr
    ihhquhgvucguvgcuofhorhgrvghsucfjohhlshgthhhuhhcuoehhmhhhsehhmhhhrdgvnh
    hgrdgsrheqnecuggftrfgrthhtvghrnhepveduteejgeeiudefuefgieehleejkeefudfh
    jeefgeekheekvddvheehleegveeinecukfhppedujeejrdduleegrdejrdefvdenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehhmhhhsehhmhhh
    rdgvnhhgrdgsrh
X-ME-Proxy: <xmx:8sUlXwpyBm-l0Cu0r-dwAuFIwAtRjtsp1eF6k4sXK7O5huhcDp3fhg>
    <xmx:8sUlX3Piy9R6CBycvvkKvm84z53wkPVYVFzdk8tjwgbigV4HHa9dkA>
    <xmx:8sUlXx4pKolqadNek1hErofL8Tkijff2WdsC2l5SQRi8uIvdyWa0IQ>
    <xmx:88UlX7tNVJMDg9GRPxflN-dR88utVzw26GxDmbActG3O9EGF9D0cH4nOmhA>
Received: from khazad-dum.debian.net (unknown [177.194.7.32])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1821A306005F;
        Sat,  1 Aug 2020 15:43:46 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by localhost.khazad-dum.debian.net (Postfix) with ESMTP id 5B674340163A;
        Sat,  1 Aug 2020 16:43:44 -0300 (-03)
X-Virus-Scanned: Debian amavisd-new at khazad-dum.debian.net
Received: from khazad-dum.debian.net ([127.0.0.1])
        by localhost (khazad-dum2.khazad-dum.debian.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 0SZCIBDTFX4O; Sat,  1 Aug 2020 16:43:42 -0300 (-03)
Received: by khazad-dum.debian.net (Postfix, from userid 1000)
        id CD5943400161; Sat,  1 Aug 2020 16:43:42 -0300 (-03)
Date:   Sat, 1 Aug 2020 16:43:42 -0300
From:   Henrique de Moraes Holschuh <hmh@hmh.eng.br>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input <linux-input@vger.kernel.org>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on
 new Lenovo Thinkpads
Message-ID: <20200801194342.GB10318@khazad-dum.debian.net>
References: <20200717114155.56222-1-hdegoede@redhat.com>
 <20200719225649.GA4341@khazad-dum.debian.net>
 <20200722054144.GQ1665100@dtor-ws>
 <20200727005049.GA10254@khazad-dum.debian.net>
 <f67ede61-c9d4-6abc-9b59-a5b2b615d1b6@redhat.com>
 <CAHp75VdvhC5HJ-BjqjDxU_Z_7_i8MV5UDN4FgWHvZfSD5=smqg@mail.gmail.com>
 <CAHp75VfCqHdZBTe8HB2C0whONCS2HgVgPPZNGRgypMiSwm0+DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfCqHdZBTe8HB2C0whONCS2HgVgPPZNGRgypMiSwm0+DQ@mail.gmail.com>
X-GPG-Fingerprint1: 4096R/0x0BD9E81139CB4807: C467 A717 507B BAFE D3C1  6092
 0BD9 E811 39CB 4807
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 27 Jul 2020, Andy Shevchenko wrote:
> On Mon, Jul 27, 2020 at 10:49 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Jul 27, 2020 at 10:45 AM Hans de Goede <hdegoede@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > On 7/27/20 2:50 AM, Henrique de Moraes Holschuh wrote:
> > > > On Tue, 21 Jul 2020, Dmitry Torokhov wrote:
> > > >> On Sun, Jul 19, 2020 at 07:56:49PM -0300, Henrique de Moraes Holschuh wrote:
> > > >>> On Fri, 17 Jul 2020, Hans de Goede wrote:
> > > >>>> This is a simple patch-series adding support for 3 new hotkeys found
> > > >>>> on various new Lenovo Thinkpad models.
> > > >>>
> > > >>> For all three patches, pending an ack for the new keycodes by the input
> > > >>> maintainers:
> > > >>>
> > > >>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> > > >>
> > > >> Do you want me to merge all 3 through input tree?
> > > >
> > > > Hans, Daren, Andy, what do you prefer?
> > >
> > > Taking all this upstream through Dmitry's input tree is fine with
> > > me, but this really is up to Andy and/or Daren.
> >
> > Fine with me.
> 
> To be clear, I assume it will go thru input tree.
> If my formal tag needed, use
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Also,
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  Henrique Holschuh
