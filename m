Return-Path: <linux-input+bounces-4324-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB3F9050A0
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 12:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CF531F21522
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 10:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E661E16EBFF;
	Wed, 12 Jun 2024 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB+dd20U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E69B16E881;
	Wed, 12 Jun 2024 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189049; cv=none; b=ezooXoVwTmJnSZjRw2s22ONjpxaHLYpASAO/nJyIaMWNXKtfH5pXUpJAABRvxtF55r4D+zAPiszI6VlEmEH6hupft2JJsEZgXt2c/BDyIc9D2Zi5Nm3DlCLlOkoBVR0IcZbnNoimGpZhfsZD7EkC9HCSQEFF7BhXD/RPzuxNvZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189049; c=relaxed/simple;
	bh=ihYnzg0Jwy5oKsfaVqwCQlur1yhHXSqhn2i9sV7uLyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg09Ivk6L9BRxtGm16Il8qF3o7q0lCYtAiXoJlHCw0L20QK7W5A6XCyNLs6ZDzfmdoXy5nFoXhiPJT+3E+uY2xGJhW6Oh1wX1mAH0t0y9/ozWhBALGhdN125tqZ1xrBfwtSMaMF+ZnrkdcCY/VnMQNtf9MiZR+axFQJGlbyZi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB+dd20U; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f47f07acd3so61106025ad.0;
        Wed, 12 Jun 2024 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718189048; x=1718793848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6T5wUHDK9Ud1tn6iE6A/UW7sJBd/hDQFYaACKKtK/so=;
        b=dB+dd20UONVPTjX594XDp9UP3Wtyrv2GXFNb4I7w6bkKFzL7kuXMkfOtWpKdW9h46x
         iZ1e2ut3YxepATguKh6D+MWqT9kSbfYWFqMwjbs+sMszHzYEEm3XYknzK+IqaneODMpE
         lnLT0p0+mDXzPj9HNrIRZHre3J9bWZLDkKrFz7Ok9PIN0zfHXcGJS+mnuqoRwXzULb29
         87tsWQXP8Rs9/GzFv715Cy04/4pVM6Cigs7+mMijrDq5zDRBH7dseu82k4qn5Kvt/5LO
         EM7RffYdB84AT+UZjx6wnBtr6oIOhyldRYjDssUj5t1qWvidf59tPzjJC13wKYeo48VA
         S2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189048; x=1718793848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6T5wUHDK9Ud1tn6iE6A/UW7sJBd/hDQFYaACKKtK/so=;
        b=HpelU9Ip3HKQzTpmWiCtsFE2KAtkGrepcykw1Fud7il/yMiMTpnRQGYb98DU5zB8Ln
         48DVvy+A5fM6MbQreZPBIT+djKvMJCOkfvCXyqlQcCuoEZroLjYop8IFnunRtfxifUCe
         dnMuNrLuAAz22YXwO9gZpzBfmGRy1isLCWjWhBRh1bBDbLhIZvEmJPu4MKXNYRSldkCb
         8nEFVB9U3+bAuZAs4bgzcW52G4gFMWGT3FnRnrss5eY6JfoqdVVOzco2qZtmmt5l6/J7
         rIs6HLa10nONYHyYeHJFfxL7w5E44FaBcMEIRb23CDPVWNYhx6pbz4s3bsjpeq7UCSe3
         E9PA==
X-Forwarded-Encrypted: i=1; AJvYcCXK1Umwnk0uu1T84T3TaP4LHBFTfN8ixWRE9hK9Y6KxL010Tyj1lgzuEBA5exxdOJmXp8JN1ZZ+XJr6EP+6gFqisEuCFeprgXclCH0mA0I3AQdl8IdEhSogQm9DTrMoYbvN45xaGoe9SQ4=
X-Gm-Message-State: AOJu0YzzUzkS0HSwbBYRp3GiBqz23ATwEPkjY8o1ykmn8l2MOHxfEwul
	4IRunkrO+pZiaHVF3zGAV4IYsu8H7LhGLfXbhklw0exAKrG5be+T
X-Google-Smtp-Source: AGHT+IEuk2yuY72xBZ7txhFszoLKdPFpL4E3w6zMeK9BYeu2yCnMTnCuuYqWZ5cHkHHUsa9EsRj3Kg==
X-Received: by 2002:a17:902:d4cf:b0:1f6:e20f:86b4 with SMTP id d9443c01a7336-1f83b74feefmr15199655ad.61.1718189047756;
        Wed, 12 Jun 2024 03:44:07 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:2e60:1ed5:d81b:ef85:e3a0:ec17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7fd943sm119829605ad.286.2024.06.12.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:44:07 -0700 (PDT)
Date: Wed, 12 Jun 2024 18:43:58 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dmitry.torokhov@gmail.com, jikos@kernel.org, bentiss@kernel.org,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, hbarnor@chromium.org,
	dianders@chromium.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <Zml77pa-rUJtZebV@ux-UP-WHL01>
References: <20240607133709.3518-1-charles.goodix@gmail.com>
 <030b639e-f5d1-40a2-8980-f436ca686e6e@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <030b639e-f5d1-40a2-8980-f436ca686e6e@moroto.mountain>

Hi Dan,

Thank you. Dmitry has pointed this out.

Charles.

On Mon, Jun 10, 2024 at 12:39:54PM +0300, Dan Carpenter wrote:
> Hi Charles,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240607-214042
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
> patch link:    https://lore.kernel.org/r/20240607133709.3518-1-charles.goodix%40gmail.com
> patch subject: [PATCH v3] HID: hid-goodix: Add Goodix HID-over-SPI driver
> config: sparc64-randconfig-r071-20240609 (https://download.01.org/0day-ci/archive/20240610/202406101633.1RJnij1Y-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406101633.1RJnij1Y-lkp@intel.com/
> 
> smatch warnings:
> drivers/hid/hid-goodix-spi.c:217 goodix_hid_parse() error: uninitialized symbol 'rdesc'.
> 
> vim +/rdesc +217 drivers/hid/hid-goodix-spi.c
> 
> bb11c3a1740813 Charles Wang 2024-06-07  214  static int goodix_hid_parse(struct hid_device *hid)
> bb11c3a1740813 Charles Wang 2024-06-07  215  {
> bb11c3a1740813 Charles Wang 2024-06-07  216  	struct goodix_ts_data *ts = hid->driver_data;
> bb11c3a1740813 Charles Wang 2024-06-07 @217  	u8 *rdesc __free(kfree);
> bb11c3a1740813 Charles Wang 2024-06-07  218  	u16 rsize;
> bb11c3a1740813 Charles Wang 2024-06-07  219  	int error;
> bb11c3a1740813 Charles Wang 2024-06-07  220  
> bb11c3a1740813 Charles Wang 2024-06-07  221  	rsize = le16_to_cpu(ts->hid_desc.report_desc_lenght);
> bb11c3a1740813 Charles Wang 2024-06-07  222  	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
> bb11c3a1740813 Charles Wang 2024-06-07  223  		dev_err(ts->dev, "invalid report desc size %d", rsize);
> bb11c3a1740813 Charles Wang 2024-06-07  224  		return -EINVAL;
>                                                         ^^^^^^^^^^^^^^^
> rdesc isn't initialized here.  It should be declared as:
> 
> 	u8 *rdesc __free(kfree) = NULL;
> 
> bb11c3a1740813 Charles Wang 2024-06-07  225  	}
> bb11c3a1740813 Charles Wang 2024-06-07  226  
> bb11c3a1740813 Charles Wang 2024-06-07  227  	rdesc = kzalloc(rsize, GFP_KERNEL);
> 
> Or it could be declared here instead.
> 
> 	u8 *rdesc __free(kfree) = kzalloc(rsize, GFP_KERNEL);
> 
> bb11c3a1740813 Charles Wang 2024-06-07  228  	if (!rdesc)
> bb11c3a1740813 Charles Wang 2024-06-07  229  		return -ENOMEM;
> bb11c3a1740813 Charles Wang 2024-06-07  230  
> bb11c3a1740813 Charles Wang 2024-06-07  231  	error = goodix_spi_read(ts, GOODIX_HID_REPORT_DESC_ADDR, rdesc, rsize);
> bb11c3a1740813 Charles Wang 2024-06-07  232  	if (error) {
> bb11c3a1740813 Charles Wang 2024-06-07  233  		dev_err(ts->dev, "failed get report desc, %d", error);
> bb11c3a1740813 Charles Wang 2024-06-07  234  		return error;
> bb11c3a1740813 Charles Wang 2024-06-07  235  	}
> bb11c3a1740813 Charles Wang 2024-06-07  236  
> bb11c3a1740813 Charles Wang 2024-06-07  237  	error = hid_parse_report(hid, rdesc, rsize);
> bb11c3a1740813 Charles Wang 2024-06-07  238  	if (error)
> bb11c3a1740813 Charles Wang 2024-06-07  239  		dev_err(ts->dev, "failed parse report, %d", error);
> bb11c3a1740813 Charles Wang 2024-06-07  240  
> bb11c3a1740813 Charles Wang 2024-06-07  241  	return error;
> bb11c3a1740813 Charles Wang 2024-06-07  242  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

