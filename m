Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0396D9638A
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 17:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729900AbfHTPAD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 11:00:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:49794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbfHTPAD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 11:00:03 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4283C22DA9;
        Tue, 20 Aug 2019 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566313202;
        bh=3fe6EGWLS8R3FfcUp3BOIDM3odDC0oNEHw83b29/eWg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=eaSTVU/YyPEUQ4RWiGVwjLnD8TXKRO4lT7KwdnRdChYxs4G1ndAMg8TtTS7wm6RVT
         63ogbzBi+mzCcW35y1d77fo4SCp/ksSZGNfCTFPbGMYSGxDKTFjcL6TUQDpKcps5ya
         jIX0Wf6eU3Tfl5GNsRwII0n4fCP35Lljnv3juRKw=
Date:   Tue, 20 Aug 2019 16:59:52 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Aaron Armstrong Skomra <skomra@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        ping.cheng@wacom.com, jason.gerecke@wacom.com,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: Re: [PATCH] HID: wacom: support named keys on older devices
In-Reply-To: <1565982170-29367-1-git-send-email-aaron.skomra@wacom.com>
Message-ID: <nycvar.YFH.7.76.1908201659370.27147@cbobk.fhfr.pm>
References: <1565982170-29367-1-git-send-email-aaron.skomra@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 16 Aug 2019, Aaron Armstrong Skomra wrote:

> Some Wacom devices have keys with predefined meanings. However, when
> support was originally added for these devices, the codes for these
> keys were not available yet. These keys were thus reported with
> the numbered KEY_PROG* range.
> 
> Some missing key codes were added with commit 4eb220cb35a9 ("HID:
> wacom: generic: add 3 tablet touch keys") and we are now able to
> report the proper key codes. We continue to report the original
> KEY_PROG codes so as not to break any unknown applications that
> may depend on them.
> 
> Also, to support the touch key, track its state in the pad report.
> 
> Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
> Link: https://gitlab.freedesktop.org/libinput/libinput/merge_requests/155
> Link: https://github.com/linuxwacom/xf86-input-wacom/pull/46
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Applied to for-5.4/wacom, thank you.

-- 
Jiri Kosina
SUSE Labs

