Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6295C3A7999
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 10:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhFOI53 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 04:57:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:46232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231222AbhFOI52 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 04:57:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95F2A61425;
        Tue, 15 Jun 2021 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623747323;
        bh=76DaaVnJe+WBkPEoWCtLhu5YWnCSPNQlkBxQn0hTDRM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=p6ZXcjjJREAg+aG84s5JDo4DiIREDT7VyiVro9heI6ShI0mebg3RUp3nXV4jjbKuu
         r2v5T0Izr8U6PDd53kbvXzDJRvtr+gZ+iBpcaYsANf4Xz8leLgMURNr4XxrBOS53U0
         wRJlPa41bXdvOaKwriwmStCercn8KYwShL1GuahTtoqPjTkz4tzORUF93giyG15Osk
         /8c0UA41tA78FHNUtQYqmxSZqTt0e/6GslmVgsIoinZ2E94CDr5kAwCwR9kmEcMItG
         LpB/BznPmpUib/GUw6M3OZSPRDid7Kk3/2nAwB5eQFO5grLWGaLvxVLHwdZEEl0A4+
         MflHJhUw4eRjg==
Date:   Tue, 15 Jun 2021 10:55:20 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Maximilian Luz <luzmaximilian@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?ISO-8859-15?Q?Bla=B8_Hrastnik?= <blaz@mxxn.io>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: surface-hid: Fix get-report request
In-Reply-To: <20210608132951.1392303-1-luzmaximilian@gmail.com>
Message-ID: <nycvar.YFH.7.76.2106151055080.18969@cbobk.fhfr.pm>
References: <20210608132951.1392303-1-luzmaximilian@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 8 Jun 2021, Maximilian Luz wrote:

> Getting a report (e.g. feature report) from a device requires us to send
> a request indicating which report we want to retrieve and then waiting
> for the corresponding response containing that report. We already
> provide the response structure to the request call, but the request
> isn't marked as a request that expects a response. Thus the request
> returns before we receive the response and the response buffer indicates
> a zero length response due to that.
> 
> This essentially means that the get-report calls are broken and will
> always indicate that a report of length zero has been read.
> 
> Fix this by appropriately marking the request.
> 
> Fixes: b05ff1002a5c ("HID: Add support for Surface Aggregator Module HID transport")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/hid/surface-hid/surface_hid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/surface-hid/surface_hid.c b/drivers/hid/surface-hid/surface_hid.c
> index 3477b31611ae..a3a70e4f3f6c 100644
> --- a/drivers/hid/surface-hid/surface_hid.c
> +++ b/drivers/hid/surface-hid/surface_hid.c
> @@ -143,7 +143,7 @@ static int ssam_hid_get_raw_report(struct surface_hid_device *shid, u8 rprt_id,
>  	rqst.target_id = shid->uid.target;
>  	rqst.instance_id = shid->uid.instance;
>  	rqst.command_id = SURFACE_HID_CID_GET_FEATURE_REPORT;
> -	rqst.flags = 0;
> +	rqst.flags = SSAM_REQUEST_HAS_RESPONSE;
>  	rqst.length = sizeof(rprt_id);
>  	rqst.payload = &rprt_id;

Queued in for-5.13/upstream-fixes branch, thanks.

-- 
Jiri Kosina
SUSE Labs

