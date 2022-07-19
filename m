Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17F0A57A364
	for <lists+linux-input@lfdr.de>; Tue, 19 Jul 2022 17:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238245AbiGSPnw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jul 2022 11:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238137AbiGSPnv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jul 2022 11:43:51 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E9058860
        for <linux-input@vger.kernel.org>; Tue, 19 Jul 2022 08:43:50 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bu1so22193175wrb.9
        for <linux-input@vger.kernel.org>; Tue, 19 Jul 2022 08:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NmXXZtQUscROskShGi5ApQFRMHLTFbjS4HwuHMm/I84=;
        b=pvlVbngw6KM3g6upOOZBcEY149F2PuDNOaFSzXUboE6byqwEefNRQAIGWTtSayWmw2
         bl7nn0yfmvFF1YYdAmR2zXDMpXPuDsp/fEYxVbuUPBe07DsGLdJFo1NkQbJ5NftynTl9
         MmpSOoqmb6+trpjJJdUSjDTjA3ACTzJP+bH7XdGZkE3xRsCm3SK0684JrxbiVFqgUwsQ
         1Wj7bYjYRieoASOpK48o327G2B1FgkSxpUdxlob2HGS38S5rhxUhcNV8YaG8pRkHS2MK
         T77j91Q1HXiiHNZXUoCUtm3UD6kLGRXMOKqbTn4y9pdEDFN5Ai+YE9nJtuOFADuw2kK2
         N0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NmXXZtQUscROskShGi5ApQFRMHLTFbjS4HwuHMm/I84=;
        b=60msXCwd7Z3pf4rFW0FXZeSll7H7Mvrob1v6dlewGIiEBNv0vpF8Smd6SaIK2ghDk6
         sAFwiPvBg23l5mKRfEKQ5SXf1992z54oKyYaKGMOMxylyVAmEeterT2QB2go8nYRuUHb
         zBSyyp4LGoIspnQsJNDpBaCzPodlZTuYVJDVP+/Y9k77Oc6tMzHenXk6JX2vX9JUadSM
         Lml5tQEf1SK+jksinYYieY4LBYeByisrn09d1LUGBMipp6g34IKbTauMvoMI0Y5nTtR7
         Zr9cEW9y+uYEhwpiYJWUedJcqYq3ynYu7AvGalBeCJQE2Xdb6fkWoPdh+X/trREfuORe
         pMAQ==
X-Gm-Message-State: AJIora/WtYDxFF1as6phuYls9bDGeRxVsvr1ZzTf6vQQ39iIW/YCX49u
        V9TD41j2yaZk3TLUvkv08f4d21igqCuXjA==
X-Google-Smtp-Source: AGRyM1uzotpcXAdt14sD1BYa+k/svbItICtU/qB9rEDhsWagU8ivEogigo5szlDrZY/oUXRcykTFzA==
X-Received: by 2002:a5d:6c62:0:b0:21d:c697:87f2 with SMTP id r2-20020a5d6c62000000b0021dc69787f2mr20419150wrz.283.1658245428578;
        Tue, 19 Jul 2022 08:43:48 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f7-20020a7bcd07000000b003a02cbf862esm19122568wmj.13.2022.07.19.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 08:43:48 -0700 (PDT)
Date:   Tue, 19 Jul 2022 16:43:45 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/1] HID: steam: Prevent NULL pointer dereference in
 steam_{recv,send}_report
Message-ID: <YtbRMUSa8KyOtd1x@google.com>
References: <20220708074009.621113-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220708074009.621113-1-lee.jones@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 08 Jul 2022, Lee Jones wrote:

> It is possible for a malicious device to forgo submitting a Feature
> Report.  The HID Steam driver presently makes no prevision for this
> and de-references the 'struct hid_report' pointer obtained from the
> HID devices without first checking its validity.  Let's change that.
> 
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org
> Fixes: c164d6abf3841 ("HID: add driver for Valve Steam Controller")
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/hid/hid-steam.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Did anyone get a chance to look at this?

Would you like me to submit a [RESEND]?

> diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
> index a3b151b29bd71..fc616db4231bb 100644
> --- a/drivers/hid/hid-steam.c
> +++ b/drivers/hid/hid-steam.c
> @@ -134,6 +134,11 @@ static int steam_recv_report(struct steam_device *steam,
>  	int ret;
>  
>  	r = steam->hdev->report_enum[HID_FEATURE_REPORT].report_id_hash[0];
> +	if (!r) {
> +		hid_err(steam->hdev, "No HID_FEATURE_REPORT submitted -  nothing to read\n");
> +		return -EINVAL;
> +	}
> +
>  	if (hid_report_len(r) < 64)
>  		return -EINVAL;
>  
> @@ -165,6 +170,11 @@ static int steam_send_report(struct steam_device *steam,
>  	int ret;
>  
>  	r = steam->hdev->report_enum[HID_FEATURE_REPORT].report_id_hash[0];
> +	if (!r) {
> +		hid_err(steam->hdev, "No HID_FEATURE_REPORT submitted -  nothing to read\n");
> +		return -EINVAL;
> +	}
> +
>  	if (hid_report_len(r) < 64)
>  		return -EINVAL;
>  

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
