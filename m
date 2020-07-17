Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0DD822401E
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 18:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgGQQCj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 12:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgGQQCi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 12:02:38 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86646C0619D2;
        Fri, 17 Jul 2020 09:02:38 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t6so5612139plo.3;
        Fri, 17 Jul 2020 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kQQY75f1lwYr//B5FuZk+rYcaijF15RsL6V2AzTXG6s=;
        b=SiErbZBCO4LyV40LgzLyuLsyk3Gy1CIrJI47k1tgmH2nSIij3507i2xnBKBmEP8FUo
         XLLTBmoJOYxEhzlZOJoRpBKMUWYdF7pVp3BdDz4ZR3CrYybT5pMQyBDBjMnqkok/V13J
         CYuF/nJmfr/RsIiMBJhAjdVCp6uUBQE3ig39l1d75qj1PV35c9zMh0jQUO28UoDV1mMi
         yfazmoR+h1b5a0KHFPScXD/nCZRWsEvfBeCp/xKPqS/u1TlX+oteecm2h2TMW6jc11Cm
         aqXKe59AO4qws7o3LCVWJq1kcVR93s4YVx/1axBDxWNoIR3yLo1ZI15QPUq2gwMANWj8
         b3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kQQY75f1lwYr//B5FuZk+rYcaijF15RsL6V2AzTXG6s=;
        b=AiuzgN+ztnoQzLC7kb8En0AOFwRyY9RzGDsWjY//eEJZHh/0FzY3U1bG888NqP7gZc
         Y5JOjxT4ETKlKK8qHhRpOPj+E/CuEbUO1hRmSURvnGLfGLwT1kVXZoknYqajbHrovlB4
         09VaXq4tCYZ75KeeorRwmA5q7O+qdWXnDI1K4jfGzlu2F2LmpLAD09X4Jqqxbl3gTz/s
         W7zD3qc7a7YN9vcdiJDcuOTdvsgAEbaIaN1tR43A2SU1SiJCsiorbWAcD3OpeCV30ZWj
         d7xgv2TsPnxhqDLUBAdS+QFNqGwISWOCJ+SMHGyuHbqHBJlPYKw0NGCWCOrDS5MK3Qil
         +oUQ==
X-Gm-Message-State: AOAM531VenlouGMNoIrjzLRq94WUCHyBbVUYaJ5sYKMWpCXipqLiJ1pX
        2QvK6vhHhoeSA/COIuFBqL0=
X-Google-Smtp-Source: ABdhPJyIKIaBLIJKoCAh+OVZfiRxAQl2eDqu7Wxzg/1MIUQJrfmb5Gqr/gT6KYTgQSt5/1gpdKQLTQ==
X-Received: by 2002:a17:90b:4ac3:: with SMTP id mh3mr11140785pjb.0.1595001757606;
        Fri, 17 Jul 2020 09:02:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id p10sm7619131pgn.6.2020.07.17.09.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:02:36 -0700 (PDT)
Date:   Fri, 17 Jul 2020 09:02:34 -0700
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     jingle <jingle.wu@emc.com.tw>
Cc:     'linux-kernel' <linux-kernel@vger.kernel.org>,
        'linux-input' <linux-input@vger.kernel.org>,
        'phoenix' <phoenix@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>,
        "'kai.heng.feng'" <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 2/2] Input: elan_i2c - Modify the IAP related functio n
 for page sizes 128, 512 bytes.
Message-ID: <20200717160234.GE1665100@dtor-ws>
References: <20200714105641.15151-1-jingle.wu@emc.com.tw>
 <20200716053912.GB1665100@dtor-ws>
 <1594880123.69588.jingle.wu@emc.com.tw>
 <20200717012719.GC1665100@dtor-ws>
 <20200717061010.GD1665100@dtor-ws>
 <002c01d65c14$bccb9c10$3662d430$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002c01d65c14$bccb9c10$3662d430$@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Fri, Jul 17, 2020 at 04:31:58PM +0800, jingle wrote:
> Hi Dmitry:
> 
> 1. 
> 
> In this function elan_get_fwinfo().
> 
> +static int elan_get_fwinfo(u16 ic_type, u8 iap_version, u8 pattern,
> +			   u16 *validpage_count, u32 *signature_address,
> +			   u16 *page_size)
>  {
> -	switch (ic_type) {
> +	u16 type = pattern >= 0x01 ? ic_type : iap_version;
> +
> +	switch (type) {
> 
> This iap_version in pattern0 is read from this command
> ETP_I2C_IAP_VERSION_CMD_OLD ,it is not from this command
> ETP_I2C_IAP_VERSION.
> So u16 type = pattern >= 0x01 ? ic_type : iap_version; <- wrong
> 
> 2. In this "static int elan_i2c_prepare_fw_update(struct i2c_client *client,
> u16 ic_type, u8 iap_version)" function.
> The ic is old pattern must be modify correct ic_type. (cmd is
> ETP_I2C_IAP_VERSION)

I see. It looks like there is some confusion on my part between IAP
version, IC type, and the commands that we want to use. Please let me
know if I understand this correctly:

- For patterns >=1 (newer)
  IAP version is retrieved with ETP_I2C_IAP_VERSION_CMD
  IC type is fetched with ETP_I2C_IC_TYPE_CMD
  Version comes from ETP_I2C_NSM_VERSION_CMD

- For pattern 0 (old)
  Before your patches
    IAP version was using ETP_I2C_IAP_VERSION_CMD (and you are saying
    it is wrong)
    Version comes from 1st byte of ETP_I2C_OSM_VERSION_CMD
    IC type comes from 2nd byte of ETP_I2C_OSM_VERSION_CMD (and you are
    saying it is some other bit of data - what is it then?)

  After your patches
    IAP version is retrieved with ETP_I2C_IAP_VERSION_CMD_OLD
    Version comes from 1st byte of ETP_I2C_OSM_VERSION_CMD
    IC type is retrieved with ETP_I2C_IAP_VERSION_CMD (should we rename
    it then?)

So the difference is where the the IC type is coming from for old
patterns. However, as I mentioned, we have the following body of code:

static int elan_check_ASUS_special_fw(struct elan_tp_data *data)
{
	if (data->ic_type == 0x0E) {
		switch (data->product_id) {
		case 0x05 ... 0x07:
		case 0x09:
		case 0x13:
			return true;
		}
	} else if (data->ic_type == 0x08 && data->product_id == 0x26) {
		/* ASUS EeeBook X205TA */
		return true;
	}

	return false;
}

And before your patches ic_type here would be the 2nd byte of response
to ETP_I2C_OSM_VERSION_CMD for older devices and my concern that
replacing it with data from ETP_I2C_IAP_VERSION_CMD would break these
checks.

We need to reconcile what we have in this function with what you are
proposing for firmware update code.

Thanks,
Dmitry
