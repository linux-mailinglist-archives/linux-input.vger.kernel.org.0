Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F613223366
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 08:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgGQGKP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 02:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgGQGKO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 02:10:14 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A93C061755;
        Thu, 16 Jul 2020 23:10:14 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u5so4892788pfn.7;
        Thu, 16 Jul 2020 23:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qOojSnVMbp+W1a0n50LFNuDIahPqMPE9gS4e6tzjV/s=;
        b=uvn7ZWY/vXnU3B3aKedfnEH4dL2WGHL+XeX+XCgV72sCUo/O2CLjQYgFS9RwZqkzMR
         7Rs1cvqPpgDO71zLZkPMcTBiVZTaYGftl9ptpiIvKoCreovsazUnFiYsqxsH6c05iRaZ
         8f35nuMVF/a5suAYmmNXoGqqBH57qzxH7TbPWiZ2g3MX2VIgBjlYog4w8ZJEjesI5NPI
         SbOCwsZI6TijGbKFeW36SY17+JqWIW9NVtXa0YACzO2vBBXcrxwwzf0NwFuFIx4fdI/Q
         6k84I2Xw6ynoKutbcbczbdZqq1+j5PpQiFtrn/gLhnHFySoLQOPKjre2RAGrBpf9um2e
         zhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qOojSnVMbp+W1a0n50LFNuDIahPqMPE9gS4e6tzjV/s=;
        b=XRQ/0iXjc8snNNBeypYvDdpM6xPV7KkiHFO/b+2QhhPpvssNLkz9CNlA5DlHg654nX
         HeRZ2bUVURnLnzelXjJKRHrjaqevcQatmyK31wDb3cZ8NxmbBj9ER0aMhPRGMyMDAtfg
         7yV0Zo/2VPyoezpkROxoED14JqUkwjTqQ7nTKNC2jAWkmFmhZYkCcDRyzy3sZRPj4ctQ
         hDeoB/Qr73V7yrMjkzaQYSMdkQPm/LLGegLvPUQdaX3vyhDN6IfQqfnzUvXvvLol7dKr
         iM6cQPuWDs5piqrZp1HR4pTRsWXvrEeqAVXTXTXPHEl4JMbj9Pq/lVulY7/oQN/z3jCs
         iZxA==
X-Gm-Message-State: AOAM533sW9Fyqfn8SY8FG+qywJswaXZzmDscPgO/0xzz10pA0rT9h66L
        eVWoYpVH1dUBs+f3nX7Fqeg=
X-Google-Smtp-Source: ABdhPJxYnouhHbiG2UcSmrO0gBCV0e258OA1b9L3tMH4RsdyBY1VtNv7vcqa5/fVZ9uK3EADOMUJ1A==
X-Received: by 2002:a63:f903:: with SMTP id h3mr7558362pgi.437.1594966213480;
        Thu, 16 Jul 2020 23:10:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g28sm6276753pfr.70.2020.07.16.23.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 23:10:12 -0700 (PDT)
Date:   Thu, 16 Jul 2020 23:10:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        phoenix <phoenix@emc.com.tw>, "josh.chen" <josh.chen@emc.com.tw>,
        "kai.heng.feng" <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 2/2] Input: elan_i2c - Modify the IAP related functio n
 for page sizes 128, 512 bytes.
Message-ID: <20200717061010.GD1665100@dtor-ws>
References: <20200714105641.15151-1-jingle.wu@emc.com.tw>
 <20200716053912.GB1665100@dtor-ws>
 <1594880123.69588.jingle.wu@emc.com.tw>
 <20200717012719.GC1665100@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717012719.GC1665100@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 16, 2020 at 06:27:19PM -0700, Dmitry Torokhov wrote:
> Hi Jingle,
> 
> On Thu, Jul 16, 2020 at 02:15:23PM +0800, jingle.wu wrote:
> > HI Dmitry:
> > 
> > Just to confirm, the older devices (I assume that pattern 0 means older)
> >  have version command that is numerically higher than the one for the
> >  newer (pattern >= 1) devices?
> > 
> > >> Yes, Pattern 1, 2 are newer devices.
> > 
> > > @@ -324,7 +342,14 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
> > >  			return error;
> > >  		}
> > >  		*version = val[0];
> > > -		*ic_type = val[1];
> > > +
> > > +		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_VERSION_CMD, val);
> > > +		if (error) {
> > > +			dev_err(&client->dev, "failed to get ic type: %d\n",
> > > +				error);
> > > +			return error;
> > > +		}
> > 
> > Could you please tell me why this chunk is needed?
> > >> Modify the old pattern IC firmware read the correct ic_type.
> > 
> > In the elan_i2c_core.c, move this code to elan_i2c_i2c.c. 
> > static int elan_query_device_info(struct elan_tp_data *data)
> > {
> > 	.....
> > 	if (data->pattern == 0x01)
> > 		ic_type = data->ic_type;
> > 	else
> > 		ic_type = data->iap_version;
> > 	.....
> > 	return 0;
> > }
> 
> I am concerned that unconditionally substituting iap_version for ic_type
> for "pattern 0" devices will break check in
> elan_check_ASUS_special_fw() as it operates on the ic_type returned by
> ETP_I2C_OSM_VERSION_CMD and not iap_version.

I split the firmware handling code into a few patches and uploaded it
to a new elan-i2c branch:

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git elan-i2c

Please take a look and let me know if I messed it up or not. I will be
looking at the new packet format next.

Thanks.

-- 
Dmitry
