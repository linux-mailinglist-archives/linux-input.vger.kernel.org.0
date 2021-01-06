Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FD92EC3C6
	for <lists+linux-input@lfdr.de>; Wed,  6 Jan 2021 20:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbhAFTSK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 14:18:10 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34179 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbhAFTSJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jan 2021 14:18:09 -0500
X-Greylist: delayed 34965 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Jan 2021 14:18:09 EST
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 05C27C0006;
        Wed,  6 Jan 2021 19:17:26 +0000 (UTC)
Message-ID: <6b33f956dfffc8edcff72f66a29ccf5d86682a53.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for Unified Battery
 (1004) feature
From:   Bastien Nocera <hadess@hadess.net>
To:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 06 Jan 2021 20:17:26 +0100
In-Reply-To: <bc65667903652a67f17b6b51a37a03f73309fe39.camel@archlinux.org>
References: <20210104182937.1472673-1-lains@archlinux.org>
         <0de99cc89a3cc0cc5b3818e10aefdd2eaddd8032.camel@hadess.net>
         <bc65667903652a67f17b6b51a37a03f73309fe39.camel@archlinux.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2021-01-06 at 18:48 +0000, Filipe Laíns wrote:
> On Wed, 2021-01-06 at 10:34 +0100, Bastien Nocera wrote:
> > On Mon, 2021-01-04 at 18:29 +0000, lains@archlinux.org wrote:
> > > From: Filipe Laíns <lains@archlinux.org>
> > > 
> > > This new feature present in new devices replaces the old Battery
> > > Level
> > > Status (0x1000) feature. It keeps essentially the same
> > > information
> > > for
> > > levels (reporting critical, low, good and full) but makes these
> > > levels
> > > optional, the device exports a capability setting which describes
> > > which
> > > levels it supports. In addition to this, there is an optional
> > > state_of_charge paramenter that exports the battery percentage.
> > > 
> > > This patch adds support for this new feature. There were some
> > > implementation choices, as described below and in the code.
> > > 
> > > If the device supports the state_of_charge parameter, we will
> > > just
> > > export the battery percentage and not the levels, which the
> > > device
> > > might
> > > still support.
> > 
> > I'm guessing that means no changes needed on the upower side?
> > 
> > Cheers
> > 
> 
> Yes :)
> I tested upower and all works as expected.
> 
> There will still be devices that only support battery voltage, so I
> might
> implement the battery voltage to charge percentage in a future patch.

I sent a WIP patch at the end of November for that, it wasn't even
compile-tested, but might be a good base to start from.

I don't think that I have any hardware that supports that feature in
any case.

Cheers

