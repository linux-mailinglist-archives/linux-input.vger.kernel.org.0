Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8023A6775
	for <lists+linux-input@lfdr.de>; Mon, 14 Jun 2021 15:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233382AbhFNNMT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 09:12:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:60478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233218AbhFNNMS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 09:12:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BF1161283;
        Mon, 14 Jun 2021 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623676216;
        bh=xfG+15qfU2qDVl0eiFPWbh7ntq4741jr7zJ1kibSdg4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=PzhqGZctfs8zQ1H1f+SgYYt+nsM6jl8vnVX1ShfBSN4ZF2GlHCYp2JncFsuCOOjNa
         6JlazVeFDQRK2wihhKxk8gmCYguenRuG1xMXposF5GaeYn3iJfXoq//gQ3ayX0D6pX
         D0ifSdaQDYAHByKrTuuTVbOFIdl6dk0sZ/e0HdZCKoNwcOyCV12QVFDk/P1DFr5WU7
         GOXaW98biM1G5WFi2AmiMovqaSuF9T8RXXX87cvVczeS5IrpZjYao/auCEDC2V/jGc
         G5a8AmIkFp3cNk66eE/HQxnzYVWEXZ1DShlaegzaQjgB9MhQNmZyv8x30t19/LrM9u
         Z2HpzIuEkt6Bw==
Date:   Mon, 14 Jun 2021 15:10:13 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Austin Kim <austindh.kim@gmail.com>
cc:     srinivas.pandruvada@linux.intel.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        austin.kim@lge.com
Subject: Re: [PATCH] HID: intel-ish-hid: Fix minor typos in comments
In-Reply-To: <20210527071637.GA1516@raspberrypi>
Message-ID: <nycvar.YFH.7.76.2106141510040.28378@cbobk.fhfr.pm>
References: <20210527071637.GA1516@raspberrypi>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 27 May 2021, Austin Kim wrote:

> Change "poiner" to "pointer" in comments.
> 
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> ---
>  drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> index d20d74a890e9..1b486f262747 100644
> --- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> +++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> @@ -456,7 +456,7 @@ static void loader_cl_event_cb(struct ishtp_cl_device *cl_device)
>  /**
>   * ish_query_loader_prop() -  Query ISH Shim firmware loader
>   * @client_data:	Client data instance
> - * @fw:			Poiner to firmware data struct in host memory
> + * @fw:			Pointer to firmware data struct in host memory
>   * @fw_info:		Loader firmware properties
>   *

Applied.

-- 
Jiri Kosina
SUSE Labs

