Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C431B56339D
	for <lists+linux-input@lfdr.de>; Fri,  1 Jul 2022 14:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbiGAMo4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Jul 2022 08:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231781AbiGAMoz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Jul 2022 08:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F7E82B263
        for <linux-input@vger.kernel.org>; Fri,  1 Jul 2022 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656679493;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I+o5MyxcdFm69IVhspSeG0AkjywTJdVF99yclwN4/5Q=;
        b=Ijld7IVESORa/lyTsNOrWiwkyb1GdP/A/t2iP2tDe4iVQTSFfB2B/147LO/QdgqcwtDG+2
        7NXsNy6olrtmoGdQesMLa+D4Lf/hkJu0azO6PfpGhfXcBmOGFhnnILWRgdqbzHZZ3IVC/i
        KSF+kZJudyie1ovZ6rzAjtE2q4p2PZw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-a7Rcv9QTO_eBxwg4Jwzg8w-1; Fri, 01 Jul 2022 08:44:52 -0400
X-MC-Unique: a7Rcv9QTO_eBxwg4Jwzg8w-1
Received: by mail-qk1-f197.google.com with SMTP id l189-20020a37bbc6000000b006af2596c5e8so2028318qkf.14
        for <linux-input@vger.kernel.org>; Fri, 01 Jul 2022 05:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=I+o5MyxcdFm69IVhspSeG0AkjywTJdVF99yclwN4/5Q=;
        b=XrpI5HfEY+xmqR13zNAEtD80WRWZH6UJZF8YxyovAPiOH7Kd7JjTbHMQB6yKHToucg
         CL6cWM3ZfdTmbDBNA1LrpRIn5dnAtk0tDfz7gumrk4hNbwoyXLAs1w1BAaW6OrmiFMVP
         X5gJ+MWQkAI6CSoG6fizdT3fEc+XkpSWZMtYnbfNrVqrRaisPykHOs4hYlMUprDUxa9M
         S2sv5VMmjaqzy/hOotFPVARoYb+FmR00o+/3CwT6pIK1Ksz3lZORkDi03acGIBm+sWE8
         svM+F24WN71ERQNmbfRY6SJQhbUEkK+0bx/tXsKpaMDuQXOHuERn48CA/00lAaFHIX6G
         PrrA==
X-Gm-Message-State: AJIora9/DAYXeXz1cx/87MyEgUfgecOwe/y4FgLnnemhklQQEL2p29nB
        JQegiE5gqHz3JQCkmHjAKNBQNtCbaoQRJE3TXfOiryRUguiBQ0tWNRKkhEGmMsLI7YPmiTY5876
        1d7QytvcSdIjgumUsDaCT6kw=
X-Received: by 2002:ad4:5bc2:0:b0:470:4c7d:db56 with SMTP id t2-20020ad45bc2000000b004704c7ddb56mr15998255qvt.90.1656679492049;
        Fri, 01 Jul 2022 05:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1viqT6xeFd0NMURnXk6opeDjr9vD5bRyRLn8iOY+Kor2kuqlGnPO3IzIZsmjH53M8mj5JDEUA==
X-Received: by 2002:ad4:5bc2:0:b0:470:4c7d:db56 with SMTP id t2-20020ad45bc2000000b004704c7ddb56mr15998236qvt.90.1656679491792;
        Fri, 01 Jul 2022 05:44:51 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id bl34-20020a05620a1aa200b006af34a1a897sm11029924qkb.65.2022.07.01.05.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 05:44:51 -0700 (PDT)
Subject: Re: [PATCH] HID: core: remove unneeded assignment in
 hid_process_report()
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220701112720.13452-1-lukas.bulwahn@gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <fd94d2dc-04ed-f041-f148-8f361f215441@redhat.com>
Date:   Fri, 1 Jul 2022 05:44:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220701112720.13452-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 7/1/22 4:27 AM, Lukas Bulwahn wrote:
> Commit bebcc522fbee ("HID: core: for input reports, process the usages by
> priority list") split the iteration into two distinct loops in
> hid_process_report().
>
> After this change, the variable field is only used while iterating in the
> second loop and the assignment of values to this variable in the first loop
> is simply not needed.
>
> Remove the unneeded assignment during retrieval. No functional change and
> no change in the resulting object code.
>
> This was discovered as a dead store with clang-analyzer.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Benjamin, Jiri, please pick this minor non-urgent clean-up patch.
>
>   drivers/hid/hid-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 00154a1cd2d8..b7f5566e338d 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -1662,7 +1662,7 @@ static void hid_process_report(struct hid_device *hid,
>   
>   	/* first retrieve all incoming values in data */
>   	for (a = 0; a < report->maxfield; a++)
> -		hid_input_fetch_field(hid, field = report->field[a], data);
> +		hid_input_fetch_field(hid, report->field[a], data);
>   
>   	if (!list_empty(&report->field_entry_list)) {
>   		/* INPUT_REPORT, we have a priority list of fields */
Reviewed-by: Tom Rix <trix@redhat.com>

