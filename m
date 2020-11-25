Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3752C40D5
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgKYNCc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 08:02:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:52342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbgKYNCc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 08:02:32 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D639206F7;
        Wed, 25 Nov 2020 13:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606309351;
        bh=1dsC4XLRXty+/paLvrXuZ/JoBwtNz/7R74sR7uRpKhM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=a/SVPQmbH1lIk9RjxNbBWknHi8jxdx05HgB9hw028JsGVd2sGUF7Hw0sD58FiPtNw
         ZeE67iP8UFPo5/aocd4ZzESs5TOLQBOGA15WWDMdk/adFyjqEuqlQZ2DtE3caExVe0
         JsMCSDZw8GKErJcg29q4Fyy4/3no8Ffg0JbRcX6s=
Date:   Wed, 25 Nov 2020 14:02:28 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 062/141] HID: usbhid: Fix fall-through warnings for
 Clang
In-Reply-To: <2ca011901b6a1313f71f3a3775078224c941a908.1605896059.git.gustavoars@kernel.org>
Message-ID: <nycvar.YFH.7.76.2011251402200.3441@cbobk.fhfr.pm>
References: <cover.1605896059.git.gustavoars@kernel.org> <2ca011901b6a1313f71f3a3775078224c941a908.1605896059.git.gustavoars@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 20 Nov 2020, Gustavo A. R. Silva wrote:

> In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
> of warnings by explicitly adding a couple of break statements instead
> of letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/hid/usbhid/hid-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index 17a29ee0ac6c..86257ce6d619 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -438,6 +438,7 @@ static void hid_irq_out(struct urb *urb)
>  		break;
>  	case -ESHUTDOWN:	/* unplug */
>  		unplug = 1;
> +		break;
>  	case -EILSEQ:		/* protocol error or unplug */
>  	case -EPROTO:		/* protocol error or unplug */
>  	case -ECONNRESET:	/* unlink */
> @@ -489,6 +490,7 @@ static void hid_ctrl(struct urb *urb)
>  		break;
>  	case -ESHUTDOWN:	/* unplug */
>  		unplug = 1;
> +		break;
>  	case -EILSEQ:		/* protocol error or unplug */
>  	case -EPROTO:		/* protocol error or unplug */
>  	case -ECONNRESET:	/* unlink */

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

