Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2861CE7FF
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 00:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgEKWXw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 18:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725854AbgEKWXv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 18:23:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A275DC061A0C;
        Mon, 11 May 2020 15:23:51 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t7so4521001plr.0;
        Mon, 11 May 2020 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JLfoSPN+g0M+12pvr+igApp4uQG3jYdsRDvXvDzv2Lk=;
        b=j3brWjRgeSjehJBApNbZLLcJvxpvJJSAfdEFmXQzA//KR4Ggrf4z/7CAsVKZKVk7B9
         N2DI7bq+NaYXms8jhOmlLVhXUjoAWbUzD1xPFsWdeuhjRV8vRARCw+DoRoeTao2v0uAb
         aTdTPhREleFZpumgtaY30v4iQjgAmNZmw4YahR3PfYJVApesxnbE0wVs5HCkFR2y9WEl
         B5VA6ohorg5LynSvE48OyPCaKGkUwh718/7wNDd+14fXWiUYuVf5/srjBCgm8UsEb8w+
         eF64UDhEkPDI60PsYXxrHnFKLdw2yTlqI/7wlX0wOU/viSBK61Iz9otiG0T4YI19J63S
         mAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JLfoSPN+g0M+12pvr+igApp4uQG3jYdsRDvXvDzv2Lk=;
        b=QwRTDWEenPpPFau1/rtlyHO6i5gyHZoGzGmPExjKxxAGYawnF6VsMGwIpdfLoq0ciZ
         pOxfqvYnzfGF5F5yEMp99BjNwrsvuYkHLc58NHQ5aAOZs5flt5phWq1TGNsXwmZDuI10
         pHsmQmGWhA9Ym2fsv8b6ULI13OdS5GzA+Mrl5NaSNNwmOeogGKxxUhwyAhcvzZ7mWufo
         b9iOCZQWYG55jJbSqMq6Npxd2z+c/11k196lL1afcCbZ4dtLUmrc4L2oZvPRDuzXMGVJ
         N1JfVHGb/Yb+FwyVrhCipcNlosOzJrJ3yjewgC/rqvNpD7iN/AsvOPmwlarqHsud7jEm
         lfIw==
X-Gm-Message-State: AGi0PubAnHzNjZh0qlqDChQeCAAI1hO3j6NZwq0JCYmZ+upcCm5EhfAm
        cNhQoPOWDqNSmuBAIgSIOkM=
X-Google-Smtp-Source: APiQypKNvsZszpo4BOEtWUTwHY54qdYIodG3QmArFEUoKdlij8JE9UneoYh3sId5yaVjvjZD29JG9w==
X-Received: by 2002:a17:902:326:: with SMTP id 35mr15663801pld.188.1589235830671;
        Mon, 11 May 2020 15:23:50 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a21sm10068113pfk.39.2020.05.11.15.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:23:49 -0700 (PDT)
Date:   Mon, 11 May 2020 15:23:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v11 05/56] Input: atmel_mxt_ts - output status from T48
 Noise Supression
Message-ID: <20200511222347.GZ89269@dtor-ws>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-6-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508055656.96389-6-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 07, 2020 at 10:56:05PM -0700, Jiada Wang wrote:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> This patch outputs status from T48 Noise Supression
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Benson Leung <bleung@chromium.org>
> Acked-by: Yufeng Shen <miletus@chromium.org>
> (cherry picked from ndyer/linux/for-upstream commit 2895a6ff150a49f27a02938f8d262be238b296d8)
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 7e6a66e3e1e0..a53985a7736f 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -324,6 +324,7 @@ struct mxt_data {
>  	u16 T18_address;
>  	u8 T19_reportid;
>  	u16 T44_address;
> +	u8 T48_reportid;
>  	u8 T100_reportid_min;
>  	u8 T100_reportid_max;
>  
> @@ -978,6 +979,24 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
>  	data->update_input = true;
>  }
>  
> +static int mxt_proc_t48_messages(struct mxt_data *data, u8 *msg)
> +{
> +	struct device *dev = &data->client->dev;
> +	u8 status, state;
> +
> +	status = msg[1];
> +	state  = msg[4];
> +
> +	dev_dbg(dev, "T48 state %d status %02X %s%s%s%s%s\n", state, status,
> +		status & 0x01 ? "FREQCHG " : "",
> +		status & 0x02 ? "APXCHG " : "",
> +		status & 0x04 ? "ALGOERR " : "",
> +		status & 0x10 ? "STATCHG " : "",
> +		status & 0x20 ? "NLVLCHG " : "");

Should we define symbolic names for these bits, like you did for T42
in the next patch?

Thanks.

-- 
Dmitry
