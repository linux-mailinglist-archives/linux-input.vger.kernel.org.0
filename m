Return-Path: <linux-input+bounces-12951-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD27ADF438
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 19:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 165513AA8CB
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 17:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7882F49E1;
	Wed, 18 Jun 2025 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8uCOzho"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA4C2F4A15
	for <linux-input@vger.kernel.org>; Wed, 18 Jun 2025 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268433; cv=none; b=gYe0W7qRy/l8SEL7ox3CnvjM4H+kyT6S/Yha5Xran6nXuAPJKAlaVhO0B8Lq+iP44pacJw/7/hfE/SyVbRS0m1M2AGhuwC+WMvnNEwQVf/xgZJxANETyf985olIjcYbSh/IyA6lYUSr//33e0rSnkF9gX+6KrfR/i/VCUGS5qN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268433; c=relaxed/simple;
	bh=ac+dj0rndcYqjmn89tRE8u9Zk6zsyI4KTZ3RrPJLnbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Zb3eX6y7ATpUp2gk0aF+uGz5XdvrodCsRIYGpGN/iPXssHq8QnRduYThqE7Uz1rxPnjguwWVnVwZBLH6KNT7MqDKvqphgzM8sQpVvUBDTsxSkHKotAyWZ79tU0O4QX+FzntvdU3LZwpV8BTJGHG+vjrfmrXfu+GTgDXfFGHi5/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8uCOzho; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-40a55314d06so1910160b6e.1
        for <linux-input@vger.kernel.org>; Wed, 18 Jun 2025 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268430; x=1750873230; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3jheGvFrRBnUTJ/jqtFbTeeb7vfKBSDeMR+EMHPWYfE=;
        b=d8uCOzholPdOILO1ieJ9Mi1nasnlFaGilYDpIqeWJQ2/1Q1IisC54hi2XCxF1T1yaA
         iIUT8sA47bslB8oNIG+TaRLU2h1F2QjM4q2t3Zgl9q6OLE/LPSKLDUPl1L8CvrBDI2KK
         rxbjJ7erOM/q/9dAENRKxyFzt3NQaUP+KBVnZfWLJDiI1JStcQp4OkXj6a+nos1SXvRf
         /ajwxEs0FCBKSqBeJCETD9YnkOxmE8gYkoYbu0G6b0Co81dg23uwSEGNANKln2WfANMG
         sSFMdmbeQdFy6NPSgIe2YEjiN6eMvdkrBGdn8y4S0e9XbBM7KsLae7db/Q/pw9IPf0Oe
         vgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268430; x=1750873230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jheGvFrRBnUTJ/jqtFbTeeb7vfKBSDeMR+EMHPWYfE=;
        b=tl7a4T1AvAOJ2clhaLmExmANjqeLjrnUPS0ZRptZJ4R+P8QU5PpGZX1992rjBfP9Mz
         0n+hptaahS2cmzB9o90Ao9TeL5E962uOS2WwaBqzPCl5rdacAzc64CGJRa50qsVWrc4+
         7w8pofFzradfCn2asayynx3CmltFv/ZCrz9j5sA/Iqf4AyIB98ZzBYBDTZ8EomlwSfEf
         Vn9WGFJfEhhh9gQ8oNN+nqAqplGLWQJ7fdzQJf2ekmHBCP1HQh6DVDD5NGl0vM6tc5p9
         lOlec9My8x5q7uqkU23kfWlgCN0btabArbDTOuLfC0M4+aItOEvGAAMgLfXaHzNm0+hk
         CJpA==
X-Forwarded-Encrypted: i=1; AJvYcCUjKyvaEMc9YpjykGRR4bX2LZrlI4Q/j6ufsYxZ9fTpS5ygl5SP1Gcmq55J3+sFmN0p+9GOdby252UFlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5g2RSYPHBoaJArWsvqOcYb2lgKesib/dJK01W/HUdXzyrjKbI
	ljSOiMJXF/eMspCdeJAb9KLEDQLpjuCx0Sw1sz9ZHdloJrp5MZRxuGOKAooi1bB4yFk=
X-Gm-Gg: ASbGnctpDIkje8gQ6/zSMp8dnkELH4CibKL0N0SlhpALE8U0TdmBxqiwRFTFTzGLpan
	iXsLWS+89RvEtw1uokNXuemYBXF7sWCqaEFOcebM3JH9O/diQ4X3cIKBEONhrBsxwAGyhHqtPtx
	eqzggc/LD2fhR7AFUbc8MRxA5awuYyv/8PleGdUaSEFjo3mh7ob6etOxdDGbid7VElKkFONgEBE
	dTXfYym3FQBQpcQCyW+DR8HOB+xh6/bwN07+OAzw/WrAPHxuliB7fhX5P29E595oJs+wAndqhq5
	ICxx1632r1JAk5M5SoouIQ1ZbXyUF/CBYyQdO638YPb2j0wsXX/8GRqYh7asM/4mjHI49g==
X-Google-Smtp-Source: AGHT+IECG3DT0XZa253ZiAtrOyEDWibKqgxLSniShtQDZC/Qv6j2rHi/ZcKJqvX1Mm8kJIJS9Lnp8g==
X-Received: by 2002:a05:6808:4fec:b0:406:7769:d351 with SMTP id 5614622812f47-40a7c20ba96mr10089279b6e.23.1750268430492;
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a7418c881sm2415408b6e.41.2025.06.18.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:40:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?utf-8?B?VG9tw6HFoSBKdcWZZW5h?= <jurenatomas@gmail.com>,
	dmitry.torokhov@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tomas Jurena <jurenatomas@gmail.com>
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation
Message-ID: <eef98df0-5beb-40c1-a4e6-722012635812@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610154609.1382818-1-jurenatomas@gmail.com>

Hi Tomáš,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Ju-ena/Input-tca6416-keypad-Add-OF-support-for-driver-instantiation/20250611-094643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250610154609.1382818-1-jurenatomas%40gmail.com
patch subject: [PATCH] Input: tca6416-keypad - Add OF support for driver instantiation
config: csky-randconfig-r073-20250612 (https://download.01.org/0day-ci/archive/20250614/202506140034.iXbhyNCx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506140034.iXbhyNCx-lkp@intel.com/

smatch warnings:
drivers/input/keyboard/tca6416-keypad.c:263 tca6416_keypad_probe() error: we previously assumed 'pdata' could be null (see line 253)

vim +/pdata +263 drivers/input/keyboard/tca6416-keypad.c

3da11976b80c663 Uwe Kleine-König             2022-11-18  236  static int tca6416_keypad_probe(struct i2c_client *client)
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  237  {
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  238  	uint8_t io_size = (uintptr_t)i2c_get_match_data(client);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  239  	struct tca6416_keys_platform_data *pdata;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  240  	struct tca6416_keypad_chip *chip;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  241  	struct input_dev *input;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  242  	int error;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  243  	int i;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  244  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  245  	/* Check functionality */
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  246  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE)) {
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  247  		dev_err(&client->dev, "%s adapter not supported\n",
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  248  			dev_driver_string(&client->adapter->dev));
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  249  		return -ENODEV;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  250  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  251  
c838cb3d477f797 Jingoo Han                   2013-12-05  252  	pdata = dev_get_platdata(&client->dev);
c4c4a926acb6b1c Tomas Jurena                 2025-06-10 @253  	if (!pdata && dev_fwnode(&client->dev)) {

Imagine pdata is NULL and so is dev_fwnode()

c4c4a926acb6b1c Tomas Jurena                 2025-06-10  254  		pdata = tca6416_parse_properties(&client->dev, io_size);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  255  		if (!pdata) {
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  256  			dev_err(&client->dev,
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  257  				"Failed to parse device configuration from properties\n");
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  258  			return -EINVAL;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  259  		}
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  260  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  261  
91a4c69052bb660 Yangtao Li                   2023-07-23  262  	chip = devm_kzalloc(&client->dev,
91a4c69052bb660 Yangtao Li                   2023-07-23 @263  			    struct_size(chip, buttons, pdata->nbuttons),
                                                                                                               ^^^^^^^^^^^^^^^
Then it will crash

91a4c69052bb660 Yangtao Li                   2023-07-23  264  			    GFP_KERNEL);
91a4c69052bb660 Yangtao Li                   2023-07-23  265  	if (!chip)
91a4c69052bb660 Yangtao Li                   2023-07-23  266  		return -ENOMEM;
91a4c69052bb660 Yangtao Li                   2023-07-23  267  
91a4c69052bb660 Yangtao Li                   2023-07-23  268  	input = devm_input_allocate_device(&client->dev);
91a4c69052bb660 Yangtao Li                   2023-07-23  269  	if (!input)
91a4c69052bb660 Yangtao Li                   2023-07-23  270  		return -ENOMEM;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  271  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  272  	chip->client = client;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  273  	chip->input = input;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


