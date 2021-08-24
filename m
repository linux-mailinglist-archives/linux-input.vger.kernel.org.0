Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100523F6155
	for <lists+linux-input@lfdr.de>; Tue, 24 Aug 2021 17:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238042AbhHXPNe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Aug 2021 11:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235683AbhHXPNe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Aug 2021 11:13:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EC6C061757;
        Tue, 24 Aug 2021 08:12:50 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id v19so21013535lfo.7;
        Tue, 24 Aug 2021 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nmGvwtewZhahaxWT7r6MM1lFjwG7TZYGIcH373t0IgY=;
        b=LlKC+CoOTFkhN6u/GuKQhlebYBoszWO94MzI/1spozMKKhe7wyibjZ6x0ShOfAvSio
         i5gbTDPQ1xLGE7ZKrB6h4T+sf73Xifrn1ir0k5nOxFQehQbU3Fk/E9IBZq3jcXInrMjF
         tAXpgCC48oWxM4ByyWdh5wnEzbDhA9h1P3PtsIoM/ye14jC+z3EF/BVtpaLBK9brydX9
         6KLFZb4icyfi0q1zcYyixyocRbWbfLSzLCtlCrxjcF39NRXXmivxqh7foZZn1w8wcD6L
         aBbbdPATT1FvLWo9NZeZaXe8HeKrANJYuo057x6su2AgCN8gVl89syrhyVsB1eepvbSI
         wwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nmGvwtewZhahaxWT7r6MM1lFjwG7TZYGIcH373t0IgY=;
        b=MVq6D2KqM9n32+ubAG5xFFFyGA+k7JmWsP4UTf/fWMgpFRp+wyeOKe3QCfhtxojwtZ
         L02Lrgii0H3dda2uZM7NR1frJKOFR45xiJ6qox2otEEt8Lnopi5AoWNL+WRFoC9tZhFE
         ujiDxfTvhVQLGR2m2QZEyh9nibs+kzpTePvTYxYLzL76UKkTC+AUzn7MVAB55eqJBt0U
         13WtIL82N0kOu1YIdd1OYrmdT4uqZV8pOwjpgio0kfmgEwzpMYj6bz25yrtWjM415rhO
         yeUinDNJjGDC++Xoq2hFo/DT6O632eMy0auIKF2ynbYGca9W3iikV82gDNYpqliDSzot
         0Sng==
X-Gm-Message-State: AOAM531TbnAh3F2eMLObknvFPk8qpUrmk7N/mLz8+qilcQiACuwJDUUb
        U0uH5cT9Pzma4giH/wQITLmQOCngGvaxa/Xa
X-Google-Smtp-Source: ABdhPJz5UdSOeNjjW80KCuKMmcs5NvyiEyViMiYj/D80q4paxy2NyVmlMyHbYbD0gWLBdqrgmnfZLQ==
X-Received: by 2002:a05:6512:3fa3:: with SMTP id x35mr4805233lfa.536.1629817968250;
        Tue, 24 Aug 2021 08:12:48 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id bp25sm719526lfb.51.2021.08.24.08.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 08:12:47 -0700 (PDT)
Subject: Re: [PATCH v3] HID: betop: fix slab-out-of-bounds Write in
 betop_probe
To:     "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210816201544.26405-1-asha.16@itfac.mrt.ac.lk>
 <20210824150730.9118-1-asha.16@itfac.mrt.ac.lk>
From:   Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <e8e7f55a-75dd-6631-13e0-eab350712a38@gmail.com>
Date:   Tue, 24 Aug 2021 18:12:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824150730.9118-1-asha.16@itfac.mrt.ac.lk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/24/21 6:07 PM, F.A.Sulaiman wrote:
> Syzbot reported slab-out-of-bounds Write bug in hid-betopff driver.
> The problem is the driver assumes the device must have an input report but
> some malicious devices violate this assumption.
> 
> So this patch checks hid_device's input is non empty before it's been used.
> 
> Reported-by: syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com
> Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>


Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>


> ---
>   drivers/hid/hid-betopff.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-betopff.c b/drivers/hid/hid-betopff.c
> index 0790fbd3fc9a..467d789f9bc2 100644
> --- a/drivers/hid/hid-betopff.c
> +++ b/drivers/hid/hid-betopff.c
> @@ -56,15 +56,22 @@ static int betopff_init(struct hid_device *hid)
>   {
>   	struct betopff_device *betopff;
>   	struct hid_report *report;
> -	struct hid_input *hidinput =
> -			list_first_entry(&hid->inputs, struct hid_input, list);
> +	struct hid_input *hidinput;
>   	struct list_head *report_list =
>   			&hid->report_enum[HID_OUTPUT_REPORT].report_list;
> -	struct input_dev *dev = hidinput->input;
> +	struct input_dev *dev;
>   	int field_count = 0;
>   	int error;
>   	int i, j;
>   
> +	if (list_empty(&hid->inputs)) {
> +		hid_err(hid, "no inputs found\n");
> +		return -ENODEV;
> +	}
> +
> +	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
> +	dev = hidinput->input;
> +
>   	if (list_empty(report_list)) {
>   		hid_err(hid, "no output reports found\n");
>   		return -ENODEV;
> 

