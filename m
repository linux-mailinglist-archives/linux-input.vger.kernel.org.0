Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADE428191A
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 14:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbfHEMXT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 08:23:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:57988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727259AbfHEMXS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 08:23:18 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E77CC20880;
        Mon,  5 Aug 2019 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565007798;
        bh=95jnUHbo0w/yk3aOf8LXrm4XLLy1YRijgI6quTvL9FM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=00Ppv714L2aE4Mlu1FXb7TCWTrgB7rU7FjOjl0yXlV9S4LkhVnbsY4wUjSoax/O/I
         hsMjjDqXjfqi583PLrSriBJQG09iB4xAl+MQ8orv/uLe4rKUHAeDwpvZwoq193d7j2
         SyGjs8gBNHA20k2RZ3aRM5zsGvQ5qWWwZArfXC8k=
Date:   Mon, 5 Aug 2019 14:23:13 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Olivier Gay <ogay@logitech.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nestor Lopez <nlopezcasad@logitech.com>
Subject: Re: [PATCH] HID: logitech-dj: extend consumer usages range
In-Reply-To: <20190729172152.4874-1-ogay@logitech.com>
Message-ID: <nycvar.YFH.7.76.1908051423070.5899@cbobk.fhfr.pm>
References: <20190729172152.4874-1-ogay@logitech.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 29 Jul 2019, Olivier Gay wrote:

> Extend the range of usage codes in the consumer page descriptor of
> the driver. Some Logitech HID devices send usages in that upper range.
> 
> Signed-off-by: Olivier Gay <ogay@logitech.com>
> ---
>  drivers/hid/hid-logitech-dj.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index 6196217a7d93..0e058ddb8e1c 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -380,9 +380,9 @@ static const char consumer_descriptor[] = {
>  	0x75, 0x10,		/* REPORT_SIZE (16)                    */
>  	0x95, 0x02,		/* REPORT_COUNT (2)                    */
>  	0x15, 0x01,		/* LOGICAL_MIN (1)                     */
> -	0x26, 0x8C, 0x02,	/* LOGICAL_MAX (652)                   */
> +	0x26, 0xFF, 0x02,	/* LOGICAL_MAX (767)                   */
>  	0x19, 0x01,		/* USAGE_MIN (1)                       */
> -	0x2A, 0x8C, 0x02,	/* USAGE_MAX (652)                     */
> +	0x2A, 0xFF, 0x02,	/* USAGE_MAX (767)                     */
>  	0x81, 0x00,		/* INPUT (Data Ary Abs)                */
>  	0xC0,			/* END_COLLECTION                      */

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

