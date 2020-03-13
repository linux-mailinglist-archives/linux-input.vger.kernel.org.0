Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5328A184C88
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 17:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgCMQcR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 12:32:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:37148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbgCMQcR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 12:32:17 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C71B206BE;
        Fri, 13 Mar 2020 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584117137;
        bh=UJ9uLMaNsCdSFf3b8zBqQuLODCb8Yutk8T7Vp7hT9Sg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=UE/g3LjyhJa8gflDX21ggALqOZagI2f93Me8yQnI6/xIFheEZYxT2wicWbDM/SkVk
         iilOTh/8AuagnAWQaMa10epUpGAJSb15ctVjxHlstwD41960w9mcUs2Ug0DnVAjm8J
         F1eno/74++40wsX6qm5egffxPECDlXa2F31dU6Es=
Date:   Fri, 13 Mar 2020 17:32:14 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Lucas Tanure <tanure@linux.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: appleir: Remove unnecessary goto label
In-Reply-To: <7c4c591bc1aa9e269cbf764a03e64d32dd6e6e96.1582998175.git.tanure@linux.com>
Message-ID: <nycvar.YFH.7.76.2003131731490.19500@cbobk.fhfr.pm>
References: <7c4c591bc1aa9e269cbf764a03e64d32dd6e6e96.1582998175.git.tanure@linux.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 29 Feb 2020, Lucas Tanure wrote:

> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  drivers/hid/hid-appleir.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hid/hid-appleir.c b/drivers/hid/hid-appleir.c
> index bf8d4afe0d6a..aafc285b538f 100644
> --- a/drivers/hid/hid-appleir.c
> +++ b/drivers/hid/hid-appleir.c
> @@ -284,10 +284,8 @@ static int appleir_probe(struct hid_device *hid, const struct hid_device_id *id)
>  	struct appleir *appleir;
>  
>  	appleir = kzalloc(sizeof(struct appleir), GFP_KERNEL);
> -	if (!appleir) {
> -		ret = -ENOMEM;
> -		goto allocfail;
> -	}
> +	if (!appleir)
> +		return -ENOMEM;
>  
>  	appleir->hid = hid;
>  
> @@ -314,7 +312,6 @@ static int appleir_probe(struct hid_device *hid, const struct hid_device_id *id)
>  	return 0;
>  fail:
>  	kfree(appleir);
> -allocfail:
>  	return ret;
>  }

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

