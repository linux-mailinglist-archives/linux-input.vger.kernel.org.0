Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADCB315AA46
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 14:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgBLNpL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 08:45:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:38812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727439AbgBLNpL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 08:45:11 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C0EB20659;
        Wed, 12 Feb 2020 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581515111;
        bh=EQ3LescQyF7yADIBjybsZ8XlicCPBIJrxsJ6uSVvAbw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=uaae36XDDaFmMGQyyC4lz0rZo56VSmvcoFGr0hMPJ5ibo3F49aH486yrj8OBXCnYo
         g2kJPQlUwKPTWXt4sK0ilhjLsNEkUgypFceolQlaQUE9kuH52cPSZNta2RJFTNKQAy
         pBIZtUIYEmjXkSQ61AmJU5yiwkZ/5BqL8YL8n4lY=
Date:   Wed, 12 Feb 2020 14:45:08 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: add debug msg when exporting a HID++
 report descriptors
In-Reply-To: <20200113192300.2482096-1-lains@archlinux.org>
Message-ID: <nycvar.YFH.7.76.2002121445030.3144@cbobk.fhfr.pm>
References: <20200113192300.2482096-1-lains@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 13 Jan 2020, Filipe Laíns wrote:

> When exporting all other types of report descriptors we print a debug
> message. Not doing so for HID++ descriptors makes unaware users think
> that no HID++ descriptor was exported.
> 
> Signed-off-by: Filipe Laíns <lains@archlinux.org>
> ---
>  drivers/hid/hid-logitech-dj.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index cc7fc71d8b05..8f17a29b5a94 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1368,6 +1368,8 @@ static int logi_dj_ll_parse(struct hid_device *hid)
>  	}
>  
>  	if (djdev->reports_supported & HIDPP) {
> +		dbg_hid("%s: sending a HID++ descriptor, reports_supported: %llx\n",
> +			__func__, djdev->reports_supported);
>  		rdcat(rdesc, &rsize, hidpp_descriptor,
>  		      sizeof(hidpp_descriptor));

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

