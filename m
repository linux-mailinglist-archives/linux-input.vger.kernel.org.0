Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFDA1D770B
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 13:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgERLaZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 07:30:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:55407 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbgERLaY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 07:30:24 -0400
IronPort-SDR: MILMShpmReP41uWRa1oKNi8zFeU5DS0vTfse2Savn7M0b8H58Z7AHHz15tsk3tsbHt7Lcn18VY
 zsmeUOrLTfsg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 04:29:14 -0700
IronPort-SDR: w780RxRCZgbx03QQMkmrqp1ULwxTLLXaLOaDh/F5Acbx2kgo61QbtLfhifN9ftMoWXtsBhWp7D
 6mSfxV011p7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="gz'50?scan'50,208,50";a="465728309"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 May 2020 04:29:08 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jadxD-000EQT-P2; Mon, 18 May 2020 19:29:07 +0800
Date:   Mon, 18 May 2020 19:28:55 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     kbuild-all@lists.01.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Pavel Balan <admin@kryma.net>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: i2c-hid: Enable touchpad wakeup from Suspend-to-Idle
Message-ID: <202005181903.MyNhR37t%lkp@intel.com>
References: <20200518093511.29530-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <20200518093511.29530-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kai-Heng,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.7-rc6 next-20200515]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Kai-Heng-Feng/HID-i2c-hid-Enable-touchpad-wakeup-from-Suspend-to-Idle/20200518-173725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
config: parisc-randconfig-r031-20200518 (attached as .config)
compiler: hppa64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/linux/kernel.h:11,
from include/linux/list.h:9,
from include/linux/module.h:12,
from drivers/hid/i2c-hid/i2c-hid-core.c:21:
drivers/hid/i2c-hid/i2c-hid-core.c: In function 'i2c_hid_probe':
>> drivers/hid/i2c-hid/i2c-hid-core.c:1075:6: error: 'acpi_gbl_FADT' undeclared (first use in this function)
1075 |  if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
|      ^~~~~~~~~~~~~
include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
|                                                    ^~~~
>> drivers/hid/i2c-hid/i2c-hid-core.c:1075:2: note: in expansion of macro 'if'
1075 |  if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
|  ^~
drivers/hid/i2c-hid/i2c-hid-core.c:1075:6: note: each undeclared identifier is reported only once for each function it appears in
1075 |  if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
|      ^~~~~~~~~~~~~
include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
|                                                    ^~~~
>> drivers/hid/i2c-hid/i2c-hid-core.c:1075:2: note: in expansion of macro 'if'
1075 |  if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
|  ^~

vim +/acpi_gbl_FADT +1075 drivers/hid/i2c-hid/i2c-hid-core.c

   995	
   996	static int i2c_hid_probe(struct i2c_client *client,
   997				 const struct i2c_device_id *dev_id)
   998	{
   999		int ret;
  1000		struct i2c_hid *ihid;
  1001		struct hid_device *hid;
  1002		__u16 hidRegister;
  1003		struct i2c_hid_platform_data *platform_data = client->dev.platform_data;
  1004	
  1005		dbg_hid("HID probe called for i2c 0x%02x\n", client->addr);
  1006	
  1007		if (!client->irq) {
  1008			dev_err(&client->dev,
  1009				"HID over i2c has not been provided an Int IRQ\n");
  1010			return -EINVAL;
  1011		}
  1012	
  1013		if (client->irq < 0) {
  1014			if (client->irq != -EPROBE_DEFER)
  1015				dev_err(&client->dev,
  1016					"HID over i2c doesn't have a valid IRQ\n");
  1017			return client->irq;
  1018		}
  1019	
  1020		ihid = devm_kzalloc(&client->dev, sizeof(*ihid), GFP_KERNEL);
  1021		if (!ihid)
  1022			return -ENOMEM;
  1023	
  1024		if (client->dev.of_node) {
  1025			ret = i2c_hid_of_probe(client, &ihid->pdata);
  1026			if (ret)
  1027				return ret;
  1028		} else if (!platform_data) {
  1029			ret = i2c_hid_acpi_pdata(client, &ihid->pdata);
  1030			if (ret)
  1031				return ret;
  1032		} else {
  1033			ihid->pdata = *platform_data;
  1034		}
  1035	
  1036		/* Parse platform agnostic common properties from ACPI / device tree */
  1037		i2c_hid_fwnode_probe(client, &ihid->pdata);
  1038	
  1039		ihid->pdata.supplies[0].supply = "vdd";
  1040		ihid->pdata.supplies[1].supply = "vddl";
  1041	
  1042		ret = devm_regulator_bulk_get(&client->dev,
  1043					      ARRAY_SIZE(ihid->pdata.supplies),
  1044					      ihid->pdata.supplies);
  1045		if (ret)
  1046			return ret;
  1047	
  1048		ret = regulator_bulk_enable(ARRAY_SIZE(ihid->pdata.supplies),
  1049					    ihid->pdata.supplies);
  1050		if (ret < 0)
  1051			return ret;
  1052	
  1053		if (ihid->pdata.post_power_delay_ms)
  1054			msleep(ihid->pdata.post_power_delay_ms);
  1055	
  1056		i2c_set_clientdata(client, ihid);
  1057	
  1058		ihid->client = client;
  1059	
  1060		hidRegister = ihid->pdata.hid_descriptor_address;
  1061		ihid->wHIDDescRegister = cpu_to_le16(hidRegister);
  1062	
  1063		init_waitqueue_head(&ihid->wait);
  1064		mutex_init(&ihid->reset_lock);
  1065	
  1066		/* we need to allocate the command buffer without knowing the maximum
  1067		 * size of the reports. Let's use HID_MIN_BUFFER_SIZE, then we do the
  1068		 * real computation later. */
  1069		ret = i2c_hid_alloc_buffers(ihid, HID_MIN_BUFFER_SIZE);
  1070		if (ret < 0)
  1071			goto err_regulator;
  1072	
  1073		i2c_hid_acpi_fix_up_power(&client->dev);
  1074	
> 1075		if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
  1076			device_set_wakeup_capable(&client->dev, true);
  1077			device_wakeup_enable(&client->dev);
  1078		}
  1079	
  1080		device_enable_async_suspend(&client->dev);
  1081	
  1082		/* Make sure there is something at this address */
  1083		ret = i2c_smbus_read_byte(client);
  1084		if (ret < 0) {
  1085			dev_dbg(&client->dev, "nothing at this address: %d\n", ret);
  1086			ret = -ENXIO;
  1087			goto err_regulator;
  1088		}
  1089	
  1090		ret = i2c_hid_fetch_hid_descriptor(ihid);
  1091		if (ret < 0)
  1092			goto err_regulator;
  1093	
  1094		ret = i2c_hid_init_irq(client);
  1095		if (ret < 0)
  1096			goto err_regulator;
  1097	
  1098		hid = hid_allocate_device();
  1099		if (IS_ERR(hid)) {
  1100			ret = PTR_ERR(hid);
  1101			goto err_irq;
  1102		}
  1103	
  1104		ihid->hid = hid;
  1105	
  1106		hid->driver_data = client;
  1107		hid->ll_driver = &i2c_hid_ll_driver;
  1108		hid->dev.parent = &client->dev;
  1109		hid->bus = BUS_I2C;
  1110		hid->version = le16_to_cpu(ihid->hdesc.bcdVersion);
  1111		hid->vendor = le16_to_cpu(ihid->hdesc.wVendorID);
  1112		hid->product = le16_to_cpu(ihid->hdesc.wProductID);
  1113	
  1114		snprintf(hid->name, sizeof(hid->name), "%s %04hX:%04hX",
  1115			 client->name, hid->vendor, hid->product);
  1116		strlcpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
  1117	
  1118		ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
  1119	
  1120		ret = hid_add_device(hid);
  1121		if (ret) {
  1122			if (ret != -ENODEV)
  1123				hid_err(client, "can't add hid device: %d\n", ret);
  1124			goto err_mem_free;
  1125		}
  1126	
  1127		return 0;
  1128	
  1129	err_mem_free:
  1130		hid_destroy_device(hid);
  1131	
  1132	err_irq:
  1133		free_irq(client->irq, ihid);
  1134	
  1135	err_regulator:
  1136		regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
  1137				       ihid->pdata.supplies);
  1138		i2c_hid_free_buffers(ihid);
  1139		return ret;
  1140	}
  1141	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--DocE+STaALJfprDB
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
JALa496/AGHaxg79FgIA

--DocE+STaALJfprDB--
