Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 458DCED082
	for <lists+linux-input@lfdr.de>; Sat,  2 Nov 2019 21:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfKBUJI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Nov 2019 16:09:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:52920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfKBUJI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 2 Nov 2019 16:09:08 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF0E4214AF;
        Sat,  2 Nov 2019 20:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572725348;
        bh=CYWBKZOnEHWEd+xJwCtecn0L4Btd0s/3sl7+23P9UeU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=cfojpSt+aekI0ZmWsjXucheRFF2DJuejQabO29NSq0a25GcE0Hj4skC9DW37ruAZr
         xjllH9chHaD1J/ktGzklyjrbgJDjIvhke2y1Qjx7RaSSj/vJkOx2ZiCaLNO/mAb5Ib
         /5yiFk9bECPI/p5jTG1pRSn3x0y7y6QcrWcrWoHg=
Date:   Sat, 2 Nov 2019 21:09:04 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH trivial] HID: intel-ish-hid: Spelling
 s/diconnect/disconnect/
In-Reply-To: <20191024151837.29421-1-geert+renesas@glider.be>
Message-ID: <nycvar.YFH.7.76.1911022108500.1799@cbobk.fhfr.pm>
References: <20191024151837.29421-1-geert+renesas@glider.be>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 24 Oct 2019, Geert Uytterhoeven wrote:

> Fix misspelling of "disconnect".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/hid/intel-ish-hid/ishtp/hbm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ishtp/hbm.c b/drivers/hid/intel-ish-hid/ishtp/hbm.c
> index c6c9ac09dac3a377..30a91d068306a000 100644
> --- a/drivers/hid/intel-ish-hid/ishtp/hbm.c
> +++ b/drivers/hid/intel-ish-hid/ishtp/hbm.c
> @@ -402,7 +402,7 @@ static void ishtp_hbm_cl_connect_res(struct ishtp_device *dev,
>   * @dev: ISHTP device instance
>   * @disconnect_req: disconnect request structure
>   *
> - * Disconnect request bus message from the fw. Send diconnect response.
> + * Disconnect request bus message from the fw. Send disconnect response.
>   */

Applied to hid.git#for-5.5/ish. Thanks,

-- 
Jiri Kosina
SUSE Labs

