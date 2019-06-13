Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 106504376C
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 16:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732632AbfFMO6z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 10:58:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:59294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732631AbfFMO5F (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 10:57:05 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9A3020B7C;
        Thu, 13 Jun 2019 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560437825;
        bh=BRkK0Z99Zbgn3wSOnZA6DSR32x37/snuih2ocWqbunk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=QbFjRZXq0dOf89VX/2gtNCnQQg24DwxTkYm5u+3ZseYyAr1PUbtt8yRs1s9ggr3RV
         jkNwYq2aYlwTIKOHR2A2H73OlfBkLMDAuM7+dz3j78EpAQG/Oct9qchQyoa538VGU7
         Uxpxh66q1fYTbNzCwtMLQacECYGMHULUIM3Tn2tQ=
Date:   Thu, 13 Jun 2019 16:57:01 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Aaron Armstrong Skomra <skomra@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        pinglinux@gmail.com, jason.gerecke@wacom.com,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: Re: [PATCH 0/4] 2nd Gen Intuos Pro Small - Second set
In-Reply-To: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
Message-ID: <nycvar.YFH.7.76.1906131656480.27227@cbobk.fhfr.pm>
References: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 12 Jun 2019, Aaron Armstrong Skomra wrote:

> The first patch here is a v2 patch for the 2nd gen Intuos
> Pro Small. It was part of my previous set, but this one patch
> needed to be rebased to apply to for-5.3/wacom. No other
> changes were made to the patch. The rest of that set is
> currently in for-5.3/wacom.
> 
> The remainder of this serires was occasioned by that same
> device. Though the Pro Small unfortunatley did not ship
> with a generic HID descriptor, these patches will ready the
> generic code path for the touch component of Bluetooth 
> reports.
> 
> This set is based on the current for-5.3/wacom branch with
> 68c20cc2164c ("HID: wacom: correct touch resolution x/y typo") at
> its HEAD.
> 
> Aaron Armstrong Skomra (4):
>   HID: wacom: Add 2nd gen Intuos Pro Small support
>   HID: wacom: generic: read HID_DG_CONTACTMAX from any feature report
>   HID: wacom: generic: support the 'report valid' usage for touch
>   HID: wacom: generic: read the number of expected touches on a per
>     collection basis
> 
>  drivers/hid/wacom_sys.c |  10 ++--
>  drivers/hid/wacom_wac.c | 125 +++++++++++++++++++++++++++++++++-------
>  drivers/hid/wacom_wac.h |   2 +
>  3 files changed, 111 insertions(+), 26 deletions(-)

Applied to for-5.3/wacom.

-- 
Jiri Kosina
SUSE Labs

