Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D717B11E08E
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 10:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfLMJ0u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 04:26:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:34242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbfLMJ0t (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 04:26:49 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DE112077B;
        Fri, 13 Dec 2019 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576229209;
        bh=1Ho3ROhnAYexCo8ZhcCQ9HeYRkRgflpVKroNFtXNv1A=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ToRO3riOLCpuvTkkTxKGkaPuajx9MWxCSnxhqaz+e7Mx1KtXj6/uRzcT+FuR+z993
         1hturMuZVdAuB/TNf8dy/jbY9EczC/U85QmGbgh44nv8w2XdAG8sYR5qytecu6jEyd
         4+ArNRGq6d63Jzra73TKYXO1bZXHjw0JlA9L8OJ8=
Date:   Fri, 13 Dec 2019 10:26:46 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: asus: Ignore Asus vendor-page usage-code 0xff
 events
In-Reply-To: <20191024115909.109402-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.1912131026360.4603@cbobk.fhfr.pm>
References: <20191024115909.109402-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 24 Oct 2019, Hans de Goede wrote:

> At least on a T100HA an Asus vendor-page usage-code 0xff event is send on
> every suspend and again on resume, resulting in the following warning:
> 
> asus 0003:0B05:1807.0002: Unmapped Asus vendor usagepage code 0xff
> 
> being logged twice on every suspend/resume.
> 
> This commit silences the "Unmapped Asus vendor usagepage code ..."
> warning for usage-code 0xff to avoid these warnings being logged.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-asus.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 8063b1d567b1..e6e4c841fb06 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -261,7 +261,8 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  		      struct hid_usage *usage, __s32 value)
>  {
>  	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> -	    (usage->hid & HID_USAGE) != 0x00 && !usage->type) {
> +	    (usage->hid & HID_USAGE) != 0x00 &&
> +	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>  		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
>  			 usage->hid & HID_USAGE);

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

