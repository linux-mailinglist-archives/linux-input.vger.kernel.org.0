Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B499C3F201D
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 20:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbhHSSsC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 14:48:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231500AbhHSSsC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 14:48:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0D0B610A0;
        Thu, 19 Aug 2021 18:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629398846;
        bh=H4r7/gW7t6P2DHP1TLFpBrBqRBsBLWkI0iu7UuRE+cM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Jp206xtArCf+YuBbF8v8awwl/uRbb14v9wL4KpJBRB5YM4mKPdFlz9GS7+qzCq4rE
         52mzUjd2zEkRDXC7qMDPrx/Y0CGkgqcFjUgh7LrASPP8XE4yaE860IrP547wfi9yjv
         EUbH3c3Sbpr2I9ni7RShwxFS+YoJZiIgFFohW9/rJxOYTvadcTIgHR9Bb0tQjKFVhC
         ntqbsh4rgJnutBvoCzNYvNMUlU8oZBTnDiq7iYOX6/NIMgLMNWhVoww2EI/BCKXfQ4
         VvHSDlAoQJ4AIIP0aRjZPbo1TPzbLiv/sBNYARSKEjHtXVg/DcIjypzy3utqHh1J6a
         OzJ68y5smwvJA==
Date:   Thu, 19 Aug 2021 20:47:22 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, paskripkin@gmail.com
Subject: Re: [PATCH] fix  slab-out-of-bounds Write in betop_probe
In-Reply-To: <20210816201544.26405-1-asha.16@itfac.mrt.ac.lk>
Message-ID: <nycvar.YFH.7.76.2108192046290.15313@cbobk.fhfr.pm>
References: <20210816201544.26405-1-asha.16@itfac.mrt.ac.lk>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 17 Aug 2021, F.A.Sulaiman wrote:

> This patch resolves the bug 'KASAN: slab-out-of-bounds Write in betop_probe' reported by Syzbot.
> This checkes hid_device's input is non empty before it's been used.
> 
> Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
> ---
>  drivers/hid/hid-betopff.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/hid/hid-betopff.c b/drivers/hid/hid-betopff.c
> index 467d789f9bc2..27b57aef9a0a 100644
> --- a/drivers/hid/hid-betopff.c
> +++ b/drivers/hid/hid-betopff.c
> @@ -121,8 +121,18 @@ static int betopff_init(struct hid_device *hid)
>  
>  static int betop_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
> +	struct hid_input *hidinput;
> +	struct input_dev *dev;
>  	int ret;
>  
> +	if (list_empty(&hdev->inputs)) {
> +		hid_err(hdev, "no inputs found\n");
> +		return -ENODEV;
> +	}
> +
> +	hidinput = list_first_entry(&hdev->inputs, struct hid_input, list);
> +	dev = hidinput->input;
> +

Thanks for the fix. Syzbot is right though -- what is the point of the 
above assignment? Could you please resubmit a fixed up version?

Thanks,

-- 
Jiri Kosina
SUSE Labs

