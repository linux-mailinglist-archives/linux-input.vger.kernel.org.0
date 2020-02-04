Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 748C7151AC0
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 13:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgBDMsj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 07:48:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:53878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727127AbgBDMsj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Feb 2020 07:48:39 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0AD9B2087E;
        Tue,  4 Feb 2020 12:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580820518;
        bh=4DGFuu1IoDl5zEeY3oTCQ8SzU1HZPn6uNSQhLe3MI6o=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=z1I9eiIC83s7T0FahxPY/qM9I2LWpRvprle0QLgUujUOQRyoSO6rLZHomedRBNXrI
         ReMMBJTmn8m2Wnb4bCKAlJphKBRpBRNS75MiiNO/WY65wnX6gS3sgNYUQ6cGSbB0oc
         Y9fnmUK/NwdyVQsD6btJzMcflIJDHrIwP+HdLeYE=
Date:   Tue, 4 Feb 2020 13:48:35 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Mansour Behabadi <mansour@oxplot.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: apple: Add support for recent firmware
In-Reply-To: <20200129062631.22694-1-mansour@oxplot.com>
Message-ID: <nycvar.YFH.7.76.2002041347250.26888@cbobk.fhfr.pm>
References: <20200129062631.22694-1-mansour@oxplot.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 29 Jan 2020, Mansour Behabadi wrote:

> Magic Keyboards with more recent firmware (0x0100) report
> Fn key differently. Without this patch, Fn key may not
> behave as expected and may not be configurable via hid_apple
> fnmode module parameter.
> 
> Signed-off-by: Mansour Behabadi <mansour@oxplot.com>
> ---
>  drivers/hid/hid-apple.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index 6ac8becc2372..d732d1d10caf 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -340,7 +340,8 @@ static int apple_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>  		unsigned long **bit, int *max)
>  {
>  	if (usage->hid == (HID_UP_CUSTOM | 0x0003) ||
> -			usage->hid == (HID_UP_MSVENDOR | 0x0003)) {
> +			usage->hid == (HID_UP_MSVENDOR | 0x0003) ||
> +			usage->hid == (HID_UP_HPVENDOR2 | 0x0003)) {
>  		/* The fn key on Apple USB keyboards */

Hmm, one day we should probably ditch this "vendor-specific" naming, which 
doesn't really match reality at all any more.

Also the mappings in hid-input for these usage pages are pretty awkward 
these days.

Anyway, that is for later. I am queuing your patch now, thanks.

-- 
Jiri Kosina
SUSE Labs

