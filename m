Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8CB5B286E
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 23:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiIHVVV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 17:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiIHVVU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 17:21:20 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68424114A75;
        Thu,  8 Sep 2022 14:21:17 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso4019018pjq.1;
        Thu, 08 Sep 2022 14:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=xlwAWQKOiA4zyI3O3mHZzhRQiU9MFPsOlzuxqJ9KpRw=;
        b=kwccyRF9OPsEdL3gW1Bd2nPgEbEFXy5dTKbQkxb27nc6eaCf82OS7+DWp86gj0Yhzx
         l1JvERj/WFjd5kieQH5amluMFwuMplcFBLcTDMYksMnmhV0UCubC2qaEyKzNwyoScb/G
         Etn4XiyDP7SKODDzxmRd6a6nVqPy1T5DlDYNUpAO3cEwav5ZE2lpVxYjV6Z3s0xs0fnj
         NvCdf+OIgBJYJEekdMI0KSW6PucomdGUwoIOnCsSfXA1KP9K/WZ4BaBc5mhOMpOZDRos
         K7/uWHz4I82ORS2T9nSASDyha2EgJ3P/6SsXmZY8RHE3wiljRf1Vf1dYClF6Kn/7MESF
         Dh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=xlwAWQKOiA4zyI3O3mHZzhRQiU9MFPsOlzuxqJ9KpRw=;
        b=nBSKn2Gx5KZflVcbhn5qd0RjhfEEYCrsq63/QYnTIbLslcicTTrAFLfFFYSYIOwMav
         TTymVf7AKJaot+C05YhlSlM8+GNC+fVb5o1Pb6gXT8h2Y3//4jp31acWI8pCz3d53vPC
         OpEqKg7OF+Tiq7WkJdu0q2QlTpUi2kUwamge+GCCToc8nXBMSatEGf+IDgvJ8ktxtpNR
         u+4vXrGjssnqS/txExczef4GnCJNHtV87p1c+VMIQcsf1wEDXS52cbbyIm5Ug0akIj0d
         D8oyvZpAoLM//LX4MLMEN0lEPFL1KJ6jAYN3dIVAPCq4Fb7upVux2BowClGyeV2CUeu+
         Xdhg==
X-Gm-Message-State: ACgBeo1VOt2T5YLVZnTN5siIll118eFdxej2niP9U24txL6HALWBamh/
        dNH1TaoVVW3oELjtnIcx9m8=
X-Google-Smtp-Source: AA6agR6E4UkOsK8w1Q3tcM1JUbkjy1rAgbVG2p9ciK6PqsgnhaRt6VGdtQkmTH5OUHjlmrysXSZ7rw==
X-Received: by 2002:a17:90a:4607:b0:1fa:f794:2c0d with SMTP id w7-20020a17090a460700b001faf7942c0dmr6325787pjg.24.1662672076621;
        Thu, 08 Sep 2022 14:21:16 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7554:1f24:9d2b:37a0])
        by smtp.gmail.com with ESMTPSA id y190-20020a6232c7000000b00528a097aeffsm62762pfy.118.2022.09.08.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 14:21:15 -0700 (PDT)
Date:   Thu, 8 Sep 2022 14:21:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/11] Input: iqs7222 - report malformed properties
Message-ID: <YxpcyY0BAumyaeVR@google.com>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-3-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908131548.48120-3-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 08, 2022 at 08:15:39AM -0500, Jeff LaBundy wrote:
> Nonzero return values of several calls to fwnode_property_read_u32()
> are silenty ignored, leaving no way to know that the properties were
> not applied in the event of an error.
> 
> To solve this problem, follow the design pattern used throughout the
> rest of the driver by first checking if the property is present, and
> then evaluating the return value of fwnode_property_read_u32().
> 
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  drivers/input/misc/iqs7222.c | 65 ++++++++++++++++++++++++++++++------
>  1 file changed, 55 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> index 04c1050d845c..fdade24caa8a 100644
> --- a/drivers/input/misc/iqs7222.c
> +++ b/drivers/input/misc/iqs7222.c
> @@ -1819,8 +1819,17 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
>  		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW;
>  		chan_setup[4] = val * 42 + 1048;
>  
> -		if (!fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
> -					      &val)) {
> +		if (fwnode_property_present(chan_node, "azoteq,ref-weight")) {
> +			error = fwnode_property_read_u32(chan_node,
> +							 "azoteq,ref-weight",
> +							 &val);

fwnode_property_read_u32() returns EINVAL if property is missing, so
maybe have:

		error = fwnode_property_read_u32(chan_node,
						 "azoteq,ref-weight", &val);
		if (!error) {
			...
		} else {
			if (error != -EINVAL) {
				dev_err(&client->dev,
					"Failed to read %s reference weight: %d\n",
					fwnode_get_name(chan_node), error);
				goto put_chan_node;
			}
		}

to avoid double calls into property handling code?

-- 
Dmitry
