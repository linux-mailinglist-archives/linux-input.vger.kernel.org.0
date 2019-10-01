Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25040C36FF
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 16:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389002AbfJAOWB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 10:22:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388994AbfJAOWB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Oct 2019 10:22:01 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7BD1321924;
        Tue,  1 Oct 2019 14:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569939720;
        bh=5yiJvRSEr6T5UmNF+BYavdiRJ6HW9GziesEHfLCrWsc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=JThJwDOzedK/yGTjqsRLOfCl4mb4aJWSXHnYIEMNrARGMNySYkTiJeidT9Besk4ML
         RG6BfinCLN4E5e7tGkMo7q/tHBjNCUs/uzLswfbrdI8XsuzJSErQM39zy9i9ARckCe
         ydPNQWdPv5B0h2VBIwIrP3MD9HwVaNskx6yO5IaA=
Date:   Tue, 1 Oct 2019 16:21:34 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: prodikeys: make array keys static const, makes
 object smaller
In-Reply-To: <20190905165406.24641-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.1910011621240.13160@cbobk.fhfr.pm>
References: <20190905165406.24641-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 5 Sep 2019, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array keys on the stack but instead make it
> static const. Makes the object code smaller by 166 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   18931	   5872	    480	  25283	   62c3	drivers/hid/hid-prodikeys.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   18669	   5968	    480	  25117	   621d	drivers/hid/hid-prodikeys.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/hid-prodikeys.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
> index 21544ebff855..fb6841ebe4d9 100644
> --- a/drivers/hid/hid-prodikeys.c
> +++ b/drivers/hid/hid-prodikeys.c
> @@ -516,7 +516,7 @@ static void pcmidi_setup_extra_keys(
>  		MY PICTURES =>	KEY_WORDPROCESSOR
>  		MY MUSIC=>	KEY_SPREADSHEET
>  	*/
> -	unsigned int keys[] = {
> +	static const unsigned int keys[] = {
>  		KEY_FN,
>  		KEY_MESSENGER, KEY_CALENDAR,
>  		KEY_ADDRESSBOOK, KEY_DOCUMENTS,
> @@ -532,7 +532,7 @@ static void pcmidi_setup_extra_keys(
>  		0
>  	};
>  
> -	unsigned int *pkeys = &keys[0];
> +	const unsigned int *pkeys = &keys[0];
>  	unsigned short i;

Applied, thanks for the fix.

-- 
Jiri Kosina
SUSE Labs

