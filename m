Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E142DA016
	for <lists+linux-input@lfdr.de>; Mon, 14 Dec 2020 20:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502237AbgLNTQD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Dec 2020 14:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502063AbgLNTPy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Dec 2020 14:15:54 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F602C0613D6
        for <linux-input@vger.kernel.org>; Mon, 14 Dec 2020 11:15:14 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 11so12707065pfu.4
        for <linux-input@vger.kernel.org>; Mon, 14 Dec 2020 11:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DvnE2hRJY7kzQqquLbMReDl3CoLwGW6U65prR7sDm9Q=;
        b=XAzYL/Np59tugJc5pSNVhHvgxgerKgerBYkidJkaVGyucNPIRzwKNr6nqN8lrh8AQh
         Wl7Gc5YTLSANuJQTAL2PXEYT2OYLL1YMYmz3ff1ARVC9AU1CPa2hDHVDtBDQcS7q2fHY
         ihtRaN5iY2/lQAFzszz/C0EvUbFSr8ubyG6WSpnlFDDbcxvmKfbnXcmg6ASneKu4P+Vo
         23Ykw1VUUx8OrQed+BWbaetf2TeJZqlwKTZH/3ABSKU9INu5XYNUm1BCc8/LzmNj77W3
         sO0rTE46JTiiUxXEM1IAEc789FDjw07aClUTOozkhaIwpHYn5j/i1xlcUowqlxc/FaJE
         8gFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DvnE2hRJY7kzQqquLbMReDl3CoLwGW6U65prR7sDm9Q=;
        b=GzI9V5dBsT8cXLs+TguZhqZd+xOZ/fnXP0qZ4jhM0wKWYDv230TnbrW8KcN8dvtAiK
         KupxrFKzei9l1E+ul73aTrTiiThSgCcjOA8EhlwZwMRHPO5Z98pR/DTHlxhUuBAf9P12
         QPfIzm9tF0Xyo6pcRhzZIsRkQoHcuanU2WqZjMDbIv5hBDkJPQhdfBnD0ofTM12OFOdf
         gql0VzlTJ2PkhRnTywEFCJP50kFKAZmWCOA6pxwZpEeBXDRQR0P27zMb5LSfSshymHiQ
         7oUf7QDxXc4kvnR9h9KIvMU00jR7UjU79jHsjFbuQZOl2sCU8Tq6fg6dugji9CQ7RZOq
         8QXQ==
X-Gm-Message-State: AOAM530fqOdnzlwWee/vBfj331iFIsIAAeXofG1hie5Vzm3mQokF7Fnc
        F59qniTj8Xxx/upvFyFhfbwZ/Q==
X-Google-Smtp-Source: ABdhPJzOfxHBLaCUcnj9WU7hpMeQHi16SvlQfeSUUXVBFQFbsOz5pj+SKk2/7Tgmeqtvq0o39PtBmQ==
X-Received: by 2002:a63:f348:: with SMTP id t8mr25554313pgj.425.1607973313883;
        Mon, 14 Dec 2020 11:15:13 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id 197sm14992845pgg.43.2020.12.14.11.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 11:15:12 -0800 (PST)
Date:   Mon, 14 Dec 2020 11:15:10 -0800
From:   Will McVicker <willmcvicker@google.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        security@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, Will Coster <willcoster@google.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH v1] HID: make arrays usage and value to be the same
Message-ID: <X9e5vl+nw4GQNYEw@google.com>
References: <20201205004848.2541215-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205004848.2541215-1-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 05, 2020 at 12:48:48AM +0000, Will McVicker wrote:
> The HID subsystem allows an "HID report field" to have a different
> number of "values" and "usages" when it is allocated. When a field
> struct is created, the size of the usage array is guaranteed to be at
> least as large as the values array, but it may be larger. This leads to
> a potential out-of-bounds write in
> __hidinput_change_resolution_multipliers() and an out-of-bounds read in
> hidinput_count_leds().
> 
> To fix this, let's make sure that both the usage and value arrays are
> the same size.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/hid/hid-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 56172fe6995c..8a8b2b982f83 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -90,7 +90,7 @@ EXPORT_SYMBOL_GPL(hid_register_report);
>   * Register a new field for this report.
>   */
>  
> -static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages, unsigned values)
> +static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages)
>  {
>  	struct hid_field *field;
>  
> @@ -101,7 +101,7 @@ static struct hid_field *hid_register_field(struct hid_report *report, unsigned
>  
>  	field = kzalloc((sizeof(struct hid_field) +
>  			 usages * sizeof(struct hid_usage) +
> -			 values * sizeof(unsigned)), GFP_KERNEL);
> +			 usages * sizeof(unsigned)), GFP_KERNEL);
>  	if (!field)
>  		return NULL;
>  
> @@ -300,7 +300,7 @@ static int hid_add_field(struct hid_parser *parser, unsigned report_type, unsign
>  	usages = max_t(unsigned, parser->local.usage_index,
>  				 parser->global.report_count);
>  
> -	field = hid_register_field(report, usages, parser->global.report_count);
> +	field = hid_register_field(report, usages);
>  	if (!field)
>  		return 0;
>  
> -- 
> 2.29.2.576.ga3fc446d84-goog
> 

Hi Jiri and Benjamin,

This is a friendly reminder in case this got lost in your inbox.

Thanks,
Will

