Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1025B2D9E
	for <lists+linux-input@lfdr.de>; Fri,  9 Sep 2022 06:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiIIEm6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Sep 2022 00:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiIIEmy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Sep 2022 00:42:54 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0DFF16FA;
        Thu,  8 Sep 2022 21:42:51 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id v1so699369plo.9;
        Thu, 08 Sep 2022 21:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=vi9VdkVa7lyguXCc6ti24fUYhj9gycPlVQvLVe1uqzc=;
        b=O23Ay2yc1nU0Tu+F3Hz3NHINh3npNtAVMgeGMWpjMZg5FXJHqFU7UVya67jiYLqpu9
         6rDXIL7pGZemIR4C+xfvjNeQQEMLZYuTJhToBjWTRbgNhSnY0m6AZZkd7ZnjZeeQZhPw
         w4NeZuFVvNERspv1ywVzgILuMECcNirhjRgZTYtvTGvBqSsA3GdhIRtVIhZVMMVTLz1R
         bkpE29e0LymhOfF3cjmhcR+GwSvMmDnKU2DztbdXxfajTxXI6ERFgwqmQiezrMWFjeMu
         Vwry869H25V8NCc6Dr6t0ZHtnn9NZ5wflpaOnygxtFJ+OvqEjkNqoh0CZgCQIE7FhpV4
         E3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vi9VdkVa7lyguXCc6ti24fUYhj9gycPlVQvLVe1uqzc=;
        b=2Tc+A+vto45QTkdrwJiLpDOsJdLjQ+tJ6i7N68vDxs5CoX624tnXq8nwba+y/t9Ded
         A4SMQ8d/wjz0k1lzlRQV38JtfavK5ib05ro0csGuPaIKll4BFzK6ChLCg6KojIgjFnYf
         blEiEqQ+CJq+ewliBU8NWoUoPSEFDV0z8N2myrmHeqk1Nx3QLF/2QSxIR8Wxhiho3Xsv
         AjMaf/MvSmvuWvo3JFx1y0ge3fvWeueSMm8RKrkM8DY4fbtBlrayFz72Nj+cARM/2ajc
         TmNHcQbrK0A0AREeQoNvbBDG4hzl1CYpgv+HvMxyRBcy8SrycaSX0g0+dh4DU35M0Ifn
         aFeg==
X-Gm-Message-State: ACgBeo3jfXtGL0YeY7R7KFV40hYyo+/uVmlmiDujFJf8KIw+AUQdv4mi
        pn2+ITJtmHDSoRj5n5bXAOo=
X-Google-Smtp-Source: AA6agR4pkU5ll+tnc3+3L54oHu2PDeaLCgnPH2O0NtGYRt8tmqTbBdJUi1tNZv9+4Seq4khUnDyIrw==
X-Received: by 2002:a17:90a:e7d2:b0:200:a220:6495 with SMTP id kb18-20020a17090ae7d200b00200a2206495mr7852697pjb.5.1662698570543;
        Thu, 08 Sep 2022 21:42:50 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7554:1f24:9d2b:37a0])
        by smtp.gmail.com with ESMTPSA id w76-20020a627b4f000000b0052d46b43006sm509285pfc.156.2022.09.08.21.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 21:42:50 -0700 (PDT)
Date:   Thu, 8 Sep 2022 21:42:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/11] Input: iqs7222 - report malformed properties
Message-ID: <YxrER3gYKg3joI7u@google.com>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-3-jeff@labundy.com>
 <YxpcyY0BAumyaeVR@google.com>
 <20220909020809.GB3306@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909020809.GB3306@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 08, 2022 at 09:08:09PM -0500, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> On Thu, Sep 08, 2022 at 02:21:13PM -0700, Dmitry Torokhov wrote:
> > On Thu, Sep 08, 2022 at 08:15:39AM -0500, Jeff LaBundy wrote:
> > > Nonzero return values of several calls to fwnode_property_read_u32()
> > > are silenty ignored, leaving no way to know that the properties were
> > > not applied in the event of an error.
> > > 
> > > To solve this problem, follow the design pattern used throughout the
> > > rest of the driver by first checking if the property is present, and
> > > then evaluating the return value of fwnode_property_read_u32().
> > > 
> > > Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> > > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > > ---
> > >  drivers/input/misc/iqs7222.c | 65 ++++++++++++++++++++++++++++++------
> > >  1 file changed, 55 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> > > index 04c1050d845c..fdade24caa8a 100644
> > > --- a/drivers/input/misc/iqs7222.c
> > > +++ b/drivers/input/misc/iqs7222.c
> > > @@ -1819,8 +1819,17 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
> > >  		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW;
> > >  		chan_setup[4] = val * 42 + 1048;
> > >  
> > > -		if (!fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
> > > -					      &val)) {
> > > +		if (fwnode_property_present(chan_node, "azoteq,ref-weight")) {
> > > +			error = fwnode_property_read_u32(chan_node,
> > > +							 "azoteq,ref-weight",
> > > +							 &val);
> > 
> > fwnode_property_read_u32() returns EINVAL if property is missing, so
> > maybe have:
> > 
> > 		error = fwnode_property_read_u32(chan_node,
> > 						 "azoteq,ref-weight", &val);
> > 		if (!error) {
> > 			...
> > 		} else {
> > 			if (error != -EINVAL) {
> > 				dev_err(&client->dev,
> > 					"Failed to read %s reference weight: %d\n",
> > 					fwnode_get_name(chan_node), error);
> > 				goto put_chan_node;
> > 			}
> > 		}
> > 
> > to avoid double calls into property handling code?
> 
> That's a better idea; I can fold this into the helper functions proposed
> for the previous patch too.

We might be talking about different helpers. I had in mind:

static int __iqs7222_parse_cycle(...)
{
...
}

static int iqs7222_parse_cycle(...)
{
...
	int retval = 0;

	error = iqs7222_parse_props(iqs7222, &cycle_node, cycle_index,
				    IQS7222_REG_GRP_CYCLE,
				    IQS7222_REG_KEY_NONE);
	if (error)
		return error;

	if (cycle_node) {
		retval = __iqs7222_parse_cycle(...);
		fwnode_put(cycle_node);
	}


	return retval;
}

so that we drop the node from one place.

Thanks.

-- 
Dmitry
