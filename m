Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840843FCD8E
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 21:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240054AbhHaTKv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 15:10:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:36022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232759AbhHaTKv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 15:10:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E4786056B;
        Tue, 31 Aug 2021 19:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630436995;
        bh=pTDLJsW5rkUoBFY+VuIy+7JptfMu3Y52eDpFrI7z2y8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=s1ySWvChyAjoJ1N8K5puNFtOExbmUNJzsvQtlGLQBywu1+wOz+PfSYrS/UDCRqrSX
         40wy8QWVEZWX1GxXrAt/3hIp/Gc/T0iFSx8qHJqwxMXAD662q7HU7YIXDbCuKaQ20k
         echGoeGotZegoWf/mwQROT70ySL3ydDx+dYCu7IE85mC9lguVerTOLhumO46pagQCN
         SXlEWsHP4Z/qHZqBVP60VLs1S3eKarcISdVec6mhJgZZdGQXIz5zu1igNo048YXkci
         mUfxAEe50RnEkA36Z3KroIsX7q3zQZKEWLbzsIXB/YQ0SPPjK0Im33b0e3atGtolxX
         BIt4J9g47HtiQ==
Date:   Tue, 31 Aug 2021 21:09:52 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Daniel Ogorchock <djogorchock@gmail.com>
cc:     Pavel Machek <pavel@ucw.cz>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        =?ISO-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Roderick Colenbrander <thunderbird2k@gmail.com>
Subject: Re: [PATCH 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
In-Reply-To: <CAEVj2tkfLjWKOaecY7t-idGaqjZ45wXhmjbUR87AoC2Dkm45vQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2108312109340.15313@cbobk.fhfr.pm>
References: <20210602061253.5747-1-roderick@gaikai.com> <20210602061253.5747-3-roderick@gaikai.com> <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm> <20210803221055.GA32527@amd> <CAEc3jaAoDfJD92q9q_HoFq3nsjkDqfZHu-VO+Ei8xSP8QrE8rg@mail.gmail.com>
 <CAEVj2tkfLjWKOaecY7t-idGaqjZ45wXhmjbUR87AoC2Dkm45vQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 13 Aug 2021, Daniel Ogorchock wrote:

> Hi Pavel,
> 
> Do you have any recommendations on what would be an appropriate
> function string for player indicator LEDs? Would some variant such as:
>   "status-x"
>   "player-status-x"
>   "indicator-x"
>   "player-indicator-x"
> be more suitable? It looks like the string "status" has been used for
> other existing LED names.
> 
> I think we are pretty happy to use whatever naming scheme fits the
> standards of the led subsystem's userspace api for the Nintendo/Sony
> HID drivers, and any future game controller drivers featuring player
> LEDs could conform to that going forward.

Pavel, could you please take a look here, so that we can proceed with the 
patchset?

Thanks,

-- 
Jiri Kosina
SUSE Labs

