Return-Path: <linux-input+bounces-576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D8780802A
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 06:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3B211C209D2
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 05:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A0110A02;
	Thu,  7 Dec 2023 05:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SlKTAiHg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B98E1B4
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 21:28:20 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-332fd78fa9dso500347f8f.3
        for <linux-input@vger.kernel.org>; Wed, 06 Dec 2023 21:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701926898; x=1702531698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P/w8d4bx85GCzG3q+XMNSr3H2oW0ZXJ+JkTmbFE6i40=;
        b=SlKTAiHgnD1ZCmZC7CNQolawMayWBfo/d2VTdQfQqMkCcj9ODW7cYpZiRaU2n3gvD0
         8bc4nzAJCFgKZc0gPmG34Dv7iHYLF+eMLG2QQRN0B7V+Re8L5p5P+zDSawTfpmcpanDn
         cwLhsrsRDQd7vs5WltPkNWnSWiY6UILCYzFRZ/bBTnWWVN2hDJbaBPK2/vdORYlEtpok
         9JOp3xN06eUJ7yHK+53sK1PG2BBk+ZYOZGLT31YVYRdGSkJit/JdBLNnjI8+vI0AkQih
         Txbnhxv7BMNLHSa1q1dHFvIIZOSC3I/xBo71PAOqEjW6ETvGjUptty8SRlepI21i9kiw
         LoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701926898; x=1702531698;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/w8d4bx85GCzG3q+XMNSr3H2oW0ZXJ+JkTmbFE6i40=;
        b=JCWuXw24eaUGj2HzRAs4lZ4fEd8tp35phYYQgcUHtGB1p15z5uXyfpqp0tQLms/gvS
         QgYkV+SHNxq9j4C6Sw7rQ2zklbjunhJE5/Cd7Tv8OoheSfMCT2wDTKmH1IGAtaiYF+Eb
         LNP8K0QGL+KF+JVcrDdrErkwxRKuD4e+phZxODwnzXW6s0rBcZzYtOoRrasrivXkb3rt
         quWZakq0reeBrj5nOLZbsTktJ3mkC/t2sUq9zCrt44U46GL1XHsBhnyaYOdfrkDqFTLI
         nhp2pI3Cu65oIVbWa+XMaK7w+r8/J0p9PVXoZf17WWiJcSos1gFtH4x12vrP0IvQdZoJ
         AA9A==
X-Gm-Message-State: AOJu0YwdbqJzLX+CufgpUL56bTV9aXZEw3Pa048QGaNmYudwBa/8EMJc
	ki/i03pysAsXMouKR5pfYEBvSw==
X-Google-Smtp-Source: AGHT+IE21IJuS8tBsselAAGayu4ujjz1P+t5qXxU0Ss8ACQiY5yyBYE/DI31YW+Ox7NMislqtWHqQA==
X-Received: by 2002:adf:a355:0:b0:333:2fd2:7665 with SMTP id d21-20020adfa355000000b003332fd27665mr518094wrb.86.1701926898494;
        Wed, 06 Dec 2023 21:28:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i15-20020adfe48f000000b0033344e2522dsm453279wrm.37.2023.12.06.21.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:28:18 -0800 (PST)
Date: Thu, 7 Dec 2023 08:28:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com, bartp@baasheep.co.uk,
	hannah.rossiter@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v4 3/3] Input: Add TouchNetix axiom i2c touchscreen driver
Message-ID: <6f8e3b64-5b21-4a50-8680-063ef7a93bdb@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204140505.2838916-4-kamel.bouhara@bootlin.com>

Hi Kamel,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamel-Bouhara/dt-bindings-vendor-prefixes-Add-TouchNetix-AS/20231204-222017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20231204140505.2838916-4-kamel.bouhara%40bootlin.com
patch subject: [PATCH v4 3/3] Input: Add TouchNetix axiom i2c touchscreen driver
config: i386-randconfig-r071-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070608.vxtNAYhk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070608.vxtNAYhk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312070608.vxtNAYhk-lkp@intel.com/

smatch warnings:
drivers/input/touchscreen/touchnetix_axiom.c:565 axiom_i2c_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +565 drivers/input/touchscreen/touchnetix_axiom.c

a9f3450f06a026 Kamel Bouhara 2023-12-04  536  static int axiom_i2c_probe(struct i2c_client *client)
a9f3450f06a026 Kamel Bouhara 2023-12-04  537  {
a9f3450f06a026 Kamel Bouhara 2023-12-04  538  	struct device *dev = &client->dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  539  	struct input_dev *input_dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  540  	struct axiom_data *ts;
a9f3450f06a026 Kamel Bouhara 2023-12-04  541  	u32 startup_delay_ms;
a9f3450f06a026 Kamel Bouhara 2023-12-04  542  	u32 poll_interval;
a9f3450f06a026 Kamel Bouhara 2023-12-04  543  	int target;
a9f3450f06a026 Kamel Bouhara 2023-12-04  544  	int error;
a9f3450f06a026 Kamel Bouhara 2023-12-04  545  
a9f3450f06a026 Kamel Bouhara 2023-12-04  546  	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
a9f3450f06a026 Kamel Bouhara 2023-12-04  547  	if (!ts)
a9f3450f06a026 Kamel Bouhara 2023-12-04  548  		return -ENOMEM;
a9f3450f06a026 Kamel Bouhara 2023-12-04  549  
a9f3450f06a026 Kamel Bouhara 2023-12-04  550  	ts->client = client;
a9f3450f06a026 Kamel Bouhara 2023-12-04  551  	i2c_set_clientdata(client, ts);
a9f3450f06a026 Kamel Bouhara 2023-12-04  552  	ts->dev = dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  553  
a9f3450f06a026 Kamel Bouhara 2023-12-04  554  	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
a9f3450f06a026 Kamel Bouhara 2023-12-04  555  	if (IS_ERR(ts->reset_gpio))
a9f3450f06a026 Kamel Bouhara 2023-12-04  556  		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio), "failed to get reset GPIO\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  557  
a9f3450f06a026 Kamel Bouhara 2023-12-04  558  	if (ts->reset_gpio)
a9f3450f06a026 Kamel Bouhara 2023-12-04  559  		axiom_reset(ts->reset_gpio);
a9f3450f06a026 Kamel Bouhara 2023-12-04  560  
a9f3450f06a026 Kamel Bouhara 2023-12-04  561  	ts->vddi = devm_regulator_get_optional(dev, "VDDI");
a9f3450f06a026 Kamel Bouhara 2023-12-04  562  	if (!IS_ERR(ts->vddi)) {
a9f3450f06a026 Kamel Bouhara 2023-12-04  563  		error = regulator_enable(ts->vddi);
a9f3450f06a026 Kamel Bouhara 2023-12-04  564  		if (error)
a9f3450f06a026 Kamel Bouhara 2023-12-04 @565  			return dev_err_probe(&client->dev, PTR_ERR(ts->vddi),
                                                                                                   ^^^^^^^^^^^^^^^^^^
s/PTR_ERR(ts->vddi)/error/

a9f3450f06a026 Kamel Bouhara 2023-12-04  566  					     "Failed to enable VDDI regulator\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  567  	}
a9f3450f06a026 Kamel Bouhara 2023-12-04  568  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


