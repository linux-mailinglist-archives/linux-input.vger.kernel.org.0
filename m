Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1F41FB618
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 17:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgFPPZw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 11:25:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:40050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728557AbgFPPZv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 11:25:51 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A41ED208B3;
        Tue, 16 Jun 2020 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592321151;
        bh=ROmyKpCSwHlfqCcIo5wsre88Oas3QTFEiHRQCGcM4Xc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=mLXd+3y+BdgMEeWhbEr30oNYTzyj9uhcdvYd/FuOXq9LpuBwqBaONxplH/95m3ivF
         G/Hq27aZgm0dC5BH9kofVymXUtyY9/NotFnuHsayBLhbmlrfaraTLD6Vj6JLxtW7p3
         ouqaZPEApvvLPs4gHkiQ46FsxGiGhf3UXCu8vnzk=
Date:   Tue, 16 Jun 2020 17:25:48 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Peter Hutterer <peter.hutterer@who-t.net>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Wen He <wen.he_1@nxp.com>
Subject: Re: [PATCH v2] HID: input: do not run GET_REPORT unless there's a
 Resolution Multiplier
In-Reply-To: <20200609060319.GA36844@jelly>
Message-ID: <nycvar.YFH.7.76.2006161724080.13242@cbobk.fhfr.pm>
References: <20200609060319.GA36844@jelly>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 9 Jun 2020, Peter Hutterer wrote:

> hid-multitouch currently runs GET_REPORT for Contact Max and again to
> retrieve the Win8 blob. If both are within the same report, the
> Resolution Multiplier code calls GET_FEATURE again and this time,
> possibly due to timing, it causes the ILITEK-TP device interpret the
> GET_FEATURE as an instruction to change the mode and effectively stop
> the device from functioning as expected.
> 
> Notably: the device doesn't even have a Resolution Multiplier so it
> shouldn't be affected by any of this at all.
> 
> Fix this by making sure we only execute GET_REPORT if there is
> a Resolution Multiplier in the respective report. Where the
> HID_QUIRK_NO_INIT_REPORTS field is set we just bail out immediately. This
> shouldn't be triggered by any real device anyway.
> 
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> Tested-by: Wen He <wen.he_1@nxp.com>
> ---
> Changes to v1:
> - bail out in case of HID_QUIRK_NO_INIT_REPORTS

Applied, thanks Peter.

-- 
Jiri Kosina
SUSE Labs

