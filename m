Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1A481907
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 14:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbfHEMR0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 08:17:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:57062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727868AbfHEMR0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 08:17:26 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E12212086D;
        Mon,  5 Aug 2019 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565007445;
        bh=SnaKG2eaDaLZ+yKzSpFsYuS3H7I5y9zA6OUCChmyWbk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=PmNvXu5enS/bgXq1Ra2LbtuRhzLgQVgKXlpsBz00iH9YBQeAO/DucAuIAVUjhQM+G
         bJB8e1Mg+BhWisG9m3uX9qGwki/HMfyGVJKEnYampK7vo27A0b4m2AmuMThuJZtAUp
         Y/4ub7xva4Qgv5R4/pVUBfxJ+0teZOrP401XMNCE=
Date:   Mon, 5 Aug 2019 14:17:21 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Michael Bowcutt <mwb71@case.edu>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: BUG: logitech-djreceiver: probe failed with error 7
In-Reply-To: <CAL2OrGL9P91TL-4tbvJjCfoe_DEscV5kWujce0H8tgFZ=VVPvw@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.1908051416291.5899@cbobk.fhfr.pm>
References: <CAL2OrGL9P91TL-4tbvJjCfoe_DEscV5kWujce0H8tgFZ=VVPvw@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 23 Jul 2019, Michael Bowcutt wrote:

> Hi,
> 
> On the latest batch commit to the hid/hid tree, my USB keyboard + mouse
> stopped working. I was able to determine that it was caused by
> dbcbabf7da921f98beefb4a6f4b91eb62d072076 which affects
> drivers/hid/hid-logitech-dj.c, but have not been able to come up with a
> solution.

The fix is now queued in hid.git#for-5.3/upstream-fixes, namely

	6fb08f1a5f7e5c ("HID: logitech-dj: Really fix return value of logi_dj_recv_query_hidpp_devices")

Could you please verify whether it fixes your issue as well?

Thanks,

-- 
Jiri Kosina
SUSE Labs

