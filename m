Return-Path: <linux-input+bounces-4097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E498FC6CB
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 10:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4A731F21CE2
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 08:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252F053BE;
	Wed,  5 Jun 2024 08:42:31 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com [115.124.28.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF4E1946AD;
	Wed,  5 Jun 2024 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717576951; cv=none; b=FsdvzbbdCeV3aPF4N27pzL5E+AX+SvXkoUJS/Ve7uPiBvU+UJzBa3cWFu7r6d0xx8wWbegPzbk3LwrwgfERsBEFQOsw8MCDECi/Oqyxd7C/hWT72BJyqGpKdaXeKrs4py3tTHg5cJBrlNE9Fu62JSeJm3Zof9hg5JAdsb/kw4XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717576951; c=relaxed/simple;
	bh=ziCWnVq3AxmUbCBf2hsUuq9/hbo9muaMvlSA8WakK1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6MNHJVh1K+D++ijJ3Wv7poByMLdftgJmhiE+3cawLINmAVmv153hgwm6gDY7fUx0YkRSj/hIPlQyBNPvZROui3nfnv5SX5u/V4xmaaSwlxq1mftYrjMj/Zp6Eig+fJ17nVpLKjov4ZABunjoFzlHGrt3zcVLUCsmppHef9a4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.024763-0.000138983-0.975098;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033070043001;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.XwawE3L_1717576910;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XwawE3L_1717576910)
          by smtp.aliyun-inc.com;
          Wed, 05 Jun 2024 16:42:17 +0800
From: wangshuaijie@awinic.com
To: dan.carpenter@linaro.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	kangjiajun@awinic.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev,
	robh@kernel.org,
	wangshuaijie@awinic.com
Subject: Re: [PATCH V1 5/5] Add support for Awinic sar sensor.
Date: Wed,  5 Jun 2024 08:42:26 +0000
Message-ID: <20240605084226.142542-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <9d90f11f-c476-40f2-a7b1-41b35783b27e@moroto.mountain>
References: <9d90f11f-c476-40f2-a7b1-41b35783b27e@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob Herring,

On Fri, 31 May 2024 11:12:51 +0300, dan.carpenter@linaro.org wrote:
>Hi,
>
>kernel test robot noticed the following build warnings:
>
>url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-input-Add-YAML-to-Awinic-sar-sensor/20240529-211303
>base:   e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc
>patch link:    https://lore.kernel.org/r/20240529130608.783624-6-wangshuaijie%40awinic.com
>patch subject: [PATCH V1 5/5] Add support for Awinic sar sensor.
>config: riscv-randconfig-r071-20240530 (https://download.01.org/0day-ci/archive/20240531/202405310138.ry5jf9hL-lkp@intel.com/config)
>compiler: riscv64-linux-gcc (GCC) 13.2.0
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>| Closes: https://lore.kernel.org/r/202405310138.ry5jf9hL-lkp@intel.com/
>
>New smatch warnings:
>drivers/input/misc/aw_sar/aw_sar.c:221 aw_sar_load_bin_comm() warn: 'fw' from request_firmware() not released on lines: 217.
>drivers/input/misc/aw_sar/aw_sar.c:283 aw_sar_irq() error: uninitialized symbol 'irq_status'.
>drivers/input/misc/aw_sar/./aw9610x/aw9610x.c:479 aw9610x_get_chip_version() error: __builtin_memcpy() 'aw9610x->chip_name[__builtin_choose_expr((4 == 1), __builtin_strlen(aw9610x->chip_name), __fortify_strlen(aw9610x->chip_name))]' too small (1 vs 2)
>drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:227 aw963xx_sram_data_write() error: uninitialized symbol 'ret'.
>drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:522 aw963xx_get_cap_offset() warn: inconsistent indenting
>
>Old smatch warnings:
>drivers/input/misc/aw_sar/./aw963xx/aw963xx.c:557 aw963xx_get_cap_offset() warn: inconsistent indenting
>

The patch for version v2 will fix these issues.

>vim +/fw +221 drivers/input/misc/aw_sar/aw_sar.c
>
>e5df082e247559 shuaijie wang 2024-05-29  203  static int32_t aw_sar_load_bin_comm(struct aw_sar *p_sar)
>e5df082e247559 shuaijie wang 2024-05-29  204  {
>e5df082e247559 shuaijie wang 2024-05-29  205  	const struct firmware *fw;
>e5df082e247559 shuaijie wang 2024-05-29  206  	int32_t ret;
>e5df082e247559 shuaijie wang 2024-05-29  207  
>e5df082e247559 shuaijie wang 2024-05-29  208  	ret = request_firmware(&fw, p_sar->load_bin.bin_name, p_sar->dev);
>e5df082e247559 shuaijie wang 2024-05-29  209  	if (ret != 0) {
>e5df082e247559 shuaijie wang 2024-05-29  210  		dev_err(p_sar->dev, "parse %s error!", p_sar->load_bin.bin_name);
>e5df082e247559 shuaijie wang 2024-05-29  211  		return ret;
>e5df082e247559 shuaijie wang 2024-05-29  212  	}
>e5df082e247559 shuaijie wang 2024-05-29  213  
>e5df082e247559 shuaijie wang 2024-05-29  214  	ret = aw_sar_parse_bin(fw, p_sar);
>e5df082e247559 shuaijie wang 2024-05-29  215  	if (ret != 0) {
>e5df082e247559 shuaijie wang 2024-05-29  216  		dev_err(p_sar->dev, "reg_bin %s load error!", p_sar->load_bin.bin_name);
>
>release_firmware(fw);
>

The patch for version v2 will fix this issue.

>e5df082e247559 shuaijie wang 2024-05-29  217  		return ret;
>e5df082e247559 shuaijie wang 2024-05-29  218  	}
>e5df082e247559 shuaijie wang 2024-05-29  219  	release_firmware(fw);
>e5df082e247559 shuaijie wang 2024-05-29  220  
>e5df082e247559 shuaijie wang 2024-05-29 @221  	return 0;
>e5df082e247559 shuaijie wang 2024-05-29  222  }
>e5df082e247559 shuaijie wang 2024-05-29  223  
>e5df082e247559 shuaijie wang 2024-05-29  224  static int32_t aw_sar_parse_dts_comm(struct device *dev, struct device_node *np,
>e5df082e247559 shuaijie wang 2024-05-29  225  		struct aw_sar_dts_info *p_dts_info)
>e5df082e247559 shuaijie wang 2024-05-29  226  {
>e5df082e247559 shuaijie wang 2024-05-29  227  	int32_t val;
>e5df082e247559 shuaijie wang 2024-05-29  228  
>e5df082e247559 shuaijie wang 2024-05-29  229  	val = of_property_read_u32(np, "sar-num", &p_dts_info->sar_num);
>e5df082e247559 shuaijie wang 2024-05-29  230  	dev_info(dev, "sar num = %d", p_dts_info->sar_num);
>e5df082e247559 shuaijie wang 2024-05-29  231  	if (val != 0) {
>e5df082e247559 shuaijie wang 2024-05-29  232  		dev_err(dev, "multiple sar failed!");
>e5df082e247559 shuaijie wang 2024-05-29  233  		return -EINVAL;
>e5df082e247559 shuaijie wang 2024-05-29  234  	}
>e5df082e247559 shuaijie wang 2024-05-29  235  
>e5df082e247559 shuaijie wang 2024-05-29  236  	p_dts_info->irq_gpio = of_get_named_gpio(np, "irq-gpio", 0);
>e5df082e247559 shuaijie wang 2024-05-29  237  	if (p_dts_info->irq_gpio < 0) {
>e5df082e247559 shuaijie wang 2024-05-29  238  		p_dts_info->irq_gpio = -1;
>e5df082e247559 shuaijie wang 2024-05-29  239  		dev_err(dev, "no irq gpio provided.");
>e5df082e247559 shuaijie wang 2024-05-29  240  		return -EINVAL;
>e5df082e247559 shuaijie wang 2024-05-29  241  	}
>e5df082e247559 shuaijie wang 2024-05-29  242  
>e5df082e247559 shuaijie wang 2024-05-29  243  	val = of_property_read_u32(np, "channel_use_flag", &p_dts_info->channel_use_flag);
>e5df082e247559 shuaijie wang 2024-05-29  244  	if (val != 0) {
>e5df082e247559 shuaijie wang 2024-05-29  245  		dev_err(dev, "channel_use_flag failed!");
>e5df082e247559 shuaijie wang 2024-05-29  246  		return -EINVAL;
>e5df082e247559 shuaijie wang 2024-05-29  247  	}
>e5df082e247559 shuaijie wang 2024-05-29  248  
>e5df082e247559 shuaijie wang 2024-05-29  249  	//GPIO is set as internal pull-up input
>e5df082e247559 shuaijie wang 2024-05-29  250  	p_dts_info->use_inter_pull_up = of_property_read_bool(np, "aw_sar,pin_set_inter_pull-up");
>e5df082e247559 shuaijie wang 2024-05-29  251  	p_dts_info->use_pm = of_property_read_bool(np, "aw_sar,using_pm_ops");
>e5df082e247559 shuaijie wang 2024-05-29  252  	p_dts_info->update_fw_flag = of_property_read_bool(np, "aw_sar,update_fw");
>e5df082e247559 shuaijie wang 2024-05-29  253  	p_dts_info->use_plug_cail_flag = of_property_read_bool(np, "aw_sar,use_plug_cail");
>e5df082e247559 shuaijie wang 2024-05-29  254  	p_dts_info->monitor_esd_flag = of_property_read_bool(np, "aw_sar,monitor_esd");
>e5df082e247559 shuaijie wang 2024-05-29  255  
>e5df082e247559 shuaijie wang 2024-05-29  256  	return 0;
>e5df082e247559 shuaijie wang 2024-05-29  257  }
>e5df082e247559 shuaijie wang 2024-05-29  258  
>e5df082e247559 shuaijie wang 2024-05-29  259  static int32_t aw_sar_parse_dts(struct aw_sar *p_sar)
>e5df082e247559 shuaijie wang 2024-05-29  260  {
>e5df082e247559 shuaijie wang 2024-05-29  261  	int32_t ret;
>e5df082e247559 shuaijie wang 2024-05-29  262  
>e5df082e247559 shuaijie wang 2024-05-29  263  	ret = aw_sar_parse_dts_comm(p_sar->dev, p_sar->i2c->dev.of_node, &p_sar->dts_info);
>e5df082e247559 shuaijie wang 2024-05-29  264  
>e5df082e247559 shuaijie wang 2024-05-29  265  	//Special requirements of SAR chip
>e5df082e247559 shuaijie wang 2024-05-29  266  	if (p_sar->p_sar_para->p_platform_config->p_add_parse_dts_fn != NULL)
>e5df082e247559 shuaijie wang 2024-05-29  267  		ret |= p_sar->p_sar_para->p_platform_config->p_add_parse_dts_fn(p_sar);
>e5df082e247559 shuaijie wang 2024-05-29  268  
>e5df082e247559 shuaijie wang 2024-05-29  269  	return ret;
>e5df082e247559 shuaijie wang 2024-05-29  270  }
>e5df082e247559 shuaijie wang 2024-05-29  271  
>e5df082e247559 shuaijie wang 2024-05-29  272  static irqreturn_t aw_sar_irq(int32_t irq, void *data)
>e5df082e247559 shuaijie wang 2024-05-29  273  {
>e5df082e247559 shuaijie wang 2024-05-29  274  	struct aw_sar *p_sar = (struct aw_sar *)data;
>e5df082e247559 shuaijie wang 2024-05-29  275  	uint32_t irq_status;
>e5df082e247559 shuaijie wang 2024-05-29  276  
>e5df082e247559 shuaijie wang 2024-05-29  277  	//step1: read clear interrupt
>e5df082e247559 shuaijie wang 2024-05-29  278  	if (p_sar->p_sar_para->p_platform_config->p_irq_init->rc_irq_fn != NULL)
>e5df082e247559 shuaijie wang 2024-05-29  279  		irq_status = p_sar->p_sar_para->p_platform_config->p_irq_init->rc_irq_fn(p_sar->i2c);
>e5df082e247559 shuaijie wang 2024-05-29  280  
>e5df082e247559 shuaijie wang 2024-05-29  281  	//step2: Read the status register for status reporting
>e5df082e247559 shuaijie wang 2024-05-29  282  	if (p_sar->p_sar_para->p_platform_config->p_irq_init->irq_spec_handler_fn != NULL)
>e5df082e247559 shuaijie wang 2024-05-29 @283  		p_sar->p_sar_para->p_platform_config->p_irq_init->irq_spec_handler_fn(irq_status,
>e5df082e247559 shuaijie wang 2024-05-29  284  				p_sar);
>
>Probably if ->irq_spec_handler_fn is non-NULL then ->rc_irq_fn is also
>non-NULL, but the static checker doesn't know that so it warns about
>uninitialized variables.
>

The patch for version v2 will fix this issue.

>e5df082e247559 shuaijie wang 2024-05-29  285  
>e5df082e247559 shuaijie wang 2024-05-29  286  	//step3: The chip
>e5df082e247559 shuaijie wang 2024-05-29  287  
>e5df082e247559 shuaijie wang 2024-05-29  288  	if ((!p_sar->dts_info.monitor_esd_flag) && (p_sar->fault_flag == AW_SAR_UNHEALTHY)) {
>e5df082e247559 shuaijie wang 2024-05-29  289  		p_sar->fault_flag = AW_SAR_HEALTHY;
>e5df082e247559 shuaijie wang 2024-05-29  290  		disable_irq_nosync(p_sar->irq_init.to_irq);
>e5df082e247559 shuaijie wang 2024-05-29  291  		p_sar->irq_init.host_irq_stat = IRQ_DISABLE;
>e5df082e247559 shuaijie wang 2024-05-29  292  		//aw_sar_soft_reset(p_sar);
>e5df082e247559 shuaijie wang 2024-05-29  293  		schedule_delayed_work(&p_sar->update_work, msecs_to_jiffies(500));
>e5df082e247559 shuaijie wang 2024-05-29  294  	}
>e5df082e247559 shuaijie wang 2024-05-29  295  
>e5df082e247559 shuaijie wang 2024-05-29  296  	return IRQ_HANDLED;
>e5df082e247559 shuaijie wang 2024-05-29  297  }
>
>-- 
>0-DAY CI Kernel Test Service
--

Thanks,

Wang Shuaijie

