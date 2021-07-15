Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5763CAC82
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245315AbhGOThP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 15:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343910AbhGOTeb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 15:34:31 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0372AC028B9F
        for <linux-input@vger.kernel.org>; Thu, 15 Jul 2021 12:08:49 -0700 (PDT)
Date:   Thu, 15 Jul 2021 21:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1626376126;
        bh=phH9mTw8veTa3Sy2ptbbgkASyC/KrWqSNlS9rzGudJA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VEDRSoHTfHavZQLuECUylccGdzFwfVQBa6y0g6EsSYJcq3Ia5YZpQnrQhHfuLPGmF
         7oqsNVLzRN/dwTeYWmq0USyl7AEyojWtWaWP6UzvJx2GqOHpnFMaKbLVe/I91E4N15
         XSrVV2tLnWVgLIAYDOFq23Tv60zfAT/J6hpNZ+RU=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.or
Subject: Re: [PATCH] HID: add cmedia-fixup driver
Message-ID: <2f89257c-b074-45ed-8103-e3e70db2c1c6@t-8ch.de>
References: <20210704104906.78490-1-linux@weissschuh.net>
 <nycvar.YFH.7.76.2107152059330.8253@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2107152059330.8253@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Do, 2021-07-15T21:00+0200, Jiri Kosina wrote:
> On Sun, 4 Jul 2021, Thomas Weißschuh wrote:
> 
> > This driver provides HID fixups for CMedia audio chips.
> > For now this enables the recognition of the microphone mute button for the
> > HS-100B.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  drivers/hid/Kconfig            |  6 +++
> >  drivers/hid/Makefile           |  1 +
> >  drivers/hid/hid-cmedia-fixup.c | 82 ++++++++++++++++++++++++++++++++++
> >  drivers/hid/hid-ids.h          |  1 +
> >  drivers/hid/hid-quirks.c       |  3 ++
> >  5 files changed, 93 insertions(+)
> >  create mode 100644 drivers/hid/hid-cmedia-fixup.c
> 
> Can you please drop the '-fixup' from the driver name? We have quite a 
> couple of drivers that do report descriptor modifications, but we're not 
> using this '-fixup' naming scheme for them either.

There is already an existing driver "hid-cmedia":
"HID driver for CMedia CM6533 audio jack controls".

This driver works in a completely different way from mine, so I thought to keep
them separate.
The idea was for the new driver to be a collection of simple, similar report fixups.

Should they be combined?

Thomas
