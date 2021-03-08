Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06897330AEF
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 11:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhCHKPz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 05:15:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:33050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231922AbhCHKP3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 05:15:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C812365101;
        Mon,  8 Mar 2021 10:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615198529;
        bh=wgbWGTTj+WOx2Mv0hHVLInOu/ZudIpMB5fyEJeBeqEI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=OC2K6fiKm+/O3gd/umx4pY8WqhY5UX1qTwFAmAHGa+/WmWf4qe1DDSaV+LSHW52g6
         Co8Ll2qtDCt0TEbZhtRnS9Q0sh3f7VRcsJ2APJ5vIC6OKkN1fplwHyPlwN32YTT09U
         8JblUsejgcpTGN79B21v4B0sAMoefOkkIp9GjK0eNdbgORXsoTfTAHlnORoCq7Cxam
         TReNTAk9xRADDCGS6WbzxaTN9jj7RFbkWjMm2gOPSkAVRgbu0mK5I91+sqjNZptBOf
         1SePtZQ7zlBmfcxPqGnEhn+uzfLJNK2y1ZMr4io6RVGqeDpZdawtEXGZ2rpO4Si59l
         Y3ECcmCyxCyuQ==
Date:   Mon, 8 Mar 2021 11:15:25 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?KOI8-R?B?zsHC?= <nabijaczleweli@nabijaczleweli.xyz>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Stylus-on-touchscreen device support
In-Reply-To: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
Message-ID: <nycvar.YFH.7.76.2103081114580.12405@cbobk.fhfr.pm>
References: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 17 Feb 2021, наб wrote:

> This patchset adds support for stylus-on-touchscreen devices as found on
> the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among others;
> with it, they properly behave like a drawing tablet.
> 
> Patches 2 and 4 funxionally depend on patch 1.
> Patch 4 needs patch 3 to apply.
> 
> The output of this patchset and the need for a kernel, rather than
> userspace, patch was previously discussed here:
>   https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/558#note_792834
> 
> Ahelenia Ziemiańska (4):
>   HID: multitouch: require Finger field to mark Win8 reports as MT
>   HID: multitouch: set Stylus suffix for Stylus-application devices, too
>   HID: input: replace outdated HID numbers+comments with macros
>   HID: input: work around Win8 stylus-on-touchscreen reporting
> 
>  drivers/hid/hid-input.c      | 47 +++++++++++++++++++++++++++++++++---
>  drivers/hid/hid-multitouch.c | 18 ++++++++------
>  2 files changed, 55 insertions(+), 10 deletions(-)

Benjamin, this patchset looks good to me; do you have any objections on 
queuing it for 5.13?

Thanks,

-- 
Jiri Kosina
SUSE Labs

